class TapsController < ApplicationController
  before_action :set_tap, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]
  # GET /taps
  # GET /taps.json
  def index
    @taps = Tap.all
  end

  # GET /taps/1
  # GET /taps/1.json
  def show
  end

  # GET /taps/new
  def new
    @tap = Tap.new
    @bar = Bar.find(params[:bar_id])
  end

  # GET /taps/1/edit
  def edit
    @bar = Bar.find(params[:bar_id])

  end

  # POST /taps
  # POST /taps.json
  def create
    @bar = Bar.find(params[:bar_id])
    @tap = Tap.new(tap_params)
    @tap.user_id = current_user.id
    @tap.bar_id = @bar.id


    respond_to do |format|
      if @tap.save
        format.html { redirect_to bar_path(@bar), notice: 'Tap was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /taps/1
  # PATCH/PUT /taps/1.json
  def update
    @bar = Bar.find(params[:bar_id])

    respond_to do |format|
      if @tap.update(tap_params)
        format.html { redirect_to bar_path(@bar), notice: 'Tap was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /taps/1
  # DELETE /taps/1.json
  def destroy
    @bar = Bar.find(params[:bar_id])

    @tap.destroy
    respond_to do |format|
      format.html { redirect_to bar_path(@bar), notice: 'Tap was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tap
      @tap = Tap.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tap_params
      params.require(:tap).permit(:title, :description, :imageId, :tapNumber, :bar_id, :color, :hoppiness, :text_color)
    end
end
