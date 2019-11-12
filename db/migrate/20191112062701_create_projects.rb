class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :project_name, limit: 255, null: false,    comment: "プロジェクト名"
      t.integer :sales_amount, limit: 4,                  comment: "売上金額"
      t.integer :working_group, limit: 1,                 comment: "担当部署"
      t.date :start_date, null: false,                    comment: "開始日"
      t.date :end_date,                                   comment: "終了日"

      t.timestamps
    end
  end
end
