ALTER DATABASE [CheckProject]
SET SINGLE_USER WITH ROLLBACK IMMEDIATE


ALTER DATABASE [CheckProject] MODIFY NAME = [CheckProject-Test]


ALTER DATABASE [CheckProject-Test]
SET MULTI_USER WITH ROLLBACK IMMEDIATE