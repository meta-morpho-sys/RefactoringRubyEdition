require 'movie'

describe Movie do
  let(:movie) { Movie.new('Logan', NewReleasePriceCalculator.new) }
  let(:new_release_pricer) { double :new_release_pricer, charge: 9 }
  let(:rental) { double :rental, movie, 3 }

  it 'has a title' do
    expect(movie.title).to eq 'Logan'
  end

  it 'validates pricers' do
    expect(movie.valid_price_calculator?(1)).to be false
    expect(movie.valid_price_calculator?(RegularPriceCalculator.new)).to be true
    expect(movie.valid_price_calculator?(NewReleasePriceCalculator.new))
      .to be true
    expect(movie.valid_price_calculator?(ChildrensPriceCalculator.new))
      .to be true
  end

  it 'raises an exception if no or wrong price code is applied' do
    INVALID_PRICER = 'InvalidPricer'.freeze
    expect { movie.price_calculator = INVALID_PRICER }.to raise_error PriceError
  end

  it 'calculates the charge of a new release' do
    expect(movie.charge(3)).to eq 9
  end

  it 'calculates the charge of a childrens' do
    kids = Movie.new('Ferdinand', ChildrensPriceCalculator.new)
    expect(kids.charge(4)).to eq 3
  end

  it 'calculates the charge of a regular rental' do
    regular = Movie.new('Die Hard', RegularPriceCalculator.new)
    expect(regular.charge(3)).to eq 3.5
  end

  it 'calculates points for frequent use' do
    expect(movie.frequent_renter_points(3)).to eq 2
  end
end
