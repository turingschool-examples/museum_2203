require 'rspec'
require './lib/patron'

RSpec.describe 'Patron' do
  describe 'attributes' do
    before(:each) do
      @patron_1 = Patron.new('Bob', 20)
    end

    it 'has a name' do
      expect(@patron_1.name).to eq 'Bob'
    end

    it 'has a cost' do
      expect(@patron_1.spending_money).to eq 20
    end
  end

  describe 'behaviors' do
    before(:each) do
      @patron_1 = Patron.new('Bob', 20)
    end
    it 'adds interests' do
      @patron_1.add_interest('Dead Sea Scrolls')
      @patron_1.add_interest('Gems and Minerals')

      expect(@patron_1.interests).to eq ['Dead Sea Scrolls', 'Gems and Minerals']
    end
  end
end
