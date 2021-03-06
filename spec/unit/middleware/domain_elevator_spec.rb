require 'spec_helper'
require 'apartment/elevators/domain'

describe Apartment::Elevators::Domain do

  describe "#parse_database_name" do
    it "parses the host for a domain name" do
      request = ActionDispatch::Request.new('HTTP_HOST' => 'example.com')
      elevator = Apartment::Elevators::Domain.new(nil)
      elevator.parse_database_name(request).should == 'example'
    end

    it "ignores a www prefix and domain suffix" do
      request = ActionDispatch::Request.new('HTTP_HOST' => 'www.example.bc.ca')
      elevator = Apartment::Elevators::Domain.new(nil)
      elevator.parse_database_name(request).should == 'example'
    end

    it "returns nil if there is no host" do
      request = ActionDispatch::Request.new('HTTP_HOST' => '')
      elevator = Apartment::Elevators::Domain.new(nil)
      elevator.parse_database_name(request).should be_nil
    end
  end
end
