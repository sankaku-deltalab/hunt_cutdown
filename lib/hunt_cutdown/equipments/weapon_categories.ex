defmodule HuntCutdown.Equipments.WeaponCategories do
  use Ecto.Schema
  import Ecto.Changeset

  schema "weapon_categories" do
    field :full_name, :string
    field :id, :string
    field :short_name, :string

    timestamps()
  end

  @doc false
  def changeset(weapon_categories, attrs) do
    weapon_categories
    |> cast(attrs, [:full_name, :short_name, :id])
    |> validate_required([:full_name, :short_name, :id])
  end
end
