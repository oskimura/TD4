# TD4

###転送

#### MOV A,IM
0011 xxxx

即値をデータAに転送します。
 
チャンネル３ 
 
#### MOV B,IM 
0111 xxxx 

即値をデータBに転送します。

チャンネル３

#### MOV A,B 
0010 xxxx

BレジスタをAレジスタに転送します。

チャンネル1

#### MOV A,B
0001 0000 

AレジスタをBレジスタに転送します。

チャンネル0

###加算
ADD

#### ADD A,IM
 0100 xxxx 

Aレジスタに即値を加算。
 
 チャンネル0
 
#### ADD B,IM
 0101 xxxx 
 
Bレジスタに即値を加算

チャンネル1

###ポート入力

#### IN A
 0010 0000 

入力ポートのデータをAレジスタに転送します。

チャンネル2

#### IN B
 0110 0000 

入力ポートのデータをBレジスタに転送します。

チャンネル2

###ポート出力

#### OUT IM
 1011 0000 

即値を出力ポートへ転送します。

チャンネル3

#### OUT B
 1001 0000 

Bレジスタをポートへ転送します。

チャンネル1

###ジャンプ
JMP

#### JMP IM

 1111 xxxx 

即値の番地にジャンプ

チャンネル3

###条件ジャンプ
JNC

#### JNC IM

 1110 xxxx 

Cフラグが０の時に番地にジャンプ

チャンネル3

|命令|MSB LSB|
|:-----|:--|
|MOV A,IM| 0011 xxxx |
|MOV B,IM| 0111 xxxx |
|MOV A,B| 0010 xxxx |
|MOV A,B| 0001 0000 |
|ADD A,IM| 0100 xxxx |
|ADD B,IM| 0101 xxxx |
|IN A| 0010 0000 |
|IN B| 0110 0000 |
|OUT IM| 1011 0000 |
|OUT B| 1001 0000 |
|JMP IM| 1111 xxxx |
|JNC IM| 1110 xxxx |
