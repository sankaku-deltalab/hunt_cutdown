defmodule HuntCutdown.Equipment.Consumable do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :string, []}

  schema "consumables" do
    field :category_id, :string
    field :cost, :integer
    field :full_name, :string
    field :short_name, :string

    timestamps()
  end

  @doc false
  def changeset(consumable, attrs) do
    consumable
    |> cast(attrs, [:id, :full_name, :short_name, :cost, :category_id])
    |> validate_required([:id, :full_name, :short_name, :cost, :category_id])
  end
end
