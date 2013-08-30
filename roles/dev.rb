name "dev"
run_list(
  "recipe[redis]",
  "recipe[nodejs]",
)
