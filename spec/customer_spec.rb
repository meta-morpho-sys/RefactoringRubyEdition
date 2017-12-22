require 'customer'
require 'movie'
require 'rental'

def load_file(filename)
  File.readlines(ASSETS_DIR + filename).join
end

describe Customer do
  let(:customer) { Customer.new :James }
  let(:test_movie) { double :movie, title: 'Logan', price_code: 0 }
  let(:rental) { double :rental, movie: test_movie, days_rented: 3 }
  # rubocop:disable Style/MutableConstant
  ASSETS_DIR = '/Users/astarte/MyCodeExperiments/RefactoringRubyEdition/assets/'

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
      text_statement = load_file('statement_output.txt')
      customer.add_rental(rental)
      expect(customer.statement).to eq text_statement
    end

    it 'html_statement' do
      html_statement = load_file('html_statement_output.txt')
      customer.add_rental(rental)
      expect(customer.html_statement).to eq html_statement
    end
  end
end
