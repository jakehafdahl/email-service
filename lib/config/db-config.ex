defmodule ProfessorStats.Repo do
	use Ecto.Repo,
		otp_app: :professor_stats,
		adapter: Ecto.Adapters.MySQL
end