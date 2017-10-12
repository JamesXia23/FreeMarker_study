<html>
<head>
    <title>条件判断</title>
</head>
<body>
    <p>
        <#if x == 1>
            x is 1
        <#else>
            x is not 1
        </#if>
    </p>
    <p>
        <#if name == "haahha">
            name is haahha
        <#elseif name == "jamesxia">
            hello boss
        <#else>
            unknown
        </#if>
    </p>
    <p>
        关于大于等于,因为与标签的尖括号相同，所以要转换<br>
        > : gt <br>
        >= : gte <br>

        <#if x gte 0>
            x > 0
        </#if>
    </p>

</body>

</html>