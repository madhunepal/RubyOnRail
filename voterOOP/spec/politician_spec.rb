require './politician.rb'

describe Politician do
    it "is created with a name and party affiliation" do
        politician =Politician.new("Jane Doe", "Democrate")
        expect(politician).to be_a(Politician)
    end
    it "can report its name" do
        politician =Politician.new("Jane Doe", "Democrate")
        expect(politician.name).to eq("Jane Doe")
    end
    it "can report its party affiliation" do
      politician =Politician.new("Jane Doe", "Democrate") 
      expect(politician.party_affiliation).to eq("Democrate")
    end
        
end
