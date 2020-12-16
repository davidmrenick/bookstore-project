class Book < ApplicationRecord
	belongs_to :author
	has_one :publisher
	has_many :book_format
	has_many :book_review
	
    def book_format_types
        formats = BookFormat.where(book_id: self.id).distinct.pluck(:book_format_type_id)
        return BookFormatType.where(id: formats)
    end
    
    def author_name
        return "#{self.author.last_name }, #{self.author.first_name}"
    end
    
    def average_rating
	    return self.book_review.average(:rating).to_f.round(1)
    end
    
    def self.search(query, options = {})
        if options[:title_only] == true
            results = Book.where("LOWER(title) LIKE ?", "%#{query.downcase}%").distinct
        else
            authors = Author.where("LOWER(last_name) = ?", query.downcase).pluck(:id)
            publishers = Publisher.where("LOWER(name) = ?", query.downcase).pluck(:id)
            results = Book.where("LOWER(title) LIKE ?", "%#{query.downcase}%")
                .or(Book.where(author_id: authors))
                .or(Book.where(publisher_id: publishers))
                .distinct
        end
        
        books = results.collect(&:id)
        
        if options[:book_format_type_id].present?
            books_in_format = BookFormat.where(book_format_type_id: options[:book_format_type_id]).pluck(:book_id)
            results = results.where(id: books_in_format)
        end
        
        if options[:book_format_physical].in? [true, false]
            physical_formats = BookFormatType.where(physical: options[:book_format_physical]).pluck(:id)
            physical_books = BookFormat.where(book_format_type_id: physical_formats).pluck(:book_id)
            results = results.where(id: physical_books)
        end
        
        return results.includes(:book_review).order("book_reviews.rating DESC")
    end
end
