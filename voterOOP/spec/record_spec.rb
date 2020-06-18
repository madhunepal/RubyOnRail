require './record.rb'
require './voter.rb'
require './politician.rb'

describe Records do
    it "can create a voter and add it to a voter's array" do 
        records =Records.new
        records.create_voter("John Doe", "Liberal")
        expect(records.voters.count).to eq(1)
    end
    
    it "can create a politician and add it to a politician's array" do 
        records =Records.new
        records.create_voter("John Doe", "Liberal")
        expect(records.voters.count).to eq(1)
    end
    it "can list all voters and politicians" do
        records = Records.new  
        records.create_voter("John Doe", "Liberal")
        records.create_politician("Jane Doe", "Democrat")
        
#         Voter, John Doe, Liberal
#         Politician, Jane Doe, Democrat
        expected_resulted = "Voter, John Doe, Liberal\nPolitician, Jane Doe, Democrat\n"
        expect(records.list).to eq(expected_resulted)
    end
    
=begin
    do
        records = Records.new
        records.create_politician("Will Smith", "Republican")
        records.create_voter("James Watt", "Socialist")
        expected_result = "Politician, #{records.politicians.last.name}, #{records.politicians.last.party_affiliation}\n"
        expected_result += "Voter, #{records.voters.last.name}, #{records.voters.last.political_affiliation}\n"
        expect(records.list).to eq(expected_result)
    end
=end
    
it "can search for a voter by name" do
        records =Records.new
        records.create_voter("John Doe", "Liberal")
        records.create_voter("Jimmy Jazz", "Socialist")
        records.create_voter("James Watt", "Conservative")
        
        index_for_existing_voter = records.search_voter("Jimmy Jazz")
        index_for_nonexisting_voter = records.search_voter("Jay Bee")
        
        expect(index_for_existing_voter).to eq(1)
        expect(index_for_nonexisting_voter).to eq(nil)
        
    end

    it "can search for a politician by name" do 
        records =Records.new
       
        records.create_voter("Ram Thapa", "Liberal")
        records.create_voter("Jimmy Jazz", "Socialist") 
       
        
        expect(records.voters[0].name).to eq("Ram Thapa")
        expect(records.voters[0].political_affiliation).to eq("Liberal")
     end

    it "can update a voter" do 
        records = Records.new
        
        records.create_voter("John Doe", "Liberal")
        records.create_voter("Lindsay Lohan", "Socialist")
        
        records.update_voter("John Doe", "Jimmy John", "Neutral")
        
        expect(records.voters[0].name).to eq("Jimmy John")
        expect(records.voters[0].political_affiliation).to eq("Neutral")
    end


    it "can update a politician" do 
        records = Records.new
        
        records.create_politician("John Doe", "Republican")
       
        records.update_politician("John Doe", "James Bond", "Democrat")
        
        expect(records.politicians[0].name).to eq("James Bond")
        expect(records.politicians[0].party_affiliation).to eq("Democrat")
    end

    it "can delete a voter" do 
        records =Records.new
       
        records.create_voter("John Doe", "Liberal")
        records.create_voter("Jimmy Jazz", "Socialist") 
        
        expect(records.voters.count).to eq(2)
        records.delete_voter("Jimmy Jazz")
        expect(records.voters.count).to eq(1)
        expect(records.search_voter("Jimmy Jazz")).to eq(nil)
    end
    it "can delete a politician" do 
        records =Records.new
       
        records.create_politician("John Doe", "Liberal")
        records.create_politician("Jimmy Jazz", "Socialist") 
       
        
        expect(records.politicians.count).to eq(2)
        records.delete_politician("Jimmy Jazz")
        expect(records.politicians.count).to eq(1)
        expect(records.search_politician("Jimmy Jazz")).to eq(nil)
    end
end