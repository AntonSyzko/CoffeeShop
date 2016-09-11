<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <jsp:include page="/WEB-INF/views/admin/template/head.jsp"/>
    <meta name="robots" content="noindex,nofollow">
    <meta name="title" content="Staff || Anton Coffee">
    <title>Staff || Anton Coffee</title>
</head>
<body>

<!-- NAVBAR -->
<jsp:include page="/WEB-INF/views/admin/template/admin_navbar.jsp"/>

<!-- PERSONS -->
<div class="container-fluid width">
    <section id="persons">
        <div class="row admin-page">
            <div class="col-xs-12 col-sm-10 col-sm-offset-1 col-md-10 col-md-offset-1 col-lg-10 col-lg-offset-1 col-xl-10 col-xl-offset-1">
                <div class="row section-name text-shadow">
                    <b>
                        <span class="color-brown">Staff</span>
                        <c:if test="${fn:length(users) eq 0}">
                            <span class="color-red"> - empty list!</span>
                            <br>
                            <a href="/admin/add_user" title="Add new  employee">
                                <button class="btn btn-success" type="submit">Add</button>
                            </a>
                        </c:if>
                    </b>
                </div>
            </div>

            <c:if test="${fn:length(users) gt 0}">
                <div class="col-xs-12 col-sm-10 col-sm-offset-1 col-md-10 col-md-offset-1 col-lg-10 col-lg-offset-1 col-xl-10 col-xl-offset-1 full-cart">
                    <table class="table">
                        <tr>
                            <th>Role</th>
                            <th>Name</th>
                            <td class="hidden-xs"><b>Phone</b></th>
                            <td>
                                <b>Action</b>
                                <a href="/admin/add_user" title="Add new employee">
                                    <button class="btn btn-success" type="submit">Add</button>
                                </a>
                                <a href="/admin/delete_all_users" title="Delete all managers">
                                    <button class="btn btn-danger" type="submit">Delete all</button>
                                </a>
                            </td>
                        </tr>

                        <c:forEach items="${users}" var="user">
                            <tr>
                                <td>
                                    <c:choose>
                                        <c:when test="${user.role eq admin_role}">
                                            <b><span class="color-red">${user.role.description}</span></b>
                                        </c:when>
                                        <c:when test="${user.role eq manager_role}">
                                            <span class="color-green">${user.role.description}</span>
                                        </c:when>
                                        <c:otherwise>
                                            ${user.role.description}
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>${user.name}</td>
                                <td class="hidden-xs">${user.phone}</td>
                                <td>
                                    <a href="/admin/view_user_${user.id}"
                                       title="View  info ${user.name}">
                                        <button class="btn btn-info btn-mg" type="submit">View</button>
                                    </a>
                                    <a href="/admin/edit_user_${user.id}"
                                       title="Edit manager info ${user.name}">
                                        <button class="btn btn-success btn-mg" type="submit">Edit</button>
                                    </a>
                                    <a href="/admin/delete_user_${user.id}"
                                       title="Delete info about ${user.name}">
                                        <button class="btn btn-danger btn-mg" type="submit">Delete</button>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </c:if>
        </div>
    </section>
</div>
</body>
</html>
