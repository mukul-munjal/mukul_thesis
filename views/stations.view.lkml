view: stations {
  derived_table: {
    sql: SELECT * FROM `looker-dcl-data.breathe_india.stations`
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: station_id {
    type: string
    sql: ${TABLE}.StationId ;;
  }

  dimension: station_name {
    type: string
    sql: ${TABLE}.StationName ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.City ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.State ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.Status ;;
  }

  set: detail {
    fields: [station_id, station_name, city, state, status]
  }
}
