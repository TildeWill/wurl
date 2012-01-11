require 'stringio'

class Net::HTTPGenericRequest
  def to_s
    io = StringIO.new
    exec(io, ::Net::HTTP::HTTPVersion, path)
    io.string
  end
end