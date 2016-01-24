module ScoreScraper
  module Scrapers
    class Nba < Scraper

      private

      def formatted_url
        @formatted_url ||= "http://data.nba.com/jsonp/5s/json/cms/noseason/scoreboard/#{search_year}#{search_month}#{search_day}/games.json"
      end

      def games
        @games ||= parsed_data['sports_content']['games']['game']
      end

      def abbreviation(game, is_home = false)
        game["#{key_type(is_home)}"]['abbreviation']
      end

      def city(game, is_home = false)
        game["#{key_type(is_home)}"]['city']
      end

      def game_state(game)
        game_state = ''
        game_status = game['period_time']['period_status']

        if game_status.downcase == 'final'
          game_state = 'F'
        elsif game['period_time']['period_value'].to_i > 0
          game_state = "#{game['period_time']['period_value']}Q"
        else
          game_state = game_status
        end

        game_state
      end

      def nickname(game, is_home = false)
        game["#{key_type(is_home)}"]['nickname']
      end

      def score(game, is_home = false)
        game["#{key_type(is_home)}"]['score']
      end

      def key_type(is_home = false)
        is_home ? 'home' : 'visitor'
      end

      def parsed_data
        return @parsed_data unless @parsed_data.nil?

        file = open(formatted_url)
        file_data = file.read

        @parsed_data = JSON.parse(file_data[16...-2])
      end
    end
  end
end
