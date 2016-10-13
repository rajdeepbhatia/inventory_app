class AllotmentHistory < ApplicationRecord
  belongs_to :item
  belongs_to :person
  belongs_to :user

  class << self
    def load_table_data(item_id)
      joins(:item, :person, :user).where(item_id: item_id).
        select('allotment_histories.*, items.name AS item_name, people.name as person_name, users.name AS user_name').
        order('allotment_histories.created_at DESC')
    end
  end
end
