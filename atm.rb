require_relative "user"

class Atm
	attr_accessor :name, :pin

	def initialize
		@name = name
		@pin = pin
	end

	def authorize(name, pin)
		file = File.open("pins.csv", r)
		file.each_line do |line|
			array = line.split(",")
		end
		print array
	end

end