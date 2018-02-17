# Timber

Final project for Craft Academy October 2017 Cohort.

## Description

Timber is a platform to share your photos and content together with your family.  
Once you land on the platform (https://timber-ca.herokuapp.com/), you need to register
(click on `sign up` in the navbar) to use the platform's features.  
The registration process requires you to enter email, first name, password, password confirmation and family name.  
Every user needs to be part of a family to be able to create an album and upload pictures.  
When the registration process is completed you can create a new album(`New album`), edit your profile
data and picture(`Edit profile`), send an invite via email to another user(`Invite`).  
If the invited user accept and complete the registration, he/she will automatically be part of your family
  and will be able to see your already existing albums and create other albums related to the family as well.  
`My albums` are the albums you created and you can add other pictures to it,
 `Shared albums` are the albums accessible by you and all the users that are part of your family.

## Contributors
* Francesco Falchi: https://github.com/NegativeKarma
* Lisa Eriksson: https://github.com/lcegit
* Sophie Sjöberg: https://github.com/sophiesjoberg
* Zuzanna Bienkowska: https://github.com/zuzanna81/

During the project we had help from:
* https://github.com/magnus-thor/
* https://github.com/tochman
* https://github.com/faraznaeem
* https://github.com/diraulo

## Technologies
* Ruby on Rails
* Bootstrap
* Sass
* AWS
* Webpacker
* Paperclip
* Imagemagick
* Devise
* devise_invitable
* Coffee rails
* Lightbox Bootstrap
* SendGrid

## Installation
Download the ZIP file from this repo
Unzip the file and then open it up via your terminal
Run `bundle install`, after run `rails db:create db:migrate`
Run `rails s` and go to http://localhost:3000/

## Testing
* Cucumber
* RSpec
* Pry
* Factory Bot
* Faker
* Launchy
* Selenium
* Shoulda Matchers
* email_spec

### Acceptance test
Acceptance test are written in Cucumber using Capybara and Selenium with Chrome Driver in headless state.

Features are stored in `./features`

To run the acceptance test suite, execute Cucumber in you terminal:

```bash
$ cucumber
```

### Unit tests
Unit test are written in rspec

```bash
$ rspec
```

#### React Components
This project makes use of React components to offer a rich user experience.

Unit tests for React components are stored in `app/javascript/components/tests`

A sample component with a test can look like this:
```javascript
import React, {Component} from "react"
import PropTypes from "prop-types"
class HelloWorld extends Component {
  render () {
    return (
      <div>
        <div>Hello {this.props.greeting}</div>
      </div>
    );
  }
}

HelloWorld.propTypes = {
  greeting: PropTypes.string
};

export default HelloWorld
```

```javascript
import React from 'react';
import HelloWorld from '../HelloWorld';
import Enzyme from 'enzyme';
import Adapter from 'enzyme-adapter-react-16';
import {mount} from 'enzyme'


Enzyme.configure({ adapter: new Adapter() });

let wrapper;

describe('<HelloWorld />', ()=>{
    beforeEach(() => {
        wrapper = mount(<HelloWorld greeting={'Thomas'}/>);
    });

    it('displays contact name', () => {
        expect(wrapper.text()).toContain('Thomas');
    });

});
```

A full list of Jest Matchers can be found on the [Jest reference docs.](https://facebook.github.io/jest/docs/en/expect.html)

#### Active Models
Active Record Models are tested using RSpec (model specs)

We are using Shoulda matchers to test the expected database tables, validations and permissions.
We are also allowing, via validations, the objects created by FactoryBot to be tested
