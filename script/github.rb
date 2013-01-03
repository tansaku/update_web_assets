#!/usr/local/bin/ruby

require 'rubygems'
require 'gist'

class Github
  
  def paste_file(filename)
    begin
      #postname = File.basename(filename)
      #content = IO.read(filename)
      #self.paste(postname, content)
      Gist.write([{
            :input => File.read(filename),
            :filename => filename,
            :extension => (File.extname(filename) if filename.include?('.'))
          }])
    rescue Exception => e
      puts "Warning: posting file '#{filename}': #{e.message}"
      puts e.backtrace
      nil
    end
  end

end
