comp = ["R","G","G","G","Y","Y"]
user = ["R","Y","Y","Y","G","G"]

all = comp.zip(user)

comp_array = []
user_array = []

matches = 0
all.each do |a,b|
  if a===b 
     matches+=1
  else
      comp_array << a
      user_array << b
  end
end

  comp_hash = Hash.new 0
  comp_array.each do |word|
  comp_hash[word] += 1
end

 user_hash = Hash.new 0
 user_array.each do |word|
     user_hash[word] += 1
 end
 
result =0
user_hash.each do |key, value|
    if comp_hash[key] >= value
        result +=value
    else
        result +=comp_hash[key]
    end
end
result