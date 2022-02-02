class CreateLikedTweets < ActiveRecord::Migration[7.0]
  def change
    create_table :liked_tweets do |t|
      t.references :user, null: false, foreign_key: true
      t.references :tweet, null: false, foreign_key: true
      t.boolean :liked, default: false

      t.timestamps
    end
  end
end
