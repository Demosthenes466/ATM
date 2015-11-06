require_relative "user"

class Atm
	attr_accessor :name, :pin, :users, :current_name, :current_pin
	attr_reader :name, :pin, :users, :current_name, :current_pin

	def initialize
		@pin = pin
		@array = Array.new
		@current_name = current_name
		@current_pin = current_pin
	end

	def input
		puts "\n"" Please Enter Your Name:  "
		@current_name = gets.chomp
		puts "Please Enter Your Pin:  "
		@current_pin = gets.chomp
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
		account_total = @current_user.balance.to_f - withdraw_amount.to_f
		puts "Your new balance is $#{account_total}"
	end

	def deposit
		puts "How much would you like to deposit?:    "
		deposit_amount = gets.chomp
		account_total = @current_user.balance.to_f + deposit_amount.to_f
		puts "Your new balance is $#{account_total}"
	end


end