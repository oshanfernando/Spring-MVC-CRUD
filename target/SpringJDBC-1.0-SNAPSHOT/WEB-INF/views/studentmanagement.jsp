<%--
  Created by IntelliJ IDEA.
  User: Oshan Fernando
  Date: 11/12/2018
  Time: 21:31
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %><html>
<head>
    <title>Student Management</title>

    <script type="text/javascript"
            src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">



</head>
<body>

<h1>Student Management</h1>

<a style="float: right" href="/logout">Log Out</a>

<style type="text/css">
    .form-style-2{
        max-width: 500px;
        padding: 20px 12px 10px 20px;
        font: 13px Arial, Helvetica, sans-serif;
    }
    .form-style-2-heading{
        font-weight: bold;
        font-style: italic;
        border-bottom: 2px solid #ddd;
        margin-bottom: 20px;
        font-size: 15px;
        padding-bottom: 3px;
    }


    .form-style-2 label{
        display: block;
        margin: 0px 0px 15px 0px;
    }
    .form-style-2 label > span{
        width: 100px;
        font-weight: bold;
        float: left;
        padding-top: 8px;
        padding-right: 5px;
    }
    .form-style-2 span.required{
        color:red;
    }
    .form-style-2 .tel-number-field{
        width: 40px;
        text-align: center;
    }
    .form-style-2 input.input-field, .form-style-2 .select-field{
        width: 50%;
    }
    .form-style-2 input.input-field,
    .form-style-2 .tel-number-field,
    .form-style-2 .textarea-field,
    .form-style-2 .select-field{
        box-sizing: border-box;
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        border: 1px solid #C2C2C2;
        box-shadow: 1px 1px 4px #EBEBEB;
        -moz-box-shadow: 1px 1px 4px #EBEBEB;
        -webkit-box-shadow: 1px 1px 4px #EBEBEB;
        border-radius: 3px;
        -webkit-border-radius: 3px;
        -moz-border-radius: 3px;
        padding: 7px;
        outline: none;
    }
    .form-style-2 .input-field:focus,
    .form-style-2 .tel-number-field:focus,
    .form-style-2 .textarea-field:focus,
    .form-style-2 .select-field:focus{
        border: 1px solid #0C0;
    }
    .form-style-2 .textarea-field{
        height:100px;
        width: 50%;
    }
    .form-style-2 input[type=submit],
    .form-style-2 input[type=button]{
        border: none;
        padding: 8px 15px 8px 15px;
        background: #FF8500;
        color: #fff;
        box-shadow: 1px 1px 4px #DADADA;
        -moz-box-shadow: 1px 1px 4px #DADADA;
        -webkit-box-shadow: 1px 1px 4px #DADADA;
        border-radius: 3px;
        -webkit-border-radius: 3px;
        -moz-border-radius: 3px;
    }
    .form-style-2 input[type=submit]:hover,
    .form-style-2 input[type=button]:hover{
        background: #EA7B00;
        color: #fff;
    }


    .form-style-3{
        max-width: 90%;
        padding: 20px 20px 20px 20px;
        font: 13px Arial, Helvetica, sans-serif;
    }
    .form-style-3-heading{
        font-weight: bold;
        border-bottom: 2px solid #ddd;
        margin-bottom: 20px;
        font-size: 20px;
        padding-bottom: 3px;
        color: #777171;
        font-family: "Calibri Light";
        margin-top: 60px;
        margin-left: 20px;
    }

    #tbl {
        font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
        border-collapse: collapse;
        width: 100%;
    }

    #tbl td, #tbl th {
        border: 1px solid #ddd;
        padding: 15px;
    }

    #tbl tr:nth-child(even){background-color: #f2f2f2;}

    #tbl tr:hover {background-color: #ddd;}

    #tbl th {
        padding-top: 12px;
        padding-bottom: 12px;
        text-align: left;
        background-color: #2e5caf;
        color: white;
    }
</style>

<div class="form-style-2">

<div class="form-style-2-heading">Add Student</div>

    <div id="postResultDiv">
        <c:if test="${not empty deleteMsg}">
            <p style='background-color:#42b04e; color:white; padding:20px 20px 20px 20px'>
                ${deleteMsg} <br></p>
        </c:if>
    </div>
        <form:form id="studentForm"  modelAttribute="student">
            <form:input  id="sid" path="sid" type="hidden" class="input-field" name="field1"/>
            <label><span>Name in Full<span class="required">*</span></span><form:input id="name" path="nameinfull" type="text" class="input-field" name="field1"/></label>
            <label><span>Preferred Name <span class="required">*</span></span><form:input id="preferredname" path="preferredname" type="text" class="input-field" name="field2"/></label>
            <label><span>Age <span class="required">*</span></span><form:input path="age" id="age" type="text" class="input-field" name="field3"/></label>
            <label><span>Address <span class="required">*</span></span><form:textarea id="address" path="address" name="field4" class="textarea-field"/></label>
            <label><span>Contact Number <span class="required">*</span></span><form:input id="contact" path="contact" type="text" class="input-field" name="field5"/></label>

            <label><span>Field of Study</span>
                <form:select id="field" name="field6" class="select-field" path="field">
            <option value="1">BSc in IT</option>
            <option value="2">BSc in SE</option>
            <option value="3">BSc in MM</option>
                </form:select></label>


            <label><span> </span>
                <c:if test="${!isedit}">
                    <form:button name="ADD" value="ADD" id="btnAdd">ADD</form:button></label>
                </c:if>

                <c:if test="${isedit}">
                    <form:button name="UPDATE" value="UPDATE" id="btnUpdate">UPDATE</form:button></label>
                </c:if>

        </form:form>

</div>

<div class="form-style-3-heading">Student Results</div>

<div class="form-style-3">

    <table id="tbl">
        <tr>
            <th>Student ID</th>
            <th>Full Name</th>
            <th>Address</th>
            <th>Contact</th>
            <th>Age</th>
            <th>Action</th>
        </tr>

        <c:if test="${not empty studentList}">

            <c:forEach var="stu" items="${studentList}">
                <tr>
                    <td> ${stu.SID}</td>
                    <td> ${stu.NameinFull}</td>
                    <td> ${stu.Address}</td>
                    <td> ${stu.Contact}</td>
                    <td> ${stu.Age}</td>
                    <%--<td align="center"><a href="<c:url value='/edit/${stu.SID}' />"><i class="fas fa-edit"></i></a></td>--%>
                    <td align="center"><a id="btnEdit" href="<c:url value='/edit/${stu.SID}' />">edit</a>
                                        <a id="btnDelete" href="/delete/${stu.SID}">delete</a></td>
                </tr>
            </c:forEach>
        </c:if>

    </table>
</div>

<script type="text/javascript">



    $("#btnAdd").click(function (e) {

        e.preventDefault();
        var dataObject = new Object();

        dataObject.nameinfull = $("#name").val();
        dataObject.preferredname = $("#preferredname").val();
        dataObject.age = $("#age").val();
        dataObject.address = $("#address").val();
        dataObject.contact =  $("#contact").val();
        dataObject.field =  $("#field").val();



        $.ajax({
            type: "POST",
            contentType: "application/json",
            datatype: "json",
            url: "http://localhost:8081/addstudent",
            cache: false,
            async: false,
            data: JSON.stringify(dataObject),

            success : function(response) {

                response = JSON.parse(response);

                if(response.code==="SUCCESS"){
                    $("#postResultDiv").html("<p style='background-color:#42b04e; color:white; padding:20px 20px 20px 20px'>" +
                        "Student Added <br>" +
                        "Preffered  Name : " +
                        dataObject.preferredname + " , Contact : " + dataObject.contact + "</p>");

                }
                if(response.code==="ERROR"){
                    $("#postResultDiv").html("<p style='background-color:#ed6565; color:white; padding:20px 20px 20px 20px'>" +
                        "Failed to add Student <br>" + "</p>");

                }

                console.log(response);
            },
            error : function(e) {
                alert("Error! "+e.toString())
                console.log("ERROR: ", e);
            }
        });
    });


    $("#btnUpdate").click(function (e) {

        e.preventDefault();

        var studentObject = new Object();

        studentObject.sid = $("#sid").val();
        studentObject.nameinfull = $("#name").val();
        studentObject.preferredname = $("#preferredname").val();
        studentObject.age = $("#age").val();
        studentObject.address = $("#address").val();
        studentObject.contact =  $("#contact").val();
        studentObject.field =  $("#field").val();

        $.ajax({

           type:"POST",
            contentType: "application/json",
            datatype: "json",
            url: "http://localhost:8081/update",
            cache: false,
            async: false,
            data: JSON.stringify(studentObject),

            success:function (response) {

               response = JSON.parse(response);

               if(response.code==="SUCCESS"){

                   $("#postResultDiv").html("<p style='background-color:#42b04e; color:white; padding:20px 20px 20px 20px'>" +
                       "Student Updated <br>" + "</p>");

               }
                if(response.code==="ERROR"){
                    $("#postResultDiv").html("<p style='background-color:#ed6565; color:white; padding:20px 20px 20px 20px'>" +
                        "Failed to Update Student <br>" + "</p>");

                }

            },
            error:function (response) {

                $("#postResultDiv").html("<p style='background-color:#ed6565; color:white; padding:20px 20px 20px 20px'>" +
                    "Communication Error ! <br>" + "</p>");
            }
        });

    });


    $("#btnDelete").click(function (e) {

        e.preventDefault();

        alert("works");

        $.ajax({

            type:"GET",
            datatype: "json",
            url: "http://localhost:8081"+$("#btnDelete").attr("href"),

            success: function (response) {

                response = JSON.parse(response);

                if (response.code === "SUCCESS"){

                    console.log("response success");

                    $("#postResultDiv").html("<p style='background-color:#42b04e; color:white; padding:20px 20px 20px 20px'>" +
                        "Student Deleted <br>" + "</p>");
                }
                if (response.code === "ERROR"){

                    $("#postResultDiv").html("<p style='background-color:#ed6565; color:white; padding:20px 20px 20px 20px'>" +
                        "Failed to Delete ! <br>" + "</p>");
                }

            },
            error: function (response) {
                $("#postResultDiv").html("<p style='background-color:#ed6565; color:white; padding:20px 20px 20px 20px'>" +
                    "Communication Error ! <br>" + "</p>");
            }
        });
    });
</script>




</body>
</html>
