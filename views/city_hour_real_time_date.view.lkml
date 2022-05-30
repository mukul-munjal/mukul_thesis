view: city_hour_real_time_date {
  derived_table: {
    sql: SELECT * FROM `looker-dcl-data.breathe_india.city_hour_2022`
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: xylene {
    type: number
    sql: ${TABLE}.Xylene ;;
  }

  dimension: toluene {
    type: number
    sql: ${TABLE}.Toluene ;;
  }

  dimension: co {
    type: number
    sql: ${TABLE}.CO ;;
  }

  dimension: o3 {
    type: number
    sql: ${TABLE}.O3 ;;
  }

  dimension: so2 {
    type: number
    sql: ${TABLE}.SO2 ;;
  }

  dimension: benzene {
    type: number
    sql: ${TABLE}.Benzene ;;
  }

  dimension: nox {
    type: number
    sql: ${TABLE}.NOx ;;
  }

  dimension: no2 {
    type: number
    sql: ${TABLE}.NO2 ;;
  }

  # dimension: aqi {
  #   type: string
  #   sql: ${TABLE}.AQI ;;
  # }
  dimension: aqi {
    type: number
    sql: ${TABLE}.AQI ;;
  }

  dimension: no_ {
    type: number
    sql: ${TABLE}.`NO` ;;
  }

  dimension: aqi_bucket {
    type: string
    sql: ${TABLE}.AQI_Bucket ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.City ;;

  }

  dimension: realtime_city {
    type: string
    # sql: ${get_realtime_cities_by_hour.b} ;;
    sql: {% parameter getting_city_name_realtime %};;
  }


  dimension: pm10 {
    type: number
    sql: ${TABLE}.PM10 ;;
  }

  dimension: pm2_5 {
    type: number
    sql: ${TABLE}.PM2_5 ;;
  }

  dimension_group: datetime {
    type: time
    sql: ${TABLE}.Datetime ;;
  }

  dimension: nh3 {
    type: number
    sql: ${TABLE}.NH3 ;;
  }

  parameter: getting_city_name_realtime {
    type: string
    #sql: ${TABLE}.getting_city_name_realtime ;;
    # suggest_explore: get_cities_name_real_time
    # suggest_dimension: get_cities_name_real_time.city_hour_real_time_date_city
    suggest_explore: get_realtime_cities_by_hour
    suggest_dimension: get_realtime_cities_by_hour.b
    suggest_persist_for: "1 second"
  }

  set: detail {
    fields: [
      xylene,
      toluene,
      co,
      o3,
      so2,
      benzene,
      nox,
      no2,
      aqi,
      aqi_bucket,
      city,
      pm10,
      pm2_5,
      datetime_time,
      nh3
    ]
  }
}
