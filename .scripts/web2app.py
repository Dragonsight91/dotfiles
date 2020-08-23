#!/usr/bin/python3.8
import os,sys

#Nativefier Setup
name = sys.argv[1]
url = sys.argv[2]
useragent = "Mozilla/5.0 (X11; ArchLinux; Linux x86_64; rv:72.0) Gecko/20100101 Firefox/72.0"
electron = "9.2.0"

# get verbose output option
verbose = (len(sys.argv) > 3 and sys.argv[3] == "-v")

if len(sys.argv) > 3 and not verbose:
    flags = " ".join(sys.argv[3:])
else:
    print(sys.argv)
    flags = " ".join(sys.argv[4:])

#run nativefier
print(f'nativefier -n {name} -e {electron} --user-agent \"{useragent}\" {flags if "flags" in vars() or "flags" in globals() else ""} {url}')
os.system(f'nativefier -n {name} -e {electron} --user-agent \"{useragent}\" {flags if "flags" in vars() or "flags" in globals() else ""} {url}')

# delete dir if exists
if os.path.exists(f"/usr/bin/{name}") and not verbose:
    os.system(f"sudo rm -r /usr/bin/{name}")
else:
    os.system(f"sudo rm -rv /usr/bin/{name}")

# make new dir
if(verbose):
    os.system(f"sudo mv -v {name}-linux-x64 /usr/bin/{name}")
else:
    os.system(f"sudo mv {name}-linux-x64 /usr/bin/{name}")


os.system(f'rm /home/{os.environ["USER"]}/.local/bin/{name}')
os.system(f"ln -s /usr/bin/{name}/{name} {os.environ['HOME']}/.local/bin/{name}")
