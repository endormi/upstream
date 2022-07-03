# Upstream

BASH script to automatically upstream a forked repo.

## Usage

First you need to generate a personal access token. Follow this [tutorial](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token) and then copy-paste the value to `ACCESS_TOKEN`.

Clone the repository:

```
git clone https://github.com/endormi/upstream.git
```

The script will check the current repository so you should copy the script and place it inside the repository you want to check.

I will maybe add an option to provide an optional argument for a repository so copying the script wouldn't be necessary.

Reason why I made it this way for now, because I doubt many people have just one forked repository that they want to check.

Check [example.sh](https://github.com/endormi/upstream/blob/main/example.sh) (just a quick script) to see how to merge-upstream multiple repositories.
