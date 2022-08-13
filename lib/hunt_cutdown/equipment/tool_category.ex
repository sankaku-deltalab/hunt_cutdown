defmodule HuntCutdown.Equipment.ToolCategory do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :string, []}

  schema "tool_categories" do
    field :full_name, :string
    field :short_name, :string

    timestamps()
  end

  @doc false
  def changeset(tool_category, attrs) do
    tool_category
    |> cast(attrs, [:id, :full_name, :short_name])
    |> validate_required([:id, :full_name, :short_name])
  end

  def null_object() do
    %__MODULE__{
      id: "_tool_empty",
      full_name: "Empty",
      short_name: "Empty"
    }
  end
end
