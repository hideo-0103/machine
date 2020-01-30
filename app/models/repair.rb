class Repair < ApplicationRecord
  # belongs_to :user_repairs
  has_many :parts_repairs, dependent: :destroy
  has_many :use_parts
  has_many :users, through: :user_repairs
  has_many :parts, through: :parts_repairs
  belongs_to :machine, foreign_key: :machine_id, optional: true
  accepts_nested_attributes_for :parts, allow_destroy: true
  validates :title, length: { in: 1..30 }, presence: true
  validates :text, length: { in: 1..1000 }, presence: true
  # after_save do
  #   update_column(:part, quentity + replenishment)
  # end
end
