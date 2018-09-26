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
      flash[:notice] = "Success"
    else
      flash[:notice] = "Something wwent wrong"
    end
  end

  private

  def rule_params
    params.require(:rule).permit(:jit_cogs, :domestic_stocking_cogs, :best_stocking_cogs, :genuine_price, :reporting_make, :brand_name, :category_name, :sub_category_name, :functional_name)
  end
end
