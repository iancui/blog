class Article < ActiveRecord::Base
  belongs_to :users
  has_many :comments
  default_scope -> {order('created_at DESC')}
  validates :text,presence:true
end
