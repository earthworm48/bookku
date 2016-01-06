class BooksController < ApplicationController

  def index
    @books = Book.all  
  end

  def new
    @book = Book.new
  end

  def search
    @books = GoogleBooks.search(params[:term])
    render 'search' 
  end
  
  def form
    @isbn = params[:book][:isbn].to_i
    
  end

  def create
    x = params[:book][:isbn].to_i
    books = GoogleBooks.search("isbn: #{x}")
    book = books.first
		@book = current_user.books.new(name: book.title, description: book.description, isbn: book.isbn.to_s, image_url: book.image_link) 
		
    @book.save!
		@book.update!(book_params)
    redirect_to @book
  end

  def show
  	@book = Book.find(params[:id])
    @book_transaction = BookTransaction.new
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update

  	@book = Book.find(params[:id])
		if @book.update(book_params)
			
			redirect_to @book
		else
			render :edit
		end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def local_search
    @books = Book.search params[:term]
    render :index
  end

	private
	def book_params
		params.require(:book).permit(:name, :price, :categories, :condition, :description, :prefered_location, :isbn)
	end

end