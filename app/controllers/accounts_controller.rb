class AccountsController < ApplicationController
  before_filter :require_login

  # GET /accounts
  # GET /accounts.xml
  def index
    @accounts = current_user.accounts

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @accounts }
    end
  end

  # GET /accounts/1
  # GET /accounts/1.xml
  def show
    @account = current_user.accounts.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @account }
    end
  end

  # GET /accounts/new
  # GET /accounts/new.xml
  def new
    @account = Account.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @account }
    end
  end

  # GET /accounts/1/edit
  def edit
    @account = current_user.accounts.find(params[:id])
  end

  # POST /accounts
  # POST /accounts.xml
  def create
    @account = Account.new(params[:account])
    @account.user = current_user

    respond_to do |format|
      if @account.save
        format.html { redirect_to(@account, :notice => t('accounts.create.success_notice')) }
        format.xml  { render :xml => @account, :status => :created, :location => @account }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @account.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /accounts/1
  # PUT /accounts/1.xml
  def update
    @account = current_user.accounts.find(params[:id])

    respond_to do |format|
      if @account.update_attributes(params[:account])
        format.html { redirect_to(@account, :notice => t('accounts.update.success_notice')) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @account.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.xml
  def destroy
    @account = current_user.accounts.find(params[:id])
    @account.destroy

    respond_to do |format|
      format.html { redirect_to(accounts_url, :notice => t('accounts.destroy.success_notice')) }
      format.xml  { head :ok }
    end
  end
end
