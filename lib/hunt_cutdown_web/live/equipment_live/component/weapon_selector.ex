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
      <label
        phx-click={"abort_select"}
        class="btn btn-sm btn-circle absolute right-2 top-2"
      >
        ✕
      </label>
      <%= for weapon_sets <- WeaponSet.create_sets(slots, pos, weapons, categories) do %>
        <div
          class="card card-compact shadow-xl"
        >

          <div class="card-title"><%= weapon_sets.category.full_name %></div>
          <div class="card-body">
            <%= for {equipable, w} <- weapon_sets.weapons do %>
              <%= if not equipable do %>
                <span
                  class="badge badge-ghost"
                >
                  <s><%= "#{w.short_name} ($#{w.cost})" %></s>
                </span>
              <% else %>
                <span
                  phx-click={"put_weapon"}
                  phx-value-pos={@pos}
                  phx-value-weapon={w.id}
                  class="badge"
                >
                  <%= "#{w.short_name} ($#{w.cost})" %>
                </span>
              <% end %>
            <% end %>
          </div>
        </div>

      <% end %>
    </div>
    """
  end
end
