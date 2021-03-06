This quickstart will get you going with the GroupDocs Ruby sample app on Heroku.

## Prerequisites

* A Heroku user account with [Heroku toolbelt](https://toolbelt.heroku.com/) installed on the local workstation.
* Add GroupDocs addon to your app.

## Add GroupDocs Add-on to your app

	:::term
    $ heroku addons:add groupdocs
    -----> Adding groupdocs to sharp-mountain-4006... done

## Clone the sample repository to your local folder

	:::term
	$ git clone git://github.com/liosha2007/groupdocs-heroku-examples-for-ruby.git

## Store Your App in Git

    :::term
	$ cd groupdocs-heroku-examples-for-ruby
    $ git init
    $ git add .
    $ git commit -m "init"

## Deploy to Heroku/Cedar

Create the app on the Cedar stack:

    :::term
    $ heroku create --stack cedar
    Creating stark-sword-399... done, stack is cedar
    http://stark-sword-399.herokuapp.com/ | git@heroku.com:stark-sword-399.git
    Git remote heroku added

Deploy your code:

    :::term
    $ git push heroku master

## Live running app
This sample app is also running live on Heroku. To view and try, please open [http://groupdocs-heroku-ruby-examples.herokuapp.com/](http://groupdocs-heroku-ruby-examples.herokuapp.com/).

## To deploy project locally follow this instructions:

* Download and install Ruby.
* Open console and run: `git clone https://github.com/liosha2007/groupdocs-heroku-examples-for-ruby`
* Install Sinatra `gem install sinatra`
* Install Liquid `gem install liquid`
* Install DevKit [https://github.com/downloads/oneclick/rubyinstaller/DevKit-tdm-32-4.5.2-20111229-1559-sfx.exe](https://github.com/downloads/oneclick/rubyinstaller/DevKit-tdm-32-4.5.2-20111229-1559-sfx.exe)
* Install GroupDocs `gem install groupdocs`
* cd to project directory and run: `ruby main.rb -p 8080`
* Now open your browser and go to http://localhost:8080/

###[Sign, Manage, Annotate, Assemble, Compare and Convert Documents with GroupDocs](http://groupdocs.com)
1. [Sign documents online with GroupDocs Signature](http://groupdocs.com/apps/signature)
2. [PDF, Word and Image Annotation with GroupDocs Annotation](http://groupdocs.com/apps/annotation)
3. [Online DOC, DOCX, PPT Document Comparison with GroupDocs Comparison](http://groupdocs.com/apps/comparison)
4. [Online Document Management with GroupDocs Dashboard](http://groupdocs.com/apps/dashboard)
5. [Doc to PDF, Doc to Docx, PPT to PDF, and other Document Conversions with GroupDocs Viewer](http://groupdocs.com/apps/viewer)
6. [Online Document Automation with GroupDocs Assembly](http://groupdocs.com/apps/assembly)

###Created by [GroupDocs Marketplace Team]( http://groupdocs.com/marketplace/ ).