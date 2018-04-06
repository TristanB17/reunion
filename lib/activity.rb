class Activity
  attr_reader   :name,
                :participants



  def initialize(name, participants)
    @name = name
    @participants = participants
  end

  def add_participants(participant, cost)
    @participants[participant] = cost
  end

  def get_cost
    @participants.values.sum
  end

  def split_cost
    get_cost / @participants.keys.length
  end

  def get_owed
    get_cost / @participants.keys.length
    @participants.values.map do |value|
      value - split_cost
    end
  end


end
