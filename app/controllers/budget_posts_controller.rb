class BudgetPostsController < ApplicationController
  before_filter :require_login

  # GET /budget_posts
  # GET /budget_posts.xml
  def index
    @budget_posts = BudgetPost.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @budget_posts }
    end
  end

  # GET /budget_posts/1
  # GET /budget_posts/1.xml
  def show
    @budget_post = BudgetPost.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @budget_post }
    end
  end

  # GET /budget_posts/new
  # GET /budget_posts/new.xml
  def new
    @budget_post = BudgetPost.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @budget_post }
    end
  end

  # GET /budget_posts/1/edit
  def edit
    @budget_post = BudgetPost.find(params[:id])
  end

  # POST /budget_posts
  # POST /budget_posts.xml
  def create
    @budget_post = BudgetPost.new(params[:budget_post])

    respond_to do |format|
      if @budget_post.save
        format.html { redirect_to(@budget_post, :notice => t('categories.create.success_notice')) }
        format.xml  { render :xml => @budget_post, :status => :created, :location => @budget_post }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @budget_post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /budget_posts/1
  # PUT /budget_posts/1.xml
  def update
    @budget_post = BudgetPost.find(params[:id])

    respond_to do |format|
      if @budget_post.update_attributes(params[:budget_post])
        format.html { redirect_to(@budget_post, :notice => t('categories.update.success_notice')) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @budget_post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /budget_posts/1
  # DELETE /budget_posts/1.xml
  def destroy
    @budget_post = BudgetPost.find(params[:id])
    @budget_post.destroy

    respond_to do |format|
      format.html { redirect_to(categories_url, :notice => t('categories.destroy.success_notice')) }
      format.xml  { head :ok }
    end
  end
end