defmodule ProfessorStats.WeeklyEmailSender do

	def send(email_info) do
		# pass email info into a template to let that do the email building
		# for now just write the email info to a file
		File.write("/", inspect email_info)
	end
end