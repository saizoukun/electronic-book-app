json.extract! book_page, :id, :book_id, :image, :created_at, :updated_at
json.url book_page_url(book_page, format: :json)