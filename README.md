# KoRec-DL supporter
## これなに
[KoRec-DL](http://www.arugoworks.net/korec-dl)を利用したオンデマンドなネットラジオを録音するのに使えるかもしれないWindows向けバッチファイル群です。

一回の実行で複数の設定を順次実行出来るようにすることを目標としていますが、更新されたら即聞きたい人向けではなく一日一回の実行などで適度に聞きたい人向けになっています。

## つかいかた
1. [KoRec公式サイト](http://www.arugoworks.net/korec)と[KoRec-DL公式サイト](http://www.arugoworks.net/korec-dl)を参照してKoRec.exe および KoRec-DL.exe が実行できるようにする。必要な依存ライブラリ等が必要な場合もあるので注意すること
2. `conf\`フォルダにある `config.cmd.default` をコピーし、`config.cmd` へリネームする
3. `config.cmd` を開いて、適宜編集する。大体ファイル内に説明あります
4. `conf\services`フォルダにある `sample.cmd.default` をコピーし、適当なファイル名をつけて拡張子を `.cmd` にリネームする
5. リネームしたファイルを開いて、適宜編集する。大体ファイル内に説明あります
6. `conf\lists\`フォルダ内にxmlファイルを作成し、必要なら `conf\filters\`フォルダ内にxsltファイルを作成する
7. 一通り揃ったら、`start.cmd` を実行して動作確認する
8. 問題無さそうなら `start.cmd` をタスクスケジューラに登録するとかで定期実行する

### config.cmd ファイルについて
`conf\config.cmd` ファイルは、全体設定をするファイルになります。ファイル内コメントに説明書きをしているので参照してください。`USE_TASK_SCHEDULER`は`start.cmd`の最後にpauseするかしないかを振り分けているだけです。

### service 設定ファイルについて
`conf\service` フォルダ内に配置する.cmdファイルは、例えばサイトごとの設定をするファイルになります。複数配置することで順次実行されていくので、増減も簡単だと思います(多分)。ファイル内コメントに説明書きをしているので参照してください。

### list ファイルについて
KoRec-DLを実行するにあたって必要になる番組ダウンロードリストになります。

service設定で`USE_LIST`を`0`にした場合(デフォルト)、`conf\lists\korec-dl-downloadlist.xml` を読みこみます。この番組ダウンロードリストは[KoRec-DL公式サイト](http://www.arugoworks.net/korec-dl/listfile)よりダウンロードできます。後述するfilterと併用して利用してください。

service設定で`USE_LIST`を`1`以上にした場合、`conf\lists\%SERVICE_NAME%.xml` を読みこみます。必要な分だけの番組ダウンロードリストを作成している場合はこちらを利用してください。

### filter ファイルについて
KoRec-DL実行時、番組ダウンロードリストから特定の部分のみを抽出したりする時に必要になります。filterのサンプルは[KoRec-DL公式サイト](http://www.arugoworks.net/korec-dl/listfile)よりダウンロードできます。予め必要な分だけの番組ダウンロードリストを作成する場合は必要ありません。

service設定で`USE_FILTER`を`0`にした場合、filterは読み込まれません。

service設定で`USE_FILTER`を`1`以上にした場合(デフォルト)、`conf\filters\%SERVICE_NAME%.xslt` を読みこみます。

### 保存先フォルダについて
`config.cmd` の `DL_ROOT_DIR` に設定したフォルダ配下に、service設定の `SERVICE_NAME` に設定した名前のフォルダが作成され、その中に保存されます。現状 `SERVICE_NAME` 以外での変更方法はありません。