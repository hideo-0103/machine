class MachinesRepair < ApplicationRecord
  belongs_to :part
  belongs_to :machine
end
