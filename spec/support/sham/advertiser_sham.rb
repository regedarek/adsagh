# encoding: UTF-8
Sham.config(Advertiser) do |c|
  c.attributes do
    { 
      :email => "czesio#{rand(10000)}@#{Sham.string!}.student.agh.edu.pl",
      :name => "Czesio#{rand(10)}"
    }
  end
end
