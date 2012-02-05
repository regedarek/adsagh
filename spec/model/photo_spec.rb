# encoding: UTF-8
# require 'spec_helper'
# require 'carrierwave/test/matchers'

# describe FileUploader do
#   include CarrierWave::Test::Matchers
#
#   before do
#     @photo = Photo.sham!(:build)
#     FileUploader.enable_processing = true
#     @uploader = FileUploader.new(@photo, :file)
#     @uploader.store!(File.open("1.jpg"))
#   end
#
#   after do
#     FileUploader.enable_processing = false
#   end
#
#   it "should have right filename" do
#     @uploader.filename.should == "original_.png"
#   end
#
# end
