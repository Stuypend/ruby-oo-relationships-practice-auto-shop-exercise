class Car

  @@all = []
  attr_accessor :classification, :owner
  attr_reader :make, :model

  def initialize(classification, owner, make=1, model=1)
    @make = make
    @model = model
    @classification = classification
    @owner = owner
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
    Mechanic.all.select { |mechanic| mechanic.specialty == self.classification }
  end

end
