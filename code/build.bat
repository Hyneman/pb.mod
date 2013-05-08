@echo off

if exist ".\build\pb.mod.keywords.txt" (
	del ".\build\pb.mod.keywords.txt"
)

if exist ".\build\pb.mod.res" (
	del ".\build\pb.mod.res"
)

copy ".\pb.mod.keywords.txt" ".\build\pb.mod.keywords.txt"
pbcompiler ".\pb.mod.pb" /RESIDENT ".\build\pb.mod.res"

