Challenge 1 - To create a 3 tier Infrastructure in Azure, I chose to create it using Terraform (IAC tool)


Three tier infrastructure 

1. Presentation Layer - It handles the incoming user request and displays the result.
2. Application Layer - It contains the business logic and processes user requests recieved from presentation layer. It performs necessay communication with the data layer.
3. Database Layer - It includes the database to store and manage the relational database. 

In the given solution there are 5 files: 
1. main.tf - It defines the Azure Provider and create Resource Group using Terraform. It also creates a virtual network and subnet
2. web.tf - It is responsible for handling user requests and distributing traffic. In Azure, I have used Azure Load Balancer to achieve this.
3. app.tf - It contains the core business logic and processes user requests.
4. db.tf - It is responsible for storing and managing the application’s data.
5. connection.tf - It is responsible for establishing the connectivity between Presentation, Application and Database layers

In the above code, we establish the connections between the layers:

The web tier instances are associated with the load balancer using a backend address pool, allowing traffic to be distributed across them.
The application tier instances are provisioned, and a virtual machine extension is added to install the MySQL client for database connectivity.
The database tier is provisioned with Azure Database for MySQL, and a virtual network rule is created to allow access from the application tier.
Another virtual machine extension is added to configure the database connection string in the application tier, replacing <YOUR_DATABASE_CONNECTION_STRING> with the actual connection string.
By implementing these connections, the web tier forwards user requests to the application tier, which, in turn, communicates with the database tier for data retrieval and storage. This establishes the 3-tier architecture and enables the flow of information across the layers.


