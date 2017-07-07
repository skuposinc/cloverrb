require "spec_helper"

RSpec.describe Cloverrb::Employee do
  describe "GET all employees" do
    token = ENV['TEST_API_TOKEN']
    merchant_id = ENV['TEST_MERCHANT_ID']

    it "should get all the employees" do
      VCR.use_cassette("get_all_employees", record: :once) do
        employee_client = described_class.new(token, merchant_id)
        employees = employee_client.all
        employee = {
          "href"=>"https://www.clover.com/v3/merchants/CQWH7CZZVQ072/employees/1D5AGFDBF88G2",
          "id"=>"1D5AGFDBF88G2",
          "name"=>"Renee",
          "nickname"=>"Renee M.",
          "email"=>"renee@tanda.co",
          "inviteSent"=>false,
          "claimedTime"=>1498613338000,
          "pin"=>"9571",
          "role"=>"EMPLOYEE",
          "orders"=>{
            "href"=>"https://www.clover.com/v3/merchants/CQWH7CZZVQ072/employees/1D5AGFDBF88G2/orders"
          }
        }

        expect(employees["elements"]).to be_an_instance_of Array
        expect(employees["elements"]).to include(employee)
      end
    end
  end  
end