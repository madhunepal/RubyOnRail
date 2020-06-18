require './voter.rb'
require './politician.rb'
require './person.rb'


class Records
    attr_accessor :voters
    attr_accessor :politicians
    
    def initialize
        @voters = []
        @politicians = []
    end
    
    def create_voter(name, political_affiliation)
        voter = Voter.new(name, political_affiliation)
        @voters.push(voter)
    end
    
    def create_politician(name, party_affiliation)
        politician = Politician.new(name, party_affiliation)
        @politicians.push(politician)
    end
    
    def list
        results = ""
        
        @voters.each do |voter| 
            results += "Voter, #{voter.name}, #{voter.political_affiliation}\n"
        end
        
        @politicians.each do |politician|
            results += "Politician, #{politician.name}, #{politician.party_affiliation}\n"
        end
        
        return results
    end
    
    def search_voter(name)
        index = @voters.index{ |voter| voter.name == name }
    end
    
    def search_politician(name)
        index = @politicians.index{ |politician| politician.name == name }
    end
    
    def update_voter(old_name, new_name, new_affiliation)
        index = search_voter(old_name)
        
        if index != nil 
            @voters[index].name = new_name
            @voters[index].political_affiliation = new_affiliation
        end
    end
    
    def update_politician(old_name, new_name, new_affiliation)
        index = search_politician(old_name)
        
        if index != nil
            @politicians[index].name = new_name
            @politicians[index].party_affiliation = new_affiliation
        end
    end
    
    def delete_voter(name)
        index = search_voter(name)
        
        if index != nil 
            @voters.delete_at(index)
        end
    end
    
    def delete_politician(name)
        index = search_politician(name)
        
        if index != nil
            @politicians.delete_at(index)
        end
    end
end
    
=begin
    
    
  
   
    
    
    end 
    def delete_voter(name)
        index = search_voter(name)
        if index != nil@voters.delete_at(index)
        end
    end
    def delete_voter(name)
        index = search_voter(name)
        if index != nil@voters.delete_at(index)
        end
    end
=end
