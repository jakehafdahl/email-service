defmodule ProfessorStats.Player do
	use Ecto.Model
	
	@primary_key {:id, :binary_id, autogenerate: true}

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
end