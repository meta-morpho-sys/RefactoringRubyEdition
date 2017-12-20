require 'customer'
require 'movie'
require 'rental'

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
    statement = <<~EOF.chomp
      Rental Record for James:
      \tLogan	 at the cost of 3.5£
      \tAmount owed is 3.5.
      \tYou earned 1 frequent renter points.
      EOF
    customer.add_rental(rental)
    expect(customer.statement).to eq statement
  end
end
