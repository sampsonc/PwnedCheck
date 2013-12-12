# PwnedCheck

Ruby gem to check to see if an email address is on http://haveibeenpwned.com

<table>
    <tr>
        <th>Version</th>
        <td>1.0.4</td>
    </tr>
    <tr>
        <th>Github</th>
        <td><a href="http://github.com/sampsonc/PwnedCheck">http://github.com/sampsonc/PwnedCheck</a></td>
    </tr>
    <tr>
       <th>Author</th>
       <td><a href="http://www.chs.us">Carl Sampson</a> (<a href="http://twitter.com/chs">@chs</a>)</td>
    </tr>
</table>

# Installation
gem install PwnedCheck

# Usage

`````ruby
require 'pwnedcheck'

# The 3 cases.
# chs@chs.us is a valid address on the site
# abcabc@chs.us is a valid address, but not on the site
# chschs.us is an invalid format
addresses = ['chs@chs.us', 'abcabc@chs.us', 'chschs.us']

addresses.each do |address|
  begin
    sites = PwnedCheck::check(address)
    puts "#{address} --> Not found on http://haveibeenpwned.com" if sites.length == 0
    sites.each do |site|
      puts "#{address} --> #{site}"
    end
  rescue PwnedCheck::BadRequest => e
    puts "#{address} --> Invalid email address format"
  end
end
`````
