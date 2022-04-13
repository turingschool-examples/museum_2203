require './lib/exhibit'
require './lib/patron'

RSpec.describe do

  it "exists" do
    exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})

    expect(exhibit).to be_a(Exhibit)
  end

end
