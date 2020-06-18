require './person.rb'
describe Person do
    it "is created with a name" do 
        person =Person.new("John Doe")
        expect(person).to be_a(Person)
    end
    it "report name of the person" do
        person =Person.new("John Doe")
        expect(person.name).to eq("John Doe")
    end
end
