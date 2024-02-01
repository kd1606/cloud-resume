# Cloud Resume 

### The Cloud Resume Challenge is designed as way for newcomers to cloud to get hands on experience with some of the technologies that are commonly used in the day to day of DevOps Engineers.

The primary goal of the Cloud Resume Challenge is for participants to build a static personal resume website and deploy it using cloud services.

For the purpose of this project, I downloaded a readymade template by CeeVee. For the purpose of the readme, I will refer to it as my Frontend which contains an HTML and CSS file. 

The frontend is uploaded on google cloud storage as a bucket. I also made the URL public so as to access it on the web. For the purpose of the project, you need to purchase a suitable domain which I haven't yet. This won't necessary affect the project, you just have to use the GCS bucket URL to see it on the web. 

Make sure to setup a HTTPS load balancer for security , beware as this will have a small cost to provision. 

Setup a Google Cloud Firestore Database in Native mode in order to store your Visitor counter of your website. Derive the necessary values of your database like the Collection ID, Document ID, Field name, Field type and Field Value:
* Collection ID: "WebsiteData"
* Document ID: "ViewingData"
* Field name, type, value": "ViewCount", "number", "0".

Before proceeding with this step, I took a small tutorial on publishing a "Hello World" function on cloud run. This gave me an idea on how to deploy my API and host it on Cloud Run. 
* When a user visits the website, we first need to increment the view count in the database and then retrieve the incremented value and return it in JSON format to the website.

When deployed, copy the URL provided on the Cloud Run instance. If you just enter this URL in your browser you will get a “Method Not Allowed” message. This is because we chose a POST method and by doing this, you are sending a GET request instead. Therefore, to ensure it is working, we can use Postman. Enter your url in the Requst URL field, change the method to POST and press Send. You should see the JSON response with the View Count appear below.

The most trouble I had in this section was with the CORS error. This is because while creating the API Gateway, I completed yet another tutorial by Google, it is a continuation of the previous Cloud Run tutorial, so you can easily re-sue that. 

Following the tutotial would allow you to obtain the openapi template file ready to go, which you can use to create a config and the gateway using gcloud.Change the config file to work for the View Count function. This is pretty simple, all we need to do is change the URLs from the tutorial and change the GET method to POST.

In order to fix the CORS error, you need to redeploy your cloud run API. Follow the steps to fix the CORS error in your Flask API: 
* Import the CORS and cross_origin methods from flask_cors library. 
* After initialising our app, add some CORS config settings to it.
* Finally change the route slightly by also adding an option method and add the cross_origin decorator.
* Similarly, allowing CORS in the API gateway just requires a few lines of code in the config file. 
* I have added the final script itself on the backend section of the project. The above steps is for explanation. 

By the end of this, you should have a working API, next step is to use Javascript to call this API in your website and return the view count to the visitor. Make sure you define the POST method. 