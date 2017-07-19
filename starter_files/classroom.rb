# Given a grade_hash, student name, and assignment number, return the score
# for that student and assignment. Note that Ruby counts arrays from 0, but
# we are referring to them as 1-10.
# PASSES

def assignment_score(grade_hash, student, assignment_num)
grade_hash[student][assignment_num -1]
end

# Given a grade_hash and assignment number, return all scores for that
# assignment. Note that Ruby counts arrays from 0, but we are referring to
# them as 1-10.
def assignment_scores(grade_hash, assignment_num)
  result = [];
  grade_hash.map do |key, value|
    # binding.pry
    result.push(value[assignment_num - 1])
  end
  return result
end

# Given a grade_hash and assignment number, return the average score for that
# assignment. Note that Ruby counts arrays from 0, but we are referring to
# them as 1-10.
def assignment_average_score(grade_hash, assignment_num)
  result = [];
  grade_hash.map do |key, value|
    result.push(*value[assignment_num - 1])
  end
    return result.reduce(:+)/result.length
end

# Return a hash of students and their average score.
# TIP: To convert an array like [[:indiana, 90], [:nevada, 80]] to a hash,
# use .to_h. Also look at Hash#transform_values.
def averages(grade_hash)
  grades = grade_hash.map do |avg, grades|
    [avg, (grades.sum)/grades.length]
  end
  grades.to_h
end

# Return a letter grade for a numerical score.
# 90+ => A
# 80-89 => B
# 70-79 => C
# 60-69 => D
# < 60 => F
def letter_grade(score)
  case
  when score >= 90
      return "A"
    when score >= 80
      return "B"
    when score >= 70
      return "C"
    when score >= 60
      return "D"
    else
      return "F"
  end
end

# Return a hash of students and their final letter grade, as determined
# by their average.
def final_letter_grades(grade_hash)
    return letter_grade(grade_hash.reduce(:+)/grade_hash.length)
end


# Return the average for the entire class.
# extra: * before value will push the numbers into the new array without adding the array
def class_average(grade_hash)
  stuff = []
   grade_hash.map do |key, value|
     stuff.push(*value)
   end
   return stuff.reduce(:+)/stuff.length

end
