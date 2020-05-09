require 'rails_helper'

RSpec.describe Order, type: :model do
  it "should include customer i.d." do
    order = Order.new(product_name:"Dresser", product_count:"1")
    order.save
    expect(Order.count).to eq(0)
  end

 it "should include a valid customer i.d." do
  order = Order.new(product_name:"Dresser", product_count:"1", customer_id: "55")
  order.save
  expect(Order.count).to eq(0)
end

it "should include product name" do
  order = Order.new(product_count:"1", customer_id:"1")
  order.save
  expect(Order.count).to eq(0)
end

it "should include product count" do
  order = Order.new(product_name:"Dresser", customer_id:"1")
  order.save
  expect(Order.count).to eq(0)
end



end
