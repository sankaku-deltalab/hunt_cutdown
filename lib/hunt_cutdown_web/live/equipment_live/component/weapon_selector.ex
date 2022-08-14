defmodule HuntCutdownWeb.EquipmentLive.Components.WeaponSelector do
  use HuntCutdownWeb, :live_component
  # import Phoenix.LiveView

  alias Phoenix.LiveView.Socket
  alias HuntCutdown.Equipment

  defmodule WeaponSet do
    defstruct category: Equipment.WeaponCategory.null_object(),
              weapons: [{true, Equipment.Weapon.null_object()}]

    def create_sets(%Equipment.EquipmentSlots{} = slots, pos, weapons, categories) do
      categories
      |> Enum.sort_by(&{&1.full_name})
      |> Enum.map(&create_single_set(slots, pos, weapons, &1))
    end

    defp create_single_set(%Equipment.EquipmentSlots{} = slots, pos, all_weapons, category) do
      weapons =
        all_weapons
        |> Enum.filter(&(&1.category_id == category.id))
        |> Enum.sort_by(&{&1.full_name})
        |> Enum.map(fn w -> {Equipment.EquipmentSlots.can_put_weapon?(slots, pos, w), w} end)

      %WeaponSet{
        category: category,
        weapons: weapons
      }
    end
  end

  @impl true
  def mount(%Socket{} = socket) do
    {:ok, socket}
  end

  @impl true
  def render(
        %{
          slots: %Equipment.EquipmentSlots{} = slots,
          pos: pos,
          weapons: weapons,
          categories: categories
        } = assigns
      ) do
    ~H"""
    <div>
      <div> Equipment slot </div>
      <%= for weapon_sets <- WeaponSet.create_sets(slots, pos, weapons, categories) do %>
        <div
          style="margin-left: 2vw"
        >
          <div><%= weapon_sets.category.short_name %></div>
          <%= for {equipable, w} <- weapon_sets.weapons do %>
            <%= if not equipable do %>
              <div style="margin-left: 2vw"><s><%= "#{w.short_name} ($#{w.cost})" %></s></div>
            <% else %>
              <div
                style="margin-left: 2vw"
                phx-click={"put_weapon"}
                phx-value-pos={@pos}
                phx-value-weapon={w.id}
              >
                <%= "#{w.short_name} ($#{w.cost})" %>
              </div>
            <% end %>
          <% end %>
        </div>

      <% end %>
    </div>
    """
  end
end
