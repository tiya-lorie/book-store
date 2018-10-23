class Api::V1::Customers::BooksController < Api::V1::Customers::ApplicationController
  before_action :set_customer, only: %i[index create]
  before_action :set_book, only: %i[create destroy]

  def index
    books = ::Customers::Books::List.run!(customer: @customer)
    render json: { books: books.as_json }
  end
  
  def create
    book = ::Customers::Books::Create.run!(customer: @customer, book: @book)
    render json: { book: book.as_json }
  end

  def destroy
    ::Customers::Books::Destroy.run!(params.merge(book: @book))
    render json: { message: 'Book deleted from customer successfully' }
  end

  private

  def set_book
    @book = ::Authors::Books::Find.run!(id: params[:id])
  end
end