module Tippy
	class Builder
		def initialize total:, gratuity:
			@total = total
			@gratuity = gratuity
		end
		def generate
			return calculation if number_based?
			word_based
		end

		def number_based?
			(@gratuity.is_a? Numeric) || (@gratuity.integer?)
		end

		def word_based
			case @gratuity.downcase
			when 'high'		then calculation 25
			when 'low'		then calculation 15
			when 'standard'	then calculation 18
			end
		end

		def calculation gratuity = @gratuity
			@total += @total * (gratuity.to_f / 100)
		end
	end
end


