require_relative "car.rb"
require_relative "car_owner.rb"

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

  def car_owners
    return CarOwner.all.select  {|owner| owner.mechanics.include?(self)}
  end

  def car_owners_names
    result = CarOwner.all.select  {|owner| owner.mechanics.include?(self)}
    return result.map { |owner| owner.name }
  end

end

o1 = CarOwner.new("Jeff")
o2 = CarOwner.new("Jess")
o3 = CarOwner.new("Jeeter")

c1 = Car.new("Toyata", o1)
c2 = Car.new("Toyata", o2)
c3 = Car.new("Ford", o1)
c4 = Car.new("GM", o3)
c5 = Car.new("GM", o3)
c5 = Car.new("GM", o1)

m1 = Mechanic.new("x", "Toyata")
m2 = Mechanic.new("a", "Ford")
m3 = Mechanic.new("n", "GM")
m4 = Mechanic.new("m", "GM")

pp m1.cars
puts
pp m2.cars
puts
pp m3.cars
puts

pp m1.car_owners_names
puts
pp m2.car_owners_names
puts
pp m3.car_owners_names
puts