require_relative "user"

class Atm
	attr_accessor :pin, :users, :current_name, :current_pin, :account_total, :balance, :current_user

	def initialize
		@users = Array.new
	end

	def users_list
		file = File.open("pins.csv", "r")
		file.each_line do |line|
			array = line.chop.split(",")
			@users.push(User.new(array[0], array[1].to_i, array[2].chop.to_f))
		end
	end

	def input
		puts "\n""Please Enter Your Name:  "
		@current_name = gets.chomp.downcase.strip
		puts "Please Enter Your Pin:  "
		@current_pin = gets.chomp.strip
	end

	def authorize(name, pin)
		for i in 0...(@users.length)
			if name == @users[i].name
				puts "working"
				if pin.to_i == @users[i].pin
					@current_user = @users[i]
					puts "Welcome"
					return true
				else
					puts @users[i].pin
					puts "Wrong combination"
					return false
				end
			end
		end
	end

	def prompt
		answer = false
		while !answer
		puts "Press 1 for deposit, and 2 for withdraw"
		input = gets.chomp.to_i
			if input == 1
				return true
				answer = true
			elsif input == 2
				return false
				answer = true
			end
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

	def update
		file = File.open("pins.csv", "w")
		for i in 0...(@users.length)
			if @users[i].name == @current_name
				file.puts "#{@current_name}, #{@current_pin}, #{@account_total}"
			else
				file.puts "#{@users[i].name}, #{@users[i].pin}, #{@users[i].balance.to_f}"
			end
		end
		file.close
	end

	def account?
		puts "Do you already have an account?"
		answer = false
		while !answer
		puts "Press 1 to access existing account, Press 2 to create an account"
		input = gets.chomp.to_i
			if input == 1
				answer = true
				return true
			elsif input == 2
				puts "Please enter the name for the account:  "
				name = gets.chomp.downcase
				puts "Please enter your pin:  "
				pin = gets.chomp
				puts "How much would you like to deposit into your new account?"
				account_total = gets.chomp.to_f

				users.push(User.new(name, pin, account_total))
				update
				puts "You now have an account with us under the name of #{name} with the pin #{pin}"
				puts "And the account total of $#{account_total}."
				puts "Please accept the debit card exiting the machine.....now. Have a nice day."
				answer = true
				return false
			end
		end
	end

		def run
			users_list
			if account?
				input
				if authorize(@current_name, @current_pin)
					if prompt
						deposit
					else
						withdraw
					end
					update
				end
			end
		end

		
end

