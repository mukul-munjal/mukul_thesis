view: indian_cities_database {
  sql_table_name: `breathe_india.Indian Cities Database`
    ;;

  dimension: city {
    type: string
    sql:TRIM(${TABLE}.City) ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension: iso2 {
    type: string
    sql: ${TABLE}.iso2 ;;
  }

  dimension: lat {
    type: number
    sql: ${TABLE}.Lat ;;
  }

  dimension: long {
    type: number
    sql: ${TABLE}.Long ;;
  }

  dimension: state {
    type: string
    sql:TRIM(${TABLE}.State);;
    # sql: CASE WHEN ${TABLE}.State LIKE("%Tamil%") THEN "Tamil Nadu" ELSE ${TABLE}.State END;;
    map_layer_name: india_map
  }

  measure: count {
    label: "has cities count"
    type: count
    drill_fields: [city]
  }
}
