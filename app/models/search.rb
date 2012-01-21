class Search < ActiveRecord::Base
  def ads
    @ads ||= find_ads
  end

  def find_ads
    ads = Ad.order(:title)
    ads = ads.where("title like ?", "%#{keywords}%") if keywords.present?
    ads = ads.where(category_id: category_id) if category_id.present?
    ads = ads.where("price >= ?", min_price) if min_price.present?
    ads = ads.where("price <= ?", max_price) if max_price.present?
    ads
  end
end
