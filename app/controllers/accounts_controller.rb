class AccountsController < ApplicationController
  def index
    @accounts = Account.all
  end

  def show
    @account = Account.find(params[:id])
     @transactions = @account.transactions
  end

  def create
    @account = Account.create(account_params)
    if @account.save
      flash[:sucess] = t(:account_create_success)
      redirect_to accounts_path
    else
      flash[:error] = t(:account_create_error)
      render :new
    end
  end

  def destroy
    if Account.find(params[:id]).destroy
      redirect_to accounts_path
    end
  end

  def new
    @account = Account.new
  end

  private
  def account_params
    params.require(:account).permit(:name)
  end
end
