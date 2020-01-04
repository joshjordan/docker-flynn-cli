## Description

Use as a self-contained Flynn CLI runner. Automatically configures cluster so you can just pass in a Flynn CLI command.

## Usage

Set the appropriate env vars from the `flynn cluster add` command that Flynn gave you when you configured your cluster. These can also be found in your `~/.flynnrc` file. Then, run the container with a flynn subcommand as the docker command.

### Example

If your `flynn cluster add` command was `flynn cluster add -p abc1234 default flynn.myhost.com xyz987`, and you wanted to run `flynn apps` to get a list of your cluster's running apps, you'd do:


```
docker run -e 'PIN=abc1234' -e 'HOSTNAME=flynn.myhost.com' -e 'KEY=xyz987'  -ti joshjordan/flynn-cli 'apps'
```

Output:

```
Cluster "default" added and set as default.
ID                                    NAME
699772a1-95ef-4cda-b785-0d946de50c30  status
94fa8bd1-7838-45ea-8a10-891cbc2808b1  dashboard
d7ccbc5a-028c-4037-aa8f-8ed91584ea2c  taffy
c966571e-4453-4f52-90ad-457876850923  logaggregator
8fe44ac0-6090-4d12-ae01-b6a1d095a4b6  docker-receive
f78c1957-1602-40a9-90da-8126495df95a  gitreceive
75670359-04ad-4a63-88ca-eeadd9070f49  router
eb004e0e-d34b-4ffd-844e-6322641997cc  blobstore
d402628e-d7ea-42a5-b45e-73b60fb2337c  mongodb
b94aa40a-0293-47a4-adbe-a99b30334bdc  mariadb
da15c831-a31d-483a-b58c-a31b02dc45e2  redis
c1d8d0bb-efbc-40a9-9768-ea731e5503d2  discoverd
a6d4e7c6-f0e3-4b95-9aed-d9cad6691d40  flannel
e26eb92e-65e3-4b7f-9ec1-f246b99a744a  postgres
ec5c7c74-040c-408c-b6ed-4f4a5799a82e  controller
```

## Scheduled tasks

You can use `flynn-cli` as an effective replacement for cron within a Flynn cluster. When paired with a scheduling framework (like AWS ECS Scheduled Tasks), you can execute a `flynn run` command easily:

```
docker run -e 'PIN=abc1234' -e 'HOSTNAME=flynn.myhost.com' -e 'KEY=xyz987'  -ti joshjordan/flynn-cli '-a myapp run scraper.sh'
```
