## Accepting Changes to the Course Material

This is the file you're expected to read once you've unpacked your course ZIP file from the instructors.

Please make sure:
a) You rename the top-level directory to `SEBC`
b) You **don't** duplicate the top-level directory, e.g., `./SEBC-master/SEBC`

Getting the path right makes it much easier for us to work through
all repositories at one time.

Once this is done:
* Create an empty repository called SEBC on your GitHub account. Do **not** create a `README.md` file with it.

Once created, click the `Clone or download` button and copy your repo's URL to the system clipboard.

* Initialize your local SEBC directory as a git repository:
  * `$ cd SEBC`
  * `$ git init`
  * `$ git config --global user.name "<your name>"`
  * `$ git config --global user.email "<your email address>"`
  * `$ git remote add upstream <paste in GitHub URL>`
  * `$ git pull upstream master`

This last step synchronizes your git repo to GitHub. If you created files on GitHub with the same name as local ones, however, they will also get overwritten. Be sure you don't have an empty `README.md` file on GitHub!

Finally, you can push your course to GitHub:

* `$ git add .`
* `$ git commit -m "Pushing course materials for Madrid, March 2017 session"`
* `$ git push -u upstream master`

Browse your GitHub version to make sure things transferred.

Also, your instructors may update the course material to address
typos or other errors. To keep things simple, we'll send you updates file(s). You're expected to copy over the file you have, add and commit the change, and all is good.

**Do not** add new or changed files directly to your GitHub repository. Make the changes locally, then push them to your repository. This will avoid confusion over which repo is the most current. For our purposes, your GitHub repo should never be more current than your local one.

---

## tl;dr: Why Use GitHub?

You probably have not used a source-code control system with a training course before. We've incorporated
`git` and GitHub into this one for a few reasons.

The outcomes we care most about include:
* Learning to follow existing technical documentation
* Identifying unfamiliar tools and practices
* Letting systems fail when they are configured improperly
* Using mistakes and failures as learning points and teachable moments.

We think PowerPoint slides do not promote hands-on skills development
and the journalling process we use very well. To track and document
your progress, and even annotate the course material to your liking,
we need a system that leaves the teaching content open to change
and active note-taking.

PowerPoint often force the author to paraphrase or gloss richer
sources of information to fit one slide.  We would rather link to
an existing source you can refer to when you need more context or
information.  There are several benefits:

* The source material remains transparent to the viewer
* One source can be replaced with a more comprehensive or recent one easily
* Errors can be traced to the source
* Errors in interpreting the source are eliminated

In addition, slide formatting is a big cost in traditional course
development. In a subject area focused on skills development in
Hadoop -- an ecosystem with dozens of evolving components, all
moving at different rates of development -- the half-life of that
knowledge is short. Static course material has not only a potential
for maintaining an error for a long time. It can also age out quickly
where the refresh window of content development (say, 6-12 months)
is a big multiple of a software release schedule (quarterly).

To mitigate these risks, traditional course development will set
the software release it covers and provide labs written in controlled
environment. Labs may be vetted to a process that proves the labs
work under a variety of failure scenarios. A solution set may be
used both to prove lab integrity and make it possible for anyone
to 'complete' them.  In the interests of time, the student may be
guided carefully on what to type or click.

These labs tend to show the software works as described. By design
they may sidestep showing how the software can be applied to a
reasonable use case that has not been factored into lab design.

---

## Ok, but why should I have to use GitHub?

In short, so we can create a dialog for your learning.

Using the mechanism for creating Issues, we then have a common medium for:

* Citing errors or obsolete references in the course material (they do exist!)
* Documenting your learning process, including failures
* Notifying collaborators of your progress
* Continuously updating the course material
