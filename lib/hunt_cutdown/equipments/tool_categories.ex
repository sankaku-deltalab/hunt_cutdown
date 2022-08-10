defmodule HuntCutdown.Equipments.ToolCategories do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tool_categories" do
    field :full_name, :string
    field :id, :string
    field :short_name, :string

    timestamps()
  end

  @doc false
  def changeset(tool_categories, attrs) do
    tool_categories
    |> cast(attrs, [:full_name, :short_name, :id])
    |> validate_required([:full_name, :short_name, :id])
  end
end
