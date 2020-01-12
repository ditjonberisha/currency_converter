class ConverterController < ApplicationController
  before_action :set_currencies, only: :index

  def index
  end

  def create
    @result = { value: Rate.convert_value(convert_params), is_from: convert_params[:is_from] == 'true' }
  end

  protected
    def set_currencies
      @currencies = Currency.all
    end

    def convert_params
      params.permit(:from, :to, :value, :is_from)
    end
end
