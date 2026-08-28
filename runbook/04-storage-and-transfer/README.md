# Runbook 04 — Use storage and transfer data

Inspect the paths assigned to you:

```bash
echo "$HOME"
ls -la ~/projects
df -h "$HOME" /projects
du -sh "$HOME" ~/projects/* 2>/dev/null
```

- Keep code, virtual environments and small active files in `/home/<user>`.
- Keep datasets, checkpoints and large outputs in `/projects/<project>`, also
  linked as `~/projects/<project>`.
- Neither filesystem is a backup. Keep irreplaceable data off Z6 as well.

Transfer from your own computer:

```bash
scp local-file z6:~/
scp -r local-directory z6:~/projects/YOUR_PROJECT/
rsync -av --progress local-directory/ z6:~/projects/YOUR_PROJECT/local-directory/
```

Do not add `rsync --delete` unless you have inspected both trees and intend to
remove remote files absent from the source.

Next: [Runbook 05](../05-python-environment/README.md).
