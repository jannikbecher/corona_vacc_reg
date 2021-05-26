defmodule CoronaVaccReg.AppointmentTest do
  use CoronaVaccReg.DataCase

  alias CoronaVaccReg.Appointment

  describe "users" do
    alias CoronaVaccReg.Appointment.User

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Appointment.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Appointment.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Appointment.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Appointment.create_user(@valid_attrs)
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Appointment.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Appointment.update_user(user, @update_attrs)
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Appointment.update_user(user, @invalid_attrs)
      assert user == Appointment.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Appointment.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Appointment.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Appointment.change_user(user)
    end
  end
end
