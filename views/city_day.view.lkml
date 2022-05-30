view: city_day {
  sql_table_name: `breathe_india.city_day`
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
    hidden: yes
    type: number
    sql: ${TABLE}.Benzene ;;
  }

  dimension: city {
    type: string
    sql:TRIM(${TABLE}.City) ;;
  }

  dimension: co_d {
    type: number
    sql: ${TABLE}.CO ;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      month_name,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Date ;;
  }

  # dimension: date_str {
  #   type: string
  #   sql: ${date_date} ;;
  # }

  dimension: covid_duration {
    type: date
    sql: ${date_year} >= 2019 ;;
  }

  dimension: no_d {
    type: number
    sql: ${TABLE}.`NO` ;;
  }

  dimension: no2_d {
    type: number
    sql: ${TABLE}.NO2 ;;
  }

  # dimension: nox_d {
  #   type: number
  #   sql: ${TABLE}.NOx ;;
  # }

  # dimension: pollutant_type {
  #   type: string
  #   sql:${TABLE}.pollutant_type ;;
  #   link: {
  #     label: "What is {{value}}"
  #     url: "
  #     {% if {{value}} == 'BTX'%} https://en.wikipedia.org/wiki/BTX_(chemistry)
  #     {% elsif {{value}} == 'NO'%} https://en.wikipedia.org/wiki/Nitrogen_dioxide
  #     {% elsif {{value}} == 'CO'%} https://en.wikipedia.org/wiki/Carbon_monoxide
  #     {% elsif {{value}} == 'O3'%} https://en.wikipedia.org/wiki/Ozone
  #     {% elsif {{value}} == 'SO'%} https://en.wikipedia.org/wiki/Sulfur_dioxide
  #     {% else %} https://www.flipkart.com
  #     {% endif %}
  #     "
  #     icon_url: ""
  #   }
  # }

    dimension: pollutant_type {
    type: string
    sql:${TABLE}.pollutant_type ;;
    link: {
      label: "  What is {{value}} 🤔"
      url: "http://wikipedia.com/wiki/{{ translating_pollutants_link._value }}"
      icon_url: "https://upload.wikimedia.org/wikipedia/en/8/80/Wikipedia-logo-v2.svg "
    }
  }

  dimension: translating_pollutants_link{
    sql:
    case
    when ${pollutant_type} = 'BTX' THEN "BTX_(chemistry)"
    when ${pollutant_type} = 'CO' THEN "Carbon_monoxide"
    when ${pollutant_type} = 'NO' THEN "Nitrogen_dioxide"
    when ${pollutant_type} = 'O3' THEN "Ozone"
    when ${pollutant_type} = 'SO2' THEN "Sulfur_dioxide"
    else "Particulate_pollution"
    end;;
  }

  dimension: o3_d {
    type: number
    sql: ${TABLE}.O3 ;;
  }

  dimension: Particulate_Matter_d {
    type: number
    sql: ${TABLE}.PM2_5 ;;
  }

  dimension: so2_d {
    type: number
    sql: ${TABLE}.SO2 ;;
  }

  dimension: toluene {
    hidden: yes
    type: number
    sql: ${TABLE}.Toluene ;;
  }

  dimension: xylene {
    hidden: yes
    type: number
    sql: ${TABLE}.Xylene ;;
  }

  dimension: BTX_d {
    type: number
    sql: (${benzene}+${toluene}+${xylene}) ;;
  }

  measure: aqi_m {
    type: sum
    label: "AQI"
    sql: ${aqi} ;;
  }


  measure: BTX{
    type: sum
    sql: ${BTX_d} ;;
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

  measure: avg_aqi_2019 {
    type: average
    sql: ${aqi} ;;
    filters: [date_month: "2019-04"]
    value_format: "0.##"
  }

  measure: general_avg_aqi {
    type: average
    sql: ${aqi} ;;
    value_format: "0.##"
  }

  measure: avg_aqi_2020 {
    type: average
    sql: ${aqi} ;;
    filters: [date_month: "2020-04"]
    value_format: "0.##"
  }

  # view: avg_aqi_2019 {
  #   derived_table: {
  #     sql: select avg(aqi) from breathe_india.city_day where CAST(Date AS string) like "%2020-04%"
  #       ;;
  #   }}

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


  measure: count {
    type: count
    drill_fields: []
  }
}
