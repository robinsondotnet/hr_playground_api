class Project < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  belongs_to :owner, class_name: "Owner"
end
