defmodule Rumbl.Repo do
  use Ecto.Repo, otp_app: :rumbl
  #alias Rumbl.User

  #@moduledoc """
  #In memory repo
  #"""

  #def all(User) do
    #  [
      #  %User{id: "1", name: "Test1", username: "test1", password: "test"},
      # %User{id: "2", name: "Test2", username: "test2", password: "test"},
      # %User{id: "3", name: "Test3", username: "test3", password: "test"}
      #] 
    #end
    #def all(_module), do: []

    #def get(module, id) do
      #Enum.find all(module), fn map -> map.id == id end
      #end

      #def get_by(module, params) do
        #Enum.find all(module), fn
          #map -> Enum.all?(params, fn {key, val} -> Map.get(map, key) == val end) 
          #end
          #end
end
