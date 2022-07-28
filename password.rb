# frozen_string_literal: true

require 'securerandom'
# A Password Generator with gradually adding options of different kinds (include alphabats, numeric, specialCharacters
# , length etc as desired by the user)
class PassGen
  def initialize(pass_type)
    @pass_options = pass_type[0].to_i
    @length = pass_type[1].to_i
  end

  #   def genrator
  #     case @pass_options
  #     when 4
  #       SecureRandom.send(:choose, [*'0'..'9', *'A'..'Z', *'a'..'z', *'!'..'?', *'µ'..'ö'], @length)
  #     when 3
  #       SecureRandom.send(:choose, [*'0'..'9', *'A'..'Z', *'a'..'z', *'!'..'?'].flatten, @length)
  #     when 2
  #       SecureRandom.send(:choose, [*'0'..'9', *'A'..'Z', *'a'..'z'].flatten, @length)
  #     when 1
  #       SecureRandom.send(:choose, [*'A'..'Z', *'a'..'z'].flatten, @length)
  #     when 0
  #       SecureRandom.send(:choose, [*'a'..'z'], @length)
  #     end
  #   end
  # end

  def genrator
    arr_all_ranges = [('a'..'z'), ('A'..'Z'), (0..9), ('!'..'?'), ('µ'..'ö')]
    pass = arr_all_ranges[0..@pass_options].map(&:to_a).flatten
    # We make a 1-dimensional array by combaining different arrays depending upon the options
    p pass.sample(@length).join # Sample return the given length of random number from the given array
  end
end

# Top Level Documentation
class ControlFlow
  def initialize; end

  def start_program
    system 'cls'
    p 'Welcome to Password Genrator V 1.0'
    system 'cls'
    p "Enter Y to Start Genrating Password. \n Enter Q to quit \n Enter S to start Again"
    option = gets
    option = option.downcase.strip
    case option
    when 'q'
      false
    when 'y'
      true
    when 's'
      's'
    else
      p 'Invalid Choice Selected Please Select Again'
      's'
    end
  end

  def pass_type
    p 'Please choose the reqruied options for your password'
    p 'press 0 Alphabat Lower Case'
    p 'press 1 Alphabat Lower Case + Upper Case'
    p 'press 2 AlphaNumeric'
    p 'press 3 AlphNumeric + Special Character'
    p 'press 4 AlphNumeric + Special Character +voodooh'
    p 'press q to quit'
    p 'press s to Start Again'

    pass_choice = []
    pass_choice[0] = gets
    pass_choice[0] = pass_choice[0].strip

    exit(0) if pass_choice[0].downcase == 'q'

    return 's' if pass_choice[0].downcase == 's'

    p 'Please Enter the Password Length'
    pass_choice[1] = gets
    pass_choice[1] = pass_choice[1].strip
    pass_choice
  end

  def check_choice_again; end
end

Kernel.loop do
  control = ControlFlow.new
  user_choice = control.start_program

  case user_choice
  when false
    exit(0)
  when 's'
    next
  when true
    pass_choice = control.pass_type
  end

  pass_obj = PassGen.new(pass_choice)
  pass_obj.genrator
end
