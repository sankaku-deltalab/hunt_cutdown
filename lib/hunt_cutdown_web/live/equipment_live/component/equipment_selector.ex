defmodule HuntCutdownWeb.EquipmentLive.Components.EquipmentSelector do
  use HuntCutdownWeb, :live_component
  import Phoenix.LiveView

  alias Phoenix.LiveView.Socket
  alias HuntCutdownWeb.EquipmentLive.Components

  defmodule SelectContent do
    defstruct [:item_id, :enabled, :category_name, :text, :search_text, :payload]

    @type t() :: %__MODULE__{
            item_id: String,
            enabled: boolean,
            category_name: String,
            text: String,
            search_text: String,
            payload: String
          }

    def is_searched?(%__MODULE__{search_text: text}, search_text)
        when search_text |> is_bitstring() do
      if search_text == "" do
        true
      else
        String.contains?(String.downcase(text), String.downcase(search_text))
      end
    end
  end

  defmodule SelectContentBlock do
    defstruct [:category_name, :contents]

    @type t() :: %__MODULE__{
            category_name: String,
            contents: [SelectContent]
          }

    def build_blocks(contents, search_text) when search_text |> is_bitstring() do
      contents =
        contents
        |> Enum.filter(&SelectContent.is_searched?(&1, search_text))

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
    socket =
      socket
      |> assign(:search_text, "")

    {:ok, socket}
  end

  @impl true
  def handle_event(
        "update_search",
        %{"filtering" => %{"search_text" => search_text}},
        %Socket{} = socket
      )
      when search_text |> is_bitstring() do
    socket =
      socket
      |> assign(:search_text, search_text)

    {:noreply, socket}
  end

  @impl true
  def render(
        %{
          close_event: close_event,
          select_event: select_event,
          contents: contents,
          search_text: search_text
        } = assigns
      ) do
    ~H"""
    <div>
      <label phx-click={close_event} class="btn btn-sm btn-circle absolute right-2 top-2">
        ✕
      </label>
      <.form let={f} for={:filtering}>
        <%= text_input(f, :search_text,
          phx_change: "update_search",
          phx_target: @myself,
          class: "input input-bordered w-full",
          placeholder: "Search"
        ) %>
        <%= error_tag(f, :search_text) %>
      </.form>
      <div class="sm:columns-1 md:columns-2 lg:columns-3 xl:columns-4">
        <%= for block <- SelectContentBlock.build_blocks(contents, search_text) do %>
          <div class="card card-compact shadow-xl">
            <div class="card-title ml-2"><%= block.category_name %></div>
            <div class="card-body">
              <%= for c <- block.contents do %>
                <.live_component
                  module={Components.SelectorButton}
                  id={"content-#{c.item_id}"}
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
