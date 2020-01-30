class Machine < ApplicationRecord

  has_many :machines_parts, dependent: :destroy
  has_many :parts, through: :machines_parts
  has_many :repairs, dependent: :destroy
  has_many :images, dependent: :destroy,index_errors: true
  accepts_nested_attributes_for :images, allow_destroy: true

  def self.search(search) #ここでのself.はUser.を意味する
    if search
      where(['name LIKE ?', "%#{search}%"]) #検索とnameの部分一致を表示。User.は省略
    else
      all #全て表示。User.は省略
    end
  end
end
