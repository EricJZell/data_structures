class Tournament
  attr_reader :input, :teams
  def self.tally(input)
    new(input).tally
  end

  def initialize(input)
    @input = input
    @teams = []
  end

  def tally
    output = format(header)
    if input.match(/.+;.+;.+/)
      input.each_line{ |line| process_game(line) }
      teams.sort_by{ |team| [-team.points, team.name] }
        .each{ |team| output += format(team.info) }
    end
    output
  end

  def header
    %w(Team MP W D L P)
  end

  def format(array)
    sprintf "%-30s | %2s | %2s | %2s | %2s | %2s\n", *array
  end

  def process_game(line)
    results = line.split(';')
    first_team = find_or_create_team(results[0])
    second_team = find_or_create_team(results[1])
    case results[2]
    when /win/
      first_team.add_win!
      second_team.add_loss!
    when /loss/
      first_team.add_loss!
      second_team.add_win!
    when /draw/
      first_team.add_draw!
      second_team.add_draw!
    end
  end

  def find_or_create_team(name)
     if team = @teams.find{ |team| team.name == name }
       team
     else
       team = Team.new(name)
       @teams << team
       team
     end
  end
end

class Team
  attr_reader :name, :wins, :losses, :draws
  def initialize(name)
    @name = name
    @wins = 0
    @losses = 0
    @draws = 0
  end

  def points
    (wins * 3) + draws
  end

  def matches_played
    wins + losses + draws
  end

  def add_win!
    @wins += 1
  end

  def add_loss!
    @losses += 1
  end

  def add_draw!
    @draws += 1
  end

  def info
    [name, matches_played, wins, draws, losses, points]
  end
end
