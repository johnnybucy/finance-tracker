class Stock < ApplicationRecord
    has_many :user_stocks
    has_many :users, through: :user_stocks
    
    validates :name, :ticker, :category, presence: true
    def  self.new_lookup(ticker_symbol)
        ticker_symbol = ticker_symbol.downcase
        client = IEX::Api::Client.new(publishable_token: 'Tpk_8c35838042e44af8a9daa2d3b42e8f4a',
                                                        endpoint: 'https://sandbox.iexapis.com/v1')
        begin
            return new(ticker: ticker_symbol, name: client.company(ticker_symbol).company_name, last_price: client.price(ticker_symbol))
        rescue => exception 
            puts "THE MESSAGE IS " + exception.message
            return nil
        end
    end
    
    def self.check_db(ticker_symbol)
        ticker_symbol = ticker_symbol.downcase
        where(ticker: ticker_symbol).first
    end

end
