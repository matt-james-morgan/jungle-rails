require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'is not valid without a name' do
      @category = Category.new(name: "Test")
      @product = Product.new(name: nil, price: 10, quantity: 1, category: @category)
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end
    it 'is not valid without a price' do
      @category = Category.new(name: "Test Cat")
      @product = Product.new(name: "Test", price_cents: nil, quantity: 1, category: @category)
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end
    it 'is not valid without a quantity' do
      @category = Category.new(name: "Test Cat")
      @product = Product.new(name: "Test", price_cents: 1, quantity: nil, category: @category)
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end
    it 'is not valid without a category' do
     
      @product = Product.new(name: "Test", price_cents: 1, quantity: 1, category: nil)
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end