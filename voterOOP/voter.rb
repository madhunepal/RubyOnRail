require './person.rb'

class Voter < Person
    attr_accessor :political_affiliation
    
    def initialize(name, political_affiliation)
        super(name)
        @political_affiliation = political_affiliation
    end
end
