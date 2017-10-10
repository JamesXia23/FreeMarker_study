<html>
<head>
    <title>使用函数对象</title>
</head>
<body>
    <#assign num1 = 1>
    <#assign num2 = 2>
    数字1：${num1}<br>
    数字2：${num2}<br>
    ${num1} ${comp(num1, num2)? string(">", "<")} ${num2}

</body>

</html>