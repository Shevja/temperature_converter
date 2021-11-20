require './lib/io_interface'
require './lib/temperature'

class Application
  def run
    io_inteface = IOInterface.new

    loop do
      source_scale = io_inteface.input_source_scale
      target_scale = io_inteface.input_target_scale(source_scale)
      value = io_inteface.input_value

      temperature = Temperature.new(source_scale, target_scale, value).converter
      io_inteface.output_result(temperature)
      io_inteface.check_exit
    end
  end
end