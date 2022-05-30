connection: "looker-dcl-data"

# include all the views
include: "/views/**/*.view"

# datagroup: mukul_thesis_default_datagroup {
#   # sql_trigger: SELECT MAX(id) FROM etl_log;;
#   max_cache_age: "1 hour"
# }

# persist_with: mukul_thesis_default_datagroup

explore: indian_cities_database {
  join: city_day_new {
    sql_on: ${indian_cities_database.city} =  ${city_day_new.city}  ;;
    relationship: one_to_one
  }
}

# explore: indian_cities_database {
#   join: stations{
#     sql_on: ${indian_cities_database.state}=${stations.state} ;;
#     relationship: one_to_one
#   }
#   join: station_day {
#     sql_on: ${station_day.station_id} = ${stations.station_id} ;;
#     relationship: one_to_many
#   }
# }

explore: stations {}
explore: city_day {}
explore: city_hour {}
explore:city_hour_real_time_date{
  join: get_realtime_cities_by_hour {
    sql_on: ${city_hour_real_time_date.city}=${get_realtime_cities_by_hour.b};;
    relationship: one_to_one
  }
}
explore: aqi_reference_table {}
explore: get_realtime_cities_by_hour {}


map_layer: india_map {
  file: "/maps/india-states.json"

}
