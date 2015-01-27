def textalyze(text, options = {})
  format = options.fetch(:format) { :frequency }

  characters = chars_in( sanitize(text) )

  if options[:format] == :count
    # Return the raw count for each item
    counts = item_counts(characters)
    format_counts(counts)
  elsif options[:format] == :frequency
    # Return the frequency percentage for each item
    freq_counts = frequency_counts(characters)
    format_frequencies(freq_counts)
  else
    raise "Format #{options[:format]} not recognized."
  end
end

def frequency_counts(array)
  total_count = array.count

  counts = item_counts(array)

  frequencies = counts.map do |item, count|
    frequency = (count / total_count.to_f).round(4)

    [item, frequency]
  end

  frequencies.to_h
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

def format_frequencies(frequencies)
  frequencies.map do |item, freq|
    freq_percent = (freq * 100).round(2)

    "#{item.inspect} - #{freq_percent}%"
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
  puts textalyze( File.read(source_file), format: :frequency )
end
