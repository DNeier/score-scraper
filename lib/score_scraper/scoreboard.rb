module ScoreScraper 
  class Scoreboard

    def initialize(search_date = nil, teams = [])
      @teams = teams
      @search_date = search_date || Time.now.strftime("%Y-%m-%d") 
    end

    def games(game_separator = '|')
      game_array = []

      team_games.each do |game|
        game_array << single_game(game)
      end

      game_array.join(game_separator)
    end

    private

    attr_reader :search_date, :teams
  
    def parser
      raise 'must be implemented by child class'
    end

    def single_game(game)
      home_team = game.home_team
      away_team = game.away_team

      " #{away_team.abbreviation} #{away_team.score} - #{home_team.score} #{home_team.abbreviation} #{game.game_state} "
    end

    def team_games
      return @team_games unless @team_games.nil?

      @team_games = parser.games_for_teams || {}
    end
  end
end
