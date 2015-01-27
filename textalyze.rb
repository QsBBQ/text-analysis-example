def textalyze(text)
  characters  = chars_in( sanitize(text) )
  char_counts = item_counts(characters)

  format_counts(char_counts)
end

def item_counts(array)
  counts = Hash.new(0)

  array.each do |item|
    counts[item] += 1
  end

  counts
end

def chars_in(string)
  string.chars
end

def sanitize(string)
  string.downcase.gsub(/[^a-z0-9\s]/, '')
end

def format_counts(counts)
  counts.map do |item, count|
    "#{item} - #{count}"
  end.join("\n")
end

if ARGV[0] == "test"
  p item_counts([1,2,1,2,1]) == {1 => 3, 2 => 2}
  p item_counts(["a","b","a","b","a","ZZZ"]) == {"a" => 3, "b" => 2, "ZZZ" => 1}
  p item_counts([]) == {}
  p item_counts(["hi", "hi", "hi"]) == {"hi" => 3}
  p item_counts([true, nil, "dinosaur"]) == {true => 1, nil => 1, "dinosaur" => 1}
  p item_counts(["a","a","A","A"]) == {"a" => 2, "A" => 2}

  p format_counts({"a" => 2, "A" => 2}) == "a - 2\nA - 2"
  p format_counts({true => 1, nil => 1, "dinosaur" => 1}) == "true - 1\n - 1\ndinosaur - 1"

  p chars_in("a") == ["a"]
  p chars_in("abc") == ["a", "b", "c"]
  p chars_in("Dr. 123\n") == ["D", "r", ".", " ", "1", "2", "3", "\n"]

  p sanitize("AaBbCc") == "aabbcc"
  p sanitize("A- lOT. of cRaZy") == "a lot of crazy"
  p sanitize("This is a sentence.") == "this is a sentence"
  p sanitize("WHY AM I YELLING?") == "why am i yelling"
  p sanitize("HEY: ThIs Is hArD tO rEaD!") == "hey this is hard to read"
else
  source_file = ARGV.first
  puts "The counts for #{source_file} are..."
  puts textalyze( File.read(source_file) )
end
