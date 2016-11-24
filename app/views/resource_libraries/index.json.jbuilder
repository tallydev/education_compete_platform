json.current_page @resource_libraries.current_page
json.total_pages @resource_libraries.total_pages

json.resource_libraries_catalog @resource_libraries, partial: 'resource_libraries/resource_library', as: :resource_library
