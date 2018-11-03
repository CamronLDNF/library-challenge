class Library
    attr_accessor :books

    def initialize
        @books = [{title: 'Harry Potter', author: 'JK Rowling', available: true, return_date: nil}, 
        {title: 'Potter', author: 'Rowling', available: false},
        {title: 'Gatsby', author: 'Shahin', available: true},
        {title: 'Alien', author: 'Arnold', available: true}]
    end

    def checkout(title)
        @find_book = @books.find { |book| book[:title] == title }
        availablity = @find_book[:available]

        availablity ? book_is_available : 'The book is unavailable'
    end
    
    def book_is_available
        @find_book[:available] = false
        @find_book[:return_date] = Date.today.next_month(1)
        'The book is yours'
    end

    def return_date?(title)
        find_books_return_date = @books.find { |book| book[:title] == title }
        return_date = find_books_return_date[:return_date]
    end

    
end