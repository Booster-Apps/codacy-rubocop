##Patterns: Lint_AssignmentInCondition

##Info: Lint_AssignmentInCondition
if v = array.grep(/foo/)
  puts 'hello world'
end

v = array.grep(/foo/)
if v
  puts 'Hello world'
end
