# This is first project based on data types and flow controls 
# submitted to I/o avenue by madhu
puts "Welcome to Puzzle World,"
puts "where you can find your lucky number to play power ball!!"

#this part takes player's info
puts "Take Player's Profile" 
print "What's your first name? "
first_name = gets.chomp.capitalize!

print "What's your last name? "
last_name = gets.chomp.capitalize!

print "What city are you from? "
city = gets.chomp.capitalize!

print "What state or province are you from? "
state = gets.chomp.upcase!

puts "You are #{first_name} #{last_name} and you belong to #{city}, #{state}!"

puts "Find your lucky numer!"
random_number = rand(10) 
puts "Pick any number between 0 and 9:"
guess = gets.chomp.to_i   #guess number 
until guess == random_number
puts "Try again! #{random_number} is not your Lucky number"
guess = gets.chomp.to_i
end

puts "Good Luck!! Your lucky number is #{random_number}!"