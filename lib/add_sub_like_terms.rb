=begin
first: simplify both sides of the equals sign
  split the equation by the equals sign and reduce?
second: Add or subtract anything that is outside parentheses (this will be hard?)
third: multiply/divide
fourth: Add/sub if necessary
fifth: Mult/Div if necessary
=end



def linear_equation_solver(equation)
end

=begin
EDGECASE! (simplify the expressions first (exponents, mult/division, radicals))
change everything to + so that the subtractions become adding a negative
split by + 
sort so that like terms are next to eachother
if the variables are the same, add the coefficients, delete the old terms, insert the new term
  
=end


=begin
change all add to sub
create a hash that maps each term to its coefficient
sort the hash by keys into an array
  
=end
def add_and_sub_like_terms(expression)
  sorted_terms = sort_by_variables(expression)
  combined_terms_hash = {}
  sorted_terms.each do |term|
    variable = get_the_variable(term)
    coefficient = get_the_coefficient(term)
    if !(combined_terms_hash.has_key?(variable))
      combined_terms_hash[variable] = coefficient
    else
      combined_terms_hash[variable] += coefficient
    end
  end
  combined_terms_arr = []
  combined_terms_hash.each do |variable, coefficient|
    combined_terms_arr.push("#{coefficient.to_s}#{variable.to_s}")
  end
  combined_terms_arr.join("+") 
end

def sort_by_variables(expression)
  all_add_expression = change_sub_to_add_negative(expression)
  term_array = all_add_expression.split("+")
  unsorted_terms_with_vars = []
  term_array.each do |term|
    term_with_var = []
    term_with_var[0] = term
    term_with_var[1] = get_the_variable(term)
    unsorted_terms_with_vars.push(term_with_var)
  end
  sorted_terms_with_vars = unsorted_terms_with_vars.sort_by { |a2| a2[1] }
  sorted_terms = []
  sorted_terms_with_vars.each do |term_and_var_array|
    if term_and_var_array != ["", ""]
      sorted_terms.push(term_and_var_array[0])
    end
  end
  sorted_terms
end

def get_the_variable(term)
  term.chars.each.with_index do |character, index|
    if is_letter(character)
      return term[index..-1]
    end
  end
  return ''
end

def is_constant(term)
  get_the_variable(term) == ''
end

def get_the_coefficient(term)
  if is_letter(term[0])
    return 1
  elsif is_constant(term)
    return term.to_i
  end
  term.chars.each.with_index do |character, index|
    if is_letter(character)
      return term[0...index].to_i
    end
  end
end

def is_letter(character)
  (character.ord <= 122) && (character.ord >= 97)
end

def change_sub_to_add_negative(expression)
  no_sub_expression = expression.chars.map.with_index do |character, index|
    if character == '-'
      character = '+'
    elsif (expression[index-1] == '-') && is_letter(character)
      character.prepend('-1')
    elsif (expression[index-1] == '-') && (expression[index-2] != '-')
      character = character.to_i * -1 
    else
      character = character
    end
  end
  no_sub_expression.join('').gsub('++', '+')
end

p all_add = change_sub_to_add_negative("3x+2y-6xyz+1y--8y+2x+-y")
# # p all_add.split("+")
# # p is_constant('8y^2')
# # p get_the_variable("563x^2yz")
# p get_the_coefficient("xy")
# p sort_by_variables("3x+2y-8xyz+1z-8y+26x-y")
p add_and_sub_like_terms("-3z-6x+7y+18xy")
# create_hash_coefficent_keys_and_variable_values("3x+2y-8xyz+1y-8y+2x-y")
# && expression[index-2] != '-'


# if it's a number 
#   character = character
# elsif it's a - change it to

# def distribute(expression)
#   starting_paren = expression.index('(')
#   ending_paren = expression.index(')')
#   p expression[(starting_paren + 1)..(ending_paren - 1)]




# distribute("3(3x+7y+10x+2)")