require_relative 'train'
require_relative 'car'
require_relative 'cargo_car'
require_relative 'pass_train'
require_relative 'cargo_train'
require_relative 'pass_car'
require_relative 'station'
require_relative 'route'
require_relative 'menu'


control =Controller.new

loop do
      menu
      control.run
    end