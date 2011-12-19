# encoding: UTF-8
Sham.config(Advertiser) do |c|
  c.attributes do
    { :ad => Sham::Base.new(Ad) }
  end
end
