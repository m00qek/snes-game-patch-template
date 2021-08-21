# Step by step to release a new version

To release a new version, first make sure your local main branch is sync'd with
the main branch on Github:

```bash
git checkout master
git pull
```

Now run this command:
```
make tag-and-release VERSION=v2.0.0
```

The `make tag-and-release` command creates a git tag with the project's current
version and pushes it to Github. This will trigger a Github Action that
automatically generates a patch an make it available on the `Releases` page.
