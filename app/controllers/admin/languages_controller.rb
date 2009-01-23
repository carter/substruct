class Admin::LanguagesController < Admin::BaseController
  before_filter :find_language

  def index
    list
    render :action => 'list'
  end
  
  def list
    @languages = Language.paginate(
      :order => "name ASC",
      :page => params[:page],
      :per_page => 30
    )
  end
  
  def new
    @language = Language.new
  end
  
  def update
    if @language.update_attributes(params[:language])
      flash[:notice] = 'Your language was successfully updated'
    else
      render :action => :edit
    end
  end
  
  def create
    @language = Language.new(params[:language])
    if @language.save
      flash[:notice] = 'Your language was successfully created'
      redirect_to :action => :index
    else
      render :action => :new
    end
  end
  
  def destroy
    if @language.destroy
      responds_to do |format|
        format.js do
          render :update do |page|
            page.visual_effect :fade, "language_#{@language.id}"
          end
        end
      end
    end
  end

  private
  def find_language
    @language = Language.find(params[:id]) if params[:id]
  end
end