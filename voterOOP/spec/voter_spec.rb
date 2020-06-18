
require './voter.rb'

describe Voter do
    it "is created with name and political afiliation" do
        voter =  Voter.new("John Doe", "Liberal")
        expect(voter).to be_a(Voter)
    end
    it "can report its name" do
        voter = Voter.new("John Doe", "Liberal")
        expect(voter.name).to eq("John Doe")
    end
    it "can report its political affiliation" do
    end    
end