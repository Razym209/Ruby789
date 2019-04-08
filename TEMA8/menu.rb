require_relative './train.rb'
require_relative './train_cargo.rb'
require_relative './train_passenger.rb'
require_relative './station.rb'
require_relative './route.rb'
require_relative './wagon.rb'
require_relative './wagon_cargo.rb'
require_relative './wagon_passenger.rb'
require_relative './main.rb'
require_relative './manufacturer'
require_relative './instance_counter'

main = Main.new
main.run
