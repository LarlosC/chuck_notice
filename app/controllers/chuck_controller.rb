class ChuckController < ApplicationController

  def home

  end

  def notice
    @p_number = params['p_number'].to_i


    if @p_number == 6266793225
      joke = HTTParty.get('http://api.icndb.com/jokes/random').parsed_response['value']['joke']

      @chuck_notice = "Chuck Notice:\n" + joke

      account_sid = 'ACce8426ecdd9c894457b44bbc8bed3191'
      auth_token = '4aa43fdd3d65746f5e177dfc72849cfb'
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
