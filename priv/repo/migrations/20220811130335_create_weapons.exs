defmodule HuntCutdown.Repo.Migrations.CreateWeapons do
  use Ecto.Migration

  def change do
    create table(:weapons, primary_key: false) do
      add :id, :string, primary_key: true
      add :full_name, :string
      add :short_name, :string
      add :cost, :integer
      add :category_id, references(:weapon_categories, type: :string, on_delete: :delete_all)
      add :size, :integer
      add :ammo_slot_count, :integer

      timestamps()
    end
  end
end
