class Api::V1::Authors::BooksController < Api::V1::Authors::ApplicationController
  before_action :set_author, only: %i[index create]
  before_action :set_book, except: %i[index create]

  def index
    books = ::Authors::Books::List.run!(author: @author)
    render json: { books: books.as_json }
  end

  def show
    render json: { book: @book.as_json }
  end

  def create
    book = ::Authors::Books::Create.run!(params.merge(author: @author))
    render json: { book: book.as_json }
  end

  def update
    ::Authors::Books::Update.run!(params.merge(book: @book))
    render json: { book: @book.as_json }
  end

  def destroy
    ::Authors::Books::Destroy.run!(book: @book)
    render json: { message: 'Book deleted successfully' }
  end

  private

  def set_book
    @book = ::Authors::Books::Find.run!(id: params[:id])
  end
end