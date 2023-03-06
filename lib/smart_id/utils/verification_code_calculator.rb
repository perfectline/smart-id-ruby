# frozen_string_literal: true

module SmartId
  module Utils
    class VerificationCodeCalculator

      ##
      # The Verification Code (VC) is computed as:
      #
      # integer(SHA256(hash)[−2:−1]) mod 10000
      #
      # where we take SHA256 result, extract 2 rightmost bytes from it,
      # interpret them as a big-endian unsigned short and take the last 4 digits in decimal for display.
      #
      # SHA256 is always used here, no matter what was the algorithm used to calculate hash.

      def self.calculate(digest)
        rightmost_bytes = digest[-2..]
        int = rightmost_bytes.unpack1('n*')
        paddable_string = (int % 10_000).to_s.chars.last(4).join
        pad = 4 - paddable_string.length

        ('0' * pad) + paddable_string
      end

    end
  end
end
