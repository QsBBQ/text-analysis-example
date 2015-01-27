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
  string.downcase
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

  p chars_in("a") == ["a"]
  p chars_in("abc") == ["a", "b", "c"]
  p chars_in("Dr. 123\n") == ["D", "r", ".", " ", "1", "2", "3", "\n"]

  p sanitize("AaBbCc") == "aabbcc"
  p sanitize("A- lOT. of cRaZy") == "a- lot. of crazy"

  sample_string = "Elementary, my dear Watson"
  characters    = chars_in( sanitize(sample_string) )
  char_counts   = item_counts(characters)

  puts "The counts for #{sample_string} are..."

  puts format_counts( char_counts )
end
