class Api::V1::BooksController < ApplicationController

	respond_to :json
	def index
      @books = Book.all
    end

    def show
      @book = Book.find(params[:id])
    end    	
end
