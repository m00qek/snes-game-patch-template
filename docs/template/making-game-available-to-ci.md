# Making your personal backup ROM available to the CI
---

In order to create a patch first it is needed to assemble the code and apply it
to a legit backup of the original game. As these backups are of personal use to
the owner of the cartridge they cannot be made public available.

This document will walk you through the steps required to allow the CI to
access, though an authenticated channel, you backup ROM and use it to create 
patches.  Don't worry, in this manner is not possible to anyone besides you 
to access your game backup.

## Creating a Dropbox App

[Dropbox][dropbox] is a file hosting service that has a free account with more 
than enough space for you to create an extra backup of you original game ROMs.
The way Dropbox allow machine users, like this repo CI, to access files is 
thought authenticated HTTP requests to users custom Dropbox Apps.

1. Go to the [app creation][create-app] website.
   - 1.1) On `1. Choose an API` select  `Scoped access`
   - 1.2) On `2. Choose the type of access you need` select `App folder`
   - 1.3) On `3. Name your app` type an unique name
   - 1.4) Click on `Create app`

2. On the tab `Settings`
   - 2.1) On the section `OAuth 2` generate a new token that does not expire
   - 2.2) Take note of the generated token, it will be used later

3. On the tab `Permissions`
   - 3.1) Select `file.content.read`
   - 3.2) Click on `Submit`

4. Go to your [Dropbox file vault][files]
   - 4.1) Enter the folder `Apps`
   - 4.2) Enter the folder with the same name as the app you just created
   - 4.3) Upload you backup ROM. It is essential that the name of the file is
     the same as you configured in the variable `GAME` in the 
     [Makefile][makefile] plus the extension `.sfc`. For example, if the `GAME`
     variable contains `TheLastSuper` the ROM needs to be named 
     `TheLastSuper.sfc`

5. Go back to your repository on Github
   - 5.1) Select the tab `Settings`
   - 5.2) On the left bar, click on `Secrets`
   - 5.3) Click on `New repository secret`
   - 5.4) Name it `DROPBOX_TOKEN`
   - 5.5) On `Value` paste the token generated on step `2.2`
   - 5.6) Click on `Add secret`

[dropbox]: https://www.dropbox.com/
[create-app]: https://www.dropbox.com/developers/apps/create
[files]: https://www.dropbox.com/home
[makefile]: ../../Makefile
