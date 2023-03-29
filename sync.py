import os
import shutil
import datetime
import yaml
from github import Github

# set up Github API client
g = Github(os.environ.get('GITHUB_TOKEN'))

# get today's year
today_year = str(datetime.datetime.now().year)

# find all updated .md files with draft=False
changed_files = []
for subdir, _, files in os.walk('.'):
    for file in files:
        if file.endswith('.md'):
            full_path = os.path.join(subdir, file)
            with open(full_path) as f:
                content = f.read()
                try:
                    metadata = yaml.safe_load(content.split('---')[1])
                    if not metadata['draft']:
                        changed_files.append(full_path)
                except:
                    pass

# upload changed files to blogs repository
repo = g.get_repo('kiwi4814/blogs')
posts_folder = os.path.join(repo.get_contents('content').path, 'posts', today_year)
os.makedirs(posts_folder, exist_ok=True)
for file_path in changed_files:
    file_name = os.path.basename(file_path)
    target_path = os.path.join(posts_folder, file_name)

    if repo.get_contents(target_path):
        repo.delete_file(target_path, "Remove old version of {}".format(file_name), repo.get_contents(target_path).sha)

    with open(file_path, 'r') as f:
        file_content = f.read()

    repo.create_file(target_path, "Add {}".format(file_name), file_content)

# log the update
log_path = os.path.join(repo.get_contents('update.log').path)
with open(log_path, 'a') as f:
    f.write("{}: Synced {} file(s)\n".format(datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"), len(changed_files)))
