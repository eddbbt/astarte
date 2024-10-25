#
# This file is part of Astarte.
#
# Copyright 2017-2024 SECO Mind Srl Mind Srl
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

defmodule Astarte.Housekeeping.APIWeb.ConnCase do
  @moduledoc """
  This module defines the test case to be used by
  tests that require setting up a connection.

  Such tests rely on `Phoenix.ConnTest` and also
  import other functionality to make it easier
  to build common datastructures and query the data layer.

  Finally, if the test case interacts with the database,
  it cannot be async. For this reason, every test runs
  inside a transaction which is reset at the beginning
  of the test unless the test case is marked as async.
  """

  use ExUnit.CaseTemplate

  using do
    quote do
      # Import conveniences for testing with connections
      import Plug.Conn
      import Phoenix.ConnTest
      import Astarte.Housekeeping.APIWeb.Router.Helpers

      # The default endpoint for testing
      @endpoint Astarte.Housekeeping.APIWeb.Endpoint
    end
  end

  setup_all do
    Astarte.Housekeeping.Mock.DB.start_link()
    :ok
  end

  setup _tags do
    on_exit(fn ->
      Astarte.Housekeeping.Mock.DB.clean()
    end)

    {:ok, conn: Phoenix.ConnTest.build_conn()}
  end
end
