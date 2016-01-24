module ScoreScraper
	module Scrapers
		extend self

		attr_reader :registered
		@registered = []

		def register(class_name, autoload_require)
			ScoreScraper.autoload(class_name, autoload_require)
			self.registered.push(class_name)
		end

	end
end

ScoreScraper::Scrapers.register(:Nba, 'score_scraper/scrapers/nba')
ScoreScraper::Scrapers.register(:Mlb, 'score_scraper/scrapers/mlb')
