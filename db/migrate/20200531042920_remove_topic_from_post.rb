class RemoveTopicFromPost < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :topic
  end
end
