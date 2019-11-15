class Project < ApplicationRecord
  validates :start_date,
    presence: true

  validates :end_date,
    presence: true

  # 担当部署
  enum working_group: {
    develop: 1,
    design: 2,
    marketing: 3,
    sales: 4
  }

end
