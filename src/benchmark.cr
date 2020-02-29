require "benchmark"
require "uuid"
require "./uuix.cr"

puts Crystal::DESCRIPTION

Benchmark.ips do |x|
  x.report("UUIX:") do
    UUIX.random
  end

  x.report("Crystal UUID:") do
    UUID.random
  end
end
