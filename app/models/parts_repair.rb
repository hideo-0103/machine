class PartsRepair < ApplicationRecord
  belongs_to :part,optional: true
  belongs_to :repair, optional: true
end
