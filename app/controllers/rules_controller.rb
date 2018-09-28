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
    Sku.import(params[:file])
    if :file.exists?
      redirect_to root_url, notice: 'Skus have been imported'
    else
      redirect_to root_url notice: 'You must select a file'
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
      redirect_to rules_url
    else
      flash[:notice] = "Something wwent wrong"
    end
  end

  private

  def rule_params
    params.require(:rule).permit(:relative_price, :discount, :reporting_make, :brand_name, :category_name, :sub_category_name, :functional_name)
  end
end
