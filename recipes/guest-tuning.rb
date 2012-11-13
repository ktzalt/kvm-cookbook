node['block_device'].select{|device,info| device =~ /^.d.$/ and info['size'].to_i > 0}.each do |device,info|
  sysfs "noop scheduler" do
    name "block/#{device}/queue/scheduler"
    value "noop"
  end
end
   
