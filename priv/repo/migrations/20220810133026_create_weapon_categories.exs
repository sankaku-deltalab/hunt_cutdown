defmodule HuntCutdown.Repo.Migrations.CreateWeaponCategories do
  use Ecto.Migration

  def change do
    create table(:weapon_categories) do
      add :full_name, :string
      add :short_name, :string
      add :id, :string

      timestamps()
    end
  end
end
