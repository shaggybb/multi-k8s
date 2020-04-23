# Installation step

### How to get a FREE tier to have $300 for 12 month in Google Console
TBD.

### How to create a Google Kubernetes Engine (GKE)
TBD.

### How to create a encrypted service account file

1. Genereate a JSON key after creating a service account called _travis-deployer_ with Role _Kubernetes Engine Admin_
2. Move it to the root directory with name _service-account.json_ and **DO NOT ADD it to the git repository**
3. Encrypte JSON key file using **TraviCI CLI**
    1. Go the root directory of this repo
    2. run `docker run -it -v $(pwd):/app ruby:2.6 sh` 
    3. In side the docker instance run `travis login`. It will ask you for credentials
       1. Username: *********
       2. Password for USERNAME: *********
       3. (IF ENABLED) Two-factor authentication code for USERNAME:
    4. Create a encrypted file by running `travis encrypt-file service-account.json -r USERNAME/REPO_NAME`
    It will return something like this:
    ```
    encrypting service-account.json for USERNAME/REPO_NAME
    storing result as service-account.json.enc
    storing secure env variables for decryption

    Please add the following to your build script (before_install stage in your .travis.yml, for instance):

        `openssl aes-256-cbc -K $encrypted_9f3b5599b056_key -iv $encrypted_9f3b5599b056_iv -in service-account.json.enc -out service-account.json -d`

    Pro Tip: You can add it automatically by running with --add.

    Make sure to add service-account.json.enc to the git repository.
    Make sure not to add service-account.json to the git repository.
    Commit all changes to your .travis.yml.
    ```
    
