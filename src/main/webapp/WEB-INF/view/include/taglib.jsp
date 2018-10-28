<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fns" uri="/WEB-INF/tlds/fns.tld" %>

<%--js中请求路径的请求路径前缀--%>
<%--<c:set var="ctx" value="${pageContext.request.contextPath}${fns:getAdminPath()}"/>--%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%--静态资源的路径前缀 --%>
<c:set var="ctxStatic" value="${pageContext.request.contextPath}/static"/>
