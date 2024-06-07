package com.airline.controller;

import com.airline.model.Flight;
import com.airline.service.FlightService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/FlightController")
public class FlightController extends HttpServlet {
    private FlightService flightService = new FlightService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Flight> flights = flightService.getAllFlights();
           
