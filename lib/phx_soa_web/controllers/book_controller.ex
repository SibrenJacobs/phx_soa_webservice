defmodule PhxSoaWeb.BookController do
  use PhxSoaWeb, :controller

  alias PhxSoa.Library
  alias PhxSoa.Library.Book

  action_fallback PhxSoaWeb.FallbackController

  def index(conn, _params) do
    books = Library.list_books()
    render(conn, "index.json", books: books)
  end

  def create(conn, %{"book" => book_params}) do
    with {:ok, %Book{} = book} <- Library.create_book(book_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.book_path(conn, :show, book))
      |> render("show.json", book: book)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %Book{} = book} <- Library.get_book(id) do
      render(conn, "show.json", book: book)
    end
  end

  def update(conn, %{"id" => id, "book" => book_params}) do
    with {:ok, %Book{} = book} <- Library.get_book(id) do
      with {:ok, %Book{} = book} <- Library.update_book(book, book_params) do
        render(conn, "show.json", book: book)
      end
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, %Book{} = book} <- Library.get_book(id) do
      with {:ok, %Book{}} <- Library.delete_book(book) do
        send_resp(conn, :no_content, "")
      end
    end
  end
end
