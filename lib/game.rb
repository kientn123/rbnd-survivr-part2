class Game

  attr_reader :tribes

  def initialize(*tribes)
    @tribes = tribes
  end

  def add_tribe(tribe)
    @tribes << tribe
  end

  def immunity_challenge
    losing_tribe = @tribes.sample
    puts "#{losing_tribe.to_s.red} lost in immunity_challenge"
    losing_tribe.tribal_council({})
    losing_tribe
  end

  def clear_tribes
    @tribes.clear
  end

  def merge(name)
    members = @tribes.map {|tribe| tribe.members}.flatten
    clear_tribes
    @tribes << Tribe.new({name: name, members: members})
    @tribes.first
  end


  def individual_immunity_challenge
    winner = @tribes.first.members.sample
    puts "#{winner.to_s} won the individual immunity challenge and is safe from elimination."
    return @tribes.first.tribal_council({immune: winner})
  end

end
