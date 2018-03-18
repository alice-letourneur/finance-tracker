class StocksController < ApplicationController
  def search
    if params[:stock].blank?
      flash.now[:danger] = "Your query is empty"
    else
      @stock = Stock.new_from_lookup(params[:stock])
      flash.now[:danger] = "Your query is invalid either because this symbol doesn't exist or becasue the service is temporarily unavailable" unless @stock
    end
    respond_to do |format|
      format.js { render partial: 'users/result' }
    end
  end
end
