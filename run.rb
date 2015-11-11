require_relative "user"
require_relative "atm"
array = Array.new
users = Array.new


file = File.open("pins.csv", "r")
file.each_line do |line|
	array = line.chop.split(",")
	users.push(User.new(array[0], array[1].to_i, array[2].chop))
end



atm = Atm.new
if atm.account?(users)
	atm.input
	if atm.authorize(users, atm.current_name, atm.current_pin)
		if atm.prompt
			atm.deposit
		else
			atm.withdraw
		end
		atm.update(users)
	end
end





# user = User.new
# atm = Atm.new

# user.input
# puts user.name
# puts user.pin

# atm.authorize(user.name, user.pin)













# class Main
# 	def initialize
# 		@user = User.new
# 		@atm = Atm.new
# 	end

# 	def run
# 		puts "hi"
# 		@user.input
# 	end
# end

# main = Main.new