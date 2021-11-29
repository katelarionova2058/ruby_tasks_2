class Route
attr_accessor :stations  
attr_reader :stations, :name_route

  def initialize (st_first, st_last, name_route)
    @name_route = name_route
    @stations  = [st_first, st_last]
  end

  def add_station (station)
    @stations.insert(-2, station) unless @stations.include? station
  end

  def del_stations (station)
  return unless (@stations.first || @stations.last) != station
  @stations.delete(station)
  end

end
