json.array!(@steward_kpis) do |steward_kpi|
  json.extract! steward_kpi, :id, :code, :resource, :code_type, :query_plan, :position, :ancestry
  json.url steward_kpi_url(steward_kpi, format: :json)
end
