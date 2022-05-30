view: station_day {
  derived_table: {
    sql: SELECT * FROM `looker-dcl-data.breathe_india.station_day`
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

  dimension: date {
    type: date
    datatype: date
    sql: ${TABLE}.Date ;;
  }

  dimension: pm2_5 {
    type: number
    sql: ${TABLE}.PM2_5 ;;
  }

  dimension: pm10 {
    type: number
    sql: ${TABLE}.PM10 ;;
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

  dimension: nh3 {
    type: number
    sql: ${TABLE}.NH3 ;;
  }

  dimension: co {
    type: number
    sql: ${TABLE}.CO ;;
  }

  dimension: so2 {
    type: number
    sql: ${TABLE}.SO2 ;;
  }

  dimension: o3 {
    type: number
    sql: ${TABLE}.O3 ;;
  }

  dimension: benzene {
    type: number
    sql: ${TABLE}.Benzene ;;
  }

  dimension: toluene {
    type: number
    sql: ${TABLE}.Toluene ;;
  }

  dimension: xylene {
    type: number
    sql: ${TABLE}.Xylene ;;
  }

  dimension: aqi {
    type: number
    sql: ${TABLE}.AQI ;;
  }

  dimension: aqi_bucket {
    type: string
    sql: ${TABLE}.AQI_Bucket ;;
  }

  dimension: BTX_d {
    type: number
    sql: (${benzene}+${toluene}+${xylene}) ;;
  }

  measure: BTX{
    type: sum
    sql: ${BTX_d} ;;
  }

  set: detail {
    fields: [
      station_id,
      date,
      pm2_5,
      pm10,
      no_,
      no2,
      nox,
      nh3,
      co,
      so2,
      o3,
      benzene,
      toluene,
      xylene,
      aqi,
      aqi_bucket
    ]
  }
}
