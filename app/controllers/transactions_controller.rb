class TransactionsController < ApplicationController

  def index
    @account = Account.find(1)
    @transactions = @account.transactions
    # @account = Account.find(1).includes(:transactions)
  end

  def new
    @transaction = Transaction.new
  end

  def create
    @account = Account.find(1)
    @transaction = @account.transactions.build(transaction_params)
    if @transaction.save
      flash[:success] = "saved"
      
      redirect_to transactions_path
    else
      flash[:error] = "not saved"
      render :new
    end
  end

  def destroy
    @transaction = Transaction.find(params[:id])
    @transaction.destroy
    redirect_to transactions_path
  end


  private
    def transaction_params
      params.require(:transaction).permit(:description, :amount)
    end
end
