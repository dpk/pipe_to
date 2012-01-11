
require 'open3'

class String
  def pipe_to cmd
    Open3.popen2 cmd do |i, o|
      i.print self
      i.close
      o.read
    end
  end
  
  def | cmd
    pipe_to "#{cmd}"
  end
  
  def edit editor=nil
    editor = ENV['EDITOR'] if not editor
    path = "/tmp/rbedit-#{uniqstr 4}"
    File.open path, "w" do |f|
      f.print self
    end
    system "#{editor} #{path}"
    File.read path
  end
  
  def edit! editor=nil
    s = edit editor
    self[0..-1] = s
  end
  
  private
  def uniqstr len
    s = ""
    len.times do
      s << (97 + (rand 26)).chr
    end
    s
  end
end
