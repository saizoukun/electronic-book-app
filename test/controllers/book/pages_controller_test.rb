require 'test_helper'

class Book::PagesControllerTest < ActionController::TestCase
  setup do
    @book_page = book_pages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:book_pages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create book_page" do
    assert_difference('Book::Page.count') do
      post :create, book_page: { book_id: @book_page.book_id, image: @book_page.image }
    end

    assert_redirected_to book_page_path(assigns(:book_page))
  end

  test "should show book_page" do
    get :show, id: @book_page
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @book_page
    assert_response :success
  end

  test "should update book_page" do
    patch :update, id: @book_page, book_page: { book_id: @book_page.book_id, image: @book_page.image }
    assert_redirected_to book_page_path(assigns(:book_page))
  end

  test "should destroy book_page" do
    assert_difference('Book::Page.count', -1) do
      delete :destroy, id: @book_page
    end

    assert_redirected_to book_pages_path
  end
end
