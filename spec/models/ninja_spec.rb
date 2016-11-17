require 'rails_helper'
RSpec.describe Ninja, type: :model do
	it "should require name" do
	  	ninja1 = Ninja.new(name: "", description: "Joe is a ninja!")
	  	ninja1.save
	  	expect(ninja1.valid?).to be false;
	end
	it "Should require description" do
	  	ninja1 = Ninja.new(name: "Joe", description: "")
	  	ninja1.save
		expect(ninja1.valid?).to be false;
	end
end
