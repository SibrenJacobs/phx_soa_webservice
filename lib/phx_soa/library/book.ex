defmodule PhxSoa.Library.Book do
  use Ecto.Schema
  import Ecto.Changeset

  schema "books" do
    field :author, :string
    field :name, :string
    field :pages, :integer

  end

  @doc false
  def changeset(book, attrs) do
    book
    |> cast(attrs, [:name, :author, :pages])
    |> validate_required([:name, :author, :pages])
  end
end
