# Upstream

BASH script to automatically upstream a forked repo.

## Usage

First you need to generate a personal access token. Follow this [tutorial](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token) and then copy-paste the value to `ACCESS_TOKEN`.

Clone the repository:

```
git clone https://github.com/endormi/upstream.git
```

> You have the option to check a global and/or local repository.

Run (check local repository):

```
chmod +x upstream.sh
./upstream.sh
```

Run (check global repository):

Provide the argument in the format of `owner/repository` for example `endormi/upstream`.

```
chmod +x upstream.sh
./upstream.sh owner/repository
```

Check [local_example.sh](https://github.com/endormi/upstream/blob/main/local_example.sh) (just a quick script) to see how to merge-upstream multiple repositories locally.

Check [global_example.sh](https://github.com/endormi/upstream/blob/main/global_example.sh) (just a quick script) to see how to merge-upstream multiple repositories globally.

**NOTE**: Curl request to GitHub API might get rejected due to API rate-limiting (if you use it too many times).
