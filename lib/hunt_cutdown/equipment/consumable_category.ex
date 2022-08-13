defmodule HuntCutdown.Equipment.ConsumableCategory do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :string, []}

  schema "consumable_categories" do
    field :full_name, :string
    field :short_name, :string

    timestamps()
  end

  @doc false
  def changeset(consumable_category, attrs) do
    consumable_category
    |> cast(attrs, [:id, :full_name, :short_name])
    |> validate_required([:id, :full_name, :short_name])
  end

  def null_object() do
    %__MODULE__{
      id: "_consumable_empty",
      full_name: "Empty",
      short_name: "Empty"
    }
  end
end
