# PwnedCheck

Ruby gem to check to see if an email address is on http://haveibeenpwned.com

<table>
    <tr>
        <th>Version</th>
        <td>1.0.17</td>
    </tr>
    <tr>
       <th>Author</th>
       <td><a href="http://www.chs.us">Carl Sampson</a> (<a href="http://twitter.com/chs">@chs</a>)</td>
    </tr>
    <tr>
        <th>Page</th>
        <td><a href="http://www.chs.us/PwnedCheck">http://www.chs.us/PwnedCheck</a></td>
    </tr>
    <tr>
        <th>Github</th>
        <td><a href="http://github.com/sampsonc/PwnedCheck">http://github.com/sampsonc/PwnedCheck</a></td>
    </tr>
</table>

# Installation
`````ruby
gem install PwnedCheck
`````

# Usage

`````ruby
require 'pwnedcheck'

# The 4 cases.
# foo@bar.com is a valid address on the site
# foo232323ce23ewd@bar.com is a valid address, but not on the site
# foo.bar.com is an invalid format
# mralexgray is a user id in snapchat
list = ['foo@bar.com', 'foo232323ce23ewd@bar.com', 'foo.bar.com', 'mralexgray']

list.each do |item|
  begin
    sites = PwnedCheck::check(item)
    if sites.length == 0
      puts "#{item} --> Not found on http://haveibeenpwned.com"
    else
      sites.each do |site|
        puts "#{item} --> #{site}"
      end
    end
  rescue PwnedCheck::InvalidEmail => e
    puts "#{item} --> #{e.message}"
  end
end
````
