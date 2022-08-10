defmodule HuntCutdown.Repo.Migrations.CreateTools do
  use Ecto.Migration

  def change do
    create table(:tools) do
      add :full_name, :string
      add :short_name, :string
      add :cost, :integer
      add :category_id, :string
      add :id, :string

      timestamps()
    end
  end
end
