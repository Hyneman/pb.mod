

require 'fileutils'


if File.exists?("build/pb.mod.keywords.txt")
	File.delete("build/pb.mod.keywords.txt")
end

if File.exists?("build/pb.mod.res")
	File.delete("build/pb.mod.res")
end


FileUtils.cp("pb.mod.keywords.txt", "build/pb.mod.keywords.txt")
system('pbcompiler "pb.mod.pb" /RESIDENT "build/pb.mod.res"')


