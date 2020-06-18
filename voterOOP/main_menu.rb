=begin
require './perosn.rb'
require './voter.rb'
require './politician.rb'
=end
require './record.rb'


class UserI
    def initialize
        @records = Records.new
    end
    
    def UserI
    play = true
   end
      def play
     
      puts "      Welcome to Voter Simulation 2017!"
      puts " You can make directory of voters or politicians"
      puts " You can list those voters or politicians"
      puts " You can even update and delete a voter or politician"
      puts "We hope you will feel great."
      puts "      What would you like to do, Now?"
      puts " (C)reate, (L)ist, (U)pdate, (D)elete or (Q)uit"
      desired_operation = gets.chomp.downcase.strip

        case desired_operation
            when "c"
                create_operation
            when "l"
                puts @records.list
            when "u"
                update_operation
            when "d"
                delete_operation
            when "q"
                return desired_operation
            else
                puts "That is not valid selection!!"
        end       
    end

    def create_operation
        puts "What would you like to create?"
        puts "(P)olitician or (V)oter"
        user_input = gets.chomp.downcase.strip

        case user_input
            when "p"
                puts "Name?"
                name = gets.chomp.downcase.strip
                puts "Party?"
                puts "(D)emocrat or (R)epublican"
                affiliation = gets.chomp.downcase.strip
                
                case affiliation
                    when "d"
                        affiliation = "Democrat"
                    when "r"
                        affiliation = "Republican"
                    else 
                        puts "That is not valid selection!!"
                end
          
                @records.create_politician(name.split.map(&:capitalize).join(' '), affiliation.split.map(&:capitalize).join(' '))
            when "v" 
                puts "Name?"
                name = gets.chomp.downcase.strip
                puts "Politics?"
                puts "(L)iberal, (C)onservative, (T)ea Party, (S)ocialist, or (N)eutral"
                affiliation = gets.chomp.downcase.strip
            
            case affiliation
                    when "l"
                        affiliation = "Liberal"
                    when "c"
                        affiliation = "Conservative"
                    when "t"
                        affiliation = "Tea Party"
                    when "s"
                        affiliation = "Socialist"
                    when "n"
                        affiliation = "Neutral"
                    else 
                        puts "That is not valid selection!!"
                end
            
                @records.create_voter(name.split.map(&:capitalize).join(' '), affiliation.split.map(&:capitalize).join(' '))
            else
                puts "That is not valid selection!!"  
        end
    end
    
    def update_operation
        puts "Who would you like to update?"
        name_old = gets.chomp.downcase.strip
        upper_name_old = name_old.split.map(&:capitalize).join(' ')
        
        # Check if politician exists in records
        index_for_politician = @records.search_politician(upper_name_old)
        if index_for_politician
            puts "New name?"
            name_new = gets.chomp.downcase.strip
            upper_name_new = name_new.split.map(&:capitalize).join(' ')
            puts "New party affilitaion?"
            puts "(D)emocrat or (R)epublican"
            affiliation_new = gets.chomp.downcase.strip
            
            case affiliation_new
                when "d"
                    affiliation_new = "Democrat"
                when "r"
                    affiliation_new = "Republican"
                else 
                    puts "That is not valid selection!!"
            end
            
            @records.update_politician(upper_name_old, upper_name_new, affiliation_new)
            puts "You successfully updated politician #{upper_name_new}"
            
            return
        end
        
        # Policitian doesn't exist, so check if voter exists in records
        index_for_voter = @records.search_voter(name_old.split.map(&:capitalize).join(' '))
        if index_for_voter
            puts "New name?"
            name_new = gets.chomp.downcase.strip
            upper_name_new = name_new.split.map(&:capitalize).join(' ')
            puts "New political affilitaion?"
            puts "(L)iberal, (C)onservative, (T)ea Party, (S)ocialist, or (N)eutral"
            affiliation_new = gets.chomp.downcase.strip
            
            case affiliation_new
                    when "l"
                        affiliation_new = "Liberal"
                    when "c"
                        affiliation_new = "Conservative"
                    when "t"
                        affiliation_new = "Tea Party"
                    when "s"
                        affiliation_new = "Socialist"
                    when "n"
                        affiliation_new = "Neutral"
                    else 
                        puts "That is not valid selection!!"
                end
            
            @records.update_voter(upper_name_old, upper_name_new, affiliation_new)
            puts "You successfully updated voter #{upper_name_new}"
            
            return
        end
        
        # No such records, display user message.
        puts "#{name_old} not found in our records."
    end
    
    def delete_operation
        puts "Who would you like to delete?"
        name = gets.chomp.downcase.strip
        upper_name = name.split.map(&:capitalize).join(' ')
     
        index_for_politician = @records.search_politician(upper_name)
     
        if index_for_politician
            @records.delete_politician(upper_name)
            puts "You successfully deleted politician #{upper_name}"
            return
        end
        
        index_for_voter = @records.search_voter(upper_name)
        if index_for_voter
            @records.delete_voter(upper_name)
            puts "You successfully deleted politician #{upper_name}"
            
            return
            elsif puts "That is not valid selection!!"
        end
    end
end

userI = UserI.new
userI.play
while true
    if userI.play == "q"
        puts "Thank you for using the Voter Simulator 2017!"
        break
    end
end