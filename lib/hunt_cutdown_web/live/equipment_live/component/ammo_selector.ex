defmodule HuntCutdownWeb.EquipmentLive.Components.AmmoSelector do
  use HuntCutdownWeb, :live_component
  # import Phoenix.LiveView

  alias Phoenix.LiveView.Socket
  alias HuntCutdown.Equipment

  defmodule AmmoSet do
    defstruct category: Equipment.WeaponCategory.null_object(),
              ammos: [{true, Equipment.WeaponAmmo.null_object()}]

    def create_set(%Equipment.EquipmentSlots{} = slots, weapon_pos, ammo_pos, ammos, categories) do
      category_id = Equipment.EquipmentSlots.get_weapon(slots, weapon_pos).category_id

      category =
        Enum.find(categories, &(&1.id == category_id)) || Equipment.WeaponCategory.null_object()

      push = fn list, head -> [head | list] end

      ammos =
        ammos
        |> Enum.filter(&(&1.weapon_category_id == category_id))
        |> push.(Equipment.WeaponAmmo.null_object_for(category_id))
        |> Enum.sort_by(&{&1.full_name})
        |> Enum.map(fn am ->
          {Equipment.EquipmentSlots.can_put_ammo?(slots, weapon_pos, ammo_pos, am), am}
        end)

      %AmmoSet{
        category: category,
        ammos: ammos
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
          weapon_pos: weapon_pos,
          ammo_pos: ammo_pos,
          ammos: ammos,
          categories: categories
        } = assigns
      ) do
    ~H"""
    <div>
      <div> Equipment slot </div>
      <div
        phx-click={"abort_select"}
      >
        [Close]
      </div>
      <%= for ammo_set <- [AmmoSet.create_set(slots, weapon_pos, ammo_pos, ammos, categories)] do %>
        <div
          style="margin-left: 2vw"
        >
          <div><%= ammo_set.category.short_name %></div>
          <%= for {equipable, am} <- ammo_set.ammos do %>
            <%= if not equipable do %>
              <div style="margin-left: 2vw"><s><%= "#{am.short_name} ($#{am.cost})" %></s></div>
            <% else %>
              <div
                style="margin-left: 2vw"
                phx-click={"put_ammo"}
                phx-value-weapon_pos={weapon_pos}
                phx-value-ammo_pos={ammo_pos}
                phx-value-ammo={am.id}
              >
                <%= "#{am.short_name} ($#{am.cost})" %>
              </div>
            <% end %>
          <% end %>
        </div>

      <% end %>
    </div>
    """
  end
end
