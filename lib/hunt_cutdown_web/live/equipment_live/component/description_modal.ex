defmodule HuntCutdownWeb.EquipmentLive.Components.DescriptionModal do
  use HuntCutdownWeb, :live_component
  # import Phoenix.LiveView

  alias Phoenix.LiveView.Socket

  @impl true
  def mount(%Socket{} = socket) do
    {:ok, socket}
  end

  @impl true
  def render(
        %{
          open_description: _open_description
        } = assigns
      ) do
    ~H"""
    <div>
      <div phx-click="close_description" class={modal_classes_str(@open_description)}>
        <div class="modal-box">
          <h3 class="font-bold text-lg">Hunt: Cutdown</h3>
          <div class="py-4">
            <p>
              is the loadout-cost calcurator of <a
                href="https://store.steampowered.com/app/594650/Hunt_Showdown/"
                class="text-blue-600 visited:text-purple-600"
              >Hunt: Showdown</a>.
            </p>
            <p>
              You can select equipments and check total cost.
            </p>
          </div>
          <div class="modal-action">
            <button phx-click="close_description" class="btn">Close</button>
          </div>
        </div>
      </div>
    </div>
    """
  end

  def modal_classes_str(open_modal) when is_boolean(open_modal) do
    if open_modal do
      "modal modal-open"
    else
      "modal"
    end
  end
end
