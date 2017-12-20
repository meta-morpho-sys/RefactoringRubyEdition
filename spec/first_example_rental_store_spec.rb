require 'first_example_rental_store'

describe Movie do
  let(:movie) { Movie.new('Logan', 1) }

  it 'has a title' do
    expect(movie.title).to eq 'Logan'
  end

  it 'has a price code' do
    expect(movie.price_code).to eq described_class::NEW_RELEASE
  end
end

describe Rental do
  let(:movie_logan) { double :Logan, price_code: 1, title: 'Logan' }
  let(:rental) { Rental.new movie_logan, 2 }

  it 'has the movie' do
    expect(rental.movie).to eq movie_logan
  end

  it 'stores the number of rental days' do
    expect(rental.days_rented).to eq 2
  end

  it 'calculates the charge' do
    expect(rental.charge).to eq 6
  end
end

describe Customer do
  let(:customer) { Customer.new :James }
  let(:movie) { double :test_movie, title: 'Logan', price_code: 0 }
  let(:rental) { double :rental, movie: movie, days_rented: 3 }

  it 'has name by default' do
    expect(customer.name).to eq :James
  end

  it 'makes a rental' do
    customer.add_rental(rental)
    expect(customer.rentals).to eq [rental]
  end

  it 'prints a statement' do
    allow(rental).to receive(:charge) { 3.5 }
  statement = %(Rental Record for James:
\tLogan	 at the cost of 3.5£
\tAmount owed is 3.5.
\tYou earned 1 frequent renter points.)
    customer.add_rental(rental)
    expect(customer.statement).to eq statement
  end
end
