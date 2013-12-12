PwnedCheck
==========

Ruby gem to check to see if an email address is on http://haveibeenpwned.com

#Usage

`````ruby
require 'pwnedcheck'

#Valid address
sites = PwnedCheck::check('chs@chs.us')
for site in sites
  puts site
end

#Invalid email format
begin
  puts PwnedCheck::check('chschs.us')
rescue PwnedCheck::BadRequest => e
  puts "Bad Request"
end

#Email address not found on site
begin
  puts PwnedCheck::check('chadasfdfs@chs.us')
rescue PwnedCheck::NotFound => e
  puts "Not Found"
end
```
