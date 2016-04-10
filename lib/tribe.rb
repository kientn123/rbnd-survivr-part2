class Tribe

  attr_reader :name, :members

  def initialize(options)
    @name = options[:name]
    @members = options[:members]
    puts "#{@name.red} tribe is successfully created with members: #{@members.map {|member| member.to_s}.join(" ,")}"
  end

  def to_s
    @name
  end

  def tribal_council(options)
    res = nil
    if options[:immune]
      immune_index = @members.find_index(options[:immune])
      swap(@members, 0, immune_index)
      to_delete_index = rand(@members.length - 1) + 1
      puts "#{@members[to_delete_index].to_s} was voted off the island."
      res = @members.delete_at(to_delete_index)
    else
      to_delete_index = rand(@members.length)
      puts "#{@members[to_delete_index].to_s} was voted off the island."
      res = @members.delete_at(to_delete_index)
    end
    remaining_tribemates = @members.map {|member| member.name}.join(" ,")
    puts "Remaining tribemates on #{self.to_s.red} are: #{remaining_tribemates}"
    res
  end

  private
  def swap(array, i, j)
    if i != j
      array[i], array[j] = array[j], array[i]
    end
  end

end
