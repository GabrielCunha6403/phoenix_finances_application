defmodule FinancesApplication.Core.Receita.Api do

  alias FinancesApplication.Repo
  alias FinancesApplication.Core.Receita

  import Ecto.Query

  def all do
    {:ok, Repo.all(Receita)}
  end

  def get(id) do
    Repo.get(Receita, id)
    |> case do
      nil -> {:error, :not_found}
      receita -> {:ok, receita}
    end
  end

  def get_by(where) do
    from(Receita)
    |> where(^where)
    |> Repo.one()
  end

  def delete(id) do
    case get(id) do
      nil -> nil
      receita -> Repo.delete(receita)
    end
  end

  def insert(params) do
    IO.inspect(params)
    %Receita{}
    |> Receita.changeset(params)
    |> Repo.insert()
  end

  def update(model, params) do
    model
    |> Receita.changeset(params)
    |> Repo.update()
  end
end
