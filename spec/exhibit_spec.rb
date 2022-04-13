require './lib/exhibit'

describe Exhibit do
  let(:exhibit){Exhibit.new({name: "Gems and Minerals", cost: 0})}

  it "exists" do
    expect(:exhibit).to be_a(Exhibit)
  end
end
