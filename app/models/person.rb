class Person < ApplicationRecord
  has_many :items

  validates :name, presence: true
  validates :mobile_no, presence: true, uniqueness: true, length: { is: 10 }

  class << self
    def load_table_data
      joins('LEFT JOIN items ON people.id = items.person_id').select(
        'people.id, people.name, people.mobile_no, count(items.person_id) AS allotted_items_count'
      ).group('people.id')
    end

    def load_details(id)
      joins('LEFT JOIN items ON people.id = items.person_id').where(id: id).select(
        'people.*, COUNT(items.person_id) AS allotted_items_count'
      ).group('people.id').first
    end
  end
end
