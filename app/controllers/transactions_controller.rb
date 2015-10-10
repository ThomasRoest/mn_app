class TransactionsController < ApplicationController

  before_action :find_account, except: [:destroy]

  def new
     @transaction = @account.transactions.build
  end

   def create
    @transaction = @account.transactions.build(transaction_params)
    if @transaction.save
       flash[:success] = "saved"    
       redirect_to @account
     else
       flash[:error] = "not saved"
       render :new
     end
   end

   def edit
    @transaction = @account.transactions.find(params[:id])
   end
   
   def update
    @transaction = @account.transactions.find(params[:id])

    if @transaction.update_attributes(transaction_params)
      flash[:success] = "vertaling hier"
      redirect_to @account
    else
      flash[:error] = "vertaling hier"
      render :edit
    end
   end

  def destroy
    @transaction = Transaction.find(params[:id])
    @transaction.destroy
    redirect_to account_path(@transaction.account)
  end


  private

    def find_account
      @account = Account.find(params[:account_id])
      # for nested transaction resource
    end

    def transaction_params
      params.require(:transaction).permit(:description, :amount, :transaction_type, :each_month)
    end
end
