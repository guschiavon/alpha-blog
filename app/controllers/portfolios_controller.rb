class PortfoliosController < ApplicationController
  before_action :set_portfolio, only:[:show, :edit, :destroy, :update] # this before_action method is defined at the bottom of the controller under the private section, and is an action performed on the CRUD actions to set the portfolio item prior to executing actions on it.

  def show
  end

  def index
    @portfolios = Portfolio.all
  end

  def new
    @portfolio = Portfolio.new
  end

  def edit
  end

  private

  def set_portfolio   
    @portfolio = Portfolio.find(params[:id]) # in order to populate the article view for edit, we call the same method which pulls the data from the database
  end

  def portfolio_params
    params.require(:portfolio).permit(:title, :description, :tech, :id)
  end
end
