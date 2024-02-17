# frozen_string_literal: true

# Input related methods
module Input
  def get_valid_value(prompt:, valid_values:, invalid_msg:, up_case: false)
    puts prompt
    loop do
      value = up_case ? gets.chomp.upcase : gets.chomp
      return value if valid_values.include?(value)

      puts invalid_msg
    end
  end

  def get_valid_value_comb(prompt:, valid_values:, invalid_msg:, up_case: false)
    puts prompt
    loop do
      value = up_case ? gets.chomp.upcase : gets.chomp
      return value if value.split('').all? { |c| valid_values.include?(c) }

      puts invalid_msg
    end
  end
end
