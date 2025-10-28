App Name: Trip Fuel Cost Estimator

Description: This Trip Fuel Cost Estimator app helps users estimate the total fuel
cost for a road trip. The user inputs the travel distance(km), vehicle fuel
efficiency(km/l), select fuel type, and the app calculates the estimated fuel cost. It is
designed to provide a simple, clean, and responsive interface for quick calculations
for a road trip.

Inputs → Process → Output:

• Inputs:
• Distance (in kilometers)
• Fuel efficiency (in kilometers per liter)
• Fuel type (selected from a dropdown button: RON95 Subsidized,
RON95, RON97, Diesel, Diesel Euro5)

• Process:
• The app will show the price of fuel per liter based on the selected fuel
type.
• It calculates fuel cost using the formula: Fuel Cost =
( Distance(km) / Fuel Efficiency(km/l) ) x Fuel Price per Liter
• Validation checks that inputs distance and fuel efficiency are not empty
and must be valid numbers.

• Output:
• Displays the estimated fuel cost (in RM) inside a container at the
bottom of the screen.

Widgets Used:
• Text – to display titles, labels, and results.
• TextFormField – for user inputs (distance and efficiency).
• DropdownButtonFormField – to select the fuel type.
• ElevatedButton – for "Calculate Fuel Cost" and "Reset All" actions.
• Row – to align labels and input fields horizontally.
• Column – to arrange sections vertically.
• Container – to display the final result with border and background styling.
• Form – to group input fields and manage validation.

Basic Validation Approach:
• Implemented using a Form widget with a GlobalKey<FormState>.
• Each TextFormField includes a validator function that:
• Checks if the field is empty.
• Verifies that the input is a valid numeric value.
• The app only performs calculation when all fields pass validation.
• Validation errors are shown inline under the input fields.