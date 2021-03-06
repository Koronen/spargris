class TagsController < ApplicationController
  def index
    @tags = ActsAsTaggableOn::Tag.where("name like ?", "%#{params[:q]}%").order("name ASC") #.page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tags }
      format.json { render :json => @tags.map(&:attributes).each{|t| t[:value] = t['name'] } }
    end
  end

  def show
    @tag = ActsAsTaggableOn::Tag.find(params[:id])
    @transactions = @tag.taggings.map(&:taggable)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tag }
    end
  end

  def edit
    @tag = ActsAsTaggableOn::Tag.find(params[:id])
  end

  def update
    @tag = ActsAsTaggableOn::Tag.find(params[:id])

    respond_to do |format|
      if @tag.update_attributes(params[:tag])
        format.html { redirect_to(tag_path(@tag), :notice => 'Tag was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => 'edit' }
        format.xml  { render :xml => @tag.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @tag = ActsAsTaggableOn::Tag.find(params[:id])
    @tag.destroy

    respond_to do |format|
      format.html { redirect_to(tags_url) }
      format.xml  { head :ok }
    end
  end
end
