module ScoreScraper
  module Scoreboards
    extend self

    attr_reader :registered
    @registered = []

    def register(class_name, autoload_require)
      ScoreScraper::Scoreboards.autoload(class_name, autoload_require)
      self.registered.push(class_name)
    end

  end
end

ScoreScraper::Scoreboards.register(:Nba, 'score_scraper/scoreboards/nba')
ScoreScraper::Scoreboards.register(:Mlb, 'score_scraper/scoreboards/mlb')
