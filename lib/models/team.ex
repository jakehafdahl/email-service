defmodule ProfessorStats.Team do
	use Ecto.Model
	import Ecto.Changeset

	schema "teams" do
		field :team_name, :string
  		field :email, :string
    	has_one :leagues, ProfessorStats.League

    	timestamps
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