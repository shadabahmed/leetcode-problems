def single_number(nums)
    nums.reduce {|x,y| x ^ y }
end
