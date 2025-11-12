Step how to working with this project automation system
-get code from the repo and using the command git clone and past the url code
-cd to the foder project like automation-contract
-open with vs code 
-open the library py -m venv or python  -m venv depend on your computer
-open the library activate  this command venv/Script/activate
-install the library flask by command pip install -r requirements.txt
-if you want to the dabase table go the foder structure app/static/database and copy the the database automation_system_db.sql;
-go to xampp and create the database name automation_system_db; and import the database copy 
-The last step run the project by command py run.py or python run.py

-click on the link output copy or ctrl + mouse click show on the browser

folder structure project 
automation-contract/
│
├── app/                     # Main Flask application (routes, models, templates, static files)
│
├── migrations/              # Flask-Migrate database migration files
│
├── scripts/                 # Custom scripts or automation helpers
│
├── venv/                    # Python virtual environment (auto-created, not versioned)
│
├── .env                     # Environment variables configuration file
│
├── .gitignore               # Files and folders to be ignored by Git
│
├── docker-compose.yml       # Docker Compose setup for containerized environment
│
├── Dockerfile               # Instructions for building the Docker image
│
├── README.md                # Project documentation file
│
├── requirements.txt         # Python dependencies list
│
└── run.py                   # Flask application entry point
