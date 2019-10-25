# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Pizza.Repo.insert!(%Pizza.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Pizza.Models.Pizzas
alias Pizza.Models.Toppings
alias Pizza.Repo

Repo.insert! %Toppings{
  name: "Hat goo"
}
Repo.insert! %Toppings{
  name: "Fish eye"
}
Repo.insert! %Toppings{
  name: "Big toe"
}
Repo.insert! %Toppings{
  name: "Pepperoni"
}
