defmodule YPEmailOffers.GraduateRepoTest do
  use YPEmailOffers.DataCase, async: true

  alias YPEmailOffers.GraduateRepo
  alias YPEmailOffers.Graduate

  @john_doe %{
    external_id: "d77353dc-4bfc-4af8-ad82-4e7a64f4f4cc",
    email: "john.doe@mail.com",
    salutation: "Mr.",
    firstname: "John",
    lastname: "Doe",
    date_of_birth: ~D[1970-01-01]
  }

  test "create_graduate/1" do
    assert {:ok, %Graduate{}} = GraduateRepo.create_graduate(@john_doe)
  end

  test "find_graduate/1" do
    assert {:ok, john_doe} = GraduateRepo.create_graduate(@john_doe)
    assert ^john_doe = GraduateRepo.find_graduate(john_doe.id)
  end
end
