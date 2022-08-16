defmodule HuntCutdown.Repo.Migrations.CreateWeaponAmmos do
  use Ecto.Migration

  def change do
    create table(:weapon_ammos, primary_key: false) do
      add :id, :string, primary_key: true
      add :full_name, :string, null: false
      add :short_name, :string, null: false
      add :cost, :integer, null: false

      add :weapon_category_id,
          references(:weapon_categories, type: :string, on_delete: :delete_all),
          null: false

      timestamps()
    end
  end
end
