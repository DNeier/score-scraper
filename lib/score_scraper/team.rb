module ScoreScraper
	class Team
		attr_reader :city, :nickname, :abbreviation, :score

		def initialize(attrs)
			@city					= attrs[:city] || ''
			@nickname 		= attrs[:nickname] || ''
			@abbreviation = attrs[:abbreviation] || 'NIL'
			@score 				= attrs[:score] || 0
		end
	end
end
