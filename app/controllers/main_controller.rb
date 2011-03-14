class MainController < ApplicationController
  def index
  end

  def order
  end

  def buy
   if params["commit"]
    prod_list = {}
    %w(248 249 250 251 234 238 233 236).each do |product|
     if params["purchase"].has_key? product
      if params["purchase"][product].has_key?("amount") and !params["purchase"][product]["amount"].blank?
       prod_list[product.to_i] = params["purchase"][product]["amount"].to_i
      end
     end
    end
    unless prod_list.empty?
     @purchase = Purchase.create :u_name => "(che-pe) #{params["purchase"]["u_name"].to_s.mb_chars.strip}", :u_mail => params["purchase"]["u_mail"].to_s.mb_chars.strip, :address => params["purchase"]["address"]
     prod_list.each do |key, val|
      puts "#{key}  #{val}"
      @purchase.cart_items.create :product_id => key, :amount => val
     end
    UserNotification.sell(@purchase.u_mail, @purchase).deliver
    end
    if @purchase
     render :order
    else
     redirect_to root_path
    end
   else
    redirect_to root_path
   end
  end
end
