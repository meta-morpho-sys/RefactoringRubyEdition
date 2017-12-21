require 'customer'
require 'movie'
require 'rental'

describe Customer do
  let(:customer) { Customer.new :James }
  let(:test_movie) { double :movie, title: 'Logan', price_code: 0 }
  let(:rental) { double :rental, movie: test_movie, days_rented: 3 }

  it 'has name by default' do
    expect(customer.name).to eq :James
  end

  it 'makes a rental' do
    customer.add_rental(rental)
    expect(customer.rentals).to eq [rental]
  end

  context 'prints statements' do
    before(:each) do
      allow(rental).to receive_messages(
                           charge: 3.5,
                           frequent_renter_points: 1
                       )
    end
    it 'text statement' do
      statement = <<~EOF.chomp
        Rental Record for James:
        \tLogan	 at the cost of 3.5£
        \tAmount owed is 3.5.
        \tYou earned 1 frequent renter points.
        EOF
      customer.add_rental(rental)
      expect(customer.statement).to eq statement
    end

    it 'html_statement' do
      html_statement = <<~EOF.chomp
        <h1>Rentals for <em>James</em></h1><p>
        \tLogan: at the cost of £3.5<br>
        \tYou owe £<em>3.5</em><p>
        \tOn this rental you earned <em>1</em> frequent renter points<p>.
      EOF
      customer.add_rental(rental)
      expect(customer.html_statement).to eq html_statement
    end
  end
end
