class UserRepair < ApplicationRecord
  belongs_to :user
  belongs_to :repair
end
