module ScoreScraper
	class Scraper
		def initialize(search_date = nil, teams = [])
			@teams = teams
			@search_date = search_date || Time.now.strftime("%Y-%m-%d")
		end

		def team_games
			team_games = []
			(games || []).each do |game|
				if teams.empty? || is_team_game?(game)
					team_games << ScoreScraper::Game.new({
						home_team: home_team(game),
						away_team: away_team(game),
						game_state: game_state(game)
					})
				end
			end

			team_games
		end

		private

		attr_reader :search_date, :teams

		def search_day
			@current_day ||= search_date.split('-')[2]
		end

		def search_month
			@current_month ||= search_date.split('-')[1]
		end

		def search_year
			@current_year ||= search_date.split('-')[0]
		end

		def formatted_url
			raise 'Must be implemented in child class'
		end

		def games
			raise 'Must be implemented in child class'
		end

		def abbreviation(game, is_home = false)
			raise 'Must be implemented in child class'
		end

		def away_team(game)
			get_game(game)
		end

		def city(game, is_home = false)
			raise 'Must be implemented in child class'
		end

		def get_game(game, is_home = false)
			ScoreScraper::Team.new({
				city: city(game, is_home),
				nickname: nickname(game, is_home),
				abbreviation: abbreviation(game, is_home),
				seore: score(game, is_home)
			})
		end

		def game_state(game)
			raise 'Must be implemented in child class'
		end

		def home_team(game)
			get_game(game, true)
		end

		def nickname(game, is_home = false)
			raise 'Must be implemented in child class'
		end

		def score(game, is_home = false)
			raise 'Must be implemented in child class'
		end

		def is_team_game?(game)
			teams.include?(abbreviation(game, true).downcase) || teams.include?(abbreviation(game).downcase)
		end

		def parsed_data
			return @parsed_data unless @parsed_data.nil?

			file = open(formatted_url)
			file_data = file.read

			@parsed_data = JSON.parse(file_data)
		end
	end
end
