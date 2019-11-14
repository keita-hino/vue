json.projects @projects do |project|
  json.id project.id
  json.project_name project.project_name
  json.sales_amount project.sales_amount
  json.working_group project.working_group_i18n
  json.start_date project.start_date&.strftime("%Y/%m/%d")
  json.end_date project.end_date&.strftime("%Y/%m/%d")
end
