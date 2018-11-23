class AddPullRequestCounterCacheColumnToUsers < ActiveRecord::Migration[4.2]
  def change
    add_column :users, :contributions_count, :integer, default: 0

    User.reset_column_information
    User.all.each do |p|
      User.update_counters p.id, contributions_count: p.contributions.count
    end
  end
end
