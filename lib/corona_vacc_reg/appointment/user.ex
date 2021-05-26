defmodule CoronaVaccReg.Appointment.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias CoronaVaccReg.User

  schema "users" do
    field :birthdate, :date
    field :doctor, :string
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    field :mobile, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs \\ %{}) do
    user
    |> cast(attrs, [:first_name, :last_name, :birthdate, :doctor, :mobile, :email])
    |> validate_required([:first_name, :last_name, :birthdate, :doctor, :mobile, :email])
  end
end
