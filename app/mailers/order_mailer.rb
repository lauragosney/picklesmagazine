class OrderMailer < ApplicationMailer


  def receipt(order)
    @order = order

    mail to: @order.email, subject: "Thank your for ordering from Pickles Magazine"

  end


end
