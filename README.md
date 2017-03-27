# Capstone Project - *DRMR*

**DRMR** is a mobile journal that will let you easily store and read dreams you've had.

Time spent: **16** hours spent in total

## User Stories

The following **required** functionality is completed:

- [ ] User can create a dream by filling a text form when they open the app
- [ ] User can save metadata about dreams like title (optional) and date (required)
- [ ] User can favorite and unfavorite dreams
- [ ] User can categorize dream by emotion / emoji selector
- [ ] User can search dreams via title, or body text info
- [ ] User can share dream via iOS Share Utility

The following **optional** features are implemented:

- [ ] User can read astrological stats for the given date of dream
- [ ] User can read meanings for keywords in dreams via Machine Learning algorithm
- [ ] User can sync dreams online to keep backed up
- [ ] User can share dreams with other DRMR users
- [ ] User can record dreams via voice clips, instead of text
- [ ] User can dictate dream via microphone (Speech to Text API)


## Wireframes

![Wireframes 1](https://github.com/amesapp/ios-ames-app/blob/master/wireframes-01.JPG?raw=true)
![Wireframes 2](https://github.com/amesapp/ios-ames-app/blob/master/wireframes-02.JPG?raw=true)

## Notes

Describe any challenges encountered while building the app.

## Defining Tables and Columns


### USER TABLE
| ID   | NAME    | LAST_NAME  | USERNAME |    PASSWORD    |
| :--: | :------:| :--------: | :-------:| :------------: |
| INT  | VARCHAR | VARCHAR    | VARCHAR  |    VARCHAR     |
| .    | .       | .          | .        |    .           |
| .    | .       | .          | .        |    .           |

### DREAM TABLE

| ID    |  USER_ID  | TITLE      | CREATED_AT | DESCRIPTION  | IS_FAVORITED |  EMOTION |
| :---: | :--------:| :--------: | :---------:| :----------: | :----------: | :-------:|
| INT   |    FK     | VARCHAR    |  TIMESTAMP | TEXTFIELD    |  BOOL        |  VARCHAR |
| .     |     .     | .          |  .         |   .          |  .           |  .       |
| .     |     .     | .          |  .         |   .          |  .           |  .       |

### COMMENTS

| ID    | CREATED_AT  | USER_ID | DREAM_ID   | description  |
| :---: | :----------:| :-----: | :---------:| :----------: |
| INT   | TIMESTAMP   | FK      |  FK        |  TEXTFIELD   |
| .     | .           | .       |  .         |  .           |
| .     | .           | .       |  .         |  .           |

### COMMENTS

| ID    | USER_ID | DREAM_ID   |
| :---: | :-----: | :---------:|
| .     | .       |  .         |



## License

    Copyright 2017 Ames

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
