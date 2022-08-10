defmodule HuntCutdown.Equipments.Tools do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tools" do
    field :category_id, :string
    field :cost, :integer
    field :full_name, :string
    field :id, :string
    field :short_name, :string

    timestamps()
  end

  @doc false
  def changeset(tools, attrs) do
    tools
    |> cast(attrs, [:full_name, :short_name, :cost, :category_id, :id])
    |> validate_required([:full_name, :short_name, :cost, :category_id, :id])
  end
end
