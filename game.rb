# put text file into a hash
story_hash = {}

lines_grabbed = ""
key = ""

File.open("story.txt", "r") do |infile|
  while (line = infile.gets)
    if line.index("~p")
      key = line
      lines_grabbed = ""
    else
      lines_grabbed += line
    end
    story_hash[key] = lines_grabbed
  end
end

# display page 1 content 
p1 = story_hash.select do |key, value|
  key.index("~p1")
end

p1.each do |k, v|
  puts v
end

# prompt user for choice and store it
puts "Please enter a choice: 1, 2, or 3."
choice = "c" + gets.chomp

# find corresponding page number
desired_page_key = ""

p1.each do |k, v|
  if k.index("#{choice}")
  	desired_page_key = k
  end
end

# display desired page
desired_page = "\~p#{desired_page_key[-2]}\n"
puts story_hash[desired_page]

