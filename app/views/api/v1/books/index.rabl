
collection @books

attributes :id, :title

child (:author_books) do 
	attributes :author_id 
end