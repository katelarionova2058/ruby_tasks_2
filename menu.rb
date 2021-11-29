def menu
puts "Меню:"
puts "1 - Создать станцию"
puts "2 - Создать поезд"
puts "3 - Создать маршрут"
puts "4 - Изменить маршрут"
puts "5 - Назначить поезду маршрут"
puts "6 - Изменить состав поезда"
puts "7 - Переместить поезд"
puts "8 - Информация"
end



class Controller

attr_reader :stations,
              :trains,
              :routes

	def initialize
	    @stations = []
	    @trains = []
	    @routes = []
	end

	def run
	    puts "Что вы хотите сделать?"
	    action = gets.chomp
	    case action
	      when "1"
	        new_station
	      when "2"
	      	puts "Выберите тип поезда"
	      	puts "1 - грузовой "
	      	puts "2 - пассажирский"
	        action_newtrain = gets.chomp
	        case action_newtrain
	        when "1"
	        new_cargo_trains
	      	when "2"
	        new_pass_trains	
	    	end
	      when "3"
	        new_route
	      when "4"
	        puts "1 - Добавить станцию"
			puts "2 - Удалить станцию"
	        action_route = gets.chomp
	        case action_route
	        when "1"
	        add_station_in_route
	      	when "2"
	        del_station_in_route	
	    	end
	      when "5"
	        train_to_roat
	      when "6"
	        puts "1 - добавить вагон"
	        puts "2 - удалить вагон"
	        action_train = gets.chomp
	        case action_train
	        when "1"
	        add_car
	      	when "2"
	        del_car
	    	end
	      when "7"
	        puts "1 - Переместить назад"
	        puts "2 - Переместить вперед"
	        action_move = gets.chomp
	        case action_move
	        when "1"
	        move_to_back
	      	when "2"
	        move_to_forward
	    	end
	      when "8"
	        puts "1 - Список станций"
	        puts "2 - Список поездов на станции"
	        action_info = gets.chomp
	        case action_info
	        when "1"
	        show_stations
	      	when "2"
	      	show_trains_on_st	
	    	end
	      when "9"
	      	exit
	    end
	 end
	end




	def new_station
		puts "Укажите Наименование станции"
	    name = gets.chomp
	    @station = Station.new(name) 
	    @stations.push(@station)
	    puts "Создана станция #{name}"
	    return @station
	end

	def new_pass_trains
		puts "Укажите Наименование поезда"
	    name = gets.chomp
	    train = PassTrain.new(name) 
	    @trains.push(train)
	    puts "Поезд создан #{name}"
	end

	def new_cargo_trains
		puts "Укажите Наименование поезда"
	    name = gets.chomp
	    train = CargoTrain.new(name) 
	    @trains.push(train)
	    puts "Поезд создан #{name}"
	end


  	def new_route
  		puts "Укажите название маршрута"
  		name_route  = gets.chomp
  		puts "Начальная станция:"
  		st_first = new_station
  		puts "Конечная станция"
  		st_last = new_station
  		@route = Route.new st_first , st_last, name_route 
  		#puts route.class
  		@routes.push(@route)
  	end

  	def add_station_in_route
  		puts "Укажите название маршрута"
  		route_get  = gets.chomp
  		search_of_route = @routes.bsearch { |route| route.name_route == route_get }
  		#puts search_of_route.class
  		new_station
  		search_of_route.add_station @station
  	end

  	def del_station_in_route
  		puts "Укажите название маршрута"
  		route_get  = gets.chomp
  		search_of_route = @routes.bsearch { |route| route.name_route == route_get }
  		station_get  = gets.chomp
  		search_of_route.del_stations (station_get)
  	end

  	def train_to_roat
  		puts "Укажите название поезда"
  		train_get  = gets.chomp
  		search_of_train = @trains.bsearch { |train| train.name == train_get }
  		puts "Укажите название маршрута"
  		route_get  = gets.chomp
  		search_of_route = @routes.bsearch { |route| route.name_route == route_get }
  		search_of_train.add_route search_of_route
  		search_of_route.stations.first.show_trains
  	end

  	def move_to_back
  		puts "Укажите название поезда"
  		train_get  = gets.chomp
  		search_of_train = @trains.bsearch { |train| train.name == train_get }
  		search_of_train.back
  	end

  	def move_to_forward
  		puts "Укажите название поезда"
  		train_get  = gets.chomp
  		search_of_train = @trains.bsearch { |train| train.name == train_get }
  		search_of_train.next
  	end

  	def add_car
	  puts "Укажите название поезда"
  	  train_get  = gets.chomp
  	  search_of_train = @trains.bsearch { |train| train.name == train_get }
  	  puts "Укажите номер вагона"
  	  car_number = gets.chomp
  	  car = Car.new car_number
  	  car.type = search_of_train.type
  	  search_of_train.add_cars(car)
    end



    def del_car
  	  puts "Укажите название поезда"
  	  train_get  = gets.chomp
      search_of_train = @trains.bsearch { |train| train.name == train_get }
  	  search_of_train.del_cars
  	end

  	def show_stations
  		@stations.each { |station| puts station.class}
  	end

  	def show_trains_on_st
  		puts "Укажите название станции"
  		station_get = gets.chomp
  		search_of_station = @stations.bsearch{ |station| station.name >= station_get }
  		puts search_of_station.class

  		search_of_station.show_trains
  	end











