<a name="readme-top"></a>

<div align="center">
  <h1><b> 🎰 VR-WORLD API 👣 </b></h1>
</div>

<!-- TABLE OF CONTENTS -->

# 📗 Table of Contents

- [📗 Table of Contents](#-table-of-contents)
- [🪮 VR-WORLD API ](#-vr-world-api-)
- [🛠 Built With ](#-built-with-)
  - [📌 Tech Stack ](#-tech-stack-)
- [🗝 Key Features ](#-key-features-)
- [📑 Documentation ](#-documentation-)
- [💻 Getting Started ](#-getting-started-)
  - [Prerequisites](#prerequisites)
  - [Setup](#setup)
  - [Usage](#usage)
  - [Run tests](#run-tests)
- [🧑🏽‍💻 Authors ](#-authors-)
- [🔭 Future Features ](#-future-features-)
- [🤝 Contributing ](#-contributing-)
- [⭐️ Show your support ](#️-show-your-support-)
- [🙏 Acknowledgments ](#-acknowledgments-)
- [📝 License ](#-license-)

<!-- PROJECT DESCRIPTION -->

# 🪮 VR-WORLD API <a name="about-project"></a>

### _Unlocking Virtual Reality Experiences with Ease!_

VR-WORLD API is a powerful application built using Rails, designed exclusively for developers and enthusiasts who want to integrate virtual reality experiences into their own applications or platforms. <br> 

With VR-WORLD API, you can seamlessly access and leverage our extensive collection of virtual reality content and functionalities.


# 🛠 Built With <a name="built-with"></a>

## 📌 Tech Stack <a name="tech-stack"></a>

| Domain | Tech Stack |
|--------|--------|
| Server | <a href="https://rubyonrails.org/">Ruby on Rails</a> |
| Database | <a href="https://www.postgresql.org/">PostgreSQL</a> |
| Testing Framework | <a href="https://github.com/rspec/rspec-rails">RSpec Rails</a> |
| Authentification | <a href="https://github.com/heartcombo/devise#getting-started">Devise, JWT</a> |
| Documentation | <a href="https://github.com/CanCanCommunity/cancancan#installation">RSwag</a> | 

<p align="right">(<a href="#readme-top">back to top</a>)</p>
<!-- Features -->

# 🗝 Key Features <a name="key-features"></a>

- GET studios
- GET studio
- POST studio
- DELETE studio
- GET reservations
- POST reservation
- User can sign up
- User can log in
- User can log out


<p align="right">(<a href="#readme-top">back to top</a>)</p>
<!-- DOCUMENTATION -->

# 📑 Documentation <a name="documentation"></a>

### You can learn more about our API on this 👉 [Live documentation](https://vr-world-app.onrender.com/api-docs/index.html)

<p align="right">(<a href="#readme-top">back to top</a>)</p>
<!-- GETTING STARTED -->

# 💻 Getting Started <a name="getting-started"></a>

To get a local copy up and running, follow these steps.

## Prerequisites

In order to run this project you need:

- **Ruby 3.2.2** installed

- **Rails** installed

Run this command to install **Rails**

```sh
 gem install rails
```
## Setup

Clone this repository to your desired folder:

```sh
  cd my-folder
  git clone git@github.com:rica213/vr-world.git
```

To install dependencies, run:

```sh
bundle install
```

A **secret_key_base** is required to run the Devise

Run this command in the bash terminal to generate it:

```sh
EDITOR="mate --wait" bin/rails credentials:edit
```

**Set up the database** <br>

A _database.yml_ file is required to use database

Here are the steps to be followed to create one

1- Copy the file **database_sample.yml** located in the directory **_vr-world/config_** <br>
2- Rename your copy of **database_sample.yml** into **database.yml** <br>
3- Make necessary configuration following the instructions provided in the file according to your database configuration

To create the database, run:

```sh
rails db:create
```
To create the schema, run:

```sh
rails db:migrate
```

## Usage

To run the project, execute the following command:

Example command:

```sh
  rails server
```

## Run tests

To run tests, run the following command:

```sh
  rspec
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- AUTHORS -->

# 🧑🏽‍💻 Authors <a name="authors"></a>

🫠 **Clarielle Larissa 🇲🇬**

- GitHub: [@rica213](https://github.com/rica213)
- Twitter: [@alc3and](https://twitter.com/alc3and)
- LinkedIn: [Clarielle Larissa](https://linkedin.com/in/larissa-clarielle)

😁 **Shaaibu Suleiman 🇳🇬**

- GitHub: [@shaaibu7](https://github.com/shaaibu7)
- Twitter: [@SuleimanShaaibu](https://twitter.com/SuleimanShaaibu)
- LinkedIn: [Shaaibu Suleiman](https://linkedin.com/in/shaaibusuleiman)

😎 **Samuel Amankwaa-Frempong 🇬🇭**

- GitHub: [@frempongdev](https://github.com/frempongdev)
- Twitter: [@knobaddy](https://twitter.com/knobaddy)
- LinkedIn: [Frempong](https://linkedin.com/in/frempongdev)

🤓 **Ambrose Kibet 🇰🇪**

- GitHub: [@ambrose-kibet](https://github.com/ambrose-kibet)
- Twitter: [@ambrose_kibet](https://twitter.com/ambrose_kibet)
- LinkedIn: [Ambrose Kibet](https://linkedin.com/in/ambrose-kibet)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FUTURE FEATURES -->

# 🔭 Future Features <a name="future-features"></a>

  - GET reservation
  - UPDATE reservation
  - DELETE reservation
  - UPDATE studio
  
<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->

# 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- SUPPORT -->

# ⭐️ Show your support <a name="support"></a>

### Show Your Support for VR-WORLD API!

As a platform dedicated to bringing you the best VR experiences, we greatly value your support.<br>

Here are a few ways you can show your enthusiasm and help us spread the word about VR-WORLD:<br>

#### 🗣️ Spread the Word: Share your VR-WORLD experience with friends, family, and colleagues.
#### 📲 Engage on Social Media: Follow us on our social media channels and actively engage with our posts.
#### ✍🏻 Provide Feedback: We value your input and want to continuously enhance the VR-WORLD experience.
#### ⭐️⭐️⭐️⭐️ Star the repository: Star is our currency 💸

Thank you for your support and for being a part of this journey! ❤️

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGEMENTS -->

# 🙏 Acknowledgments <a name="acknowledgements"></a>

We would like to thank: 
- Microverse
- Code Reviewers

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->

# 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
