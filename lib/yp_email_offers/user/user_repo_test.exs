defmodule YPEmailOffers.UserRepoTest do
  use YPEmailOffers.DataCase, async: true

  alias YPEmailOffers.UserRepo
  alias YPEmailOffers.User

  @john_doe %{
    external_id: "d77353dc-4bfc-4af8-ad82-4e7a64f4f4cc",
    email: "john.doe@mail.com",
    salutation: "Mr.",
    firstname: "John",
    lastname: "Doe",
    date_of_birth: ~D[1970-01-01]
  }

  test "create_user/1" do
    assert {:ok, %User{}} = UserRepo.create_user(@john_doe)
  end

  test "find_user/1" do
    assert {:ok, john_doe} = UserRepo.create_user(@john_doe)
    assert ^john_doe = UserRepo.find_user(john_doe.id)
  end
end
