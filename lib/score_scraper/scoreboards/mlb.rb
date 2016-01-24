module ScoreScraper
	module Scoreboards
		class Mlb < Scoreboard

			private

			def parser
				@parser ||= Scrapers::Mlb.new(search_date, teams)
			end
		end
	end
end
