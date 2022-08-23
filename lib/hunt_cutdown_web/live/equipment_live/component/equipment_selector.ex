defmodule HuntCutdownWeb.EquipmentLive.Components.EquipmentSelector do
  use HuntCutdownWeb, :live_component
  # import Phoenix.LiveView

  alias Phoenix.LiveView.Socket
  alias HuntCutdownWeb.EquipmentLive.Components

  defmodule SelectContent do
    defstruct enabled: true,
              category_name: "cartegory name",
              text: "item name",
              payload: %{"some" => "thing"}
  end

  defmodule SelectContentBlock do
    defstruct category_name: "category name",
              contents: [%SelectContent{}]

    def build_blocks(contents) do
      categories = contents |> Enum.map(& &1.category_name) |> Enum.uniq() |> Enum.sort()

      categories
      |> Enum.map(&%__MODULE__{category_name: &1, contents: contents_in_category(&1, contents)})
    end

    defp contents_in_category(category, contents) do
      contents |> Enum.filter(&(&1.category_name == category)) |> Enum.sort()
    end
  end

  @impl true
  def mount(%Socket{} = socket) do
    {:ok, socket}
  end

  @impl true
  def render(
        %{
          close_event: close_event,
          select_event: select_event,
          contents: contents
        } = assigns
      ) do
    ~H"""
    <div>
      <label phx-click={close_event} class="btn btn-sm btn-circle absolute right-2 top-2">
        ✕
      </label>
      <div class="sm:columns-1 md:columns-2 lg:columns-3 xl:columns-4">
        <%= for block <- SelectContentBlock.build_blocks(contents) do %>
          <div class="card card-compact shadow-xl">
            <div class="card-title ml-2"><%= block.category_name %></div>
            <div class="card-body">
              <%= for c <- block.contents do %>
                <.live_component
                  module={Components.SelectorButton}
                  id={"content-#{c.text}"}
                  event={select_event}
                  json_payload={Jason.encode!(c.payload)}
                  enabled={c.enabled}
                >
                  <%= c.text %>
                </.live_component>
              <% end %>
            </div>
          </div>
        <% end %>
      </div>
    </div>
    """
  end
end
