json.array!(@steward_page_widgets) do |steward_page_widget|
  json.extract! steward_page_widget, :id, :widget_type, :label, :options, :steward_kpi_id, :param
  json.url steward_page_widget_url(steward_page_widget, format: :json)
end
