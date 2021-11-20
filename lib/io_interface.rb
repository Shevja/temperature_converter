require './lib/error_handler'

class IOInterface
  def initialize
    @error_handler = ErrorHanlder.new
  end

  def input_source_scale
    puts 'Input source scale: ("C", "F", "K")'
    source_scale = gets.chomp.upcase

    if @error_handler.check_correct_scale(source_scale)
      source_scale
    else
      input_source_scale
    end
  end

  def input_target_scale(source_scale)
    puts 'Input final scale:'
    target_scale = gets.chomp.upcase

    if  @error_handler.check_correct_scale(target_scale) &&
        @error_handler.check_repeating_scale(source_scale, target_scale)
      target_scale
    else
      input_target_scale(source_scale)
    end
  end

  def input_value
    puts 'Input value:'
    value = gets

    if @error_handler.check_value(value)
      value.to_f
    else
      input_value
    end
  end

  def output_result(result)
    puts "Result = #{result}"
  end

  def check_exit
    puts 'Continue? (Y/N)'
    state = gets.chomp.upcase

    case state
    when 'N'
      abort 'See u soon!'
    when 'Y'
      true
    else
      check_exit
    end
  end
end