#!/bin/ruby

def bar
  print "bar\n"
  STDERR.puts caller.join(", ")
end


def foo
  print "foo\n"
  bar
end

print "start\n"
foo
