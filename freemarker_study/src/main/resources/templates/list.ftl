<html>
<head>
    <title>通过list遍历变量</title>
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

<!-- sep 套住的在最后一次迭代后不会执行 -->
<#list names>
    <p>
        <#items as name>
            <span>${name}<#sep>,</#sep></span>
        </#items>
    </p>
</#list>

<#list 1..15 as i>
    <#if i % 5 == 0>
        ${i}
    </#if>
</#list>

<#-- 使用break -->
<#list 1..15 as i>
    <#if i gt 10>
        <#break>
    <#elseif i % 2 == 0>
    <p>偶数：${i}</p>
    <#else>
    <p>奇数：${i}</p>
    </#if>
</#list>

<#-- 使用list的方法 -->
<#list 1..6 as i>
    <#if i gt 10>
        <#break>
    </#if>
    <p>${i?item_parity}：${i}</p>
</#list>

<#list names as name>
<p>${name?counter}：${name}</p>
</#list>
</body>

</html>