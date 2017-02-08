class Person < ActiveRecord::Base
  validates :name, presence: true
  validates :house_id, presence: true

  belongs_to(
    :name,
    class_name: 'House',
    primary_key: :id,
    foreign_key: :house_id
  )
end
