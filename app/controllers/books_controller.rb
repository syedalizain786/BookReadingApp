class BooksController < ApplicationController
  
 
  #load_and_authorize_resource


  def seehome
    @books=Book.all
    
  end

  def index
    
   #@books=Book.accessible_by(current_ability)    
    @pagy, @books = pagy(policy_scope(Book))

    
    # if params[:search].present? && params[:search] != ""
    # @books=policy_scope(Book).where("title LIKE ?","%"+params[:search]+"%")
    # end
    
  end
   
  def search
  
    query = params[:query]

    @books = Book.joins(:author).where('authors.auname LIKE ?', "%#{query}%")
    respond_to do |format|
      format.json { render json: @books.map { |book| {id:book.id, title: book.title, author_name: book.author.auname } } }
    end
  end


 
  def show  
    @book = Book.find(params[:id])
    authorize @book
  end

  def new
    @book = Book.new 
  end

  
  def create
    @book = Book.new(book_params)
    @book.user = current_user # Assign the book to the current user
    authorize @book

    if @book.save
      redirect_to @book
    else
      render :new, status: :unprocessable_entity
    end
  end


  def edit
    @book=Book.find(params[:id])
   authorize @book

  end

  def update
    @book=Book.find(params[:id])
    authorize @book

    if @book.update(book_params)
      redirect_to @book
    else
      render :new, status: :unprocessable_entity
    end
  end


  def destroy
    @book=Book.find(params[:id])
   authorize @book

    @book.destroy

    redirect_to books_path,status: :see_other
  end

  private
  def book_params
    params.require(:book).permit(:title, :summary, :pubdate, :author_id,:user_id)
  end

end
