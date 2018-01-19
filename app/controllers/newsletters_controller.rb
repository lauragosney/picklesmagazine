class NewslettersController < ApplicationController

  def create
    gibbon = Gibbon::Request.new(api_key: "a18090f4e9faace25281903f9f60350f-us11")
    gibbon.lists("a52bb1c17c").members.create(body: { email_address: params["newsletter"]["email"], first_name: params["newsletter"]["first_name"], last_name: params["newsletter"]["last_name"], status: "subscribed" })

      flash[:success] = "You have successfully subscribed to Pickles Magazine "

      redirect_back(fallback_location: root_path)
  end



end
