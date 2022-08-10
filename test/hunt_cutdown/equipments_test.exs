defmodule HuntCutdown.EquipmentsTest do
  use HuntCutdown.DataCase

  alias HuntCutdown.Equipments

  describe "weapon_categories" do
    alias HuntCutdown.Equipments.WeaponCategories

    import HuntCutdown.EquipmentsFixtures

    @invalid_attrs %{full_name: nil, id: nil, short_name: nil}

    test "list_weapon_categories/0 returns all weapon_categories" do
      weapon_categories = weapon_categories_fixture()
      assert Equipments.list_weapon_categories() == [weapon_categories]
    end

    test "get_weapon_categories!/1 returns the weapon_categories with given id" do
      weapon_categories = weapon_categories_fixture()
      assert Equipments.get_weapon_categories!(weapon_categories.id) == weapon_categories
    end

    test "create_weapon_categories/1 with valid data creates a weapon_categories" do
      valid_attrs = %{full_name: "some full_name", id: "some id", short_name: "some short_name"}

      assert {:ok, %WeaponCategories{} = weapon_categories} = Equipments.create_weapon_categories(valid_attrs)
      assert weapon_categories.full_name == "some full_name"
      assert weapon_categories.id == "some id"
      assert weapon_categories.short_name == "some short_name"
    end

    test "create_weapon_categories/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Equipments.create_weapon_categories(@invalid_attrs)
    end

    test "update_weapon_categories/2 with valid data updates the weapon_categories" do
      weapon_categories = weapon_categories_fixture()
      update_attrs = %{full_name: "some updated full_name", id: "some updated id", short_name: "some updated short_name"}

      assert {:ok, %WeaponCategories{} = weapon_categories} = Equipments.update_weapon_categories(weapon_categories, update_attrs)
      assert weapon_categories.full_name == "some updated full_name"
      assert weapon_categories.id == "some updated id"
      assert weapon_categories.short_name == "some updated short_name"
    end

    test "update_weapon_categories/2 with invalid data returns error changeset" do
      weapon_categories = weapon_categories_fixture()
      assert {:error, %Ecto.Changeset{}} = Equipments.update_weapon_categories(weapon_categories, @invalid_attrs)
      assert weapon_categories == Equipments.get_weapon_categories!(weapon_categories.id)
    end

    test "delete_weapon_categories/1 deletes the weapon_categories" do
      weapon_categories = weapon_categories_fixture()
      assert {:ok, %WeaponCategories{}} = Equipments.delete_weapon_categories(weapon_categories)
      assert_raise Ecto.NoResultsError, fn -> Equipments.get_weapon_categories!(weapon_categories.id) end
    end

    test "change_weapon_categories/1 returns a weapon_categories changeset" do
      weapon_categories = weapon_categories_fixture()
      assert %Ecto.Changeset{} = Equipments.change_weapon_categories(weapon_categories)
    end
  end

  describe "weapons" do
    alias HuntCutdown.Equipments.Weapons

    import HuntCutdown.EquipmentsFixtures

    @invalid_attrs %{ammo_slot_count: nil, category_id: nil, cost: nil, full_name: nil, id: nil, short_name: nil, size: nil}

    test "list_weapons/0 returns all weapons" do
      weapons = weapons_fixture()
      assert Equipments.list_weapons() == [weapons]
    end

    test "get_weapons!/1 returns the weapons with given id" do
      weapons = weapons_fixture()
      assert Equipments.get_weapons!(weapons.id) == weapons
    end

    test "create_weapons/1 with valid data creates a weapons" do
      valid_attrs = %{ammo_slot_count: 42, category_id: "some category_id", cost: 42, full_name: "some full_name", id: "some id", short_name: "some short_name", size: 42}

      assert {:ok, %Weapons{} = weapons} = Equipments.create_weapons(valid_attrs)
      assert weapons.ammo_slot_count == 42
      assert weapons.category_id == "some category_id"
      assert weapons.cost == 42
      assert weapons.full_name == "some full_name"
      assert weapons.id == "some id"
      assert weapons.short_name == "some short_name"
      assert weapons.size == 42
    end

    test "create_weapons/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Equipments.create_weapons(@invalid_attrs)
    end

    test "update_weapons/2 with valid data updates the weapons" do
      weapons = weapons_fixture()
      update_attrs = %{ammo_slot_count: 43, category_id: "some updated category_id", cost: 43, full_name: "some updated full_name", id: "some updated id", short_name: "some updated short_name", size: 43}

      assert {:ok, %Weapons{} = weapons} = Equipments.update_weapons(weapons, update_attrs)
      assert weapons.ammo_slot_count == 43
      assert weapons.category_id == "some updated category_id"
      assert weapons.cost == 43
      assert weapons.full_name == "some updated full_name"
      assert weapons.id == "some updated id"
      assert weapons.short_name == "some updated short_name"
      assert weapons.size == 43
    end

    test "update_weapons/2 with invalid data returns error changeset" do
      weapons = weapons_fixture()
      assert {:error, %Ecto.Changeset{}} = Equipments.update_weapons(weapons, @invalid_attrs)
      assert weapons == Equipments.get_weapons!(weapons.id)
    end

    test "delete_weapons/1 deletes the weapons" do
      weapons = weapons_fixture()
      assert {:ok, %Weapons{}} = Equipments.delete_weapons(weapons)
      assert_raise Ecto.NoResultsError, fn -> Equipments.get_weapons!(weapons.id) end
    end

    test "change_weapons/1 returns a weapons changeset" do
      weapons = weapons_fixture()
      assert %Ecto.Changeset{} = Equipments.change_weapons(weapons)
    end
  end

  describe "weapon_ammos" do
    alias HuntCutdown.Equipments.WeaponAmmos

    import HuntCutdown.EquipmentsFixtures

    @invalid_attrs %{cost: nil, full_name: nil, id: nil, short_name: nil, weapon_category_id: nil}

    test "list_weapon_ammos/0 returns all weapon_ammos" do
      weapon_ammos = weapon_ammos_fixture()
      assert Equipments.list_weapon_ammos() == [weapon_ammos]
    end

    test "get_weapon_ammos!/1 returns the weapon_ammos with given id" do
      weapon_ammos = weapon_ammos_fixture()
      assert Equipments.get_weapon_ammos!(weapon_ammos.id) == weapon_ammos
    end

    test "create_weapon_ammos/1 with valid data creates a weapon_ammos" do
      valid_attrs = %{cost: 42, full_name: "some full_name", id: "some id", short_name: "some short_name", weapon_category_id: "some weapon_category_id"}

      assert {:ok, %WeaponAmmos{} = weapon_ammos} = Equipments.create_weapon_ammos(valid_attrs)
      assert weapon_ammos.cost == 42
      assert weapon_ammos.full_name == "some full_name"
      assert weapon_ammos.id == "some id"
      assert weapon_ammos.short_name == "some short_name"
      assert weapon_ammos.weapon_category_id == "some weapon_category_id"
    end

    test "create_weapon_ammos/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Equipments.create_weapon_ammos(@invalid_attrs)
    end

    test "update_weapon_ammos/2 with valid data updates the weapon_ammos" do
      weapon_ammos = weapon_ammos_fixture()
      update_attrs = %{cost: 43, full_name: "some updated full_name", id: "some updated id", short_name: "some updated short_name", weapon_category_id: "some updated weapon_category_id"}

      assert {:ok, %WeaponAmmos{} = weapon_ammos} = Equipments.update_weapon_ammos(weapon_ammos, update_attrs)
      assert weapon_ammos.cost == 43
      assert weapon_ammos.full_name == "some updated full_name"
      assert weapon_ammos.id == "some updated id"
      assert weapon_ammos.short_name == "some updated short_name"
      assert weapon_ammos.weapon_category_id == "some updated weapon_category_id"
    end

    test "update_weapon_ammos/2 with invalid data returns error changeset" do
      weapon_ammos = weapon_ammos_fixture()
      assert {:error, %Ecto.Changeset{}} = Equipments.update_weapon_ammos(weapon_ammos, @invalid_attrs)
      assert weapon_ammos == Equipments.get_weapon_ammos!(weapon_ammos.id)
    end

    test "delete_weapon_ammos/1 deletes the weapon_ammos" do
      weapon_ammos = weapon_ammos_fixture()
      assert {:ok, %WeaponAmmos{}} = Equipments.delete_weapon_ammos(weapon_ammos)
      assert_raise Ecto.NoResultsError, fn -> Equipments.get_weapon_ammos!(weapon_ammos.id) end
    end

    test "change_weapon_ammos/1 returns a weapon_ammos changeset" do
      weapon_ammos = weapon_ammos_fixture()
      assert %Ecto.Changeset{} = Equipments.change_weapon_ammos(weapon_ammos)
    end
  end

  describe "tool_categories" do
    alias HuntCutdown.Equipments.ToolCategories

    import HuntCutdown.EquipmentsFixtures

    @invalid_attrs %{full_name: nil, id: nil, short_name: nil}

    test "list_tool_categories/0 returns all tool_categories" do
      tool_categories = tool_categories_fixture()
      assert Equipments.list_tool_categories() == [tool_categories]
    end

    test "get_tool_categories!/1 returns the tool_categories with given id" do
      tool_categories = tool_categories_fixture()
      assert Equipments.get_tool_categories!(tool_categories.id) == tool_categories
    end

    test "create_tool_categories/1 with valid data creates a tool_categories" do
      valid_attrs = %{full_name: "some full_name", id: "some id", short_name: "some short_name"}

      assert {:ok, %ToolCategories{} = tool_categories} = Equipments.create_tool_categories(valid_attrs)
      assert tool_categories.full_name == "some full_name"
      assert tool_categories.id == "some id"
      assert tool_categories.short_name == "some short_name"
    end

    test "create_tool_categories/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Equipments.create_tool_categories(@invalid_attrs)
    end

    test "update_tool_categories/2 with valid data updates the tool_categories" do
      tool_categories = tool_categories_fixture()
      update_attrs = %{full_name: "some updated full_name", id: "some updated id", short_name: "some updated short_name"}

      assert {:ok, %ToolCategories{} = tool_categories} = Equipments.update_tool_categories(tool_categories, update_attrs)
      assert tool_categories.full_name == "some updated full_name"
      assert tool_categories.id == "some updated id"
      assert tool_categories.short_name == "some updated short_name"
    end

    test "update_tool_categories/2 with invalid data returns error changeset" do
      tool_categories = tool_categories_fixture()
      assert {:error, %Ecto.Changeset{}} = Equipments.update_tool_categories(tool_categories, @invalid_attrs)
      assert tool_categories == Equipments.get_tool_categories!(tool_categories.id)
    end

    test "delete_tool_categories/1 deletes the tool_categories" do
      tool_categories = tool_categories_fixture()
      assert {:ok, %ToolCategories{}} = Equipments.delete_tool_categories(tool_categories)
      assert_raise Ecto.NoResultsError, fn -> Equipments.get_tool_categories!(tool_categories.id) end
    end

    test "change_tool_categories/1 returns a tool_categories changeset" do
      tool_categories = tool_categories_fixture()
      assert %Ecto.Changeset{} = Equipments.change_tool_categories(tool_categories)
    end
  end

  describe "tools" do
    alias HuntCutdown.Equipments.Tools

    import HuntCutdown.EquipmentsFixtures

    @invalid_attrs %{category_id: nil, cost: nil, full_name: nil, id: nil, short_name: nil}

    test "list_tools/0 returns all tools" do
      tools = tools_fixture()
      assert Equipments.list_tools() == [tools]
    end

    test "get_tools!/1 returns the tools with given id" do
      tools = tools_fixture()
      assert Equipments.get_tools!(tools.id) == tools
    end

    test "create_tools/1 with valid data creates a tools" do
      valid_attrs = %{category_id: "some category_id", cost: 42, full_name: "some full_name", id: "some id", short_name: "some short_name"}

      assert {:ok, %Tools{} = tools} = Equipments.create_tools(valid_attrs)
      assert tools.category_id == "some category_id"
      assert tools.cost == 42
      assert tools.full_name == "some full_name"
      assert tools.id == "some id"
      assert tools.short_name == "some short_name"
    end

    test "create_tools/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Equipments.create_tools(@invalid_attrs)
    end

    test "update_tools/2 with valid data updates the tools" do
      tools = tools_fixture()
      update_attrs = %{category_id: "some updated category_id", cost: 43, full_name: "some updated full_name", id: "some updated id", short_name: "some updated short_name"}

      assert {:ok, %Tools{} = tools} = Equipments.update_tools(tools, update_attrs)
      assert tools.category_id == "some updated category_id"
      assert tools.cost == 43
      assert tools.full_name == "some updated full_name"
      assert tools.id == "some updated id"
      assert tools.short_name == "some updated short_name"
    end

    test "update_tools/2 with invalid data returns error changeset" do
      tools = tools_fixture()
      assert {:error, %Ecto.Changeset{}} = Equipments.update_tools(tools, @invalid_attrs)
      assert tools == Equipments.get_tools!(tools.id)
    end

    test "delete_tools/1 deletes the tools" do
      tools = tools_fixture()
      assert {:ok, %Tools{}} = Equipments.delete_tools(tools)
      assert_raise Ecto.NoResultsError, fn -> Equipments.get_tools!(tools.id) end
    end

    test "change_tools/1 returns a tools changeset" do
      tools = tools_fixture()
      assert %Ecto.Changeset{} = Equipments.change_tools(tools)
    end
  end

  describe "consumable_categories" do
    alias HuntCutdown.Equipments.ConsumableCategories

    import HuntCutdown.EquipmentsFixtures

    @invalid_attrs %{full_name: nil, id: nil, short_name: nil}

    test "list_consumable_categories/0 returns all consumable_categories" do
      consumable_categories = consumable_categories_fixture()
      assert Equipments.list_consumable_categories() == [consumable_categories]
    end

    test "get_consumable_categories!/1 returns the consumable_categories with given id" do
      consumable_categories = consumable_categories_fixture()
      assert Equipments.get_consumable_categories!(consumable_categories.id) == consumable_categories
    end

    test "create_consumable_categories/1 with valid data creates a consumable_categories" do
      valid_attrs = %{full_name: "some full_name", id: "some id", short_name: "some short_name"}

      assert {:ok, %ConsumableCategories{} = consumable_categories} = Equipments.create_consumable_categories(valid_attrs)
      assert consumable_categories.full_name == "some full_name"
      assert consumable_categories.id == "some id"
      assert consumable_categories.short_name == "some short_name"
    end

    test "create_consumable_categories/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Equipments.create_consumable_categories(@invalid_attrs)
    end

    test "update_consumable_categories/2 with valid data updates the consumable_categories" do
      consumable_categories = consumable_categories_fixture()
      update_attrs = %{full_name: "some updated full_name", id: "some updated id", short_name: "some updated short_name"}

      assert {:ok, %ConsumableCategories{} = consumable_categories} = Equipments.update_consumable_categories(consumable_categories, update_attrs)
      assert consumable_categories.full_name == "some updated full_name"
      assert consumable_categories.id == "some updated id"
      assert consumable_categories.short_name == "some updated short_name"
    end

    test "update_consumable_categories/2 with invalid data returns error changeset" do
      consumable_categories = consumable_categories_fixture()
      assert {:error, %Ecto.Changeset{}} = Equipments.update_consumable_categories(consumable_categories, @invalid_attrs)
      assert consumable_categories == Equipments.get_consumable_categories!(consumable_categories.id)
    end

    test "delete_consumable_categories/1 deletes the consumable_categories" do
      consumable_categories = consumable_categories_fixture()
      assert {:ok, %ConsumableCategories{}} = Equipments.delete_consumable_categories(consumable_categories)
      assert_raise Ecto.NoResultsError, fn -> Equipments.get_consumable_categories!(consumable_categories.id) end
    end

    test "change_consumable_categories/1 returns a consumable_categories changeset" do
      consumable_categories = consumable_categories_fixture()
      assert %Ecto.Changeset{} = Equipments.change_consumable_categories(consumable_categories)
    end
  end

  describe "consumables" do
    alias HuntCutdown.Equipments.Consumables

    import HuntCutdown.EquipmentsFixtures

    @invalid_attrs %{category_id: nil, cost: nil, full_name: nil, id: nil, short_name: nil}

    test "list_consumables/0 returns all consumables" do
      consumables = consumables_fixture()
      assert Equipments.list_consumables() == [consumables]
    end

    test "get_consumables!/1 returns the consumables with given id" do
      consumables = consumables_fixture()
      assert Equipments.get_consumables!(consumables.id) == consumables
    end

    test "create_consumables/1 with valid data creates a consumables" do
      valid_attrs = %{category_id: "some category_id", cost: 42, full_name: "some full_name", id: "some id", short_name: "some short_name"}

      assert {:ok, %Consumables{} = consumables} = Equipments.create_consumables(valid_attrs)
      assert consumables.category_id == "some category_id"
      assert consumables.cost == 42
      assert consumables.full_name == "some full_name"
      assert consumables.id == "some id"
      assert consumables.short_name == "some short_name"
    end

    test "create_consumables/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Equipments.create_consumables(@invalid_attrs)
    end

    test "update_consumables/2 with valid data updates the consumables" do
      consumables = consumables_fixture()
      update_attrs = %{category_id: "some updated category_id", cost: 43, full_name: "some updated full_name", id: "some updated id", short_name: "some updated short_name"}

      assert {:ok, %Consumables{} = consumables} = Equipments.update_consumables(consumables, update_attrs)
      assert consumables.category_id == "some updated category_id"
      assert consumables.cost == 43
      assert consumables.full_name == "some updated full_name"
      assert consumables.id == "some updated id"
      assert consumables.short_name == "some updated short_name"
    end

    test "update_consumables/2 with invalid data returns error changeset" do
      consumables = consumables_fixture()
      assert {:error, %Ecto.Changeset{}} = Equipments.update_consumables(consumables, @invalid_attrs)
      assert consumables == Equipments.get_consumables!(consumables.id)
    end

    test "delete_consumables/1 deletes the consumables" do
      consumables = consumables_fixture()
      assert {:ok, %Consumables{}} = Equipments.delete_consumables(consumables)
      assert_raise Ecto.NoResultsError, fn -> Equipments.get_consumables!(consumables.id) end
    end

    test "change_consumables/1 returns a consumables changeset" do
      consumables = consumables_fixture()
      assert %Ecto.Changeset{} = Equipments.change_consumables(consumables)
    end
  end
end
