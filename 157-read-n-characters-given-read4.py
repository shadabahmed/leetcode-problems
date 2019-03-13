"""
The read4 API is already defined for you.

    @param buf, a list of characters
    @return an integer
    def read4(buf):

# Below is an example of how the read4 API can be called.
file = File("abcdefghijk") # File is "abcdefghijk", initially file pointer (fp) points to 'a'
buf = [' '] * 4 # Create buffer with enough space to store characters
read4(buf) # read4 returns 4. Now buf = ['a','b','c','d'], fp points to 'e'
read4(buf) # read4 returns 4. Now buf = ['e','f','g','h'], fp points to 'i'
read4(buf) # read4 returns 3. Now buf = ['i','j','k',...], fp points to end of file
"""
class Solution:
    def read(self, buf, n):
        """
        :type buf: Destination buffer (List[str])
        :type n: Number of characters to read (int)
        :rtype: The number of actual characters read (int)
        """
        buf_idx = 0
        temp_buf = [None] * 4
        read_chars = read4(temp_buf)
        while read_chars > 0:
          if read_chars == 4:
            buf[buf_idx:] = temp_buf
          else:
            buf[buf_idx:] = temp_buf[:read_chars]
            break
          buf_idx += read_chars
          read_chars = read4(temp_buf)
        return buf_idx
            
        