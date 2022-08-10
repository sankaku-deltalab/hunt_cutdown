defmodule HuntCutdown.Equipments.WeaponAmmos do
  use Ecto.Schema
  import Ecto.Changeset

  schema "weapon_ammos" do
    field :cost, :integer
    field :full_name, :string
    field :id, :string
    field :short_name, :string
    field :weapon_category_id, :string

    timestamps()
  end

  @doc false
  def changeset(weapon_ammos, attrs) do
    weapon_ammos
    |> cast(attrs, [:full_name, :short_name, :cost, :weapon_category_id, :id])
    |> validate_required([:full_name, :short_name, :cost, :weapon_category_id, :id])
  end
end
