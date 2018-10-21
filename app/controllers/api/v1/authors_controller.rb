class Api::V1::AuthorsController < Api::V1::ApplicationController
  before_action :set_author, except: %i[index create]

  def index
    authors = ::Authors::List.run!
    render json: { authors: authors.as_json }
  end

  def show
    render json: { author: @author.as_json }
  end

  def create
    author = ::Authors::Create.run!(params)
    render json: { author: author.as_json }
  end

  def update
    ::Authors::Update.run!(params.merge(author: @author))
    render json: { author: @author.as_json }
  end

  def destroy
    ::Authors::Destroy.run!(author: @author)
    render json: { message: 'Author deleted successfully' }
  end

  private

  def set_author
    @author = ::Authors::Find.run!(id: params[:id])
  end
end