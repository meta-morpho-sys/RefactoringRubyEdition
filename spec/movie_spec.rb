require 'movie'
require 'price_code_error'

describe Movie do
  let(:movie) { Movie.new('Logan', Movie::NEW_RELEASE) }
  let(:new_release_pricer) { double :new_release_pricer, charge: 9 }
  let(:rental) { double :rental, movie, 3 }

  it 'has a title' do
    expect(movie.title).to eq 'Logan'
  end

  it 'has a price code' do
    expect(movie.price_code).to eq Movie::NEW_RELEASE
  end

  it 'raises an exception if no or wrong price code is applied' do
    INVALID_PRICE_CODE = 5
    expect { movie.price_code = INVALID_PRICE_CODE }.to raise_error PriceCodeError
  end

  it 'calculates the charge of a new release' do
    expect(movie.charge(3)).to eq 9
  end

  it 'calculates the charge of a childrens' do
    kids = Movie.new('Ferdinand', Movie::CHILDRENS)
    expect(kids.charge(4)).to eq 3
  end

  it 'calculates the charge of a regular rental' do
    regular = Movie.new('Die Hard', Movie::REGULAR)
    expect(regular.charge(3)).to eq 3.5
  end

  it 'calculates points for frequent use' do
    expect(movie.frequent_renter_points(3)).to eq 2
  end
end
