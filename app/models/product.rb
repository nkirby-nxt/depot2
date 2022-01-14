class Product < ApplicationRecord
  attr_accessor :hash_tags
  has_rich_text :description
  after_initialize :index_search_terms

  #after_create_commit { broadcast_prepend_to :products }
  after_update_commit { broadcast_replace_to :products }
  after_destroy_commit { broadcast_remove_to :products }

  private

  def index_search_terms
    @hash_tags = []
    self.description.to_plain_text.split(" ").each { |word| @hash_tags.append(word) if word.size > 4 } if self.description
  end
 end
