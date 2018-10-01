class RulesController < ApplicationController
  def index
    @rules = Rule.all
    @discounts = DiscountedPart.all
    respond_to do |format|
      format.html
      format.csv { send_data @discounts.to_csv }
    end
  end

  def import
    if params[:file].nil?
      redirect_to root_url, danger: 'You must select a file for upload'
    else
      Sku.import(params[:file])
      redirect_to root_url, info: 'Skus have been imported'
    end
  end

  def new
    @skus = Sku.all
    @rule = Rule.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @rule = Rule.new(rule_params)
    @rule.save
    if @rule.save
      RulesWorker.perform_async(@rule.id)
      redirect_to root_url, info: 'Rule created successfully'
    else
      flash[:danger] = 'Something went wrong'
    end
  end

  private

  def rule_params
    params.require(:rule).permit(:relative_price, :discount, :reporting_make, :brand_name, :category_name, :sub_category_name, :functional_name)
  end
end
