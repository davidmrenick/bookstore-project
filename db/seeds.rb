# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Author.destroy_all

Author.create!([{
    first_name: "Douglas", last_name: "Adams"
},
{
    first_name: "Alan", last_name: "Moore"
},
{
    first_name: "H.P.", last_name: "Lovecraft"
},
{
    first_name: "Frank", last_name: "Miller"
},
{
    first_name: "Aaron", last_name: "McGruder"
},
{
    first_name: "Arthur Conan", last_name: "Doyle"
},
{
    first_name: "Orson Scott", last_name: "Card"
},
{
    first_name: "William", last_name: "Gibson"
}
])

p "Created #{Author.count} Authors"

Publisher.destroy_all

Publisher.create!([{
    name: "Marvel Publishing"   
},
{
    name: "Dark Horse Comics"
},
{
    name: "Penguin Books"
},
{
    name: "Beeblebrox Publishing"
},
{
    name: "Zorg Publishing LLC"
}
])

p "Created #{Publisher.count} Publishers"

BookFormatType.destroy_all

BookFormatType.create!([{
    name: "Hardcover", physical: true
},
{
    name: "Paperback", physical: true
},

{
    name: "Leatherbound", physical: true
},

{
    name: "Kindle", physical: false
},

{
    name: "PDF", physical: false
}
])

p "Created #{BookFormatType.count} Book Format Types"

Book.destroy_all

Book.create!([{
    title: "Boondocks: All the Rage", publisher_id: 3, author_id: 5
},
{
    title: "Hitchhiker's Guide to the Galaxy", publisher_id: 4, author_id: 1
},
{
    title: "The Watchmen", publisher_id: 2, author_id: 2
},
{
    title: "V for Vendetta", publisher_id: 2, author_id: 2
},
{
    title: "The Mountains of Madness", publisher_id: 5, author_id: 3
},
{
    title: "Call of Cthulhu", publisher_id: 5, author_id: 3
},
{
    title: "A Study in Scarlet", publisher_id: 3, author_id: 6
}
])

p "Created #{Book.count} Books"

BookFormat.destroy_all

BookFormat.create!([{
    book_id: 1, book_format_type_id: 2
},
{
    book_id: 1, book_format_type_id: 4
},
{
    book_id: 1, book_format_type_id: 5
},
{
    book_id: 2, book_format_type_id: 1
},
{
    book_id: 2, book_format_type_id: 3
},
{
    book_id: 3, book_format_type_id: 2
},
{
    book_id: 4, book_format_type_id: 2
},
{
    book_id: 4, book_format_type_id: 4
},
{
    book_id: 4, book_format_type_id: 5
},
{
    book_id: 5, book_format_type_id: 3
},
{
    book_id: 6, book_format_type_id: 1
},
{
    book_id: 6, book_format_type_id: 3
},
{
    book_id: 7, book_format_type_id: 1
},
{
    book_id: 7, book_format_type_id: 2
},
{
    book_id: 7, book_format_type_id: 4
},
{
    book_id: 7, book_format_type_id: 5
}
])

p "Created #{BookFormat.count} Book Formats"

BookReview.destroy_all

BookReview.create!([{
    book_id: 1, rating: 3
},
{
    book_id: 1, rating: 4
},
{
    book_id: 1, rating: 2
},
{
    book_id: 1, rating: 5
},
{
    book_id: 1, rating: 5
},
{
    book_id: 1, rating: 4
},
{
    book_id: 2, rating: 1
},
{
    book_id: 2, rating: 5
},
{
    book_id: 3, rating: 4
},
{
    book_id: 3, rating: 5
},
{
    book_id: 4, rating: 1
},
{
    book_id: 4, rating: 2
},
{
    book_id: 4, rating: 3
},
{
    book_id: 4, rating: 4
},
{
    book_id: 4, rating: 5
},
{
    book_id: 4, rating: 4
},
{
    book_id: 5, rating: 2
}
])

p "Created #{BookReview.count} Book Reviews"
