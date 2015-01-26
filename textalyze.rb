def item_counts(array)
  counts = Hash.new(0)

  array.each do |item|
    counts[item] += 1
  end

  counts
end

if ARGV[0] == "test"
  p item_counts([1,2,1,2,1]) == {1 => 3, 2 => 2}
  p item_counts(["a","b","a","b","a","ZZZ"]) == {"a" => 3, "b" => 2, "ZZZ" => 1}
  p item_counts([]) == {}
  p item_counts(["hi", "hi", "hi"]) == {"hi" => 3}
  p item_counts([true, nil, "dinosaur"]) == {true => 1, nil => 1, "dinosaur" => 1}
  p item_counts(["a","a","A","A"]) == {"a" => 2, "A" => 2}
end
