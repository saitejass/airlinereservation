<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.airline.model.Flight" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Available Flights</title>
    <link rel="stylesheet" href="static/css/style.css">
</head>
<body>
    <h2>Available Flights</h2>
    <table>
        <tr>
            <th>Flight Number</th>
            <th>Origin</th>
            <th>Destination</th>
            <th>Departure Time</th>
            <th>Arrival Time</th>
            <th>Price</th>
            <th>Action</th>
        </tr>
        <%
            List<Flight> flights = (List<Flight>) request.getAttribute("flights");
            if (flights != null) {
                for (Flight flight : flights) {
        %>
        <tr>
            <td><%= flight.getFlightNumber() %></td>
            <td><%= flight.getOrigin() %></td>
            <td><%= flight.getDestination() %></td>
            <td><%= flight.getDepartureTime() %></td>
            <td><%= flight.getArrivalTime() %></td>
            <td><%= flight.getPrice() %></td>
            <td>
                <form action="ReservationController?action=book" method="post">
                    <input type="hidden" name="flightId" value="<%= flight.getId() %>">
                    <button type="submit">Book</button>
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
