[
  import_deps: [:ecto, :phoenix],
  plugins: [Phoenix.LiveView.HTMLFormatter],
  inputs: ["*.{ex,exs}", "priv/*/seeds.exs", "{config,lib,test}/**/*^(live.html).{heex,ex,exs}"],
  subdirectories: ["priv/*/migrations"]
]
