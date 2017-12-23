require 'movie'

describe Movie do
  let(:movie) { Movie.new('Logan', 1) }
  let(:rental) { double :rental, movie, 3 }

  it 'has a title' do
    expect(movie.title).to eq 'Logan'
  end

  it 'has a price code' do
    expect(movie.price_code).to eq described_class::NEW_RELEASE
  end

  it 'calculates the charge' do
    expect(movie.charge(3)).to eq 9
  end

  it 'calculates points for frequent use' do
    expect(movie.frequent_renter_points(3)).to eq 2
  end
end
