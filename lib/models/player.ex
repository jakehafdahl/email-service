defmodule ProfessorStats.Player do
	use Ecto.Model
	import Ecto.Changeset
	
	schema "leagues" do
		field :first_name, :string
		field :last_name, :string
		field :position, :string
		field :team, :string

    	timestamps
	end 

	@required_params ~w(first_name last_name position team)
	@optional_params ~w()

	def changeset(model, params \\ :empty) do
		model
		|> cast(params, @required_params, @optional_params)
	end

	def player_for(team_player) do
		from p in ProfessorStats.Player, where: p.id == ^team_player.time_id, select: p		
	end
end