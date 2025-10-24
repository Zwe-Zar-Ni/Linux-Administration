# Managing Databases

- Understanding the MySQL configuration files
- Managing MySQL databases
- Setting up a secondary database server

### Backup Database with mysqldump

```bash
mysqldump -u username -p databasename > backup.sql
```

### Restore Database with mysql

```bash
mysql -u username -p databasename < backup.sql
```
