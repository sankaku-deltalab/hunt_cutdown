defmodule HuntCutdown.Repo.Migrations.CreateTools do
  use Ecto.Migration

  def change do
    create table(:tools, primary_key: false) do
      add :id, :string, primary_key: true
      add :full_name, :string
      add :short_name, :string
      add :cost, :integer
      add :category_id, references(:tool_categories, type: :string, on_delete: :delete_all)

      timestamps()
    end
  end
end
