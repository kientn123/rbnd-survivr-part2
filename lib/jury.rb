class Jury

  attr_accessor :members

  def initialize
    @members = []
  end

  def add_member(contestant)
    @members << contestant
    puts "#{contestant.name} is member #{@members.length} of the jury.".white
  end

  def cast_votes(finalists)
    res = {}
    finalists.each do |finalist|
      res[finalist] = 0
    end
    @members.each do |member|
      vote_index = rand(finalists.length)
      res[finalists[vote_index]] += 1
      puts "#{member.to_s} cast their vote for #{finalists[vote_index].to_s}".white
    end
    res
  end

  def report_votes(final_votes)
    final_votes.each do |finalist, num_votes|
      puts "#{finalist.to_s} received #{num_votes} votes".white
    end
  end

  def announce_winner(final_votes)
    winner = final_votes.keys.max do |finalist_1, finalist_2|
      final_votes[finalist_1] <=> final_votes[finalist_2]
    end
    puts "The winner is #{winner.name}".white
    winner
  end

end
