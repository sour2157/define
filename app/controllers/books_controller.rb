class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  # GET /books
  # GET /books.json
  def index
    @books = Book.page(params[:page]).per(5)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @books }
    end
  end

  # GET /books/1
  # GET /books/1.json
  def show
    @book=Book.find(params[:id])
    @commentable = @book
    @comments = @commentable.comments
    @comment = Comment.new
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @book }
    end
  end

  # GET /books/new
  def new
    @book = Book.new
    @author_ids = Author.all
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
      format.js
    end
  end

  # GET /books/1/edit
  def edit
    @book = Book.find(params[:id])
    respond_to do |format|
    format.html
    format.js
    end
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render json: @book, status: :created, location: @book}
        format.js
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { head :no_content }
        format.js
      else
        format.html { render action: "edit" }
        format.json { render json: @book.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book = Book.find(params[:id])
    @book.delete
    
    respond_to do |format|
      format.html { redirect_to books_url }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:title, :cover, :author_ids => [])
    end

    def show_authors
      @author = Author.find(params[:id])
    end
end
