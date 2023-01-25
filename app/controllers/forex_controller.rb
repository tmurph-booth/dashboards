class ForexController < ApplicationController
  def firstInput
    @rawData = open("https://api.exchangerate.host/symbols").read
    @parsedData = JSON.parse(@rawData)
    @symbolsHash = @parsedData.fetch("symbols")

    @arrayOfCurrencies = @symbolsHash.keys

    render({ :template => "forex_templates/step_one.html.erb" })
  end

  def secondInput
    @rawData = open("https://api.exchangerate.host/symbols").read
    @parsedData = JSON.parse(@rawData)
    @symbolsHash = @parsedData.fetch("symbols")

    @arrayOfCurrencies = @symbolsHash.keys

    @previousInput = params.fetch("fromPrevious")

    render({ :template => "forex_templates/step_two.html.erb" })
  end

  def currOutput
    @firstCurr = params.fetch("firstCurr")
    @secondCurr = params.fetch("secondCurr")

    @rawData = open("https://api.exchangerate.host/convert?from=#{@firstCurr}&to=#{@secondCurr}").read
    @parsedData = JSON.parse(@rawData)

    @exchangeRate = @parsedData.fetch("result")

    render({ :template => "forex_templates/output_currency.html.erb" })
  end
end
