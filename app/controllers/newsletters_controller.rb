class NewslettersController < ApplicationController

  def create

     gibbon = Gibbon::Request.new(api_key: Rails.application.secrets.mailchimp_api_key )

     email = params["newsletter"]["email"]
     md5_email = Digest::MD5.hexdigest(email.downcase)

     if email.present?

     gibbon.lists("a52bb1c17c").members(md5_email).upsert(body: {
       email_address: email,
       status: "subscribed",
       merge_fields: {
         FNAME: params["newsletter"]["first_name"],
         LNAME: params["newsletter"]["last_name"]
       }
     })

      flash[:success] = "You have successfully subscribed to Pickles Magazine "
      redirect_back(fallback_location: root_path)

    else
      flash[:error] = "Please complete all required fields"
      redirect_back(fallback_location: root_path)

    end

  end
end
