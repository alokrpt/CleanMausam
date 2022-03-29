query WSParams {
  sensor(where: {gateway_id: {_eq: ""}}) {
    parameter {
      icon_url
      key
      name
      short_name
      unit {
        short_name
        name
      }
    }
  }
}
