# @param {String} str1
# @param {String} str2
# @return {String}
def gcd_of_strings(str1, str2)
  gcd = ''
  str1, str2 = str2, str1 if str1.length < str2.length

end



# @param {String} str1
# @param {String} str2
# @return {String}
def gcd_of_strings(str1, str2)  
  str1, str2 = str2, str1 if str2.length > str1.length
  str1_idx, str2_idx = 0, 0
  gcd_idx = 0
  gcd = ''
  while str1_idx < str1.length
    return '' if str1[str1_idx] != str2[str2_idx]
    if gcd[gcd_idx] != str1[str1_idx] && 
      gcd = str2.slice(0, str2_idx + 1)
      gcd_idx = 0  
    else      
      gcd_idx += 1
      gcd_idx %= gcd.length
    end
    str2_idx += 1    
    str1_idx += 1
    str2_idx %= str2.length    
   end 
   gcd
end

# p gcd_of_strings "abcabc", "abc"
# p gcd_of_strings  str1 = "ABABABAB", str2 = "ABAB"
# p gcd_of_strings "LEET", "CODE"
p gcd_of_strings "OBCNOOBCNOOBCNOOBCNOOBCNOOBCNOOBCNOOBCNO", "OBCNOOBCNOOBCNOOBCNOOBCNOOBCNOOBCNOOBCNOOBCNOOBCNOOBCNOOBCNOOBCNO"

def find_largest_prefix_suffix()
  
end