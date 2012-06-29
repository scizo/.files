require 'fileutils'

task :default => 'link_to_home'

def desired_files
  files = ENV['FILES'] && ENV['FILES'].split(',') || (Dir.glob('*') - ['Rakefile', '.gitignore', '.gitmodules'])
  files.each{|path| yield path}
end

desc "Link all files and folders to dotfiles in the home folder"
task :link_to_home do
  desired_files do |path|
    expanded_path = File.expand_path("~/.#{path}")
    unless File.exists?(expanded_path)
      File.symlink File.expand_path(path), File.expand_path("~/.#{path}")
    end
  end
end

desc "Remove all corresponding files and folders from home folder"
task :clean_home do
  desired_files do |path|
    expanded_path = File.expand_path("~/.#{path}")
    if File.exists?(expanded_path) && !File.symlink?(expanded_path)
      puts "Removing .#{path} from #{Dir.home}"
      FileUtils.rm_f expanded_path
    end
  end
end

desc "Remove all links to dotfiles from the home folder"
task :clean_links do
  desired_files do |path|
    expanded_path = File.expand_path("~/.#{path}")
    if File.exists?(expanded_path) && File.symlink?(expanded_path)
      puts "Removing .#{path} from #{Dir.home}"
      FileUtils.rm_f expanded_path
    end
  end
end
