view: get_realtime_cities_by_hour {
  derived_table: {
    sql: WITH city_hour_real_time_date AS (SELECT * FROM `looker-dcl-data.breathe_india.city_hour_2022`
      )
SELECT
    city_hour_real_time_date.AQI  AS city_hour_real_time_date_aqi,
        (DATE(city_hour_real_time_date.Datetime )) AS city_hour_real_time_date_datetime_date,
        (EXTRACT(HOUR FROM city_hour_real_time_date.Datetime )) AS city_hour_real_time_date_datetime_hour_of_day,
        (FORMAT_TIMESTAMP('%H:%M', city_hour_real_time_date.Datetime )) AS city_hour_real_time_date_datetime_time_of_day,
        (FORMAT_TIMESTAMP('%F %T', city_hour_real_time_date.Datetime )) AS city_hour_real_time_date_datetime_time,
    city_hour_real_time_date.City  AS B
FROM city_hour_real_time_date
WHERE ((((EXTRACT(HOUR FROM CURRENT_TIMESTAMP()) =  (EXTRACT(HOUR FROM city_hour_real_time_date.Datetime ))) AND (EXTRACT(DAY FROM CURRENT_TIMESTAMP()) =  (EXTRACT(DAY FROM city_hour_real_time_date.Datetime )))) AND (EXTRACT(MONTH FROM CURRENT_TIMESTAMP()) =  (EXTRACT(MONTH FROM city_hour_real_time_date.Datetime )))) AND (NOT ( city_hour_real_time_date.AQI IS NULL)))
GROUP BY
    1,
    2,
    3,
    4,
    5,
    6
ORDER BY
    2 DESC,
    6
LIMIT 5000
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: city_hour_real_time_date_aqi {
    type: string
    sql: ${TABLE}.city_hour_real_time_date_aqi ;;
  }

  dimension: city_hour_real_time_date_datetime_date {
    type: date
    datatype: date
    sql: ${TABLE}.city_hour_real_time_date_datetime_date ;;
  }

  dimension: city_hour_real_time_date_datetime_hour_of_day {
    type: number
    sql: ${TABLE}.city_hour_real_time_date_datetime_hour_of_day ;;
  }

  dimension: city_hour_real_time_date_datetime_time_of_day {
    type: string
    sql: ${TABLE}.city_hour_real_time_date_datetime_time_of_day ;;
  }

  dimension: city_hour_real_time_date_datetime_time {
    type: string
    sql: ${TABLE}.city_hour_real_time_date_datetime_time ;;
  }

  dimension: b {
    type: string
    suggest_persist_for: "1 second"
    sql: ${TABLE}.B ;;
  }

  set: detail {
    fields: [
      city_hour_real_time_date_aqi,
      city_hour_real_time_date_datetime_date,
      city_hour_real_time_date_datetime_hour_of_day,
      city_hour_real_time_date_datetime_time_of_day,
      city_hour_real_time_date_datetime_time,
      b
    ]
  }
}
