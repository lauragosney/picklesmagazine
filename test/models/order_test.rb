require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  test "should save is order is full" do
    @order = orders(:laura)

    assert_equal @order.save, true

  end

  test "should save and charge" do
    @order = orders(:laura)

    assert_equal @order.save_and_charge, true

  end

  test "should save and charge debit" do
    @order = orders(:laura2)

    assert_equal @order.save_and_charge, true

  end

  test "should save and charge mastercard" do
    @order = orders(:laura3)

    assert_equal @order.save_and_charge, true

  end

  test "should save and charge mastercard debit" do
    @order = orders(:laura4)

    assert_equal @order.save_and_charge, true

  end

  test "should save and charge american express" do
    @order = orders(:laura5)

    assert_equal @order.save_and_charge, true

  end

  test "should not save and charge with invalid card" do
    @order = orders(:ed)

    assert_equal @order.save_and_charge, false
    assert_equal @order.errors[:stripe_token], ["Your card was declined."]

  end

  test "should not save and charge with invalid expired card" do
    @order = orders(:jo)

    assert_equal @order.save_and_charge, false
    assert_equal @order.errors[:stripe_token], ["Your card's security code is incorrect."]

  end

  test "should not save and charge with processing error" do
    @order = orders(:gabs)

    assert_equal @order.save_and_charge, false
    assert_equal @order.errors[:stripe_token], ["An error occurred while processing your card. Try again in a little bit."]

  end

  test "should not save and charge as card is considered fraudulent" do
    @order = orders(:dan)

    assert_equal @order.save_and_charge, false
    assert_equal @order.errors[:stripe_token], ["Your card was declined."]

  end

  test "should not save and charge as the address_line1_check and address_zip_check verifications fail" do
    @order = orders(:sue)

    assert_equal @order.save_and_charge, false
    assert_equal @order.errors[:stripe_token], ["The zip code you supplied failed validation."]

  end


  test "should not save and charge attaching this card to a Customer object succeeds, but attempts to charge the customer fail." do
    @order = orders(:kirstie)

    assert_equal @order.save_and_charge, false
    assert_equal @order.errors[:stripe_token], ["Your card was declined."]

  end

  test "Charge succeeds but the address_line1_check verification fails" do
    @order = orders(:joey)

    assert_equal @order.address_1, false
    assert_equal @order.save_and_charge, false
    assert_equal @order.errors[:stripe_token], ["Your card was declined."]

  end


end
