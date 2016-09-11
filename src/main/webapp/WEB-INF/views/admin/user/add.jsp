<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <jsp:include page="/WEB-INF/views/admin/template/head.jsp"/>
    <meta name="robots" content="noindex,nofollow">
    <meta name="title" content="New employee || Anton Coffee">
    <title>New employee || Anton Coffee</title>
</head>
<body>

<!-- NAVBAR -->
<jsp:include page="/WEB-INF/views/admin/template/admin_navbar.jsp"/>

<!-- ADD PERSON -->
<div class="container-fluid width">
    <section id="user">
        <div class="row admin-page">
            <div class="col-xs-12 col-sm-10 col-sm-offset-1 col-md-10 col-md-offset-1 col-lg-10 col-lg-offset-1 col-xl-10 col-xl-offset-1">
                <div class="row section-name text-shadow">
                    <b>
                        <span class="color-green">New </span>
                        <span class="color-brown">employee</span>
                    </b>
                </div>
            </div>

            <div class="col-xs-12 col-sm-10 col-sm-offset-1 col-md-10 col-md-offset-1 col-lg-10 col-lg-offset-1 col-xl-10 col-xl-offset-1 full-cart">
                <form action="/admin/save_user" method="post">
                    <table class="table">
                        <tr>
                            <th>Name:</th>
                            <td>
                                <input class="input-order" type="text" name="name"
                                       placeholder="Enter name"
                                       minlength="2" maxlength="50" required>
                            </td>
                        </tr>
                        <tr>
                            <th>Role:</th>
                            <td>
                                <select class="input-order" name="role">
                                    <c:forEach items="${roles}" var="role">
                                    <option value="${role.id}">${role.description}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>Login:</th>
                            <td>
                                <input class="input-order" type="text" name="username" pattern="[A-Za-z0-9_]{5,50}"
                                       placeholder="Enter login, format(A-Z, a-z, 0-9, _)"
                                       minlength="5" maxlength="50" required>
                            </td>
                        </tr>
                        <tr>
                            <th>Password:</th>
                            <td>
                                <input class="input-order" type="text" name="password" pattern="[A-Za-z0-9]{6,50}"
                                       placeholder=" Enter password, format (A-Z, a-z, 0-9)"
                                       minlength="6" maxlength="50" required>
                            </td>
                        </tr>
                        <tr>
                            <th>Email:</th>
                            <td>
                                <input class="input-order" type="email" name="email" pattern="[A-Za-z0-9_.@]{5,50}"
                                       placeholder=" Enter email , format (A-Z, a-z, 0-9, _, ., @)"
                                       minlength="5" maxlength="50" required>
                            </td>
                        </tr>
                        <tr>
                            <th>Phone:</th>
                            <td>
                                <input id="phone" class="input-order" type="text" name="phone"
                                       placeholder=" Enter phone" required>
                            </td>
                        </tr>
                        <tr>
                            <th>Vkontakte:</th>
                            <td>
                                <input class="input-order" type="text" name="vkontakte" pattern="[a-z0-9_/.]{5,50}"
                                       placeholder=" Enter VKontakte address, format (a-z, 0-9, _, /, .)"
                                       minlength="5" maxlength="50">
                            </td>
                        </tr>
                        <tr>
                            <th>Facebook:</th>
                            <td>
                                <input class="input-order" type="text" name="facebook" pattern="[a-z0-9_/.]{5,50}"
                                       placeholder=" Enter facebook address, format (a-z, 0-9, _, /, .)"
                                       minlength="5" maxlength="50">
                            </td>
                        </tr>
                        <tr>
                            <th>Skype:</th>
                            <td>
                                <input class="input-order" type="text" name="skype" pattern="[A-Za-z0-9_.]{5,50}"
                                       placeholder=" Enter Skype login, format (A-Z, a-z, 0-9, _, .)"
                                       minlength="5" maxlength="50">
                            </td>
                        </tr>
                        <tr>
                            <th>Description:</th>
                            <td>
                                <textarea class="input-order textarea" type="text" name="description"
                                          placeholder=" Enter employee description"
                                          maxlength="500"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <button class="btn btn-success" type="submit">Add user</button>
                                <button class="btn btn-info" type="reset">Reset</button>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </section>
</div>
</body>
</html>
