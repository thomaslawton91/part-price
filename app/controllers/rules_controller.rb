class RulesController < ApplicationController
  def index
    @rules = Rule.all
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
