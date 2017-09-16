#!/usr/bin/env ruby

require 'sinatra'
require 'sinatra/base'
require 'sinatra/reloader'
require 'json'
require 'better_errors'
require 'date'

set :bind, '0.0.0.0'

configure :development do
	use BetterErrors::Middleware
	BetterErrors.application_root = __dir__
end

content =
    { :date => Date.today,
      :author => '<your name here>',
      :title => 'NGINX Microservices Network Architecture Training',
      :body => 'Join us Friday, September 9 for "Microservice Network Architectures with NGINX Plus".

In this one-day, hands-on training, you will explore the three architecture models in the NGINX Microservices Reference Architecture: the Proxy Model, Router Mesh Model, and Fabric Model. In hands-on labs, you will create an NGINX proxy to a microservices application. You’ll then do centralized load balancing in the Router Mesh model. Finally, you’ll do container-to-container load balancing using the Fabric Model.

Audience: This class is for experienced developers and NGINX admins who understand microservices architectures.<br/>What: A one-day, hands-on, team-based learning experience with NGINX Chief Architect Chris Stetson and the NGINX professional services team. Participants will explore three microservice network architectures through in-class lectures and hands-on activities.

You will:

<ul class="bulletlist"><li>Learn how to deploy NGINX Plus as an HTTP gateway to your microservices application</li><li>Deploy NGINX Plus to act as a centralized load balancer for interprocess communication between their microservices</li><li>Deploy NGINX Plus at the container level to create a fabric network with persistent SSL connections between microservices</li><li>Collaborate and connect with other participants</li><li>Get your questions answered by experts from NGINX</li></ul>

<p>Prerequisites/Requirements:</p>
<ul class="bulletlist"><li>Solid understanding of webserver functionality</li><li>Experience working with NGINX .conf files</li><li>Working knowledge of NGINX proxy and load balancing capabilities</li><li>Comfortable working on the command line in a UNIX environment</li><li>Attendees should bring a wifi-enabled laptop to the class</li></ul>'
    }

before do
  content_type 'application/json'
end

get '/' do
	"Sinatra is up!"
end

# Send back content
get '/content' do
  content.to_json
end
