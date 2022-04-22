connection: "looker-dcl-data"

# include all the views
include: "/views/**/*.view"

datagroup: mukul_thesis_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: mukul_thesis_default_datagroup

explore: city_day {}

explore: indian_cities_database {}

explore: city_hour {}
