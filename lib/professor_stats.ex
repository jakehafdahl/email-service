defmodule ProfessorStats do
	use Application
	require Logger

	def start(_type, _args) do
		import Supervisor.Spec

		children = [
			supervisor(ProfessorStats.Repo,[]),
			supervisor(ProfessorStats.CalcService,[]),
		]

		opts = [strategy: :one_for_one, name: ProfessorStats.Supervisor]

		Supervisor.start_link(children, opts)
	end
end
