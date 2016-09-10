class Book < ActiveRecord::Base
  has_many :pages, class_name: 'Book::Page'

  def to_epub
    book = self
    epub = EeePub.make do
      title(book.title)
      uid('BookId')
      identifier(SecureRandom.uuid, scheme: :uuid, id: 'BookId')

      files book.pages.map{ |page| page.to_html }
    end

    path = Rails.root.join('tmp','epub',"#{id}.epub").to_s
    FileUtils.mkdir_p(File.dirname(path))
    epub.save(path)

    path
  end
end
