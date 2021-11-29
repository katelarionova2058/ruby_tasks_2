class CargoTrain < Train

@trains = {}

  def initialize (name)
    super
    @type = :cargo
  end
end
