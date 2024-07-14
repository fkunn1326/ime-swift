# swiftのdllをコピーするやつ
import subprocess
import os
import shutil

# Copy additional files
source_folder = r'C:\Users\fukuda\AppData\Local\Programs\Swift\Runtimes\0.0.0\usr\bin'
destination_folder = r'D:\SwiftIME\.build\release'
shutil.copytree(source_folder, destination_folder, dirs_exist_ok=True)