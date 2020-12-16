require 'rails_helper'

RSpec.describe BookReview, type: :model do
    context "when rating is greater than 5" do
        it "throws an error" do
            author = Author.create!(first_name: "Douglas", last_name: "Adams")
            book = Book.create!(title: "Mostly Harmless", author_id: author.id, publisher_id: 1)
            review = BookReview.create(book_id: book.id, rating: 7)
            review.valid?
            expect(review.errors[:rating].first).to include("less than or equal to 5")
        end
    end
    context "when rating is less than 1" do
        it "throws an error" do
            author = Author.create!(first_name: "Douglas", last_name: "Adams")
            book = Book.create!(title: "Restaurant at the End of the Universe", author_id: author.id, publisher_id: 1)
            review = BookReview.create(book_id: book.id, rating: 0)
            review.valid?
            expect(review.errors[:rating].first).to include("greater than or equal to 1")
        end
    end
end
