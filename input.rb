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

  def get_valid_value_comb(prompt:, valid_values:, length:, invalid_msg:, up_case: false)
    puts prompt
    loop do
      value = up_case ? gets.chomp.upcase : gets.chomp
      return value if value.split('').all? { |c| valid_values.include?(c) } && value.length == length

      puts "You input #{value.length} characters, but it should be #{length}." if value.length != length
      puts invalid_msg
    end
  end

  def get_yes(prompt:)
    get_valid_value(
      prompt: prompt,
      valid_values: %w[Y N],
      invalid_msg: "Sorry, that\'s not valid. Please try again.\n",
      up_case: true
    ) == 'Y'
  end

  def get_not_empty(prompt:, invalid_msg:)
    puts prompt
    loop do
      value = gets.chomp
      return value unless value.empty?

      puts invalid_msg
    end
  end
end
