defmodule HuntCutdown.Repo.Migrations.CreateConsumables do
  use Ecto.Migration

  def change do
    create table(:consumables, primary_key: false) do
      add :id, :string, primary_key: true
      add :full_name, :string, null: false
      add :short_name, :string, null: false
      add :cost, :integer, null: false

      add :category_id, references(:consumable_categories, type: :string, on_delete: :delete_all),
        null: false

      timestamps()
    end
  end
end
