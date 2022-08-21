defmodule HuntCutdownWeb.EquipmentLive.Components.AmmoSelector do
  use HuntCutdownWeb, :live_component
  # import Phoenix.LiveView

  alias Phoenix.LiveView.Socket
  alias HuntCutdown.Equipment
  alias HuntCutdownWeb.EquipmentLive.Components

  defmodule AmmoSet do
    defstruct category: Equipment.WeaponCategory.null_object(),
              ammos: [{true, Equipment.WeaponAmmo.null_object()}]

    def create_set(%Equipment.EquipmentSlots{} = slots, weapon_pos, ammo_pos, ammos, categories) do
      category_id = Equipment.EquipmentSlots.get_weapon(slots, weapon_pos).category_id

      category =
        Enum.find(categories, &(&1.id == category_id)) || Equipment.WeaponCategory.null_object()

      ammos =
        ammos
        |> Enum.filter(&(&1.weapon_category_id == category_id))
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
      <label phx-click="abort_select" class="btn btn-sm btn-circle absolute right-2 top-2">
        ✕
      </label>
      <div class="sm:columns-1 md:columns-2 lg:columns-3 xl:columns-4">
        <%= for ammo_set <- [AmmoSet.create_set(slots, weapon_pos, ammo_pos, ammos, categories)] do %>
          <div class="card card-compact shadow-xl">
            <div class="card-title ml-2"><%= "Ammo: #{ammo_set.category.full_name}" %></div>
            <div class="card-body">
              <%= for {equipable, am} <- ammo_set.ammos do %>
                <div
                  phx-click={
                    if equipable do
                      "put_ammo"
                    end
                  }
                  phx-value-weapon_pos={weapon_pos}
                  phx-value-ammo_pos={ammo_pos}
                  phx-value-ammo={am.id}
                >
                  <.live_component
                    module={Components.SelectorButton}
                    id={"selector_button-#{am.id}"}
                    enabled={equipable}
                  >
                    <%= "#{am.short_name} ($#{am.cost})" %>
                  </.live_component>
                </div>
              <% end %>
            </div>
          </div>
        <% end %>
      </div>
    </div>
    """
  end
end
