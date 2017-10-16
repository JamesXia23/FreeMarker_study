<html>
<head>
    <title>使用宏macro</title>
</head>
<body>

<#-- 宏可以将内部定义的东西原样输出，提高复用 -->
<#macro hello>
    <h1>hello, world</h1>
</#macro>

<#-- 带参数的宏 -->
<#macro test a b c>
    这个宏有三个参数：${a}, ${b}, ${c}<br>
</#macro>

<#-- 参数有默认值的宏 -->
<#macro testv a = "我" b = 38 c = 2.50>
    有带默认值的宏：${a}, ${b}, ${c}<br>
</#macro>

<#-- 更复杂的宏 -->
<#macro list title items>
    <#-- 将目标首字母大写 -->
    <p>title: ${title?cap_first}</p>
    <#list items>
        <ul>
            <#items as item>
                <li>${item?cap_first}</li>
            </#items>
        </ul>
    </#list>
</#macro>

<#-- 参数扩展 -->
<#macro listv title extra...>
    <#-- 将目标首字母大写 -->
    <p>title: ${title?cap_first}</p>
    <#list extra?keys as key>
        ${key}: "${extra[key]?html}"<#sep>,</#sep>
    </#list>
</#macro>
<#macro img src extra...>
    <img src="/context${src?html}"
         <#list extra?keys as attr>
             ${attr}="${extra[attr]?html}"
         </#list>
    /><br>
</#macro>

<#-- nested 会将@标签中的内容回填入宏中，反向回填 -->
<#macro do_twice>
    1. <#nested/>
    2. <#nested/>
</#macro>

<#-- 带参数的nested，在nested标签中带参数，可以将参数回填如@标签 -->
<#macro pram>
    <#nested 1><#-- nest里面是实参 -->
    <#nested 2>
    <#nested 3>
</#macro>

<#-- 更复杂的实例 -->
<#--<#macro repeat count>-->
    <#--<#list 1..count as i>-->
        <#--<#nested i, i==count, i/2>-->
    <#--</#list>-->
<#--</#macro>-->
<#macro repeat count>
    <#list 1..count as i>
        <#nested i, i % 2 == 0/>
    </#list>
</#macro>

<#-- 宏中的return, 一般都用来暂停返回宏，使下方代码不被执行-->
<#macro ret i>
    <#list 1..10>
        <ul>
        <#items as j>
            <#if j == i>
                <#return/>
            </#if>
            <li>${j}</li>
        </#items>
        </ul>
    </#list>
</#macro>

<@hello/>
<@test "我" "你" "他"/>
<@testv b=56 a="虾米"/>
<@list "names" names></@list>
<#-- 最好使用命名传递，不要使用位置传递 -->
<@listv title="/images/test.png" width=100 heigth=50 alt="图片"/>
<@img src="/images/test.png" width=100 heigth=50 alt="图片"/>

<#-- 如果没有nested标签，"输出两次"这个文本就不会被解析到页面上-->
<@do_twice>输出两次</@do_twice><br>

<@pram ; x>
    ${x}. dosomething<br>
</@pram>

<#--<@repeat count = 4; c, last, halfc>-->
    <#--${c}. ${halfc}<#if last> Last!</#if><br>-->
<#--</@repeat>-->

<@repeat count = 10 ; i, isEven>
    <#if isEven>
        index:${i}, ${i*i}<br>
    </#if>
</@repeat>
<#--
    nested 和 macro结合步骤
    1. 获取nested中的参数
    2. 获取@标签中的内容（带nested形参）
    3. 将1、2结合后替代nested标签
    4. 获取@标签上的参数
    5. 获取macro中的内容（带macro形参）
    6. 将4、5结合后替代@标签
-->

<@ret 5></@ret>


</body>

</html>