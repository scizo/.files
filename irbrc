def dump_history(num, path)
  File.open(path, 'w') do |file|
    Readline::HISTORY.to_a[-num..Readline::HISTORY.length-2].each do |line|
      file.puts line
    end
  end
end

def hash_diff(a, b)
  (a.keys | b.keys).each_with_object({}) do |k, diff|
    if a[k] != b[k]
      if a[k].is_a?(Hash) && b[k].is_a?(Hash)
        diff[k] = hash_diff(a[k], b[k])
      else
        diff[k] = [a[k], b[k]]
      end
    end
  end
end
