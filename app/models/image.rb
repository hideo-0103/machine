class Image < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :machine, foreign_key: :machine_id, optional: true
  validates :image, presence: true
end
