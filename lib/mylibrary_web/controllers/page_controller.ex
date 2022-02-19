defmodule MylibraryWeb.PageController do
  use MylibraryWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
