# -------------------------------------------------------------
# Valid phone
# -------------------------------------------------------------
class PhoneValidator < ActiveModel::Validator

  MIN_PHONE_LENGTH = 8
  MAX_PHONE_LENGTH = 13

  def validate_each(record, attribute, value)
    unless value =~ /\A\d\z/i
      record.errors[attribute] << (options[:message] || 'Phone must include only numbers')
    end

    unless value.size < MIN_PHONE_LENGTH
      record.errors[attribute] << (options[:message] || 'Phone number is too short')
    end

    unless value.size > MAX_PHONE_LENGTH
      record.errors[attribute] << (options[:message] || 'Phone number is too long')
    end

  end
end