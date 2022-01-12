class Customer < ApplicationRecord
  has_many :orders

  after_create_commit { broadcast_prepend_to :customers }
  after_update_commit { broadcast_replace_to :customers }
  after_destroy_commit { broadcast_remove_to :customers }
end
