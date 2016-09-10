class Book::Page < ActiveRecord::Base
  belongs_to :book
  mount_uploader :image, PageUploader

  def to_html
    @size = FastImage.size(image.path)
    @type = FastImage.type(image.path)
    @blob = Base64.encode64(File.open(image.path, 'rb', &:read))

    template = ERB.new(File.read(
      Rails.root.join('app','views','book','pages','content.html.erb')
    ))
    html = template.result(binding)

    path = Rails.root.join('tmp','page',"#{id}.html").to_s
    FileUtils.mkdir_p(File.dirname(path))
    File.open(path, 'w') do |file|
      file.write(html)
    end
    path
  end
end
