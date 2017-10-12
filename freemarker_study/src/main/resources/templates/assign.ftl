<html>
<head>
    <title>通过assign声明变量</title>
</head>
<body>
welcome ${username}，性别 ${sex}，年龄 ${age}
<#assign seq = ['abc', 'def', 'hij']>
<#assign sep = []>
<ul>
<#list sep as s>
    <li>${s}</li>
<#else>
    没有元素,else从2.3.23版本才有
</#list>
</ul>

2.2.23新版本开始新的list写法<br>
<#list seq>
    这个只执行一次，使用新的写法可以保证ul便签在list存在时再加载，而且只加载一次
    <ul>
    <#items as s>
        <li>${s}</li>
    </#items>
    </ul>
    这个也是执行一次
<#else>
    没有元素,else从2.3.23版本才有
</#list>



<#assign name>
    JamesXia,
        wahahaha
</#assign>

<h1>
    ${name}
</h1>
</body>

</html>