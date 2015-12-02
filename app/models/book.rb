class Book < ActiveRecord::Base
	has_many :comments, :as => :commentable
	has_many :cover, :as => :photoable
	has_and_belongs_to_many :authors, :join_table => :author_books

	has_attached_file :cover, styles: { medium: "200x200>", thumb: "50x50#" },
	default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/
end
