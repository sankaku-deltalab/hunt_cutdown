defmodule HuntCutdown.Repo.Migrations.CreateWeapons do
  use Ecto.Migration

  def change do
    create table(:weapons) do
      add :full_name, :string
      add :short_name, :string
      add :cost, :integer
      add :category_id, :string
      add :size, :integer
      add :ammo_slot_count, :integer
      add :id, :string

      timestamps()
    end
  end
end
