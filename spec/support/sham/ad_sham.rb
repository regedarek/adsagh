# encoding: UTF-8
Sham.config(Ad) do |a|
  a.attributes do
    {
      :title => "Tytuł#{rand(100)}",
      :email => "czesio#{rand(10000)}@#{Sham.string!}.student.agh.edu.pl",
      :name => "Czesio#{rand(100)}",
      :ad_content => "Ja czesio#{rand(100)} piszę sobie tutaj ogłoszenie.",
      :category_id => 1,
      :price => "#{rand(10)}.44",
      :level => 1
    }
  end
end
