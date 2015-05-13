class ChuckController < ApplicationController

  def home

  end

  def notice
    @p_number = params['p_number'].to_i


    if @p_number == ENV["my_phone"].to_i
      joke = HTTParty.get('http://api.icndb.com/jokes/random').parsed_response['value']['joke']

      @chuck_notice = "Chuck Notice:\n" + joke
      
      account_sid = ENV["twilio_sid"]
      auth_token = ENV["twilio_token"]
      @client = Twilio::REST::Client.new account_sid, auth_token
      message = @client.account.messages.create({:body => @chuck_notice,
          :to => "+1#{@p_number}",
          :from => "+12133475614"})
      puts message.sid + " Chuck Notice sent."
      else
        redirect_to "/fail"
      end
  end

  def fail
  end

end
