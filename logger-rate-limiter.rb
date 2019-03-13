class Logger

=begin
    Initialize your data structure here.
=end
  def initialize()
    @map = {}
  end

=begin
    Returns true if the message should be printed in the given timestamp, otherwise returns false.
        If this method returns false, the message will not be printed.
        The timestamp is in seconds granularity.
    :type timestamp: Integer
    :type message: String
    :rtype: Boolean
=end
  def should_print_message(timestamp, message)
    if !@map.key?(message) || timestamp - @map[message] >= 10
      @map[message] = timestamp
      return true
    end
    false
  end
end
