
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
end
