defmodule ProfessorStats.TeamPlayer do
	use Ecto.Model

	@primary_key {:id, :binary_id, autogenerate: true}

	schema "leagues" do
    	has_one :team, ProfessorStats.Team, foreign_key: :team_id
    	has_one :player, ProfessorStats.Player, foreign_key: :player_id

    	timestamps
	end 

	@required_params ~w()
	@optional_params ~w()

	def changeset(model, params \\ :empty) do
		model
		|> cast(params, @required_params, @optional_params)
	end
end