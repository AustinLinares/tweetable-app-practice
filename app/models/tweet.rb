class Tweet < ApplicationRecord
  belongs_to :user
  has_many :liked_tweets, dependent: :destroy
  belongs_to :parent, class_name: 'Tweet',
                      optional: true
  has_many :responses, class_name: 'Tweet', foreign_key: 'parent_id', dependent: :destroy
  validates :body, presence: true
end
