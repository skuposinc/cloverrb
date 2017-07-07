require "spec_helper"

RSpec.describe Cloverrb::Employee do
  let(:token) { ENV['TEST_API_TOKEN'] }
  let(:merchant_id) { ENV['TEST_MERCHANT_ID'] }

  describe "GET all employees" do
    token = ENV['TEST_API_TOKEN']
    merchant_id = ENV['TEST_MERCHANT_ID']

    before do
        @employee_client = described_class.new(token, merchant_id)
    end

    it "should get all the employees" do
      VCR.use_cassette("get_all_employees", record: :once) do
        employees = @employee_client.all
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

    it "should properly filter the list of employees" do
      VCR.use_cassette("filter_all_employers", record: :once) do
        employees = @employee_client.all('EMPLOYEE')

        expect(employees["elements"].count).to eq 4
      end
    end
  end  
end