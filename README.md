# docker-bison-flex
Docker image with bison, flex and example programs

Run with:
```
docker build --rm . -t bison-image \
    && docker run --rm -ti -v "$(pwd)":/home bison-image
```

## YACCコンパイラ
### 文法ファイル"test.y"から構文解析プログラム（パーサファイル）"y.tab.c"コンパイル
```
bison -y test.y
```
## GCCコンパイラ
### 構文解析プログラム（パーサファイル）"y.tab.c"から構文解析プログラム（実行形式）"ExpParser"にコンパイル
```
gcc y.tab.c -ly -o ExpParser -lm -o test.y
```