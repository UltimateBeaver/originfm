#!/usr/bin/env ruby

parameters = [[64, 0.011, 0.008, 0.00002, 0.00002],
              [64, 0.012, 0.008, 0.00002, 0.00002],
              [64, 0.013, 0.008, 0.00002, 0.00002],
              [64, 0.014, 0.008, 0.00002, 0.00002],
              [64, 0.005, 0.008, 0.00002, 0.00002],
              [64, 0.006, 0.008, 0.00002, 0.00002],
              [64, 0.007, 0.008, 0.00002, 0.00002],
              [64, 0.008, 0.008, 0.00002, 0.00002],
              [64, 0.009, 0.008, 0.00002, 0.00002],
              [64, 0.010, 0.008, 0.00002, 0.00002]]

total = parameters.size
start = Time.now

f = open("ptuner_log_7", "w+")

parameters.each_with_index do |p, i|
  f.puts "#{i+1}/#{total} k=#{p[0]} e1=#{p[1]} e2=#{p[2]} l1=#{p[3]} l2=#{p[4]} #{(Time.now - start)/60}mins"
  `../fm -k #{p[0]} -t 4 -s 1 -e1 #{p[1]} -e2 #{p[2]} -l1 #{p[3]} -l2 #{p[4]} -g k_#{p[0]}_e2_#{p[2]}_e1_#{p[1]}_l1_#{p[3]}_l2_#{p[4]} ../train.libfm ../test.libfm`
end

f.close


