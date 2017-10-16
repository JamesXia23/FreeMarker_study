<html>
<head>
    <title>比较local和assign的区别</title>
</head>
<body>
<#assign name = "1234">
<#function test>
    <#-- local只能在宏或者函数中使用，这时候，assign中的name对于函数来说就相当于全局变量了 -->
    <#--<#local name = "4567">-->
    <#return name>
</#function>
${test()}

${name}


</body>

</html>