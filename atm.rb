require_relative "user"

class Atm
	attr_accessor :name, :pin, :users, :current_name, :current_pin, :account_total
	attr_reader :name, :pin, :users, :current_name, :current_pin, :account_total

	def initialize
		@pin = pin
		@array = Array.new
		@current_name = current_name
		@current_pin = current_pin
		@account_total = account_total
	end

	def input
		puts "\n""Please Enter Your Name:  "
		@current_name = gets.chomp.downcase
		puts "Please Enter Your Pin:  "
		@current_pin = gets.chomp.downcase
	end

	def authorize(array, name, pin)
		for i in 0...(array.length)
			if name == "#{array[i].name}"
				if pin == "#{array[i].pin}"
					@current_user = array[i]
					puts "Welcome"
					return true
				else
					puts "Wrong combination"
					return false
				end
			end
		end
	end

	def prompt
		puts "Press 1 for deposit, and 2 for withdraw"
		input = gets.chomp.to_i
		if input == 1
			return true
		elsif input == 2
			return false
		end
	end

	def withdraw
		puts "How much would you like to withdraw?:   "
		withdraw_amount = gets.chomp
		@account_total = @current_user.balance.to_f - withdraw_amount.to_f
		puts "Your new balance is $#{account_total}"
	end

	def deposit
		puts "How much would you like to deposit?:    "
		deposit_amount = gets.chomp
		@account_total = @current_user.balance.to_f + deposit_amount.to_f
		puts "Your new balance is $#{account_total}"
	end

	def update(array)
		file = File.open("pins.csv", "w")
		for i in 0...(array.length)
			if array[i].name == @current_name
				file.puts "#{@current_name}, #{@current_pin}, #{@account_total}"
			else
				file.puts "#{array[i].name}, #{array[i].pin}, #{array[i].balance.to_f}"
			end
		end
		file.close
	end

	def account?(users)
		puts "Do you already have an account?"
		puts "Press 1 to access existing account, Press 2 to create an account"
		input = gets.chomp.to_i
		if input == 1
			return true
		else 
			puts "Please enter the name for the account:  "
			name = gets.chomp.downcase
			puts "Please enter your pin:  "
			pin = gets.chomp
			puts "How much would you like to deposit into your new account?"
			account_total = gets.chomp.to_f

			users.push(User.new(name, pin, account_total))
			update(users)
			puts "You now have an account with us under the name of #{name} with the pin #{pin}"
			puts "And the account total of $#{account_total}."
			puts "Please accept the debit card exiting the machine.....now. Have a nice day."
			return false
		end
	end



end