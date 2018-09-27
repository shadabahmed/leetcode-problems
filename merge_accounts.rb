def insert_email(entry, email)
  idx = entry.length
  while idx > 1 && email < entry[idx - 1]
    idx -= 1
  end
  entry.insert(idx, email)
end

def accounts_merge(accounts)
  email_map = {}
  entries = []
  accounts.each do |(name, *emails)|
    matching_email = emails.find do |email|
                      email_map.key?(email)
                     end
    entry = email_map[matching_email]
    if !matching_email
      entry = [name]
      entries.push(entry)
    end
    emails.each do |email|
      insert_email(entry, email) unless email_map.key?(email)
      email_map[email] = entry
    end
  end
  entries
end

p accounts_merge [["John", "johnsmith@mail.com", "john00@mail.com"], ["John", "johnnybravo@mail.com"], ["John", "johnsmith@mail.com", "john_newyork@mail.com"], ["Mary", "mary@mail.com"]]
