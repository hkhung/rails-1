class ChangeTypeVoteBooleanToString < ActiveRecord::Migration
  def change
  	change_column :votes, :vote, :string
  end
end
