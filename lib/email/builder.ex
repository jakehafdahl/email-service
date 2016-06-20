defmodule ProfessorStats.WeeklyEmailBuilder do
	alias ProfessorStats.TeamPlayer
	alias ProfessorStats.Repo
	alias ProfessorStats.Player
	# fire off worker that calcs the fant points for the players on the team and orders them 
	# for start/sit stuff
	def build_email(team, settings, config) do
		players_for(team)
		|> Enum.map(fn player -> 
			score = settings
			|> Enum.filter(fn setting -> setting.position == player.position end)
			|> Enum.map(fn setting -> 
				PlayerProjection.get_for_player_and_week(player, config.week, config.season_year)
				|> PlayerProjection.apply_settings(setting)
			end)
			|> Enum.reduce(&+/2)

			%{player: player, score: score}
		end)
	end	

	def players_for(team) do
		team_players = Repo.all(TeamPlayer.team_players_for(team))

		players = team_players |> Enum.map(fn team_player -> Repo.first(Player.player_for(team_player)) end)
	end
end