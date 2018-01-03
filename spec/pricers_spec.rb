require 'pricers'

describe RegularPrice do
  let(:regular) { RegularPrice.new }

  it 'calculates the charge with rent-days' do
    expect(regular.charge(1)).to eq 2
  end

  it 'calculates the charge with more than 2 days' do
    expect(regular.charge(3)).to eq 3.5
  end

  it 'calculates points for frequent use' do
    expect(regular.frequent_renter_points).to eq 1
  end
end

describe NewReleasePrice do
  let(:new_release) { NewReleasePrice.new }

  it 'calculates the charge with rent-days' do
    expect(new_release.charge(1)).to eq 3
  end

  it 'calculates regular points for frequent use' do
    expect(new_release.frequent_renter_points(1)).to eq 1
  end

  it 'calculates bonus points for frequent use' do
    expect(new_release.frequent_renter_points(2)).to eq 2
  end
end

describe ChildrensPrice do
  let(:kids) { ChildrensPrice.new }

  it 'calculates the charge with 1 rent-day' do
    expect(kids.charge(1)).to eq 1.5
  end

  it 'calculates the charge with rent-days' do
    expect(kids.charge(4)).to eq 3
  end

  it 'calculates points for frequent use' do
    expect(kids.frequent_renter_points).to eq 1
  end
end
