require 'date'
require 'time'
require 'bigdecimal'

module Hippo
  class Field
    attr_accessor :name, :sequence, :datatype, :options,
                  :restrictions, :minimum, :maximum, :required,
                  :separator, :composite, :composite_sequence

    def minimum
      @minimum ||= 0
    end

    def formatted_value(value)
      return nil if value.nil?

      case datatype
      when :binary  then value
      when :integer then value.to_i
      when :decimal then parse_decimal(value)
      when :date    then parse_date(value)
      when :time    then parse_time(value)
      else parse_string(value)
      end
    end

    def string_value(value)
      return '' if value.nil? && !required

      case datatype
      when :binary  then value
      when :integer then value.to_s.rjust(minimum, '0')
      when :decimal then generate_decimal(value)
      when :date    then generate_date(value)
      when :time    then generate_time(value)
      else generate_string(value)
      end
    end

    def generate_string(value)
      if required
        value.to_s.ljust(minimum)
      else
        value.to_s
      end
    end

    def parse_string(value)
      if value.to_s.empty? && !required
        nil
      else
        value.to_s.strip
      end
    end

    def generate_decimal(value)
      value ||= BigDecimal.new('0')

      value.to_s('F').sub(/\.0\z/,'').rjust(minimum, '0')
    end

    def parse_decimal(value)
      if value == ''
        invalid! if required
        return nil
      end

      BigDecimal.new(value.to_s)
    end

    def generate_time(value)
      value ||= Time.now

      if maximum == 4 || value.sec == 0
        value.strftime('%H%M')
      else
        value.strftime('%H%M%S')
      end
    end

    def parse_time(value)
      if value == ''
        invalid! if required
        return nil
      end

      case value.class.to_s
      when 'Time' then value
      when 'String'
        format =  case value
                  when /\A\d{4}\z/ then '%H%M'
                  when /\A\d{6}\z/ then '%H%M%S'
                  when /\A\d{7,8}\z/ then '%H%M%S%N'
                  else invalid!
                  end

        Time.strptime(value, format)
      else invalid!
      end
    rescue
      invalid!
    end

    def generate_date(value)
      value ||= Date.today

      if value.class.to_s == 'Range'
        "#{value.first.strftime('%Y%m%d')}-#{value.last.strftime('%Y%m%d')}"
      elsif maximum == 6
        value.strftime('%y%m%d')
      else
        value.strftime('%Y%m%d')
      end
    end

    def parse_date(value)
      if value == ''
        invalid! if required
        return nil
      end

      case value.class.to_s
      when "Range"  then value
      when "Date"   then value
      when "Time"   then value.to_date
      when "String"
        format =  case value
                  when /\A\d{6}\z/ then '%y%m%d'
                  when /\A\d{8}\z/ then '%Y%m%d'
                  when /\A(\d{8})-(\d{8})\z/ then
                    return Date.parse($1, '%Y%m%d')..Date.parse($2, '%Y%m%d')
                  else
                    invalid!
                  end

        Date.parse(value, format)
      else
        invalid! "Invalid datatype(#{value.class}) for date field."
      end
    rescue
      invalid!
    end

    def invalid!(message = "Invalid value specified for #{self.datatype} field.")
      raise Hippo::Exceptions::InvalidValue.new message
    end
  end
end
