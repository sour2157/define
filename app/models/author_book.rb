class AuthorBook < ActiveRecord::Base
	belongs_to :author
	belongs_to :book

	validates_uniqueness_of :AuthorBook_id, scope: [:author_id, :book_id]
end
