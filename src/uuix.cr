module UUIX
  VERSION = "0.1.0"

  @@SIZE : Int32 = 4096
  @@HEX = [] of String
  @@IDX : Int32 = 0
  @@BUFFER = [] of UInt8

  i = 0
  while i < 256
    @@HEX << (i + 256).to_s(16)[1..]
    i += 1
  end

  def self.random
    if @@BUFFER.empty? || ((@@IDX + 16) > @@SIZE)
      @@BUFFER = Random.new.random_bytes(@@SIZE).to_a
      @@IDX = 0
    end

    arr = @@BUFFER[@@IDX..(@@IDX += 16)]

    String.build do |str|
      (0..3).each do |idx|
        str << @@HEX[arr[idx]]
      end
      str << '-'
      str << @@HEX[arr[4]]
      str << @@HEX[arr[5]]
      str << '-'
      str << @@HEX[arr[6] & 15 | 64]
      str << @@HEX[arr[7]]
      str << '-'
      str << @@HEX[arr[8] & 63 | 128]
      str << @@HEX[arr[9]]
      str << '-'
      arr[10..15].each do |val|
        str << @@HEX[val]
      end
    end
  end
end
