#
# This file is part of Astarte.
#
# Copyright 2017-2024 SECO Mind Srl
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

defmodule Astarte.Housekeeping.API.DataCase do
  use ExUnit.CaseTemplate

  setup_all do
    Astarte.Housekeeping.Mock.DB.start_link()
    :ok
  end

  setup do
    on_exit(fn ->
      Astarte.Housekeeping.Mock.DB.clean()
    end)
  end
end
