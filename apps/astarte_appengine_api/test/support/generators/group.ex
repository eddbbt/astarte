# Copyright 2017-2024 SECO Mind Srl
#
# SPDX-License-Identifier: Apache-2.0

#
# This file is part of Astarte.
#
# Copyright 2024 SECO Mind Srl
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

defmodule Astarte.AppEngine.API.GroupTestGenerator do
  @moduledoc """
  Helpers group's generators
  """
  use ExUnitProperties

  @max_subpath_count 10
  @max_subpath_length 20

  @doc """
  Generate a random group name
  Es.
  world/europe/italy
  """
  def group_name do
    string(:ascii, min_length: 1, max_length: @max_subpath_length)
    |> uniq_list_of(
      min_length: 1,
      max_length: @max_subpath_count
    )
    |> filter(fn [<<first, _::binary>> | _] ->
      first not in [?@, ?~, ?\s]
    end)
    |> map(&Enum.join(&1, "/"))
  end
end