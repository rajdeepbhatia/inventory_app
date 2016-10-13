class Item < ApplicationRecord
  validates :name, presence: true
  validates :user, presence: true
  validates :sku, presence: true, uniqueness: { case_sensitive: false }
  validates :serial, presence: true

  belongs_to :user
  belongs_to :person
  belongs_to :category
  belongs_to :brand
  has_many :attachments, dependent: :destroy
  has_many :allotment_histories, dependent: :destroy

  attr_accessor :updated_by

  before_save :add_allotment_histories, if: Proc.new { |item| item.person_id_changed? }

  class << self
    def load_table_data
      joins(:category, :brand, :user).joins('LEFT JOIN people ON items.person_id = people.id').select(
        'items.id, items.name, items.sku, items.person_id, items.user_id, items.serial, items.purchased_at,
        people.name AS person_name, users.name AS creator, categories.name AS category_name, brands.name AS brand_name'
      ).order('items.updated_at DESC')
    end

    def load_details(id)
      joins(:category, :brand, :user).joins('LEFT JOIN people ON items.person_id = people.id').where(id: id).select(
        'items.*, people.name AS person_name, users.name AS creator, categories.name AS category_name, brands.name AS brand_name'
      ).first
    end
  end

  def add_allotment_histories
    allotment_histories << allotment_histories.new(person_id: person_id_was, user_id: updated_by, is_allotted: false) if person_id_was
    allotment_histories << allotment_histories.new(person_id: person_id, user_id: updated_by, is_allotted: true) if person_id
  end
end
