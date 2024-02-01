document.addEventListener('DOMContentLoaded', function() {
    // Fetch the visitor count from your API using a GET request
    fetch('https://apigateway-viewcount-63w9whta.an.gateway.dev/viewcount', {
        method: 'POST',  // Specify the POST method
        headers: {
            'Content-Type': 'application/json',
            // Add any additional headers if needed
        },
    })
        .then(response => response.json())
        .then(data => {
            // Update the visitor count on the webpage
            document.getElementById('counter').textContent = data.ViewCount;
        })
        .catch(error => console.error('Error fetching visitor count:', error));
});
