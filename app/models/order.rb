class Order < ApplicationRecord
  has_many :products
  has_one :customer

  after_create_commit { broadcast_prepend_to :orders }
  after_update_commit { broadcast_replace_to :orders }
  after_destroy_commit { broadcast_remove_to :orders }
end
