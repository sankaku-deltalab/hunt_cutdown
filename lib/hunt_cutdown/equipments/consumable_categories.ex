defmodule HuntCutdown.Equipments.ConsumableCategories do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :string, []}

  schema "consumable_categories" do
    field :full_name, :string
    field :short_name, :string

    timestamps()
  end

  @doc false
  def changeset(consumable_categories, attrs) do
    consumable_categories
    |> cast(attrs, [:full_name, :short_name, :id])
    |> validate_required([:full_name, :short_name, :id])
  end
end
