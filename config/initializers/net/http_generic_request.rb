require 'stringio'

class Net::HTTPGenericRequest
  def to_s
    io = StringIO.new
    exec(io, '1.1', path)
    io.string
  end
end