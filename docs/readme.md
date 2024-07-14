# Docs (Memo)

WindowsのIME作りはかなり難がある気がするのでいろいろなメモ
ちなみにファイル構成は[ここ](https://github.com/microsoft/Windows-classic-samples/tree/main/Samples/Win7Samples/winui/input/tsf/textservice/textservice-step01)を参考にしてある

## Swift on WindowsでTSFを利用する

`%appdata%\..\Local\Programs\Swift\Platforms\0.0.0\Windows.platform\Developer\SDKs\Windows.sdk\usr\share`
にあるwindows.modulemapを編集

```
  module UI {
    module XAML {
      module Hosting {
        header "windows.ui.xaml.hosting.desktopwindowxamlsource.h"
        export *
      }
    }
    // ここを追加
    module TextServices {
      header "msctf.h"
      export *
    }
  }
```

msctf.hがcpp headerだからswift6.0以降しか対応してないらしいので、swift本家にPRするのは結構先かもしれない