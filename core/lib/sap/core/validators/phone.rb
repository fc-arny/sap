# -------------------------------------------------------------
# Validate phone number
# -------------------------------------------------------------
module Sap
  module Core
    module Validators
      class PhoneValidator < ActiveModel::EachValidator
        PHONE_LENGTH_MIN = 7
        PHONE_LENGHT_MAX = 14

        def validate_each(record, attribute, value)
          number_count = value.strip.gsub(/[^0-9]/,'').length

          unless number_count.between?(PHONE_LENGTH_MIN, PHONE_LENGHT_MAX)
            record.errors[attribute] << (options[:message] || I18n.t('Wrong phone length'))
          end

        end
      end
    end
  end
end