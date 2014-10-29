# The questions
q1 = true && true
q2 = false && true
q3 = 1 == 1 && 2 == 1
q4 = "test" == "test"
q5 = 1 == 1 || 2 != 1
q6 = true && 1 == 1
q7 = false && 0 != 0
q8 = true || 1 == 1
q9 = "test" == "testing"
q10 = 1 != 0 && 2 == 1
q11 = "test" != "testing"
q12 = "test" == 1
q13 = !(true && false)
q14 = !(1 == 1 && 0 != 1)
q15 = !(10 == 1 || 1000 == 1000)
q16 = !(1 != 0 || 3 == 4)
q17 = !("testing" == "testing" && "Zed" == "Cool Guy")
q18 = 1 == 1 && ( !("testing" == 1 || 1 == 0) )
q19 = "chunky" == "bacon" && ( !(3 == 4 || 3 == 3) )
q20 = 3 == 3 && ( !("testing" == "testing" || "Ruby" == "Fun") )

# My answers
a1 = true
a2 = false
a3 = false
a4 = true
a5 = true
a6 = true
a7 = false
a8 = true
a9 = false
a10 = false
a11 = true
a12 = false
a13 = true
a14 = false
a15 = false
a16 = false
a17 = true
a18 = true
a19 = false
a20 = false

quiz_answers = [a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15,a16,a17,a18,a19,a20]
right_answers = [q1,q2,q3,q4,q5,q6,q7,q8,q9,q10,q11,q12,q13,q14,q15,q16,q17,q18,q19,q20]

# Answer checker

quiz_answers.each_with_index do |x,i|
  puts "Q#{i + 1}: my answer was #{x}. The right answer was #{right_answers[i]}. I was #{x == right_answers[i] ? "Right!" : "Wrong!"}"
end


# Marks out of 20 and a list of incorrect answers
# had to learn about .with_index for this, tried to do plain .each and compare q[x] with a[x]...

def marks(my_answers, correct_answers)
  marks = 0
  wrong = []
  my_answers.each_with_index do |x,i|
    if x == correct_answers[i]
      marks += 1
    else
      wrong << i + 1
    end
  end
  puts "I scored #{marks} out of 20"
  puts "I got these questions wrong:"
  puts wrong.empty? ? "None!!" : wrong.join(",")   
end

marks(quiz_answers, right_answers)

