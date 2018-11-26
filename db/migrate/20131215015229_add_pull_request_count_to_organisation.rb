class AddPullRequestCountToOrganisation < ActiveRecord::Migration[4.2]
  def change
    add_column :organisations, :contribution_count, :integer, default: 0
  end
end
