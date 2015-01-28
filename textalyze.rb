def textalyze(text, options = {})
  format = options.fetch(:format) { :frequency }

  characters = chars_in( sanitize(text) )

  if format == :count
    # Return the raw count for each character
    counts = item_counts(characters)
    format_counts(counts)
  elsif format == :frequency
    # Return the frequency percentage for each character
    freq_counts = frequencies(characters)
    format_frequencies(freq_counts)
  else
    raise "Format #{format} not recognized."
  end
end

def frequencies(array)
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
  string.downcase.gsub(/[^a-z0-9]/, "")
end

def sorted(stats)
  stats.sort_by { |item, _stat| item.to_s }
end

def to_percent(freq)
  freq_percent = (freq * 100).round(2)
  freq_percent.to_s.rjust(5) + "%"
end

def screen_width
  if system "which tput 1>/dev/null"
    # If tput is available, use it
    `tput cols`.to_i
  else
    # Otherwise, just return a default width of 80 chars
    80
  end
end

def histogram_bar(percent, width, offset)
  "#" * (percent * (width - offset))
end

def format_counts(counts)
  sorted(counts).map do |item, count|
    "#{item.inspect} - #{count}"
  end.join("\n")
end

def format_frequencies(frequencies)
  max = frequencies.values.max

  sorted(frequencies).map do |item, freq|
    item_info         = "#{item} [#{to_percent(freq)}] "
    percent_of_screen = freq / max

    item_info + histogram_bar(percent_of_screen, screen_width, item_info.length)
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
  puts textalyze( File.read(source_file), :format => :frequency )
end
