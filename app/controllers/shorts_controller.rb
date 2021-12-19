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
    @short.update_attribute(:redirectcount, @short.redirectcount + 1)
    #redirect_to @short.url
    render status: 302, location: @short.url
   end
    # 
    # render json: @short
  end

  #GET /stat/1
  def stat
    @short=Short.find_by_shortcode(params[:shortcode])
    if @short.nil? 
      
      render json: {
        error: "The shortcode cannot be found in the system"
      }, status: 404
    else     
     
      render status: 200, json: 
      { 
         "Startdate": @short.created_at,
         "Lastdate": @short.updated_at,
         "redirectCount": @short.redirectcount,
     }
    
    end     
  end
  # POST /shorts
  def create
    @short = Short.new(short_params)
    @short.shortcode=@short.shorten
    

      if @short.save
        render json: {"shortcode": @short.shortcode}, status: :created, location: @short
      else
        
        @error=@short.errors.first
        #options=ActiveSupport::JSON.encode(@error.options)
        options=@error.options
        render json: {error: options[:message]}, status: options[:status]
        
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
    @short=Short.where(id: 3..55).destroy_all
    render status: 204
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_short
      @short = Short.find_by_shortcode(params[:shortcode])
    end

    # Only allow a list of trusted parameters through.
    def short_params
      params.require(:short).permit(:url, :shortcode, :redirectcount)
    end
end
