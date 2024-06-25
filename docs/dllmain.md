# DllMain

このファイルでは
```
DllCanUnloadNow
DllGetClassObject
DllRegisterServer
DllUnregisterServer
```
の4つを実装している。

IMEっていうのは簡単にするとこの4つの関数を露出したDllらしい