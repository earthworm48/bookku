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
		# byebug
    @book.save!
		@book.update!(book_params)
    @book.price = calculate_price(@book.categories,@book.condition)
    # @book.update!
    # byebug
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
  	@book = Book.find(params[:book][:id])
    # byebug
		if @book.update!(book_params)

			@book.update!(price: calculate_price(@book.categories,@book.condition))
      
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

  def calculate_price(categories,book_condition)
    case categories
    when 'Primary School Textbooks'
      x = 2
    when 'Secondary School Textbooks'
      x = 3
    when 'University Textbooks'
      x = 5
    when 'Non-Textbooks'
      x = 1
    end
    # byebug
    case book_condition
    when 'Brand new'
      price = x
    when 'OK'
      price = x * 2 / 3
      # byebug
    when 'Looks bad'
      price = x * 1 / 3
    end
    
    return 1 if price == 0
    # byebug
  end

end