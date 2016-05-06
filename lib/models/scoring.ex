defmodule ProfessorStats.ScoringSetting do
	use Ecto.Model

	schema "leagues" do
  		field :position, :string
  		field :field, :string
  		field :points_for, :integer
  		field :required_per, :integer
  		belongs_to :leagues, ProfessorStats.League

  		timestamps
	end 
end