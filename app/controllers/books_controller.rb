class BooksController < ApplicationController

 before_action :authenticate_user!

	def index
  	@book = Book.new
  	@books = Book.all
  	@user = User.find(current_user.id)
    end

    def show
    @book = Book.new
  	@book = Book.find(params[:id])
  	@user = User.find(current_user.id)
    end

    def create
  	@book = Book.new(book_params)
  	 if @book.save
  		flash[:notice] = "Book was successfully created!"
  	    redirect_to book_path(@book.id)
     else
        @books = Book.all
        render :index
      end
    end

    def edit
  	@book = Book.find(params[:id])
    end

    def update
  	@book = Book.find(params[:id])
  	 if @book.update(book_params)
  		flash[:notice] = "Book was successfully updated!"
  		redirect_to book_path(@book)
  	 else
  		render :edit
  	 end
    end

    def destroy
  	book = Book.find(params[:id])
  	book.destroy
  	redirect_to books_path
    end

  private
  def book_params
  	params.require(:book).permit(:title,:body)
  end

end