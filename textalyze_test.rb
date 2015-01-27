require_relative './textalyze.rb'

puts ""
puts "Running tests for item_counts()..."
p item_counts([1,2,1,2,1]) == {1 => 3, 2 => 2}
p item_counts(["a","b","a","b","a","ZZZ"]) == {"a" => 3, "b" => 2, "ZZZ" => 1}
p item_counts([]) == {}
p item_counts(["hi", "hi", "hi"]) == {"hi" => 3}
p item_counts([true, nil, "dinosaur"]) == {true => 1, nil => 1, "dinosaur" => 1}
p item_counts(["a","a","A","A"]) == {"a" => 2, "A" => 2}

puts ""
puts "Running tests for format_counts()..."
p format_counts({"a" => 2, "A" => 2}) == "a - 2\nA - 2"
p format_counts({true => 1, nil => 1, "dinosaur" => 1}) == "true - 1\n - 1\ndinosaur - 1"

puts ""
puts "Running tests for chars_in()..."
p chars_in("a") == ["a"]
p chars_in("abc") == ["a", "b", "c"]
p chars_in("Dr. 123\n") == ["D", "r", ".", " ", "1", "2", "3", "\n"]

puts ""
puts "Running tests for sanitize()..."
p sanitize("AaBbCc") == "aabbcc"
p sanitize("A- lOT. of cRaZy") == "a lot of crazy"
p sanitize("This is a sentence.") == "this is a sentence"
p sanitize("WHY AM I YELLING?") == "why am i yelling"
p sanitize("HEY: ThIs Is hArD tO rEaD!") == "hey this is hard to read"
