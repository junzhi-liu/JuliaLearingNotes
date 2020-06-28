#变量
x = 10
x + 1
x = 1 + 1
x = "hello julia!"
##
x = 1.0
y = -3
Z = "julia"
cunstomary_phrase = "hello world!"
Universal = "全球的"
δ = 0.00001
🐼 = "panda"
#变量名采用小写，不推荐用”_"下划线分割单词。
#类型（Type）和模块（Module）的名字使用大写字母开头，并用大写字母分隔单词。
#函数（Function）和宏（Macro）的名字使用小写，不使用下划线。
#会对输入参数进行更改的函数要使用 ! 结尾。
#这些函数有时叫做 “mutating” 或 “in-place” 函数，它们在被调用后，不仅仅会返回一些值 还会更改输入参数的内容。

#整数与浮点数
::Int8 #(带符号，整数，比特数8,最小值-2^7,最大值2^7-1)
::wwUInt8#(不带符号，正整数，比特数（8，16，32，64，128），最小值0,最大值2^8-1)
::Bool #(符号（N/A），比特数8)

::Float16or64or128
#精度half single double
