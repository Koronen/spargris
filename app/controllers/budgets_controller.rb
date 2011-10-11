class BudgetsController < ApplicationController
  # GET /budgets
  # GET /budgets.xml
  def index
    @budgets = current_user.budgets.page(params[:page])

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
    if params[:template]
      @budget = current_user.budgets.find(params[:template])
      @budget.id = nil
    else
      @budget = current_user.budgets.new
      @budget.start = Time.zone.now.to_datetime.beginning_of_month.beginning_of_day
      @budget.end = Time.zone.now.to_datetime.end_of_month.end_of_day
    end

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
        format.html { redirect_to(@budget, :notice => t('budgets.create.success_notice')) }
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
        format.html { redirect_to(@budget, :notice => t('budgets.update.success_notice')) }
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
      format.html { redirect_to(budgets_url, :notice => t('budgets.destroy.success_notice')) }
      format.xml  { head :ok }
    end
  end
end
