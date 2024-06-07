<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.airline.model.Reservation" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My Reservations</title>
    <link rel="stylesheet" href="static/css/style.css">
</head>
<body>
    <h2>My Reservations</h2>
    <table>
        <tr>
            <th>Reservation ID</th>
            <th>Flight Number</th>
            <th>Reservation Date</th>
            <th>Status</th>
            <th>Action</th>
        </tr>
        <%
            List<Reservation> reservations = (List<Reservation>) request.getAttribute("reservations");
            if (reservations != null) {
                for (Reservation reservation : reservations) {
        %>
        <tr>
            <td><%= reservation.getId() %></td>
            <td><%= reservation.getFlightId() %></td>
            <td><%= reservation.getReservationDate() %></td>
            <td><%= reservation.getStatus() %></td>
            <td>
                <form action="ReservationController?action=cancel" method="post">
                    <input type="hidden" name="reservationId" value="<%= reservation.getId() %>">
                    <button type="submit">Cancel</button>
                </form>
            </td>
        </tr>
        <%
                }
            }
        %>
    </table>
</body>
</html>
