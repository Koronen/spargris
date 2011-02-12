class BudgetsController < ApplicationController
  before_filter :require_login

  # GET /budgets
  # GET /budgets.xml
  def index
    @budgets = current_user.budgets

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @budgets }
    end
  end

  # GET /budgets/1
  # GET /budgets/1.xml
  def show
    @budget = current_user.budgets.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @budget }
    end
  end

  # GET /budgets/new
  # GET /budgets/new.xml
  def new
    @budget = current_user.budgets.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @budget }
    end
  end

  # GET /budgets/1/edit
  def edit
    @budget = current_user.budgets.find(params[:id])
  end

  # POST /budgets
  # POST /budgets.xml
  def create
    @budget = current_user.budgets.new(params[:budget])
    @budget.start = @budget.start.beginning_of_day
    @budget.end = @budget.end.end_of_day

    respond_to do |format|
      if @budget.save
        format.html { redirect_to(@budget, :notice => 'Budget was successfully created.') }
        format.xml  { render :xml => @budget, :status => :created, :location => @budget }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @budget.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /budgets/1
  # PUT /budgets/1.xml
  def update
    @budget = current_user.budgets.find(params[:id])
    #TODO: make adjustments below
    #params[:budget][:start] = params[:budget][:start].beginning_of_day if params[:budget][:start]
    #params[:budget][:end] = params[:budget][:end].end_of_day if params[:budget][:end]

    respond_to do |format|
      if @budget.update_attributes(params[:budget])
        format.html { redirect_to(@budget, :notice => 'Budget was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @budget.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /budgets/1
  # DELETE /budgets/1.xml
  def destroy
    @budget = current_user.budgets.find(params[:id])
    @budget.destroy

    respond_to do |format|
      format.html { redirect_to(budgets_url) }
      format.xml  { head :ok }
    end
  end
end
