class PagesController < ApplicationController
  load_and_authorize_resource	
  uses_tiny_mce :options => {
                            :theme => 'advanced',
                            :theme_advanced_resizing => true,
                            :theme_advanced_resize_horizontal => false,
                            :plugins => %w{ table fullscreen }
                          }
  def index
  	@pages = Page.all
  end

  def show
  end

  def new
  end

  def create
    if @page.save!
      #flash[:notice] = 'Page saved'
      redirect_to root_url, :notice  =>  'Page saved' 
    else  
      render :action => 'new'  
    end     
  end

  def edit
  end

  def update
    @page.attributes = params[:page]
    if @page.save!
      redirect_to root_url, :notice => "Updated..."
    else 
      redirect_to :action => "index"
    end
  end

  def destroy
    if @page.destroy
      flash[:notice] = "Page deleted..."	    	
    else
      flash[:notice] = "There was a problem deleting the page..."	    	
    end
      redirect_to root_url
  end

end
