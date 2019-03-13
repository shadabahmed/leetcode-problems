def isBadVersion(n)
  n > 4
end

def first_bad_version(n, start = 1)
  return nil if start > n
  mid = start + (n - start) / 2
  if is_bad_version(mid)
    first_bad_version(mid - 1, start) || mid
  else
    first_bad_version(n, mid + 1)
  end
end

def first_bad_version(n)
  first, last = 1, n
  while first < last
    mid = (first + last) / 2
    if is_bad_version(mid)
      last = mid
    else
      first = mid + 1
    end
  end
  first
end

p first_bad_version(10)
