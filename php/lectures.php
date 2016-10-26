<?
    $dom = simplexml_load_file("lectures.xml")
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <title>Lectures</title>
</head>
<body>
    <h1>Lectures</h1>
    <ul>
    <?php
        print("<li>");
        print($lecture->title);
        print("</li>");
    ?>
    </ul>
</body>
</html>
