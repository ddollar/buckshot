require "spec_helper"
require "buckshot"

describe Buckshot do

  describe "VERSION" do
    subject { Buckshot::VERSION }
    it { should be_a String }
  end

  describe "environment detection" do
    it "defaults to development environment" do
      Buckshot.environment.should == "development"
    end

    it "reads environment from RACK_ENV" do
      ENV["RACK_ENV"] = "staging"
      Buckshot.environment.should == "staging"
      ENV.delete("RACK_ENV")
    end
  end

  describe "port detection" do
    it "defaults to 3000" do
      Buckshot.port.should == 3000
    end

    it "reads environment from RACK_ENV" do
      ENV["PORT"] = "4000"
      Buckshot.port.should == 4000
      ENV.delete("PORT")
    end
  end

  describe "development mode" do
    before(:each) { ENV["RACK_ENV"] = "development" }
    after(:each)  { ENV.delete("RACK_ENV") }

    it "uses shotgun" do
      Buckshot.should_receive(:start_shotgun)
      Buckshot.start
    end
  end

  describe "production mode" do
    before(:each) { ENV["RACK_ENV"] = "production" }
    after(:each)  { ENV.delete("RACK_ENV") }

    it "uses thin" do
      Buckshot.should_receive(:start_thin)
      Buckshot.start
    end
  end

  describe "start_shotgun" do
    it "executes shotgun correctly" do
      Buckshot.should_receive(:environment).and_return("development")
      Buckshot.should_receive(:port).and_return("5000")
      Buckshot.should_receive(:exec).with("shotgun -s thin -p 5000 -E development")
      Buckshot.start_shotgun
    end
  end

  describe "start_thin" do
    it "executes thin correctly" do
      Buckshot.should_receive(:environment).and_return("production")
      Buckshot.should_receive(:port).and_return("5000")
      Buckshot.should_receive(:exec).with("thin start -p 5000 -e production")
      Buckshot.start_thin
    end
  end

end
