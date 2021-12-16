class ShortsController < ApplicationController
  before_action :set_short, only: [:show, :update, :destroy]

  # GET /shorts
  def index
    @shorts = Short.all

    render json: @shorts
  end

  # GET /shorts/1
  def show
   if @short.nil?

    render json: {
        error: "The shortcode cannot be found in the system"
      }, status: 404
   else
    @short.update_attribute(:clicked, @short.clicked + 1)
    render json: {
      
        "location": @short.url
      
      
    }, status: 200
   end
    # 
    # render json: @short
  end

  #GET /stat/1
  def stat
    @short=Short.find_by_shorturl(params[:slug])
    if @short.nil? 
      
      render json: {
        error: "The shortcode cannot be found in the system"
      }, status: 404
    else     
     
      render status: 200, json: 
      { 
         "Startdate": @short.created_at,
         "Lastdate": @short.updated_at,
         "redirectCount": @short.clicked,
     }
    
    end     
  end
  # POST /shorts
  def create
    @short = Short.new(short_params)
    if @short.shorturl.nil?
      @short.shorturl=@short.shorten
    else
      @short.shorturl=@short.shorturl
    end

    if @short.save
      render json: @short, status: :created, location: @short
    else
      render json: @short.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /shorts/1
  def update
    if @short.update(short_params)
      render json: @short
    else
      render json: @short.errors, status: :unprocessable_entity
    end
  end

  # DELETE /shorts/1
  def destroy
    @short.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_short
      @short = Short.find_by_shorturl(params[:slug])
    end

    # Only allow a list of trusted parameters through.
    def short_params
      params.require(:short).permit(:url, :shorturl, :clicked)
    end
end
