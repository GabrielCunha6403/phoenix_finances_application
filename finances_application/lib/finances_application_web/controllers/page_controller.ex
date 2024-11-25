defmodule FinancesApplicationWeb.PageController do
  use FinancesApplicationWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end

  # def menu(conn, _params) do
  #   text(conn, "hello")
  # end

end
