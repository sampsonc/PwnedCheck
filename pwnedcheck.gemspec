# coding: utf-8
=begin
Copyright (c) 2013 Carl Sampson <chs@chs.us>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
=end

Gem::Specification.new do |s|
  s.name        = 'PwnedCheck'
  s.version     = '1.0.19'
  s.date        = '2017-10-26'
  s.summary     = "Checks an email address against haveibeenpwned.com."
  s.description = "Checks an email address against haveibeenpwned.com."
  s.authors     = ["Carl Sampson"]
  s.email       = 'chs@chs.us'
  s.files       = ["lib/pwnedcheck.rb"]
  s.homepage    = 'http://www.chs.us/PwnedCheck'
  s.license      = 'MIT'
  s.has_rdoc    = 'yard'
  s.extra_rdoc_files  = %w(README.md AUTHOR.md LICENSE.md)
  s.rdoc_options      = [ '--charset=UTF-8' ]
end
