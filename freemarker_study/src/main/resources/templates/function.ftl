<html>
<head>
    <title>使用function</title>
</head>
<body>

<#function add x y>
    <#-- 在function不能打印东西，只有通过返回值返回，然后外部使用${}才行 -->
    <#return x+y>
</#function>

${add(x, y)}
</body>

</html>