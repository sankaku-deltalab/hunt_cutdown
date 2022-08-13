defmodule HuntCutdown.Equipment.Weapon do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :string, []}

  schema "weapons" do
    field :ammo_slot_count, :integer
    field :category_id, :string
    field :cost, :integer
    field :full_name, :string
    field :short_name, :string
    field :size, :integer

    timestamps()
  end

  @doc false
  def changeset(weapon, attrs) do
    weapon
    |> cast(attrs, [:id, :full_name, :short_name, :cost, :category_id, :size, :ammo_slot_count])
    |> validate_required([
      :id,
      :full_name,
      :short_name,
      :cost,
      :category_id,
      :size,
      :ammo_slot_count
    ])
  end

  def null_object() do
    %__MODULE__{
      id: "_weapon_empty",
      ammo_slot_count: 0,
      category_id: "_weapon_empty",
      cost: 0,
      full_name: "Empty",
      short_name: "Empty",
      size: 0
    }
  end
end
