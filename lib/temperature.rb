class Temperature
  def initialize(source_scale, target_scale, value)
    @source_scale = source_scale
    @target_scale = target_scale
    @value = value
    @convert_f_to_c = ->(x) { 0.56 * (x - 32) }
    @convert_k_to_c = ->(x) { x - 273.15 }
  end

  def converter
    scale_map = {
      'C' => {
        'F' => ->(x) { (1.8 * x) + 32 },
        'K' => ->(x) { x + 273.15 }
      },
      'F' => {
        'C' => @convert_f_to_c,
        'K' => ->(x) { @convert_f_to_c.call(x) + 273.15 }
      },
      'K' => {
        'C' => @convert_k_to_c,
        'F' => ->(x) { (@convert_k_to_c.call(x) * 1.8) + 32 }
      }
    }
    scale_map[@source_scale][@target_scale].call(@value).round(3)
  end
end
