# encoding: UTF-8
Sham.config(Ad) do |a|
  a.attributes do
    { 
      :title => "Tytuł#{rand(10)}",
      :email => "czesio#{rand(10000)}@#{Sham.string!}.student.agh.edu.pl",
      :name => "Czesio#{rand(10)}",
      :ad_content => "Ja czesio#{rand(10)} piszę sobie tutaj ogłoszenie.",
      :price => "#{rand(10)}.44" 
    }
  end
end
