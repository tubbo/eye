# Eye

Your very own image-sharing service. Born out of the need for an
[imgur][imgur] with less advertising and "community". This is a
bare-bones, simple and fast image sharing service that leverages
[Amazon S3][s3] for file storage and [Amazon CloudFront][cf] for
content delivery.

## Features

- Upload any image, at any quality, of any size
- Mirror an image at a given URL
- Share images on Facebook, Twitter, Reddit or via e-mail

### Optional Features

- Allow anyone to upload an image
- Only allow registered users to see images
- Treat all images as "secret", that is, only users that have the proper
  `Referer-ID` HTTP header will be allowed access

## Setup

Install Ruby 2.1.1 and Redis:

```bash
$ ruby-install ruby 2.1.1
$ brew install redis
```

Clone down the app:

```bash
$ git clone git://github.com/tubbo/eye.git
```

Install gem dependencies with [Bundler][bun]

```bash
$ gem install bundler && bundle install
```

Set up the database:

```bash
$ bundle exec rake db
```

Configure the app with an interactive menu:

```bash
$ bundle exec rake config
```

Start the Redis server and run the following command to get the app
running:

```bash
$ bundle exec rails server
```

## Usage

You can upload images, if you have access, through the web app. 


[imgur]: http://imgur.com
[s3]: http://aws.amazon.com/s3
[cf]: http://aws.amazon.com/cloudfront
