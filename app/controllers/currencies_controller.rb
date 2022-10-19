class CurrenciesController < ApplicationController
  def first_currency
    @raw_data = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@raw_data)
    @symbols_hash = @parsed_data["symbols"]

    @array_of_symbols = @symbols_hash.keys

    render({ :template => "currency_templates/step_one.html.erb" })
  end

  def from_currency
    @raw_data = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@raw_data)
    @symbols_hash = @parsed_data["symbols"]

    @array_of_symbols = @symbols_hash.keys

    @symbol = params["symbol"]

    render({ :template => "currency_templates/from_currency.html.erb" })
  end

  def conversion
    @from_sym = params["from_symbol"]
    @to_sym = params["to_symbol"]

    @raw_data = open("https://api.exchangerate.host/convert?from=#{@from_sym}&to=#{@to_sym}").read
    @parsed_data = JSON.parse(@raw_data)
    @exchange_rate = @parsed_data["info"]["rate"].to_f
    render({ :template => "currency_templates/conversion.html.erb" })
  end
end
