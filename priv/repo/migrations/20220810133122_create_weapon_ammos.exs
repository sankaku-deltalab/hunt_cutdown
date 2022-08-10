defmodule HuntCutdown.Repo.Migrations.CreateWeaponAmmos do
  use Ecto.Migration

  def change do
    create table(:weapon_ammos, primary_key: false) do
      add :id, :string, primary_key: true
      add :full_name, :string
      add :short_name, :string
      add :cost, :integer

      add :weapon_category_id,
          references(:weapon_categories, type: :string, on_delete: :delete_all)

      timestamps()
    end
  end
end
