defmodule HuntCutdown.Repo.Migrations.CreateWeaponAmmos do
  use Ecto.Migration

  def change do
    create table(:weapon_ammos) do
      add :full_name, :string
      add :short_name, :string
      add :cost, :integer
      add :weapon_category_id, :string
      add :id, :string

      timestamps()
    end
  end
end
