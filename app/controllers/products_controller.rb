class ProductsController < ApplicationController
  def index
    # Vulnerable query that directly uses user input in SQL query
    @unsafe_products = search_unsafe_products(params[:query])

    # ActiveRecord's built-in query methods to sanitize user inputs
    @safe_products = search_safe_products(params[:query])
  end

  private

  def search_unsafe_products(query)
    return [] unless query.present?

    Product.where("LOWER(name) LIKE '%#{query.downcase}%'")
  end

  def search_safe_products(query)
    return [] unless query.present?

    Product.where("LOWER(name) LIKE ?", "%#{query.downcase}%")
  end
end
