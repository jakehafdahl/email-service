defmodule ProfessorStats.TeamCalculator do
	alias ProfessorStats.WeeklyEmailBuilder
	alias ProfessorStats.WeeklyEmailSender

	def calculate_and_send(team, config) do
		# grab all players for that team and get their fantasy points
		league = Repo.get(ProfessorStats.League.get_for_team(team))
		scoring_settings = Repo.get(ProfessorStats.ScoringSetting.get_for_league(league))

		email_info = WeeklyEmailBuilder.build_email_info(team, scoring_settings, config)
		WeeklyEmailSender.send(email_info)
	end
end