require 'spec_helper'

describe Category do
  let(:category) { Category.sham! }

   it "should create a new instane given a valid attribute" do
     category.should be_valid
   end

end
