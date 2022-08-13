defmodule HuntCutdown.Equipment.WeaponAmmo do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :string, []}

  schema "weapon_ammos" do
    field :cost, :integer
    field :full_name, :string
    field :short_name, :string
    field :weapon_category_id, :string

    timestamps()
  end

  @doc false
  def changeset(weapon_ammo, attrs) do
    weapon_ammo
    |> cast(attrs, [:id, :full_name, :short_name, :cost, :weapon_category_id])
    |> validate_required([:id, :full_name, :short_name, :cost, :weapon_category_id])
  end

  def null_object() do
    %__MODULE__{
      id: "_ammo_empty",
      full_name: "Empty",
      short_name: "Empty",
      weapon_category_id: "_weapon_empty"
    }
  end
end
