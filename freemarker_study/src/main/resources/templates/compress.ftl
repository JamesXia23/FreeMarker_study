<html>
<head>
    <title>使用compress去掉空格和换行</title>
</head>
<body>
    <#assign x = "     我  最  帅   \n\n">

    ${x}
    <#-- 其实html就会显示自动去掉，但是显示源代码就会发现compress是有效的 -->
    <#compress>
                   你再试试     我也试试    好多空格
    确实好多


    还有很多换行

    ${x}
    </#compress>

</body>

</html>