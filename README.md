# PwnedCheck

Ruby gem to check to see if an email address is on http://haveibeenpwned.com

<table>
    <tr>
        <th>Version</th>
        <td>1.0.14</td>
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

# The 3 cases.
# foo@bar.com is a valid address on the site
# foo232323ce23ewd@bar.com is a valid address, but not on the site
# foo.bar.com is an invalid format
addresses = ['foo@bar.com', 'foo232323ce23ewd@bar.com', 'foo.bar.com']

addresses.each do |address|
  begin
    sites = PwnedCheck::check(address)
    if sites.length == 0
      puts "#{address} --> Not found on http://haveibeenpwned.com"
    else
      sites.each do |site|
        puts "#{address} --> #{site}"
      end
    end
  rescue PwnedCheck::InvalidEmail => e
    puts "#{address} --> #{e.message}"
  end
end
`````
<a title="Real Time Web Analytics" href="http://clicky.com/100685763"><img alt="Real Time Web Analytics" src="//static.getclicky.com/media/links/badge.gif" border="0" width="0" height="0"/></a>
<script src="//static.getclicky.com/js" type="text/javascript"></script>
<script type="text/javascript">try{ clicky.init(100685763); }catch(e){}</script>
<noscript><p><img alt="Clicky" width="1" height="1" src="//in.getclicky.com/100685763ns.gif" /></p></noscript>
