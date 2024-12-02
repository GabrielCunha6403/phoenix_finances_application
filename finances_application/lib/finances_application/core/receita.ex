defmodule FinancesApplication.Core.Receita do

  use Ecto.Schema

  @derive {Jason.Encoder, only: [:id, :value, :description, :inserted_at, :updated_at]}
  schema "receitas" do
    field :value, :integer
    field :description, :string

    timestamps()
  end

  def changeset(model, params) do
    model
    |> Ecto.Changeset.cast(params, [:value, :description])
    |> Ecto.Changeset.validate_required([:value, :description])
  end

end
