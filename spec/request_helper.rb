module RequestHelpers
  def json_parser(obj)
    JSON.parse(obj).deep_transform_keys { |v| v.underscore.to_sym }
  end

  def camelize_of_json(obj)
    obj.deep_transform_keys { |v| v.to_s.camelize(:lower) }.to_json
  end
end
