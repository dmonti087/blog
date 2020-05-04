require 'rails_helper'
RSpec.describe "CustomersControllers", type: :request do
  describe "get customers_path" do
    it "renders the index view" do
      FactoryBot.create_list(:customer, 10)
      get customers_path
      expect(response.status).to eq(200)
    end
  end
  describe "get customer_path" do
    it "renders the :show template" do
      customer = FactoryBot.create(:customer)
      get customer_path(id: customer.id)
      expect(response.status).to eq(200)
    end
    it "redirects to the index path if the customer id is invalid" do
      get customer_path(id: 5000) #an ID that doesn't exist
      expect(response).to redirect_to customers_path
    end
  end


  describe "get new_customer_path" do
    it "renders the :new template" do
     get new_customer_path
     expect(response.status).to eq(200)
   end
  end


  describe "get edit_customer_path" do
    it "renders the :edit template" do
    customer = FactoryBot.create(:customer)
    get edit_customer_path(id: customer.id)
    expect(response.status).to eq(200)
  end
end


  describe "post customers_path with valid data" do
    it "saves a new entry and redirects to the show path for the entry" do
      customer_attributes = FactoryBot.attributes_for(:customer)
      expect do
         post customers_path, {customer: customer_attributes}
      end.to change(Customer, :count).by 1
      expect(response.status).to eq(302)
      expect(response).to redirect_to customer_path(id: Customer.last)
    end
  end


  describe "post customers_path with invalid data" do
    it "does not save a new entry or redirect" do
      customer_attributes = FactoryBot.attributes_for(:customer)
      customer_attributes.delete(:first_name)
      expect { post customers_path, {customer: customer_attributes}
    }.to_not change(Customer, :count)
      expect(response.status).to eq(200)
    end
  end


  describe "put customer_path with valid data" do
     it "updates an entry and redirects to the show path for the customer" do
     customer = FactoryBot.create(:customer, first_name: "Bob")
     expect(customer.first_name).to eq("Bob")
     patch customer_path(customer), {customer: {first_name: "Billy"}}
     customer.reload
     expect(customer.first_name).to eq("Billy")
    end
   end

   describe "put customer_path with invalid data" do
     it "does not update the customer record or redirect" do
     customer = FactoryBot.create(:customer, phone: "1234567890")
     expect(customer.phone).to eq("1234567890")
     put customer_path(customer), {customer: {first_name: "123"}}
     customer.reload
     expect(customer.phone).to eq("1234567890")
   end
 end

   describe "delete a customer record" do
     it "deletes a customer record" do
     customer = FactoryBot.create(:customer)
     expect { delete customer_path(customer) }.to change(Customer, :count)
     expect(response.status).to eq(302)
   end
 end
 end
