<?
    ini_set("display_errors", TRUE);
?>

<html>
<head>
<title></title>
</head>
<body>
    <h1>Thanks for registering, <?= $_POST["name"] ?>!
    <br />
    <b>Gender:</b> <?= $_POST["gender"] ?>
    <br />
    <? if (isset($_POST["captain"])): ?>
    <b>Captain:</b> YES!
    <? endif ?>
</h1>
</body>
</html>
