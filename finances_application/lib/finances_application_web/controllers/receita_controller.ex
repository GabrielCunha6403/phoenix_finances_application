defmodule FinancesApplicationWeb.ReceitaController do

  use FinancesApplicationWeb, :controller

  alias FinancesApplication.ReceitaContext

  def hello(conn, _) do
    render(conn, :hello)
  end

  # ENDPOINTS ======================

  def all(conn, params) do
    case ReceitaContext.all(params) do
      {:ok, receitas} ->
        json(conn, %{data: receitas})
      {:error, msg} ->
        put_status(conn, 422)
        |> json(%{error: msg})
    end
  end

  def get(conn, params) do
    case ReceitaContext.get(params) do
      {:ok, receita} -> json(conn, %{data: receita})
      {:error, msg} ->
        put_status(conn, 422)
        |> json(%{error: msg})
    end
  end

  def create(conn, params) do
    case ReceitaContext.create(params) do
      {:ok, receita} ->
        json(conn, %{data: receita})
      {:error, msg} ->
        put_status(conn, 422)
        |> json(%{error: msg})
    end
  end

end
