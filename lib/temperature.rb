class Temperature
  def initialize(source_scale, target_scale, value)
    @source_scale = source_scale
    @target_scale = target_scale
    @value = value
  end

  def converter
    scale_map = {
      'C' => {
        'F' => ->(x) { (1.8 * x) + 32 },
        'K' => ->(x) { x + 273.15 }
      },
      'F' => {
        'C' => ->(x) { 0.56 * (x - 32) },
        'K' => ->(x) { (0.56 * (x - 32)) + 273.15 }
      },
      'K' => {
        'C' => ->(x) { x - 273.15 },
        'F' => ->(x) { ((x - 273.15) * 1.8) + 32 }
      },
    }
    scale_map[@source_scale][@target_scale].call(@value).round(3)
  end
end