defmodule HuntCutdown.Repo.Migrations.CreateToolCategories do
  use Ecto.Migration

  def change do
    create table(:tool_categories, primary_key: false) do
      add :id, :string, primary_key: true
      add :full_name, :string
      add :short_name, :string

      timestamps()
    end
  end
end
