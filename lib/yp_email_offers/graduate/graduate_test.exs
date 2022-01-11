defmodule YPEmailOffers.GraduateTest do
  use YPEmailOffers.DataCase, async: true

  alias YPEmailOffers.Graduate

  test "age/1" do
    assert 42 = Graduate.age(%Graduate{date_of_birth: ~D[1980-01-01]}, ~D[2022-01-01])
  end
end
