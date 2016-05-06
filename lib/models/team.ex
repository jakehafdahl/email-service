defmodule ProfessorStats.Team do
	use Ecto.Model

	schema "teams" do
		field :name, :string
  		field :email, :string
    	has_one :leagues, ProfessorStats.League

    	timestamps
	end 
end