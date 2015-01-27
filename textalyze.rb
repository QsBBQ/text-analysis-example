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
    "#{item.inspect} - #{count}"
  end.join("\n")
end

if __FILE__ == $PROGRAM_NAME
  if ARGV.empty?
    puts "Please supply a text file to analyze."
    puts ""
    puts "Example:"
    puts "$ ruby #{__FILE__} ./sample_data/moby-dick.txt"
    exit 1
  end

  source_file = ARGV.first

  puts "The counts for #{source_file} are..."
  puts textalyze( File.read(source_file) )
end
