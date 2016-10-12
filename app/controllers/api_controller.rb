class ApiController < ApplicationController

  skip_before_action :verify_authenticity_token
  protect_from_forgery with: :null_session

  before_action :ensure_json_request


  def get_bars
    render :json => {
      :response => Bar.get_bars,
    },:status => 200
  end

  def get_cards

    bar_id = request.headers["Bar-Id"].to_i

    render :json => {
      :response => Tap.get_cards(bar_id),
    },:status => 200
  end



 private

  def ensure_json_request
  return if request.format == :json
  render file: "#{Rails.root}/public/404.html", layout: false, status: 404
  end

end
