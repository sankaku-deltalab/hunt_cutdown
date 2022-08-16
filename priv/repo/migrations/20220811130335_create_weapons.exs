defmodule HuntCutdown.Repo.Migrations.CreateWeapons do
  use Ecto.Migration

  def change do
    create table(:weapons, primary_key: false) do
      add :id, :string, primary_key: true
      add :full_name, :string, null: false
      add :short_name, :string, null: false
      add :cost, :integer, null: false

      add :category_id, references(:weapon_categories, type: :string, on_delete: :delete_all),
        null: false

      add :size, :integer, null: false
      add :ammo_slot_count, :integer, null: false

      timestamps()
    end
  end
end
