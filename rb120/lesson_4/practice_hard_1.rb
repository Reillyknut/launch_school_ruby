# # 1)
# class SecretFile
#   def initialize(secret_data, logger)
#     @data = secret_data
#     @logger = logger
#   end

#   def data
#     @data
#     @logger.create_log_entry
#   end
# end

# class SecurityLogger
#   def create_log_entry
#     # ... implementation omitted ...
#   end
# end


# # 2)
# module Fuelable
#   attr_accessor :speed, :heading
#   attr_writer :fuel_capacity, :fuel_efficiency

#   def range
#     @fuel_capacity * @fuel_efficiency
#   end
# end

# class WheeledVehicle
#   include Fuelable

#   def initialize(tire_array, km_traveled_per_liter, liters_of_fuel_capacity)
#     @tires = tire_array
#     self.fuel_efficiency = km_traveled_per_liter
#     self.fuel_capacity = liters_of_fuel_capacity
#   end

#   def tire_pressure(tire_index)
#     @tires[tire_index]
#   end

#   def inflate_tire(tire_index, pressure)
#     @tires[tire_index] = pressure
#   end
# end

# class Auto < WheeledVehicle
#   def initialize
#     # 4 tires are various tire pressures
#     super([30,30,32,32], 50, 25.0)
#   end
# end

# class Motorcycle < WheeledVehicle
#   def initialize
#     # 2 tires are various tire pressures
#     super([20,20], 80, 8.0)
#   end
# end

# class Catamaran
#   attr_reader :propeller_count, :hull_count

#   include Fuelable

#   def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
#     self.fuel_efficiency = km_traveled_per_liter
#     self.fuel_capacity = liters_of_fuel_capacity
#   end
# end


# # 3)
# class Seacraft
#   attr_reader :propeller_count, :hull_count

#   include Fuelable

#   def initialize(num_propellers, num_hulls, fuel_efficiency, fuel_capacity)
#     @propeller_count = num_propellers
#     @hull_count = num_hulls
#     self.fuel_efficiency = fuel_efficiency
#     self.fuel_capacity = fuel_capacity
#   end

#   def range
#     super + 10 
#   end
# end

# class Motorboat < Seacraft
#   def initialize(km_traveled_per_liter, liters_of_fuel_capacity)
#     super(1, 1, km_traveled_per_liter, liters_of_fuel_capacity)
#   end
# end

# # New catamaran class:
# class Catamaran < Seacraft
# end


# # 4)
# # Made the following addition to Seacraft
# def range
#   super + 10 
# end