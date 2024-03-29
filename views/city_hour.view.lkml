view: city_hour {
  derived_table: {
    sql: SELECT * FROM `looker-dcl-data.breathe_india.city_hour` LIMIT 10
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: city {
    type: string
    sql: ${TABLE}.City ;;
  }

  dimension_group: datetime {
    type: time
    sql: ${TABLE}.Datetime ;;
  }

  dimension: pm2_5 {
    type: number
    sql: ${TABLE}.PM2_5 ;;
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

  set: detail {
    fields: [
      city,
      datetime_time,
      pm2_5,
      no2,
      nox,
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
