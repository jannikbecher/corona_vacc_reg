defmodule CoronaVaccReg.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :first_name, :string
      add :last_name, :string
      add :birthdate, :date
      add :doctor, :string
      add :mobile, :string
      add :email, :string

      timestamps()
    end

  end
end
