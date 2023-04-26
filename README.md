# InMemoryDb

**TODO: Add description**

## Installation

Use it as module, run as node!

```elixir
  ##############################################################################
  @doc """
  # get_children!
  """
  defp get_children! do
    {:ok, topologies} = get_topologies()
    {:ok, config} = Mnesiar.get_config!()

    result = [
      {Mnesiar, [config: config, opts: []]},
      {InMemoryDbWorker, []},
      {Cluster.Supervisor, [topologies, [name: InMemoryDb.ClusterSupervisor]]}
    ]

    {:ok, result}
  end

```

### Config

#### Runtime config

```elixir
import Config

import ConfigUtils, only: [get_env!: 3, get_env!: 2, get_env_name!: 1, in_container!: 0]

{:ok, in_container} = in_container!()

if in_container do
  config :logger,
    handle_otp_reports: true,
    backends: [
      :console
    ]

  config :logger,
         :console,
         level: get_env!("CONSOLE_LOG_LEVEL"), :atom, :info),
         format: get_env!("LOG_FORMAT"), :string, "[$date] [$time] [$level] [$node] [$metadata] [$levelpad] [$message]\n"),
         metadata: :all
else
  config :logger,
    handle_otp_reports: true,
    backends: [
      :console,
      {LoggerFileBackend, :info_log},
      {LoggerFileBackend, :error_log}
    ]

  config :logger,
         :console,
         level: get_env!("CONSOLE_LOG_LEVEL"), :atom, :info),
         format: get_env!("LOG_FORMAT"), :string, "[$date] [$time] [$level] [$node] [$metadata] [$levelpad] [$message]\n"),
         metadata: :all

  config :logger,
         :info_log,
         level: :info,
         path: get_env!("LOG_PATH"), :string, "log") <> "/#{Node.self()}/info.log",
         format: get_env!("LOG_FORMAT"), :string, "[$date] [$time] [$level] [$node] [$metadata] [$levelpad] [$message]\n"),
         metadata: :all

  config :logger,
         :error_log,
         level: :error,
         path: get_env!("LOG_PATH"), :string, "log") <> "/#{Node.self()}/error.log",
         format: get_env!("LOG_FORMAT"), :string, "[$date] [$time] [$level] [$node] [$metadata] [$levelpad] [$message]\n"),
         metadata: :all
end

config :in_memory_db,
  cookie: get_env!("CLUSTER_COOKIE"), :atom)

if config_env() in [:dev] do
end

if config_env() in [:prod] do
end

```

