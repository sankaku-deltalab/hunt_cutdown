defmodule HuntCutdown.EquipmentTest do
  use HuntCutdown.DataCase

  alias HuntCutdown.Equipment

  describe "weapons" do
    alias HuntCutdown.Equipment.Weapon

    import HuntCutdown.EquipmentFixtures

    @invalid_attrs %{ammo_slot_count: nil, category_id: nil, cost: nil, full_name: nil, id: nil, short_name: nil, size: nil}

    test "list_weapons/0 returns all weapons" do
      weapon = weapon_fixture()
      assert Equipment.list_weapons() == [weapon]
    end

    test "get_weapon!/1 returns the weapon with given id" do
      weapon = weapon_fixture()
      assert Equipment.get_weapon!(weapon.id) == weapon
    end

    test "create_weapon/1 with valid data creates a weapon" do
      valid_attrs = %{ammo_slot_count: 42, category_id: "some category_id", cost: 42, full_name: "some full_name", id: "some id", short_name: "some short_name", size: 42}

      assert {:ok, %Weapon{} = weapon} = Equipment.create_weapon(valid_attrs)
      assert weapon.ammo_slot_count == 42
      assert weapon.category_id == "some category_id"
      assert weapon.cost == 42
      assert weapon.full_name == "some full_name"
      assert weapon.id == "some id"
      assert weapon.short_name == "some short_name"
      assert weapon.size == 42
    end

    test "create_weapon/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Equipment.create_weapon(@invalid_attrs)
    end

    test "update_weapon/2 with valid data updates the weapon" do
      weapon = weapon_fixture()
      update_attrs = %{ammo_slot_count: 43, category_id: "some updated category_id", cost: 43, full_name: "some updated full_name", id: "some updated id", short_name: "some updated short_name", size: 43}

      assert {:ok, %Weapon{} = weapon} = Equipment.update_weapon(weapon, update_attrs)
      assert weapon.ammo_slot_count == 43
      assert weapon.category_id == "some updated category_id"
      assert weapon.cost == 43
      assert weapon.full_name == "some updated full_name"
      assert weapon.id == "some updated id"
      assert weapon.short_name == "some updated short_name"
      assert weapon.size == 43
    end

    test "update_weapon/2 with invalid data returns error changeset" do
      weapon = weapon_fixture()
      assert {:error, %Ecto.Changeset{}} = Equipment.update_weapon(weapon, @invalid_attrs)
      assert weapon == Equipment.get_weapon!(weapon.id)
    end

    test "delete_weapon/1 deletes the weapon" do
      weapon = weapon_fixture()
      assert {:ok, %Weapon{}} = Equipment.delete_weapon(weapon)
      assert_raise Ecto.NoResultsError, fn -> Equipment.get_weapon!(weapon.id) end
    end

    test "change_weapon/1 returns a weapon changeset" do
      weapon = weapon_fixture()
      assert %Ecto.Changeset{} = Equipment.change_weapon(weapon)
    end
  end

  describe "weapon_categories" do
    alias HuntCutdown.Equipment.WeaponCategory

    import HuntCutdown.EquipmentFixtures

    @invalid_attrs %{full_name: nil, id: nil, short_name: nil}

    test "list_weapon_categories/0 returns all weapon_categories" do
      weapon_category = weapon_category_fixture()
      assert Equipment.list_weapon_categories() == [weapon_category]
    end

    test "get_weapon_category!/1 returns the weapon_category with given id" do
      weapon_category = weapon_category_fixture()
      assert Equipment.get_weapon_category!(weapon_category.id) == weapon_category
    end

    test "create_weapon_category/1 with valid data creates a weapon_category" do
      valid_attrs = %{full_name: "some full_name", id: "some id", short_name: "some short_name"}

      assert {:ok, %WeaponCategory{} = weapon_category} = Equipment.create_weapon_category(valid_attrs)
      assert weapon_category.full_name == "some full_name"
      assert weapon_category.id == "some id"
      assert weapon_category.short_name == "some short_name"
    end

    test "create_weapon_category/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Equipment.create_weapon_category(@invalid_attrs)
    end

    test "update_weapon_category/2 with valid data updates the weapon_category" do
      weapon_category = weapon_category_fixture()
      update_attrs = %{full_name: "some updated full_name", id: "some updated id", short_name: "some updated short_name"}

      assert {:ok, %WeaponCategory{} = weapon_category} = Equipment.update_weapon_category(weapon_category, update_attrs)
      assert weapon_category.full_name == "some updated full_name"
      assert weapon_category.id == "some updated id"
      assert weapon_category.short_name == "some updated short_name"
    end

    test "update_weapon_category/2 with invalid data returns error changeset" do
      weapon_category = weapon_category_fixture()
      assert {:error, %Ecto.Changeset{}} = Equipment.update_weapon_category(weapon_category, @invalid_attrs)
      assert weapon_category == Equipment.get_weapon_category!(weapon_category.id)
    end

    test "delete_weapon_category/1 deletes the weapon_category" do
      weapon_category = weapon_category_fixture()
      assert {:ok, %WeaponCategory{}} = Equipment.delete_weapon_category(weapon_category)
      assert_raise Ecto.NoResultsError, fn -> Equipment.get_weapon_category!(weapon_category.id) end
    end

    test "change_weapon_category/1 returns a weapon_category changeset" do
      weapon_category = weapon_category_fixture()
      assert %Ecto.Changeset{} = Equipment.change_weapon_category(weapon_category)
    end
  end

  describe "weapon_ammos" do
    alias HuntCutdown.Equipment.WeaponAmmo

    import HuntCutdown.EquipmentFixtures

    @invalid_attrs %{cost: nil, full_name: nil, id: nil, short_name: nil, weapon_category_id: nil}

    test "list_weapon_ammos/0 returns all weapon_ammos" do
      weapon_ammo = weapon_ammo_fixture()
      assert Equipment.list_weapon_ammos() == [weapon_ammo]
    end

    test "get_weapon_ammo!/1 returns the weapon_ammo with given id" do
      weapon_ammo = weapon_ammo_fixture()
      assert Equipment.get_weapon_ammo!(weapon_ammo.id) == weapon_ammo
    end

    test "create_weapon_ammo/1 with valid data creates a weapon_ammo" do
      valid_attrs = %{cost: 42, full_name: "some full_name", id: "some id", short_name: "some short_name", weapon_category_id: "some weapon_category_id"}

      assert {:ok, %WeaponAmmo{} = weapon_ammo} = Equipment.create_weapon_ammo(valid_attrs)
      assert weapon_ammo.cost == 42
      assert weapon_ammo.full_name == "some full_name"
      assert weapon_ammo.id == "some id"
      assert weapon_ammo.short_name == "some short_name"
      assert weapon_ammo.weapon_category_id == "some weapon_category_id"
    end

    test "create_weapon_ammo/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Equipment.create_weapon_ammo(@invalid_attrs)
    end

    test "update_weapon_ammo/2 with valid data updates the weapon_ammo" do
      weapon_ammo = weapon_ammo_fixture()
      update_attrs = %{cost: 43, full_name: "some updated full_name", id: "some updated id", short_name: "some updated short_name", weapon_category_id: "some updated weapon_category_id"}

      assert {:ok, %WeaponAmmo{} = weapon_ammo} = Equipment.update_weapon_ammo(weapon_ammo, update_attrs)
      assert weapon_ammo.cost == 43
      assert weapon_ammo.full_name == "some updated full_name"
      assert weapon_ammo.id == "some updated id"
      assert weapon_ammo.short_name == "some updated short_name"
      assert weapon_ammo.weapon_category_id == "some updated weapon_category_id"
    end

    test "update_weapon_ammo/2 with invalid data returns error changeset" do
      weapon_ammo = weapon_ammo_fixture()
      assert {:error, %Ecto.Changeset{}} = Equipment.update_weapon_ammo(weapon_ammo, @invalid_attrs)
      assert weapon_ammo == Equipment.get_weapon_ammo!(weapon_ammo.id)
    end

    test "delete_weapon_ammo/1 deletes the weapon_ammo" do
      weapon_ammo = weapon_ammo_fixture()
      assert {:ok, %WeaponAmmo{}} = Equipment.delete_weapon_ammo(weapon_ammo)
      assert_raise Ecto.NoResultsError, fn -> Equipment.get_weapon_ammo!(weapon_ammo.id) end
    end

    test "change_weapon_ammo/1 returns a weapon_ammo changeset" do
      weapon_ammo = weapon_ammo_fixture()
      assert %Ecto.Changeset{} = Equipment.change_weapon_ammo(weapon_ammo)
    end
  end

  describe "tools" do
    alias HuntCutdown.Equipment.Tool

    import HuntCutdown.EquipmentFixtures

    @invalid_attrs %{category_id: nil, cost: nil, full_name: nil, id: nil, short_name: nil}

    test "list_tools/0 returns all tools" do
      tool = tool_fixture()
      assert Equipment.list_tools() == [tool]
    end

    test "get_tool!/1 returns the tool with given id" do
      tool = tool_fixture()
      assert Equipment.get_tool!(tool.id) == tool
    end

    test "create_tool/1 with valid data creates a tool" do
      valid_attrs = %{category_id: "some category_id", cost: 42, full_name: "some full_name", id: "some id", short_name: "some short_name"}

      assert {:ok, %Tool{} = tool} = Equipment.create_tool(valid_attrs)
      assert tool.category_id == "some category_id"
      assert tool.cost == 42
      assert tool.full_name == "some full_name"
      assert tool.id == "some id"
      assert tool.short_name == "some short_name"
    end

    test "create_tool/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Equipment.create_tool(@invalid_attrs)
    end

    test "update_tool/2 with valid data updates the tool" do
      tool = tool_fixture()
      update_attrs = %{category_id: "some updated category_id", cost: 43, full_name: "some updated full_name", id: "some updated id", short_name: "some updated short_name"}

      assert {:ok, %Tool{} = tool} = Equipment.update_tool(tool, update_attrs)
      assert tool.category_id == "some updated category_id"
      assert tool.cost == 43
      assert tool.full_name == "some updated full_name"
      assert tool.id == "some updated id"
      assert tool.short_name == "some updated short_name"
    end

    test "update_tool/2 with invalid data returns error changeset" do
      tool = tool_fixture()
      assert {:error, %Ecto.Changeset{}} = Equipment.update_tool(tool, @invalid_attrs)
      assert tool == Equipment.get_tool!(tool.id)
    end

    test "delete_tool/1 deletes the tool" do
      tool = tool_fixture()
      assert {:ok, %Tool{}} = Equipment.delete_tool(tool)
      assert_raise Ecto.NoResultsError, fn -> Equipment.get_tool!(tool.id) end
    end

    test "change_tool/1 returns a tool changeset" do
      tool = tool_fixture()
      assert %Ecto.Changeset{} = Equipment.change_tool(tool)
    end
  end

  describe "tool_categories" do
    alias HuntCutdown.Equipment.ToolCategory

    import HuntCutdown.EquipmentFixtures

    @invalid_attrs %{full_name: nil, id: nil, short_name: nil}

    test "list_tool_categories/0 returns all tool_categories" do
      tool_category = tool_category_fixture()
      assert Equipment.list_tool_categories() == [tool_category]
    end

    test "get_tool_category!/1 returns the tool_category with given id" do
      tool_category = tool_category_fixture()
      assert Equipment.get_tool_category!(tool_category.id) == tool_category
    end

    test "create_tool_category/1 with valid data creates a tool_category" do
      valid_attrs = %{full_name: "some full_name", id: "some id", short_name: "some short_name"}

      assert {:ok, %ToolCategory{} = tool_category} = Equipment.create_tool_category(valid_attrs)
      assert tool_category.full_name == "some full_name"
      assert tool_category.id == "some id"
      assert tool_category.short_name == "some short_name"
    end

    test "create_tool_category/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Equipment.create_tool_category(@invalid_attrs)
    end

    test "update_tool_category/2 with valid data updates the tool_category" do
      tool_category = tool_category_fixture()
      update_attrs = %{full_name: "some updated full_name", id: "some updated id", short_name: "some updated short_name"}

      assert {:ok, %ToolCategory{} = tool_category} = Equipment.update_tool_category(tool_category, update_attrs)
      assert tool_category.full_name == "some updated full_name"
      assert tool_category.id == "some updated id"
      assert tool_category.short_name == "some updated short_name"
    end

    test "update_tool_category/2 with invalid data returns error changeset" do
      tool_category = tool_category_fixture()
      assert {:error, %Ecto.Changeset{}} = Equipment.update_tool_category(tool_category, @invalid_attrs)
      assert tool_category == Equipment.get_tool_category!(tool_category.id)
    end

    test "delete_tool_category/1 deletes the tool_category" do
      tool_category = tool_category_fixture()
      assert {:ok, %ToolCategory{}} = Equipment.delete_tool_category(tool_category)
      assert_raise Ecto.NoResultsError, fn -> Equipment.get_tool_category!(tool_category.id) end
    end

    test "change_tool_category/1 returns a tool_category changeset" do
      tool_category = tool_category_fixture()
      assert %Ecto.Changeset{} = Equipment.change_tool_category(tool_category)
    end
  end

  describe "consumables" do
    alias HuntCutdown.Equipment.Consumable

    import HuntCutdown.EquipmentFixtures

    @invalid_attrs %{category_id: nil, cost: nil, full_name: nil, id: nil, short_name: nil}

    test "list_consumables/0 returns all consumables" do
      consumable = consumable_fixture()
      assert Equipment.list_consumables() == [consumable]
    end

    test "get_consumable!/1 returns the consumable with given id" do
      consumable = consumable_fixture()
      assert Equipment.get_consumable!(consumable.id) == consumable
    end

    test "create_consumable/1 with valid data creates a consumable" do
      valid_attrs = %{category_id: "some category_id", cost: 42, full_name: "some full_name", id: "some id", short_name: "some short_name"}

      assert {:ok, %Consumable{} = consumable} = Equipment.create_consumable(valid_attrs)
      assert consumable.category_id == "some category_id"
      assert consumable.cost == 42
      assert consumable.full_name == "some full_name"
      assert consumable.id == "some id"
      assert consumable.short_name == "some short_name"
    end

    test "create_consumable/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Equipment.create_consumable(@invalid_attrs)
    end

    test "update_consumable/2 with valid data updates the consumable" do
      consumable = consumable_fixture()
      update_attrs = %{category_id: "some updated category_id", cost: 43, full_name: "some updated full_name", id: "some updated id", short_name: "some updated short_name"}

      assert {:ok, %Consumable{} = consumable} = Equipment.update_consumable(consumable, update_attrs)
      assert consumable.category_id == "some updated category_id"
      assert consumable.cost == 43
      assert consumable.full_name == "some updated full_name"
      assert consumable.id == "some updated id"
      assert consumable.short_name == "some updated short_name"
    end

    test "update_consumable/2 with invalid data returns error changeset" do
      consumable = consumable_fixture()
      assert {:error, %Ecto.Changeset{}} = Equipment.update_consumable(consumable, @invalid_attrs)
      assert consumable == Equipment.get_consumable!(consumable.id)
    end

    test "delete_consumable/1 deletes the consumable" do
      consumable = consumable_fixture()
      assert {:ok, %Consumable{}} = Equipment.delete_consumable(consumable)
      assert_raise Ecto.NoResultsError, fn -> Equipment.get_consumable!(consumable.id) end
    end

    test "change_consumable/1 returns a consumable changeset" do
      consumable = consumable_fixture()
      assert %Ecto.Changeset{} = Equipment.change_consumable(consumable)
    end
  end

  describe "consumable_categories" do
    alias HuntCutdown.Equipment.ConsumableCategory

    import HuntCutdown.EquipmentFixtures

    @invalid_attrs %{full_name: nil, id: nil, short_name: nil}

    test "list_consumable_categories/0 returns all consumable_categories" do
      consumable_category = consumable_category_fixture()
      assert Equipment.list_consumable_categories() == [consumable_category]
    end

    test "get_consumable_category!/1 returns the consumable_category with given id" do
      consumable_category = consumable_category_fixture()
      assert Equipment.get_consumable_category!(consumable_category.id) == consumable_category
    end

    test "create_consumable_category/1 with valid data creates a consumable_category" do
      valid_attrs = %{full_name: "some full_name", id: "some id", short_name: "some short_name"}

      assert {:ok, %ConsumableCategory{} = consumable_category} = Equipment.create_consumable_category(valid_attrs)
      assert consumable_category.full_name == "some full_name"
      assert consumable_category.id == "some id"
      assert consumable_category.short_name == "some short_name"
    end

    test "create_consumable_category/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Equipment.create_consumable_category(@invalid_attrs)
    end

    test "update_consumable_category/2 with valid data updates the consumable_category" do
      consumable_category = consumable_category_fixture()
      update_attrs = %{full_name: "some updated full_name", id: "some updated id", short_name: "some updated short_name"}

      assert {:ok, %ConsumableCategory{} = consumable_category} = Equipment.update_consumable_category(consumable_category, update_attrs)
      assert consumable_category.full_name == "some updated full_name"
      assert consumable_category.id == "some updated id"
      assert consumable_category.short_name == "some updated short_name"
    end

    test "update_consumable_category/2 with invalid data returns error changeset" do
      consumable_category = consumable_category_fixture()
      assert {:error, %Ecto.Changeset{}} = Equipment.update_consumable_category(consumable_category, @invalid_attrs)
      assert consumable_category == Equipment.get_consumable_category!(consumable_category.id)
    end

    test "delete_consumable_category/1 deletes the consumable_category" do
      consumable_category = consumable_category_fixture()
      assert {:ok, %ConsumableCategory{}} = Equipment.delete_consumable_category(consumable_category)
      assert_raise Ecto.NoResultsError, fn -> Equipment.get_consumable_category!(consumable_category.id) end
    end

    test "change_consumable_category/1 returns a consumable_category changeset" do
      consumable_category = consumable_category_fixture()
      assert %Ecto.Changeset{} = Equipment.change_consumable_category(consumable_category)
    end
  end
end
