require_relative "user"
require_relative "atm"

class Main
	def initialize
		@user = User.new
		@atm = Atm.new
	end

	def run
		@user.input
	end

end

run = Main.new