require 'pricers'

describe RegularPrice do
  it 'calculates the charge with rent-days' do
    regular = RegularPrice.new
    expect(regular.charge(1)).to eq 2
  end

  it 'calculates the charge with more than 2 days' do
    regular = RegularPrice.new
    expect(regular.charge(3)).to eq 3.5
  end
end

describe NewReleasePrice do
  it 'calculates the charge with rent-days' do
    regular = NewReleasePrice.new
    expect(regular.charge(1)).to eq 3
  end
end

describe ChildrensPrice do
  it 'calculates the charge with rent-days' do
    regular = ChildrensPrice.new
    expect(regular.charge(1)).to eq 1.5
  end

  it 'calculates the charge with rent-days' do
    regular = ChildrensPrice.new
    expect(regular.charge(4)).to eq 3
  end


end
