class Owner < ApplicationRecord
  has_many :projects, class_name: "Project", foreign_key: "owner_id"
end
