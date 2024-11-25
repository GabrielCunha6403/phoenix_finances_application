defmodule FinancesApplicationWeb.MenuController do
  use FinancesApplicationWeb, :controller

  def menu(conn, _params) do
    render(conn, "menu.html")
  end

end
