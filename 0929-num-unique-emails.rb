# @param {String[]} emails
# @return {Integer}
def num_unique_emails(emails)
  email_set = Set.new
  Set.new(emails.collect {|email| get_email_key(email)}).length
end

def get_email_key(email)
  idx = 0
  key = ''
  while idx < email.length && email[idx] != '@' && email[idx] != '+'
    key << email[idx] unless email[idx] == '.'
    idx += 1
  end
  idx += 1 while idx < email.length && email[idx] != '@'
  while idx < email.length
    key << email[idx]
    idx += 1
  end
  key
end

p num_unique_emails  ["test.email+alex@leetcode.com","test.e.mail+bob.cathy@leetcode.com","testemail+david@lee.tcode.com"]