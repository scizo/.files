def dump_history(num, path)
  File.open(path, 'w') do |file|
    Readline::HISTORY.to_a[-num..Readline::HISTORY.length-2].each do |line|
      file.puts line
    end
  end
end
