Closely follows: https://dvc.org/doc/get-started

```
git init
dvc init
git commit -m "Initialize DVC project"
```

Initialize git and dvc, create `.dvc/config`.

Setup 'local remote' for demoing purpose

```
mkdir ../dvc_demo_remove
dvc remote add -d myremote ../dvc_demo_remove
```

Download dataset:

```
mkdir data/
dvc get https://github.com/iterative/dataset-registry \
        get-started/data.xml -o data/data.xml
```

Add file to DVC and subsequently created files to git.

```
dvc add data/data.xml

git add data/data.xml.dvc data/.gitignore
git commit -m "Add raw data to project"
```