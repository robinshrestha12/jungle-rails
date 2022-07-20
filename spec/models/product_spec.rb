require 'rails_helper'

RSpec.describe Product, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"

  describe 'Validations' do
    # validation tests/examples here
    it 'validation of product' do  
      @product = Product.new(name: "name", price_cents: 1, quantity: 1, category_id: 1)

      expect(@product).to be_present
    end
    it 'name presence' do  
      @product = Product.new(name: nil, price_cents: 1, quantity: 1, category_id: 1)
      @product.validate

      expect(@product.errors[:name]).to include("can't be blank")

      expect(@product.errors.full_messages).to include("Name can't be blank")
    end
    it 'price_cents presence' do  
      @product = Product.new(name: "name", price_cents: nil, quantity: 1, category_id: 1)
      @product.validate

      expect(@product.errors[:price_cents]).to include("is not a number")

      expect(@product.errors.full_messages).to include("Price can't be blank")
    end
    it 'quantity presence' do  
      @product = Product.new(name: "name", price_cents: 1, quantity: nil, category_id: 1)
      @product.validate

      expect(@product.errors[:quantity]).to include("can't be blank")

      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end
    it 'category presence' do  
      @product = Product.new(name: "name", price_cents: 1, quantity: 1, category_id: nil)
      @product.validate

      expect(@product.errors[:category]).to include("can't be blank")

      expect(@product.errors.full_messages).to include("Category can't be blank")
    end

  end

end
