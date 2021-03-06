-- CreateTable
CREATE TABLE "article" (
    "id" SERIAL NOT NULL,
    "title" VARCHAR NOT NULL,
    "text" VARCHAR NOT NULL,
    "points" INTEGER NOT NULL DEFAULT 0,
    "creatorId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "PK_40808690eb7b915046558c0f81b" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "article_like" (
    "value" INTEGER NOT NULL,
    "userId" INTEGER NOT NULL,
    "articleId" INTEGER NOT NULL,

    CONSTRAINT "PK_a5d5b31b5440727623f8a901917" PRIMARY KEY ("userId","articleId")
);

-- CreateTable
CREATE TABLE "comment" (
    "id" SERIAL NOT NULL,
    "title" VARCHAR NOT NULL,
    "text" VARCHAR NOT NULL,
    "points" INTEGER NOT NULL DEFAULT 0,
    "creatorId" INTEGER NOT NULL,
    "articleId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "PK_0b0e4bbc8415ec426f87f3a88e2" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "like" (
    "value" INTEGER NOT NULL,
    "userId" INTEGER NOT NULL,
    "commentId" INTEGER NOT NULL,

    CONSTRAINT "PK_3a063d4952039809428988bb852" PRIMARY KEY ("userId","commentId")
);

-- CreateTable
CREATE TABLE "migrations" (
    "id" SERIAL NOT NULL,
    "timestamp" BIGINT NOT NULL,
    "name" VARCHAR NOT NULL,

    CONSTRAINT "PK_8c82d7f526340ab734260ea46be" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "user" (
    "id" SERIAL NOT NULL,
    "username" VARCHAR NOT NULL,
    "email" VARCHAR NOT NULL,
    "password" VARCHAR NOT NULL,
    "createdAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "PK_cace4a159ff9f2512dd42373760" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "UQ_78a916df40e02a9deb1c4b75edb" ON "user"("username");

-- CreateIndex
CREATE UNIQUE INDEX "UQ_e12875dfb3b1d92d7d7c5377e22" ON "user"("email");

-- AddForeignKey
ALTER TABLE "article" ADD CONSTRAINT "FK_73bd593f880a989870fa0b70ee3" FOREIGN KEY ("creatorId") REFERENCES "user"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "article_like" ADD CONSTRAINT "FK_a436ab6e04141e82716fa5de359" FOREIGN KEY ("articleId") REFERENCES "article"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "article_like" ADD CONSTRAINT "FK_36fe87c54892234d74f641b60a4" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "comment" ADD CONSTRAINT "FK_c20404221e5c125a581a0d90c0e" FOREIGN KEY ("articleId") REFERENCES "article"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "comment" ADD CONSTRAINT "FK_b6bf60ecb9f6c398e349adff52f" FOREIGN KEY ("creatorId") REFERENCES "user"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "like" ADD CONSTRAINT "FK_d86e0a3eeecc21faa0da415a18a" FOREIGN KEY ("commentId") REFERENCES "comment"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "like" ADD CONSTRAINT "FK_e8fb739f08d47955a39850fac23" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
