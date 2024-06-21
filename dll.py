import subprocess
import os
import shutil

def copy_dependent_dlls(dll_path, destination_folder):
    dumpbin_output = subprocess.check_output([r'C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Tools\MSVC\14.40.33807\bin\Hostx64\x64\dumpbin.exe', '/dependents', dll_path], universal_newlines=True)

    dependent_dlls = []
    for line in dumpbin_output.splitlines():
        if '.dll' in line[4:] and 'Dump of' not in line:
            dependent_dlls.append(line[4:])

    paths = os.environ['PATH'].split(";")
    for i in dependent_dlls:
        if "swift" in i:
            for path in paths:
                if os.path.exists(os.path.join(path, i)):
                    shutil.copy(os.path.join(path, i), destination_folder)
                    # copy_dependent_dlls(os.path.join(path, i), destination_folder)
                    break

# Example usage
dll_path = r'D:\ime-swift\.build\release\ime-swift.dll'
destination_folder = r'D:\ime-swift\.build\release'
copy_dependent_dlls(dll_path, destination_folder)