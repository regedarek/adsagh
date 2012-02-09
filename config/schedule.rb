set :output, "#{path}/log/cron.log"

every 1.day, :at => '4:30 am' do
  runner "Ad.remove_old_photos"
end
