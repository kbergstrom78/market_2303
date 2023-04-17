require 'rspec'
require './lib/item'
require './lib/vendor'

RSpec.describe Vendor do
  before(:each) do
    @vendor = Vendor.new("Rocky Mountain Fresh") 
  end
  
  describe '#initialize' do
    it 'exists' do
      expect(@vendor).to be_an_instance_of(Vendor)
    end
  
    it 'has attributes' do
      expect(@vendor.name).to eq("Rocky Mountain Fresh")
    end
  
    it 'has no inventory' do
      expect(@vendor.inventory).to eq({})
    end
  end

  describe '#check_stock' do
end