Received: from luna.linkmauve.fr (82-65-109-163.subs.proxad.net [82.65.109.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F701E47CC;
	Sun, 26 Jul 2026 12:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.65.109.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785070430; cv=none; b=UCL3Rh0jSh3+8A8UVUl7WN/OLdCi3FedTb+VYm75AT9SbKdnElnqMKaecDP4JPlWzV5MyYfFwF77zYlPhsVHwy95g18+zT+gxTqe7IP8Bzlb7qzhFEfU062eK6NandUT6wRpz+aC8EA3/lLEvkZSgZzKEZgcUraBAEKKDIQdyjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785070430; c=relaxed/simple;
	bh=O3HYa8wiNTN6EO16VZ8Ky1zSM92NEu8CVlA7TjgUbHM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c3VFUWv/Gy7B3QOqGOpw2kNoLysN0sotRqizOlxBs4Pdd5k36n7Z8zyrBuXRChINjwuVoxftTkMw6d/rI93CYKm3T6oBLAwXqmobbcZA5/JEvr/poRw3W8/3bNyCeCQWbps77pQV0uv9Ie8VsoPgx2bDct692FCyuYu2gMLqw/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr; spf=pass smtp.mailfrom=linkmauve.fr; arc=none smtp.client-ip=82.65.109.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linkmauve.fr
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
	id 79B43F40DDF; Sun, 26 Jul 2026 14:45:41 +0200 (CEST)
From: Link Mauve <linkmauve@linkmauve.fr>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Link Mauve <linkmauve@linkmauve.fr>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] media: ov2740: move regmap_config to a static const variable
Date: Sun, 26 Jul 2026 14:45:31 +0200
Message-ID: <20260726124535.15081-2-linkmauve@linkmauve.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260726124535.15081-1-linkmauve@linkmauve.fr>
References: <20260726124535.15081-1-linkmauve@linkmauve.fr>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This one was fully static, so no need to fill it in the register
function manually.

Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>
---
 drivers/media/i2c/ov2740.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index fbcbadcecebe..39003c1632ad 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -1241,11 +1241,16 @@ static int ov2740_nvmem_read(void *priv, unsigned int off, void *val,
 	return ret;
 }
 
+static const struct regmap_config regmap_config = {
+	.val_bits = 8,
+	.reg_bits = 16,
+	.disable_locking = true,
+};
+
 static int ov2740_register_nvmem(struct i2c_client *client,
 				 struct ov2740 *ov2740)
 {
 	struct nvm_data *nvm;
-	struct regmap_config regmap_config = { };
 	struct regmap *regmap;
 	struct device *dev = ov2740->dev;
 	struct nvmem_config nvmem_config = {
@@ -1266,9 +1271,6 @@ static int ov2740_register_nvmem(struct i2c_client *client,
 	if (!nvm)
 		return -ENOMEM;
 
-	regmap_config.val_bits = 8;
-	regmap_config.reg_bits = 16;
-	regmap_config.disable_locking = true;
 	regmap = devm_regmap_init_i2c(client, &regmap_config);
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
-- 
2.55.0

