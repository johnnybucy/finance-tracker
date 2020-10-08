class Stock < ApplicationRecord
    def  self.new_lookup(ticker_symbol)
        client = IEX::Api::Client.new(publishable_token: 'Tpk_8c35838042e44af8a9daa2d3b42e8f4a',
                                                        endpoint: 'https://sandbox.iexapis.com/v1')
        return new(ticker: ticker_symbol, name: client.company(ticker_symbol).company_name, last_price: client.price(ticker_symbol))
    end
end
