require 'rails_helper'

RSpec.describe Book, type: :model do
    context "with author name" do
        it "returns author name in [last_name], [first_name] format" do
            author = Author.create!(first_name: "Stephen", last_name: "Strange")
            book = Book.create!(title: "Astronomia Nova", author_id: author.id, publisher_id: 1)
            expect(book.author_name).to eq("Strange, Stephen")
        end
    end
    context "with reviews" do
        it "averages the review score, accurate to 1 decimal place" do
            author = Author.create!(first_name: "Douglas", last_name: "Adams")
            book = Book.create!(title: "So Long and Thanks for All the Fish", author_id: author.id, publisher_id: 1)
            review1 = BookReview.create!(book_id: book.id, rating: 4)
            review2 = BookReview.create!(book_id: book.id, rating: 5)
            expect(book.average_rating).to eq(4.5)
        end
    end
    context "with format types" do
        it "returns all valid format types" do
            author = Author.create!(first_name: "Christopher", last_name: "Paolini")
            book = Book.create!(title: "", author_id: author.id, publisher_id: 1)
            format1 = BookFormatType.create!(name: "Paperback", physical: true)
            format2 = BookFormatType.create!(name: "Hardback", physical: true)
            format3 = BookFormatType.create!(name: "PDF", physical: false)
            BookFormat.create!(book_id: book.id, book_format_type_id: format1.id)
            BookFormat.create!(book_id: book.id, book_format_type_id: format3.id)
            expect(book.book_format_types).to include(format1, format3)
        end
    end
end

