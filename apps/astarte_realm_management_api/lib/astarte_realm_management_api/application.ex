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

defmodule Astarte.RealmManagement.API.Application do
  use Application

  require Logger

  @app_version Mix.Project.config()[:version]

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    # make amqp supervisors logs less verbose
    :logger.add_primary_filter(
      :ignore_rabbitmq_progress_reports,
      {&:logger_filters.domain/2, {:stop, :equal, [:progress]}}
    )

    Logger.info("Starting application v#{@app_version}.", tag: "realm_management_api_start")

    children = [
      Astarte.RealmManagement.APIWeb.Telemetry,
      Astarte.RealmManagement.APIWeb.Endpoint,
      Astarte.RPC.AMQP.Client
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Astarte.RealmManagement.API.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
