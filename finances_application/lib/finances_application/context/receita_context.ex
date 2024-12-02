defmodule FinancesApplication.ReceitaContext do

  alias FinancesApplication.Core.Receita

  def all(_params) do
    case Receita.Api.all() do
      {:ok, receitas} -> {:ok, receitas}
      error -> error
    end
  end

  def get(params) do
    id = params["id"]
    case Receita.Api.get(id) do
      {:ok, receita} -> {:ok, receita}
      error -> error
    end
  end

  def create(params) do
    case Receita.Api.insert(params) do
      {:ok, receita} -> {:ok, receita}
      error -> error
    end
  end
end
