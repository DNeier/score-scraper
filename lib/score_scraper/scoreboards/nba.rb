module ScoreScraper
	module Scoreboards
		class Nba < Scoreboard

			private

			def parser
				@parser ||= ScoreScraper::Scrapers::Nba.new(search_date, teams)
			end
		end
	end
end
