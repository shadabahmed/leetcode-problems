# @param {String[]} emails
# @return {Integer}
def num_unique_emails(emails)
  map = {}
  emails.each do |email|
    map[get_true_email(email)] = true
  end
  p map
  map.length
end

def get_true_email(email)
  email, domain = email.split('@')
  email = email[0..find_plus_index(email)]
  email = email.gsub('.','')
  "#{email}@#{domain}"
end

def find_plus_index(str)
  0.upto(str.length - 1) do |idx|
    return idx - 1 if str[idx] == '+'
  end
  str.length - 1
end

p num_unique_emails ["test.email+alex@leetcode.com","test.e.mail+bob.cathy@leetcode.com","testemail+david@lee.tcode.com"]