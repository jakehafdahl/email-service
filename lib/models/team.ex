defmodule ProfessorStats.Team do
	use Ecto.Model
	import Ecto.Changeset

	@primary_key {:id, :binary_id, autogenerate: true}

	schema "teams" do
		field :team_name, :string
  		field :email, :string
    	has_one :leagues, ProfessorStats.League, foreign_key: :league_id
    	has_many :team_players, ProfessorStats.TeamPlayer

    	timestamps
	end 

	def with_players_settings(query) do
		from q in query, preload: [team_players: :team_players]
	end

	@required_params ~w(team_name email)
	@optional_params ~w()

	def changeset(model, params \\ :empty) do
		model
		|> cast(params, @required_params, @optional_params)
		|> validate_format(:email, ~r/@/)
		|> unique_constraint(:email)
	end
end