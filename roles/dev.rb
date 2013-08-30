name "dev"
run_list(
  "recipe[git]",
  "recipe[redis]",
  "recipe[nodejs]",
)
