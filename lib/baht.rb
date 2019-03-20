require "baht/version"

module Baht
  class Error < StandardError; end

  class << self
    # Ruby < 2.4 shims for Integer#digits
    def get_digits(number, base: 10)
      quotient, remainder = number.divmod(base)
      quotient == 0 ? [remainder] : [*get_digits(quotient, base: base), remainder]
    end

    def words(input)
      out = ""
      input = input.to_f.round(2)
      baht = input.truncate

      if input == 0
        return 'ศูนย์บาทถ้วน'
      end

      if input < 0
        out << "ลบ"
        baht = -baht
        input = -input
      end

      baht_million_groups = get_digits(baht, base:1000000)

      sub_hundred = %w{ ศูนย์ หนึ่ง สอง สาม สี่ ห้า หก เจ็ด แปด เก้า
        สิบ สิบเอ็ด สิบสอง สิบสาม สิบสี่ สิบห้า สิบหก สิบเจ็ด สิบแปด สิบเก้า
        ยี่สิบ ยี่สิบเอ็ด ยี่สิบสอง ยี่สิบสาม ยี่สิบสี่ ยี่สิบห้า ยี่สิบหก ยี่สิบเจ็ด ยี่สิบแปด ยี่สิบเก้า
        สามสิบ สามสิบเอ็ด สามสิบสอง สามสิบสาม สามสิบสี่ สามสิบห้า สามสิบหก สามสิบเจ็ด สามสิบแปด สามสิบเก้า
        สี่สิบ สี่สิบเอ็ด สี่สิบสอง สี่สิบสาม สี่สิบสี่ สี่สิบห้า สี่สิบหก สี่สิบเจ็ด สี่สิบแปด สี่สิบเก้า
        ห้าสิบ ห้าสิบเอ็ด ห้าสิบสอง ห้าสิบสาม ห้าสิบสี่ ห้าสิบห้า ห้าสิบหก ห้าสิบเจ็ด ห้าสิบแปด ห้าสิบเก้า
        หกสิบ หกสิบเอ็ด หกสิบสอง หกสิบสาม หกสิบสี่ หกสิบห้า หกสิบหก หกสิบเจ็ด หกสิบแปด หกสิบเก้า
        เจ็ดสิบ เจ็ดสิบเอ็ด เจ็ดสิบสอง เจ็ดสิบสาม เจ็ดสิบสี่ เจ็ดสิบห้า เจ็ดสิบหก เจ็ดสิบเจ็ด เจ็ดสิบแปด เจ็ดสิบเก้า
        แปดสิบ แปดสิบเอ็ด แปดสิบสอง แปดสิบสาม แปดสิบสี่ แปดสิบห้า แปดสิบหก แปดสิบเจ็ด แปดสิบแปด แปดสิบเก้า
        เก้าสิบ เก้าสิบเอ็ด เก้าสิบสอง เก้าสิบสาม เก้าสิบสี่ เก้าสิบห้า เก้าสิบหก เก้าสิบเจ็ด เก้าสิบแปด เก้าสิบเก้า
      }
      sub_ten = sub_hundred.first 10

      if (input < 100)
        out << sub_hundred[input]
      else
        sub_hundred[0] = ""

        digits = %w{ แสน หมื่น พัน ร้อย สิบ }
        blocks = []

        baht_million_groups.each_with_index do |number, group_index|
          digit_words = ""
          hundreds = number / 100
          hundreds_digits = get_digits(hundreds)
          len = hundreds_digits.length

          hundreds_digits.each_with_index do |num, index|
            if num > 0
              digit_words << sub_ten[num]
              digit_words << digits[(4 - len + index)]
            end
          end

          unless group_index == 0 && baht_million_groups.length > 1 && hundreds == 0
            sub_hundred[1] = "เอ็ด"
          end

          digit_words << sub_hundred[number % 100]

          blocks << digit_words
        end

        out << blocks.join('ล้าน')
      end

      out << "บาท"
      satangs = ('%.2f' % input)[-2..-1].to_i
      if satangs == 0
        out << "ถ้วน"
      else
        sub_hundred[1] = "หนึ่ง"
        out << sub_hundred[satangs]
        out << "สตางค์"
      end

      out.sub(/ศูนย์บาท/, "")
    end
  end
end
