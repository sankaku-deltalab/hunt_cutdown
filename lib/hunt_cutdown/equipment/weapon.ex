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
end
