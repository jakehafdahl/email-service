defmodule ProfessorStats.Repo.Migrations.AddProjectionsTable do
  use Ecto.Migration

  def change do
  	create table(:player_projections) do
  		add :week, :integer
	  	add :season_year, :integer
		  add :rush_yards, :integer

  		timestamps
  	end

    alter table(:player_projections) do
        add :player_id, references(:players)
    end
  end

end
