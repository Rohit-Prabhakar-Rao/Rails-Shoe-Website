class GalleryController < ApplicationController
  def index
    @shoes_gallery = Store.all
  end

  def products
    @shoes_gallery = Store.all
  end

  def view
    @shoe = Store.find(params[:id])
    
  end

  def checkout
    amount_to_charge = session[:amount].to_i
    if request.post?
      ActiveMerchant::Billing::Base.mode = :test
      # ActiveMerchant accepts all amounts as Integer values in cents
      #amount = 100
      credit_card = ActiveMerchant::Billing::CreditCard.new(
      :first_name         => params[:first_name],
      :last_name          => params[:last_name],
      :number             => params[:credit_no].to_i,
      :month              => params[:check][:month].to_i,
      :year               => params[:check][:year].to_i,
      :verification_value => params[:verification_number].to_i)
  
      # Validating the card automatically detects the card type
      gateway =ActiveMerchant::Billing::TrustCommerceGateway.new(
      :login => 'TestMerchant',
      :password =>'password',
      :test => 'true' )
  
      response = gateway.authorize(amount_to_charge , credit_card)
      #response = gateway.purchase(amount_to_charge, credit_card)
      puts response.inspect
        if response.success?
          gateway.capture(amount_to_charge, response.authorization)
          #UserNotifier.purchase_complete(session[:user],current_cart).deliver
          #flash[:notice]="Thank You for using Pink Flowers. The oreder details are sent to your mail"
          session[:cart_id]=nil
          session[:amount]=nil
          redirect_to :action=>:purchased
        else
          flash[:notice]= "Something went wrong.Try again"
          render :action => "checkout"
        end
      end
    end

    def search
      keyword = '%' + params[:keyword] + '%'
      @shoes_gallery = Store.find_by_sql ["Select * from stores WHERE name like ? or color like ? or brand like ? or size like ?",keyword,keyword,keyword,keyword]
    end
  
 
end
