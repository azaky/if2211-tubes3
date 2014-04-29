<%-- 
    Document   : index
    Created on : Apr 22, 2014, 3:58:07 PM
    Author     : Toshiba
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <style>
            #keyword-list {
                list-style-type: none;
                padding-left: 0px;
            }
            #keyword-list > li {
                margin-left: 0px;
            }
        </style>
    </head>
    <!--h1>Hello World!</h1>
    <a href="newjsp.jsp">Don't click here</a>
    <div>
        <form action='newjsp.jsp' method="POST">
            <div>
                <label>Username</label>
                <input type="text" name="username"/>
            </div>
            <div>
                <label>Keywords</label>
                <input type="text" name="keywords"/>
            </div>
            <div>
                <label>Humbala</label>
                <input type="number" name="humbala" value/>
            </div>
            <button type="submit">Submit</button>
        </form>
    </div-->

    <div class="container">
        <div class="row">
            <h1 class="page-header">
                Bonbon's tweet sentiment
            </h1>
            <div class="col-md-5">
                <form class="form-horizontal" id="mainform" action="search.jsp" method="GET">
                    <div class="form-group" style="margin-bottom:50px">
                        <label class="col-md-3 control-label" for="_search">Pencarian <i>twitter</i></label>
                        <div class="col-md-8">
                            <div class="input-group">
                                <input name="search" type="text" class="form-control" required>
                                <span class="input-group-btn">
                                    <button class="btn btn-default" type="submit"><span class="glyphicon glyphicon-search"></span></button>
                                </span>
                            </div>
                        </div>
                    </div>
                    <legend>
                        Kata Kunci
                    </legend>
                    <ol id="keyword-list">
                        <li id="1">
                            <div class="form-group">
                                <label class="col-md-3 control-label" id="_keywordname1" contenteditable="true">Kata kunci 1</label>
                                <input type="hidden" class="dummy-keyword" name="keywordname1">
                                <div class="col-md-8">
                                    <input type="text" class="form-control" id="_keyword1" name="keyword1" required>
                                </div>
                                <button type="button" class="close rm-keyword">&times;</button>
                            </div>
                        </li>
                    </ol>
                    <a class="btn btn-default" onclick="addKeyword()">Tambah kata kunci</a>
                </form>
            </div>
        </div>
    </div>

    <script>
        function addKeyword() {
            var $nkey = $("#keyword-list").children().length;
            $nkey++;
            $("#keyword-list").append('<li id="'+$nkey+'"><div class="form-group"><label class="col-md-3 control-label" id="_keywordname'+$nkey+'" contenteditable="true">Kata kunci '+$nkey+'</label><input type="hidden" class="dummy-keyword" name="keywordname'+$nkey+'"><div class="col-md-8"><input type="text" class="form-control" id="_keyword'+$nkey+'" name="keyword'+$nkey+'" required></div><button type="button" class="close rm-keyword">&times;</button></div></li>');
            return false;
        }

        $('#keyword-list').on("click", ".rm-keyword", function() {
            var $key = $(this).closest("li");
            var $child = $key.next();
            var $id = parseInt($key.attr("id"));
            $key.remove();

            while ($child.length > 0) {
                $child.attr("id", $id);
                $child.find("label").attr("id", "_keywordname"+$id);
                $child.find("input.dummy-keyword").attr("name", "keywordname"+$id);
                $child.find("input#_keyword"+($id+1)).attr("name", "keyword"+$id);
                $child.find("input#_keyword"+($id+1)).attr("id", "_keyword"+$id);

                $id++;
                $child = $child.next();
            }
        });

        $('#mainform').submit(function() {
            //copy label to dummy-keyword
            $id = 1;
            $node = $(this).find("#"+$id);
            while ($node.length > 0) {
                $node.find(".dummy-keyword").attr("value", $node.find("#_keywordname"+$id).html());
                
                $id++;
                $node = $(this).find("#"+$id);
            }
            return true;
        });
    </script>
        
</html>
