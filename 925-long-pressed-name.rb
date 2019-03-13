# @param {String} name
# @param {String} typed
# @return {Boolean}
def is_long_pressed_name(name, typed)
  idx, l_idx = 0, 0
  while idx < name.length && l_idx < typed.length
    return false if name[idx] != typed[l_idx]    
    idx += 1
    l_idx += 1
    l_idx += 1 while l_idx < typed.length && name[idx] != typed[l_idx]
  end
  idx >= name.length && l_idx >= typed.length
end

name = "alex"
typed = "aaleex"
name = "saeed"
typed = "ssaaedd"
# name = "leelee"
# typed = "lleeelee"

# name = "vtkgn"
# typed = "vttkgnn"
p is_long_pressed_name name, typed