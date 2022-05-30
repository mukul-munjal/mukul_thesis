view: aqi_reference_table {
  derived_table: {
    sql: SELECT * FROM UNNEST([

      STRUCT('0-50' AS AQI, 'Good' AS Remark, 'Minimal impact' AS Possible_Health_Impacts),
            ('51-100', 'Satisfactory', 'Minor breathing discomfort to sensitive people'),
            ('101-200', 'Moderate', 'Breathing discomfort to the people with lungs, asthma and heart diseases'),
            ('201-300', 'Poor', 'Breathing discomfort to most people on prolonged exposure'),
            ('301-400', 'Very Poor', 'Respiratory illness on prolonged exposure'),
            ('401-500', 'Severe', 'Affects healthy people and seriously impacts those with existing diseases')
      ]);;}

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: aqi {
    type: string
    sql: TRIM(${TABLE}.AQI) ;;


  }

  dimension: remark {
    type: string
    sql: ${TABLE}.Remark ;;
  }

  dimension: possible_health_impacts {
    type: string
    sql: ${TABLE}.Possible_Health_Impacts ;;
  }

  set: detail {
    fields: [aqi, remark, possible_health_impacts]
  }
}

# <font color="green">{{ value }}</font>

  # {% if {{value}} = "0-50" %}
  #   <p style="color: red; font-size: 50%">{{ rendered_value }}</p>
  #   {% elsif {{value}} >1000 %}
  #   <p style="color: blue; font-size:80%">{{ rendered_value }}</p>
  #   {% else %}
  #   <p style="color: black; font-size:100%">{{ rendered_value }}</p>
  #   {% endif %};;
