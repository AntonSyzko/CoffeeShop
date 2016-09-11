<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <jsp:include page="/WEB-INF/views/admin/template/head.jsp"/>
    <meta name="robots" content="noindex,nofollow">
    <meta name="title" content="Coffee Types || Anton Coffee">
    <title>Coffee Types  || Anton Coffee</title>
</head>
<body>

<!-- NAVBAR -->
<jsp:include page="/WEB-INF/views/admin/template/admin_navbar.jsp"/>

<!-- CATEGORIES -->
<div class="container-fluid width">
    <section id="categories">
        <div class="row admin-page">
            <div class="col-xs-12 col-sm-10 col-sm-offset-1 col-md-10 col-md-offset-1 col-lg-10 col-lg-offset-1 col-xl-10 col-xl-offset-1">
                <div class="row section-name text-shadow">
                    <b>
                        <span class="color-brown">Types</span>
                        <c:if test="${fn:length(categories) eq 0}">
                            <span class="color-red"> - empty list!</span>
                            <br>
                            <a href="/admin/add_category" title="Add type ">
                                <button class="btn btn-success" type="submit">ADD</button>
                            </a>
                        </c:if>
                    </b>
                </div>
            </div>

            <c:if test="${fn:length(categories) gt 0}">
                <div class="col-xs-12 col-sm-10 col-sm-offset-1 col-md-10 col-md-offset-1 col-lg-10 col-lg-offset-1 col-xl-10 col-xl-offset-1 full-cart">
                    <table class="table">
                        <tr>
                            <th>Name</th>
                            <td class="hidden-xs"><b>URL</b></td>
                            <td>
                                <b>Action</b>
                                <a href="/admin/add_category" title="Add new Type">
                                    <button class="btn btn-success" type="submit">ADD</button>
                                </a>
                                <a href="/admin/delete_all_categories" title="Delete all types">
                                    <button class="btn btn-danger" type="submit">Delete ALL types</button>
                                </a>
                            </td>
                        </tr>

                        <c:forEach items="${categories}" var="category">
                            <tr>
                                <td>
                                    <a href="/category_${category.url}"
                                       title="Go to Type  ${category.title}">
                                            ${category.title}</a>
                                </td>
                                <td class="hidden-xs">${category.url}</td>
                                <td>
                                    <a href="/admin/view_category_${category.id}"
                                       title="View the type  ${category.title}">
                                        <button class="btn btn-info" type="submit">View</button>
                                    </a>
                                    <a href="/admin/edit_category_${category.id}"
                                       title="Edit the type ${category.title}">
                                        <button class="btn btn-success" type="submit">Edit</button>
                                    </a>
                                    <a href="/admin/delete_category_${category.id}"
                                       title="Delete the Type ${category.title}">
                                        <button class="btn btn-danger" type="submit">Delete</button>
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
