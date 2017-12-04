## This works better than what they were asking for.  But they want it to only count as a header if the line starts with hashtags (not specified in instructions)

def markdownparser(markdown)
  arr = markdown.split(" ")
  arr.each_with_index do |sub, i|
    header_level = 0
    
    if sub[0] == "#"
      sub.each_char do |chr|
        header_level += 1 if chr == "#"
      end
      
      if header_level == sub.length
        header_text = arr[(i + 1)..-1].join(" ")
        return "<h#{header_level}>#{header_text}</h#{header_level}>"
      end
    end
  end
  
  markdown
end
