"C:\Program Files (x86)\Windows Kits\10\bin\10.0.22000.0\x64\rc.exe" "D:\SwiftIME\Sources\assets\resource.rc"
swift build -c release --use-integrated-swift-driver -v
python dll.py
"ime.wsb"