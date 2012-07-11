class PhoneNumberValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A(([0-9]{3})|((\()([0-9]{3})(\))))?([\s\.-])?([0-9]{3})([\s\.-])?([0-9]{4})([\s\.-])?([x] ?[0-9]{1,7})?\z/
      record.errors[attribute] << (options[:message] || "is not a phone number")
    end
  end
end