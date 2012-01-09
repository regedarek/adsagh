# encoding: UTF-8
require 'spec_helper'

describe Category do

  let(:category) { Category.sham!(:build) }

  specify { category.should be_valid }

  it "not require ancestry" do
    subject.valid?
    subject.errors[:ancestry].should be_empty
  end

  it "require name" do
    # subject.send("name=", nil)
    # should_not be_valid
    subject.valid?
    subject.errors[:name].should include("nie może być puste")
  end

  it "reject wrong numbers" do
    %w[name 1\2 1.2].each do |n|
      a = Category.sham!(:ancestry => n)
      a.should_not be_valid
      a.errors[:ancestry].should include("jest nieprawidłowe") 
    end
  end

end
