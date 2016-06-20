defmodule ProfessorStats.League do
	use Ecto.Model
	import Ecto.Changeset

	schema "leagues" do
		field :league_name, :string
    	belongs_to :team, ProfessorStats.Team, foreign_key: :team_id
    	has_many :scoring_settings, ProfessorStats.ScoringSetting

    	timestamps
	end 

	def with_scoring_settings(query) do
		from q in query, preload: [scoring_settings: :scoring_settings]
	end

	def get_for_team(team) do
		from l in ProfessorStats.Team, where: ^team.league_id == l.id, select: l
	end

	@required_params ~w(league_name)
	@optional_params ~w()

	def changeset(model, params \\ :empty) do
		model
		|> cast(params, @required_params, @optional_params)
	end
end