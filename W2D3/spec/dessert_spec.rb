require 'rspec'
require 'dessert'
require "byebug"

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  subject(:red_velvet) {Dessert.new("Cake",2, chef)}
# debugger
  describe "#initialize" do
    it "sets a type" do 
       expect(red_velvet.type).to eq('Cake')
    end
    it "sets a quantity" do
      expect(red_velvet.quantity).to eq(2)
    end
    it "starts ingredients as an empty array" do
      expect(red_velvet.ingredients).to eq([])
    end
    it "raises an argument error when given a non-integer quantity" do
      expect {Dessert.new("Cake","2", chef)}.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
        red_velvet.add_ingredient("eggs")
        expect(red_velvet.ingredients).to include("eggs")
   end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      red_velvet.add_ingredient("eggs")
      red_velvet.add_ingredient("oil")
      red_velvet.add_ingredient("cake mix")
      red_velvet.add_ingredient("water")
      red_velvet.mix!
      expect(red_velvet.ingredients).to_not eq(["eggs","oil","cake mix","water"])
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      red_velvet.eat(2)
      expect(red_velvet.quantity).to eq(0)
    end
    it "raises an error if the amount is greater than the quantity" do
      expect {red_velvet.eat(12)}.to raise_error("not enough left!")
    end

  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Tucker the Great Baker")
      expect(red_velvet.serve).to eq("Chef Tucker the Great Baker has made 2 Cakes!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      allow(chef).to receive(:bake).with(red_velvet)
      red_velvet.make_more
    end
  end
end
