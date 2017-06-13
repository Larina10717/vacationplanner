Fabricator(:vacation) do
  employee_id { Fabricate(:employee).id }
  start_date Date.new(2017,6,13)
  end_date Date.new(2017,6,20)
end
