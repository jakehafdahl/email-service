defmodule ProfessorStats do
	use Application
	require Logger

	def start(_type, args) do
		import Supervisor.Spec

		children = [
			supervisor(ProfessorStats.Repo,[]),
			supervisor(ProfessorStats.CalcService,[]),
			supervisor(ProfessorStats.ScheduleService,[]),
			worker(Task, [ProfessorStats, :loop, args])
		]

		opts = [strategy: :one_for_one, name: ProfessorStats.Supervisor]

		Supervisor.start_link(children, opts)
	end

		# def loop do

		# 	loop()
		# end
end
