module ScoreScraper
	class Game
		attr_reader :home_team, :away_team, :game_state

		def initialize(attrs)
			@home_team 	= attrs[:home_team]  || {}
			@away_team 	= attrs[:away_team]  || {}
			@game_state = attrs[:game_state] || ''
		end
	end
end
