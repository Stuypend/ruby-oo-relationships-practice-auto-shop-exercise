class Car

  @@all = []
  attr_accessor :classification
  attr_reader :make, :model

  def initialize(make, model, classification)
    @make = make
    @model = model
    @classification = classification
    save
  end

  def save
    @@all << self
  end

  def self.all
    return @@all
  end

  def self.classification
    return @@all.map do
      |car|
      car.classification
    end
  end

  def self.find_mechanics(classification)
    Mechanic.all.select { |mechanic| mechanic.classification == self.classification }
  end

end
