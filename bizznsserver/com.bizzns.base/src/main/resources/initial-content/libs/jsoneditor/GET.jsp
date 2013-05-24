<%@page session="false" contentType="text/html; charset=utf-8" %><%
%><%@page import="java.io.*,
                  java.net.*,
				  javax.jcr.*,
				  org.apache.sling.api.resource.*,
                  utils.*" 
%>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8">

    <title>JSON Editor Online - view, edit and format JSON online</title>

    <!--

    @file index.html

    @brief
    JSON Editor Online is a web-based tool to view, edit, and format JSON.
    It shows your data side by side in a clear, editable treeview and in
    a code editor.

    Supported browsers: Chrome, Firefox, Safari, Opera, Internet Explorer 8+

    @license
    This json editor is open sourced with the intention to use the editor as
    a component in your own application. Not to just copy and monetize the editor
    as it is.

    Licensed under the Apache License, Version 2.0 (the "License"); you may not
    use this file except in compliance with the License. You may obtain a copy
    of the License at

    http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
    WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
    License for the specific language governing permissions and limitations under
    the License.

    Copyright (C) 2011-2013 Jos de Jong, http://jsoneditoronline.org

    @author   Jos de Jong, <wjosdejong@gmail.com>
    @date     2013-03-08
    -->

    <meta name="description" content="JSON Editor Online is a web-based tool to view, edit, and format JSON. It shows your data side by side in a clear, editable treeview and in a code editor.">
    <meta name="keywords" content="json, editor, formatter, online, format, parser, json editor, json editor online, online json editor, javascript, javascript object notation, tools, tool, json tools, treeview, open source, free, json parser, json parser online, json formatter, json formatter online, online json formatter, online json parser, format json online">
    <meta name="author" content="Jos de Jong">

    <link rel="shortcut icon" href="favicon.ico">

    <link rel="stylesheet" type="text/css" href="/libs/jsoneditor/app-min.css">
    <link rel="stylesheet" type="text/css" href="/libs/jsoneditor/lib/jsoneditor/jsoneditor-min.css">
    <!-- TODO: droid font
        <link href='http://fonts.googleapis.com/css?family=Droid+Sans+Mono' rel='stylesheet' type='text/css'>
    -->

    <script type="text/javascript" src="/libs/jsoneditor/lib/jsoneditor/jsoneditor-min.js"></script>
    <script type="text/javascript" src="/libs/jsoneditor/lib/ace/ace-min.js"></script>
    <script type="text/javascript" src="/libs/jsoneditor/app-min.js"></script>
</head>

<body>

<div id="header">

 
    <div id="menu">
      
        <ul>
					<li class="">
						<a href=".edit.html">Home</a>
					</li> 
					<li class="">
						<a href="/system/console">Console</a>
					</li> 
            <li>
                <a id="clear" title="Clear contents">Clear</a>
            </li>
            <li>
                <a id="open" title="Open file from disk">
                    Open
                    <span id="openMenuButton" title="Open file from disk or url">
                    &#x25BC;
                    </span>
                </a>
                <ul id="openMenu">
                    <li>
                        <a id="menuOpenFile" title="Open file from disk">Open&nbsp;file</a>
                    </li>
                    <li>
                        <a id="menuOpenUrl" title="Open file from url">Open&nbsp;url</a>
                    </li>
                </ul>
            </li>
            <li>
                <a id="save" title="Save file to disk">Save</a>
            </li>             
        </ul>
    </div>
 
   

    <!-- TODO: info, links, faq -->
    <!--
  <div class="info" style="display:none;">
    JSON, or JavaScript Object Notation, is a lightweight text-based open standard
    designed for human-readable data interchange. It is derived from the JavaScript
    scripting language for representing simple data structures and associative arrays,
    called objects. Despite its relationship to JavaScript, it is language-independent,
    with parsers available for most languages.
    The JSON format was originally specified by Douglas Crockford, and is described
    in RFC 4627. The official Internet media type for JSON is application/json.
    The JSON filename extension is .json.
    The JSON format is often used for serializing and transmitting structured data
    over a network connection. It is used primarily to transmit data between a server
    and web application, serving as an alternative to XML.
    <br><br>
    From <a target="_blank" href="http://en.wikipedia.org/wiki/Json">Wikipedia</a>
  </div>

  <div class="links" style="display:none;">
    <a target="_blank" href="http://json.org/">http://json.org/</a><br>
    <a target="_blank" href="http://en.wikipedia.org/wiki/Json">http://en.wikipedia.org/wiki/Json</a><br>
  </div>

  <div class="faq" style="display:none;"></div>
    -->
</div>

<div id="auto">
    <div id="contents">
        <div id="jsonformatter"></div>

        <div id="splitter">
            <div id="buttons">
                <div>
                    <button id="toEditor" class="convert" title="Code to editor">
                        <div class="convert-right"></div>
                    </button>
                </div>
                <div>
                    <button id="toCode" class="convert" title="Editor to code">
                        <div class="convert-left"></div>
                    </button>
                </div>
            </div>
            <div id="drag">
            </div>
        </div>

        <div id="jsoneditor"></div>

        <script type="text/javascript">
            app.load();
            app.resize();
        </script>


    </div>
</div>

<div id="footer">

</div>

<script type="text/javascript">
    app.resize();
</script>

<script type="text/javascript" src="/libs/jsoneditor/lib/jsonlint/jsonlint.js"></script>

</body>
</html>