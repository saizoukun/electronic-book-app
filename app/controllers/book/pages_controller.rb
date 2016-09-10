class Book::PagesController < ApplicationController
  before_action :set_book_page, only: [:show, :edit, :update, :destroy, :download]

  # GET /book/pages
  # GET /book/pages.json
  def index
    @book_pages = book.pages.all
  end

  # GET /book/pages/1
  # GET /book/pages/1.json
  def show
  end

  # GET /book/pages/new
  def new
    @book_page = Book::Page.new
  end

  # GET /book/pages/1/edit
  def edit
  end

  # POST /book/pages
  # POST /book/pages.json
  def create
    @book_page = Book::Page.new(book_page_params.merge(book: book))

    respond_to do |format|
      if @book_page.save
        format.html { redirect_to book_pages_path(book_id: book.id), notice: 'Page was successfully created.' }
        format.json { render :show, status: :created, location: @book_page }
      else
        format.html { render :new }
        format.json { render json: @book_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /book/pages/1
  # PATCH/PUT /book/pages/1.json
  def update
    respond_to do |format|
      if @book_page.update(book_page_params)
        format.html { redirect_to @book_page, notice: 'Page was successfully updated.' }
        format.json { render :show, status: :ok, location: @book_page }
      else
        format.html { render :edit }
        format.json { render json: @book_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /book/pages/1
  # DELETE /book/pages/1.json
  def destroy
    @book_page.destroy
    respond_to do |format|
      format.html { redirect_to book_pages_url, notice: 'Page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def book
    @book ||= Book.find(params[:book_id])
  end
  helper_method :book
    # Use callbacks to share common setup or constraints between actions.
    def set_book_page
      @book_page = book.pages.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_page_params
      params.require(:book_page).permit(:book_id, :image)
    end
end
