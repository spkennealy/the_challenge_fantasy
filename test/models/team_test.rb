# == Schema Information
#
# Table name: teams
#
#  id         :bigint           not null, primary key
#  losses     :integer
#  team_name  :string           not null
#  wins       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class TeamTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
