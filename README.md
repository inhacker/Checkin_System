# Project 6
## Ruby on Rails Project

## Roles
* Overall Project Manager:
* Coding Manager:
* Testing Manager:
* Documentation:

## Contributions
Please list who did what for each part of the project.
Also list if people worked together (pair programmed) on a particular section.

## Installation
<h3>1. Installing MySQL</h3>
<p>You need to have MySQL installed and working on your machine before you are able to run the project.
If you dont have it installed, we suggest you follow the second step of this tutorial to install MySQL on your machine.</p>

<a href="https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-on-ubuntu">How to install Apache, MySQL, PHP on Ubuntu</a>

<p>After you install MySQL, you can check that it works my typing <pre><code>$ mysql -u root -p</code></pre> in the terminal and it would prompt you to enter your password. Note that if you did not set a password you can omit the `-p` part and just execute <pre><code>$ mysql -u root </code></pre></p>



<h3>2. Creating a Separate User for This Application</h3>
<h4>Optional</h4>
<p>if you would like, you can create a separate user for this application so the databases on your root account are not used for an application. This is generally a great practice and a must if you are in production servers. However if you are running these on your local machine, this does not make a big difference.</p>

<p>You can follow this tutorial to set that up. Only do the first portion of the Tutorial since we need all the privileges in our user<p>

<a href="https://www.digitalocean.com/community/tutorials/how-to-create-a-new-user-and-grant-permissions-in-mysql">How to Create a New User And Grant Permissions in MySQL</a>

<p>You can test this step my first login out of the root MySQL and then logging in to MySQL using the newly created user</p>
<pre><code>mysql -u &lt;new_user&gt; -p</code></pre>
<p>This will prompt you to enter a password which is the password you set for the new user</p>


<h3>3. Creating a database</h3>
<p>Login to your MySQL (if you created a user, then use that to login, otherwise use root). You can create a database using the following syntax</p>

<pre><code>CREATE DATABASE &lt;database_name&gt; ; </code></pre>

<p>This will create a database called <database_name>, and you can check that by viewing all the databases using this commands</p>
<pre> <code> SHOW DATABASES; </code> </pre>

<p>If your database was there, you can move on to the next step</p>

<h3>4. Making Ruby Work with MySQL</h3>
<p>Install these libraries so that Ruby can communicate with MySQL</p>

<pre> <code>sudo apt-get install libmysql-ruby libmysqlclient-dev</code> </pre>

<h3>5. Install Gems</h3>
<p>In the Gemfile we have specified all the necessary Gems that are required to make Rails work with MySQL. So all you need to do is to install them. You can do that using bundle<p>

<pre><code>bundle install</code></pre>

<p>Note that you have to run the bundle command in the project directory (Where the gemfile resides)</p>

<h3>6. Migrating the Tables</h3>
<p>By now, everything should be ready, so you now can migrate the table definitions that are created for you to the database using rake</p>

<pre><code>rake db:migrate</code></pre>

<p>This command will go to the db/migrate directory and run all the files (their `up` method) on the database and creates the tables<p>

<h2>We are GOOD to go</h2>


## How to Add a Polymer Component
<h3>1. Create your component</h3>
<p>You can create a new Polymer component using this command</p>

<pre><code>rails generate polymer:component &lt;component-name&gt;</code</pre>

<p>This will create a directory in the called &lt;component-name&gt; under <code>app/assets/components/</code> directory. It contains all the necessary files (html, css, js).<p>

<p>Now all you have to do before starting is to include your component in the application manifest file. The application manifest is located at <code>app/assets/components/application.html.erb</code> and you need to add <code>//= require component-name/component-name</code>. This way, your component is included in the files and you can just call it in any view</p>

<a href="https://github.com/alchapone/polymer-rails">Read more about it</a>