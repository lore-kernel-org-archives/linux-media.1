Received: from luna.linkmauve.fr (82-65-109-163.subs.proxad.net [82.65.109.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F081DE4F1;
	Sun, 26 Jul 2026 12:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.65.109.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785070431; cv=none; b=bLyoNdH8gfRounBT6l+d79tVo59IydcfgQNCJdz1U28FFBZjJtsDx82KDvjTWcJFw7BX9rWvNt0yMuXLZFFph8Vqw9Dz4TJsLvdIgL7/jAKajIUcJpmsRlCYEMLL8h3YzaMVnj9iyLC7l6nPSPHDbShEIWuyDZNpVUbZ3zX5G2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785070431; c=relaxed/simple;
	bh=awXQYLArLbDGYn9jXGuF/NUzWdg7WrGvuKU6atXZCO0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fOxeP8ldGvVoe9PG5UBqth08Nhcwjp3WBqYPifhzUmfkcoIbZwz0+6fKXRteaqftyyfALa7qi8VRgBFtCQU42zmT4R/a3m4ktWa7zfgJ+M13UB9h+kol7pYDfVT4sGBsDoPvRd9YxguTbKRzldu+XZB37clWM32V5EBtqETFAFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr; spf=pass smtp.mailfrom=linkmauve.fr; arc=none smtp.client-ip=82.65.109.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linkmauve.fr
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
	id B3870F40DC6; Sun, 26 Jul 2026 14:45:39 +0200 (CEST)
From: Link Mauve <linkmauve@linkmauve.fr>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Link Mauve <linkmauve@linkmauve.fr>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] media: ov2740: define most fields on variable declaration
Date: Sun, 26 Jul 2026 14:45:30 +0200
Message-ID: <20260726124535.15081-1-linkmauve@linkmauve.fr>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This also removes initializing reg_write to NULL, which will help with
changing its signature in nvmem-provider[1].

Thanks to Sakari Ailus for their suggestion[2]!

[1] https://lore.kernel.org/rust-for-linux/20260716142415.28718-1-linkmauve@linkmauve.fr/
[2] https://lore.kernel.org/rust-for-linux/al3sxMUgeK49dwNs@kekkonen.localdomain/

Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>
Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ov2740.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index fb590dfadda1..fbcbadcecebe 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -1246,9 +1246,21 @@ static int ov2740_register_nvmem(struct i2c_client *client,
 {
 	struct nvm_data *nvm;
 	struct regmap_config regmap_config = { };
-	struct nvmem_config nvmem_config = { };
 	struct regmap *regmap;
 	struct device *dev = ov2740->dev;
+	struct nvmem_config nvmem_config = {
+		.name = dev_name(dev),
+		.dev = dev,
+		.read_only = true,
+		.root_only = true,
+		.owner = THIS_MODULE,
+		.compat = true,
+		.base_dev = dev,
+		.reg_read = ov2740_nvmem_read,
+		.stride = 1,
+		.word_size = 1,
+		.size = CUSTOMER_USE_OTP_SIZE,
+	};
 
 	nvm = devm_kzalloc(dev, sizeof(*nvm), GFP_KERNEL);
 	if (!nvm)
@@ -1262,20 +1274,7 @@ static int ov2740_register_nvmem(struct i2c_client *client,
 		return PTR_ERR(regmap);
 
 	nvm->regmap = regmap;
-
-	nvmem_config.name = dev_name(dev);
-	nvmem_config.dev = dev;
-	nvmem_config.read_only = true;
-	nvmem_config.root_only = true;
-	nvmem_config.owner = THIS_MODULE;
-	nvmem_config.compat = true;
-	nvmem_config.base_dev = dev;
-	nvmem_config.reg_read = ov2740_nvmem_read;
-	nvmem_config.reg_write = NULL;
 	nvmem_config.priv = nvm;
-	nvmem_config.stride = 1;
-	nvmem_config.word_size = 1;
-	nvmem_config.size = CUSTOMER_USE_OTP_SIZE;
 
 	nvm->nvmem = devm_nvmem_register(dev, &nvmem_config);
 	if (IS_ERR(nvm->nvmem))

base-commit: 9eebf259d5352b87080d67758f483583d9e763d7
-- 
2.55.0

