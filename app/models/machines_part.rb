class MachinesPart < ApplicationRecord
  belongs_to :machine, optional: true
  belongs_to :part, optional: true
end
