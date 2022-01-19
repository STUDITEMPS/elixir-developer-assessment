defmodule YPEmailOffers.GraduatesTest do
  use YPEmailOffers.DataCase, async: true

  alias YPEmailOffers.Graduates

  describe "fetch_graduates/0" do
    test "foo" do
      assert [_ | _] = Graduates.fetch_graduates()
    end
  end
end
