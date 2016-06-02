defmodule ProfessorStats.Repo.Migrations.AddTeamsTable do
  use Ecto.Migration

  def change do
  	create table(:teams, primary_key: false) do
      add :id, :uuid, primary_key: true
  		add :team_name, :string
  		add :email, :string

  		timestamps
  	end

  	create table(:leagues, primary_key: false) do
      add :id, :uuid, primary_key: true
  		add :league_name, :string

  		timestamps
  	end

  	create table(:scoring_settings, primary_key: false) do
      add :id, :uuid, primary_key: true
  		add :position, :string
  		add :field, :string
  		add :points_for, :integer
  		add :required_per, :integer

  		timestamps
  	end

  	alter table(:teams) do
  		add :league_id, references(:leagues)
  	end

  	alter table(:leagues) do
  		add :team_id, references(:teams)
  	end

  	alter table(:scoring_settings) do
  		add :league_id, references(:leagues)
  	end
  end
end
