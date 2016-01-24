# score-scraper

This gem is used to retrieve NBA or MLB scores. Please note I do not own any of the information provided by this gem, all nba scores are retrieved from a publicly available json file on nba.com and all mlb scores are are retreived from a publicly available json file on mlb.com. It is entirely possible that these files will change and this gem will break, if that happens I will do my best to keep up with any changes.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'score-scraper'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install score-scraper


## Usage

### Get scores of games for nba teams
```ruby
require 'score_scraper'

scraper = ScoreScraper::Scrapers::Nba.new(Time.now.strftime("%Y-%m-%d"), # Date you want to search
                                          ['chi','det'])                 # Teams you want to find, pass nothing in for all teams

# team_games will return Game objects for the teams defined in the initialize
games = scraper.team_games
# => [#<ScoreScraper::Game:0x00000001b00b48 @home_team=#<ScoreScraper::Team:0x00000001b00e68 @city="Houston", @nickname="Rockets", @abbreviation="HOU", @score=0>, @away_team=#<ScoreScraper::Team:0x00000001b00c38 @city="Dallas", @nickname="Mavericks", @abbreviation="DAL", @score=0>, @game_state="1Q">, #<ScoreScraper::Game:0x00000001b00530 @home_team=#<ScoreScraper::Team:0x00000001b008c8 @city="Toronto", @nickname="Raptors", @abbreviation="TOR", @score=0>, @away_team=#<ScoreScraper::Team:0x00000001b00670 @city="Los Angeles", @nickname="Clippers", @abbreviation="LAC", @score=0>, @game_state="6:00 pm ET">]
```

## Development

Contributions are welcome, feel free to expand on current functionality or add new leagues.



## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/DNeier/score-scraper.



## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

