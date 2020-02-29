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

    @@HEX[arr[0]] + @@HEX[arr[1]] + @@HEX[arr[2]] + @@HEX[arr[3]] +
      '-' + @@HEX[arr[4]] + @@HEX[arr[5]] +
      '-' + @@HEX[arr[6] & 15 | 64] + @@HEX[arr[7]] +
      '-' + @@HEX[arr[8] & 63 | 128] + @@HEX[arr[9]] +
      '-' + @@HEX[arr[10]] + @@HEX[arr[11]] + @@HEX[arr[12]] + @@HEX[arr[13]] + @@HEX[arr[14]] + @@HEX[arr[15]]
  end
end
