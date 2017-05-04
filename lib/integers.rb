require 'prime'
4800.prime_division 


def factors_of(number)
  primes, powers = number.prime_division.transpose
  exponents = powers.map{|i| (0..i).to_a}
  divisors = exponents.shift.product(*exponents).map do |powers|
    primes.zip(powers).map{|prime, power| prime ** power}.inject(:*)
  end
  divisors.sort.map{|div| [div, number / div]}
end

# p factors_of(24)
# options for args
# args = {
#   bounds: (lower_bound..upper_bound)
#   div: true or false
#   fraction: true or false (do you want your answer to be a fraction)
#   whole_num: true or false (do you want the answer to be a whole number)
# }

def get_two_rand_ints(div=false, fraction=false, whole_num=false)
  bounds = (-20..20)
  p num_1 = (bounds.to_a - [-1, 0, 1]).sample
  p num_2 = (bounds.to_a - [0, 1]).sample
  if div
    if whole_num
      num_2 = num_1 * [-4, -3, -2, -1, 1, 2, 3, 4].sample
    elsif fraction
      if (num_1 == num_2)
        num_2 = num_1 * [-3, -2, -1, 1, 2, 3].sample
      elsif num_1.abs.prime?
        num_2 *= (num_1)*[-1, 1].sample
      else
        factors = factors_of(num_1.abs).flatten.uniq

        num_2 *= (factors -[1, num_1]).sample
      end
    end
  end
  p [num_1, num_2]
  p num_1/num_2.to_f
end
get_two_rand_ints(true, true, false)
