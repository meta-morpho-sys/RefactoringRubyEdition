require 'rental'

describe Rental do
  let(:movie_logan) { double :movie, price_code: 1, title: 'Logan' }
  let(:rental) { Rental.new movie_logan, 2 }

  it 'has the movie' do
    expect(rental.movie).to eq movie_logan
  end

  it 'stores the number of rental days' do
    expect(rental.days_rented).to eq 2
  end
  #
  it 'calculates the charge' do
    allow(movie_logan).to receive(:charge) { 6 }
    expect(rental.charge).to eq 6
  end

  it 'calculates points for frequent use' do
    allow(movie_logan).to receive(:frequent_renter_points) { 2 }
    expect(rental.frequent_renter_points).to eq 2
  end
end
