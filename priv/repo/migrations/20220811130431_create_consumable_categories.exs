defmodule HuntCutdown.Repo.Migrations.CreateConsumableCategories do
  use Ecto.Migration

  def change do
    create table(:consumable_categories, primary_key: false) do
      add :id, :string, primary_key: true
      add :full_name, :string
      add :short_name, :string

      timestamps()
    end
  end
end
