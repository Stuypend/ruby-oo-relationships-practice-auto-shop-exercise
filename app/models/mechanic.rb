class Mechanic

  @@all = []

  attr_reader :name, :specialty

def initialize(name, specialty)
  @name = name
  @specialty = specialty
  save
end

  def save
    @@all << self
  end

  def self.all
    return @@all
  end

  def cars
    return Car.all.select  {|car| car.classification == self.specialty}
  end

  def cars_owners
    return CarOwner.all.select  {|owner| owner.mechanics.include?(self)}
  end

  def cars_owners_names
    result = CarOwner.all.select  {|owner| owner.mechanics.include?(self)}
    return result.map { |owner| owner.name }
  end

end
