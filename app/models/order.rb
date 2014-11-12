class Order < ActiveRecord::Base
belongs_to :line_items
has_many :line_items, dependent: :destroy
end
