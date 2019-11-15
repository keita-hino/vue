class Project < ApplicationRecord
  validates :project_name,
    presence: true

  validates :sales_amount,
    presence: true

  # 担当部署
  enum working_group: {
    develop: 1,
    design: 2,
    marketing: 3,
    sales: 4
  }

end
