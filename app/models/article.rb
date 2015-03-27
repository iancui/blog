class Article < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  default_scope -> {order('created_at DESC')}
  validates :text,presence:true
end
