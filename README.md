# InMemoryDb

**TODO: Add description**

## Installation

Use it as module, run as node!

### Config
#### Runtime config
```elixir
  config :in_memory_db,
    cookie: get_env!(get_env_name!("CLUSTER_COOKIE"), :atom)

  config :mnesia,
    dir: String.to_charlist(get_env!(get_env_name!("MNESIAR_IN_MEMORY_DB_PATH"), :string, ".") <> "/Mnesia.#{Node.self()}"),
    dc_dump_limit: get_env!(get_env_name!("MNESIAR_IN_MEMORY_DC_DUMP_LIMIT"), :integer, 40),
    dump_log_write_threshold: get_env!(get_env_name!("MNESIAR_IN_MEMORY_DUMP_LOG_WRITE_THRESHOLD"), :integer, 50_000)

```

