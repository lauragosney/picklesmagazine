class NewslettersController < ApplicationController

  def create
    gibbon = Gibbon::Request.new(api_key: "a18090f4e9faace25281903f9f60350f-us11")
    gibbon.lists("a52bb1c17c").members.create(body: { email_address: params["newsletter"]["email"], status: "subscribed" })
  
        flash[:success] = "Product removed from cart"

        redirect_to newsletter_path
  end

end
