module ScoreScraper
  module Scrapers
    class Mlb < Scraper

      private

      def formatted_url
        @formatted_url ||= "http://chicago.cubs.mlb.com/gdcross/components/game/mlb/year_#{search_year}/month_#{search_month}/day_#{search_day}/master_scoreboard.json"
      end

      def games
        @games ||= parsed_data['data']['games']['game']
      end

      def abbreviation(game, is_home = false)
        game["#{key_type(is_home)}_name_abbrev"]
      end

      def city(game, is_home = false)
        game["#{key_type(is_home)}_team_city"]
      end

      def game_state(game)
        game_state = ''
        game_status = game['status']['status']

        if game_status.downcase == 'final' || game_status.downcase == 'game over'
          game_state = 'F'
        elsif game_status.downcase == 'preview'
          game_state = game['time']
        elsif game['status']['top_inning'] && game['status']['inning']
          is_top_inning = game['status']['top_inning'].downcase == 'y'
          game_state = is_top_inning ? "T#{game['status']['inning']}" : "B#{game['status']['inning']}"
        end

        game_state
      end

      def nickname(game, is_home = false)
        game["#{key_type(is_home)}_team_name"]
      end

      def score(game, is_home = false)
        game['linescore'] ? game['linescore']['r']["#{key_type(is_home)}"] : ''
      end

      def key_type(is_home = false)
        is_home ? 'home' : 'away'
      end
    end
  end
end
