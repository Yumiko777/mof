class Property < ApplicationRecord
  has_many :nearest_station, dependent: :destroy
  #refect_all_blank関数でtrueが出たパラメータは送信データから除外ざせる
  accepts_nested_attributes_for :nearest_station, allow_destroy: true, reject_if: :all_blank

  validates :property_name, presence: true
  validates :rent, presence: true
  validates :address, presence: true
  validates :age, presence: true
  validates :remarks, presence: true
end
