class Photo < ActiveRecord::Base
  belongs_to :ad
  has_attached_file :photo,
    :styles => { :original => "640x480>", :thumb => "100x100"},
    :url => "/:attachment/:ad_id/:id_:style.png"

  validates_attachment_size :photo, :less_than => 4.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png', 'image/gif']

  Paperclip.interpolates :ad_id do |attachment, style|
    attachment.instance.ad.id
  end
end
