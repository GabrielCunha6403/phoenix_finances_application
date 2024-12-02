defmodule FinancesApplication.Repo.Migrations.CreateTableReceita do
  use Ecto.Migration

  def change do
    create table("receitas") do
      add :value, :integer
      add :description, :string

      timestamps()
    end
  end
end
