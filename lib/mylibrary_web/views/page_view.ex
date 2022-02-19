defmodule MylibraryWeb.PageView do
  use MylibraryWeb, :view

  def render("index.html", assigns) do
    "rendering with assigns #{inspect Map.keys(assigns)}"
  end
end
