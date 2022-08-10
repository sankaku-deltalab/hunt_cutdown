defmodule HuntCutdown.Repo.Migrations.CreateConsumables do
  use Ecto.Migration

  def change do
    create table(:consumables, primary_key: false) do
      add :id, :string, primary_key: true
      add :full_name, :string
      add :short_name, :string
      add :cost, :integer
      add :category_id, references(:consumable_categories, type: :string, on_delete: :delete_all)

      timestamps()
    end
  end
end
