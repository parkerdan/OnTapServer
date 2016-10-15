class BarsController < ApplicationController
  before_action :set_bar, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index, :landing]
  # GET /bars
  # GET /bars.json
  def index
    @bars = Bar.all.order(:title).page(params[:page]).per(12)
  end

  def landing

  end

  def user_bars
    @bars = Bar.where("user_id = ?",current_user.id).order(:title).page(params[:page]).per(12)
  end

  # GET /bars/1
  # GET /bars/1.json
  def show
    # @taps = Tap.where(bar_id: @bar.id)
    if user_signed_in? && @bar.user_id == current_user.id
      @taps = Tap.where("bar_id = ?", @bar.id).order(:created_at)
    else
      # @tap = Tap.find(params[:id])
      @taps = Tap.where("bar_id = ? AND show_card = ?", @bar.id, true).order(:created_at)
    end

  end

  # GET /bars/new
  def new
    @bar = Bar.new
  end

  # GET /bars/1/edit
  def edit
  end

  # POST /bars
  # POST /bars.json
  def create
    @bar = Bar.new(bar_params)
    @bar.user_id = current_user.id

    respond_to do |format|
      if @bar.save
        format.html { redirect_to @bar, notice: 'Bar was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /bars/1
  # PATCH/PUT /bars/1.json
  def update
    respond_to do |format|
      if @bar.update(bar_params)
        format.html { redirect_to @bar, notice: 'Bar was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /bars/1
  # DELETE /bars/1.json
  def destroy
    @bar.destroy
    respond_to do |format|
      format.html { redirect_to bars_url, notice: 'Bar was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bar
      @bar = Bar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bar_params
      params.require(:bar).permit(:title)
    end
end
