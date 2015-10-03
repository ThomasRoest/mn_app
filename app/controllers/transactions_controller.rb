class TransactionsController < ApplicationController

  def new
    @transaction  = Transaction.new
  end

   def create
    @account = Account.find(params[:account_id])
    @transaction = @account.transactions.build(transaction_params)
    if @transaction.save
       flash[:success] = "saved"    
       redirect_to @account
     else
       flash[:error] = "not saved"
       render :new
     end
   end

  def destroy
    @transaction = Transaction.find(params[:id])
    @transaction.destroy
    redirect_to account_path(@transaction.account)
  end


  private
    def transaction_params
      params.require(:transaction).permit(:description, :amount)
    end
end
