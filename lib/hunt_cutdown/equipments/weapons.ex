defmodule HuntCutdown.Equipments.Weapons do
  use Ecto.Schema
  import Ecto.Changeset

  schema "weapons" do
    field :ammo_slot_count, :integer
    field :category_id, :string
    field :cost, :integer
    field :full_name, :string
    field :id, :string
    field :short_name, :string
    field :size, :integer

    timestamps()
  end

  @doc false
  def changeset(weapons, attrs) do
    weapons
    |> cast(attrs, [:full_name, :short_name, :cost, :category_id, :size, :ammo_slot_count, :id])
    |> validate_required([:full_name, :short_name, :cost, :category_id, :size, :ammo_slot_count, :id])
  end
end
