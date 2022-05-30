view: city_day_new {
  derived_table: {
    sql: SELECT * FROM `looker-dcl-data.breathe_india.city_day_new`
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: city {
    type: string
    sql:TRIM(${TABLE}.City) ;;
  }

  dimension: date {
    type: date
    datatype: date
    sql: ${TABLE}.Date ;;
  }

  dimension: Particulate_Matter_d {
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

  dimension: no2_d {
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

  dimension: co_d {
    type: number
    sql: ${TABLE}.CO ;;
  }

  dimension: so2 {
    type: number
    sql: ${TABLE}.SO2 ;;
  }

  dimension: o3_d {
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

  measure: benzene_m{
    type: sum
    sql: ${benzene} ;;
  }
  measure: xylene_m{
    type: sum
    sql: ${xylene} ;;
  }
  measure: toluene_m{
    type: sum
    sql: ${toluene} ;;
  }



  measure: benzene_a{
    label: "Benzene"
    type: average
    sql: ${benzene} ;;
  }
  measure: xylene_a{
    label: "Xylene"
    type: average
    sql: ${xylene} ;;
  }
  measure: toluene_a{
    label: "Toluene"
    type: average
    sql: ${toluene} ;;
  }


  measure: Particulate_Matter {
    label: "Particulate Matter 2.5"
    type: sum
    sql: ${Particulate_Matter_d} ;;
  }

  measure: NO2 {
    type: sum
    sql: ${no2_d} ;;
  }

  measure: CO {
    type: sum
    sql: ${co_d} ;;
  }

  measure: SO2 {
    type: sum
    sql: ${TABLE}.so2 ;;
  }

  measure: O3 {
    type: sum
    sql: ${o3_d} ;;
  }

  measure: BTX_A{
    label: "BTX"
    type: average
    sql: ${BTX_d} ;;
  }

  measure: Particulate_Matter_a {
    label: "Particulate Matter 2.5"
    type: average
    sql: ${Particulate_Matter_d} ;;
  }

  measure: NO2_a {
    label: "NO2"
    type: average
    sql: ${no2_d} ;;
  }

  measure: general_avg_aqi {
    type: average
    sql: ${aqi} ;;
    value_format: "0.##"
  }

  measure: CO_a{
    label: "CO"
    type: average
    sql: ${co_d} ;;
  }

  measure: SO2_a {
    label: "SO2"
    type: average
    sql: ${TABLE}.so2 ;;
  }

  measure: O3_a {
    label: "O3"
    type: average
    sql: ${o3_d} ;;
  }


  set: detail {
    fields: [
      city,
      date,
      Particulate_Matter_d,
      pm10,
      no_,
      no2_d,
      nox,
      nh3,
      co_d,
      so2,
      o3_d,
      benzene,
      toluene,
      xylene,
      aqi,
      aqi_bucket
    ]
  }
}
