defmodule ProfessorStats.League do
	use Ecto.Model

	schema "leagues" do
		field :name, :string
    	belongs_to :team, ProfessorStats.Team
    	has_many :scoring_settings, ProfessorStats.ScoringSetting

    	timestamps
	end 

	def with_scoring_settings(query) do
		from q in query, preload: [scoring_settings: :scoring_settings]
	end
end