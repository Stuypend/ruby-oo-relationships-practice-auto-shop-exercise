class CarOwner

  @@all = []

  attr_reader :name


  def initialize(name)
    @name = name

    save
  end

  def save
    @@all << self
  end

  def self.all
    return @@all
  end

  def cars
    return Car.all.select  {|car| car.owner == self}
  end

  def mechanics
    mycars = self.cars
    result = []

    Mechanic.all.each  do
    |mechanic|

      mycars.each do
        |car|
        if(car.classification == mechanic.specialty)
          result.push(mechanic)
        end
      end

    end

    return result
  end

  def self.average_number_of_cars
    sum = 0
    @@all.each do
      |owner|
      sum += owner.cars.size
    end
    return sum/@@all.size
  end


end
