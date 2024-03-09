module LuhnValidator
  # Validates credit card number using Luhn Algorithm
  # arguments: none
  # assumes: a local String called 'number' exists
  # returns: true/false whether last digit is correct
  def validate_checksum()
    # number = "17893729974"
    payload = @number.chars[0..-2].reverse.map.with_index { |c, i| i.even? ? (c.to_i * 2).to_s : c }
    sum = payload.join.chars.reduce(0) { |s, c| s + c.to_i}
    check_digit = (10 - (sum % 10)) % 10
    check_digit == number[-1].to_i
  end

end
# class CreditCard
#   include LuhnValidator
# end
# card = CreditCard.new
# puts card.validate_checksum()
