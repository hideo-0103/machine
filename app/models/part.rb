class Part < ApplicationRecord
  has_many :parts_repairs,dependent: :destroy
  has_many :machines_parts
  has_many :repairs, through: :parts_repairs
  has_many :machines,through: :machines_parts,dependent: :destroy
  validates :name, length: { in: 1..30 }, presence: true
  
  after_save do
    update_columns(quentity: quentity + replenishment,replenishment: 0)
  end

  def self.search(search) #ここでのself.はUser.を意味する
    if search
      where(['name LIKE ?', "%#{search}%"]) #検索とnameの部分一致を表示。User.は省略
    else
      all #全て表示。User.は省略
    end
  end
  
end
