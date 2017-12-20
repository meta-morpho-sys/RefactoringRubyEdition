require 'movie'

describe Movie do
  let(:movie) { Movie.new('Logan', 1) }

  it 'has a title' do
    expect(movie.title).to eq 'Logan'
  end

  it 'has a price code' do
    expect(movie.price_code).to eq described_class::NEW_RELEASE
  end
end