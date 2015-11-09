# ATM

#### Purpose:  
The purpose of this project was to experiment with user input, as well as understand
classes and object oriented programming.
#### Setup:
First you need to clone the repository    
```sh
$ git clone https://github.com/Demosthenes466/ATM.git
```
Then you need to open up the directory you saved it to, and git bash.   
Finally, run the command:
```sh
$ ruby run.rb
```
    
    
#### Questions:
1) Im still not all that sure how the file accessing commands work.   
       For example, in the code:
        
        file = File.open("pins.csv", "r")   
        file.each_line do |line|    
            array = line.chop.split(",")    
        end
What exactly is the "r"? 
        
2) I also am not fully aware of the difference between the    
       attr_accessor vs the attr_reader, such as in my Atm class:
       
          attr_accessor :name, :pin, :users, :current_name, :current_pin   
          attr_reader :name, :pin, :users, :current_name, :current_pin
    
3) Finally, when or when not to use the "@" when referencing a variable.    
       In my Atm class in the input method, it only ran when I set @current_name    
       equal to gets.chomp rather than simply current_name.
       
          def input
              puts "\n"" Please Enter Your Name:  "
              @current_name = gets.chomp
              puts "Please Enter Your Pin:  "
              @current_pin = gets.chomp
          end
  
