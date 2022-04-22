view: city_hour {
  sql_table_name: `breathe_india.city_hour`
    ;;

  dimension: aqi {
    type: number
    sql: ${TABLE}.AQI ;;
  }

  dimension: aqi_bucket {
    type: string
    sql: ${TABLE}.AQI_Bucket ;;
  }

  dimension: benzene {
    type: number
    sql: ${TABLE}.Benzene ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.City ;;
  }

  dimension: co {
    type: number
    sql: ${TABLE}.CO ;;
  }

  dimension_group: datetime {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.Datetime ;;
  }

  dimension: no_ {
    type: number
    sql: ${TABLE}.`NO` ;;
  }

  dimension: no2 {
    type: number
    sql: ${TABLE}.NO2 ;;
  }

  dimension: nox {
    type: number
    sql: ${TABLE}.NOx ;;
  }

  dimension: o3 {
    type: number
    sql: ${TABLE}.O3 ;;
  }

  dimension: pm2_5 {
    type: number
    sql: ${TABLE}.PM2_5 ;;
  }

  dimension: so2 {
    type: number
    sql: ${TABLE}.SO2 ;;
  }

  dimension: toluene {
    type: number
    sql: ${TABLE}.Toluene ;;
  }

  dimension: xylene {
    type: number
    sql: ${TABLE}.Xylene ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
