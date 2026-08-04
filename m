Received: from linkmauve.fr (82-65-109-163.subs.proxad.net [82.65.109.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4765537F339;
	Tue,  4 Aug 2026 11:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.65.109.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785843995; cv=none; b=W+J7AH4g3zZmr2fH/PGtVFGhvawHrUfrv6OZO3Rhk//bkcjtPH6pU7n6Zowg/ylADl0nuHXo9io4s+698LJHHCk6b7gJzG3cn7awfhHoUKBWBZKovknFtxgEtU/LC7b1h2Lm4DyLp6/GDwHEnYL1OgbmTLZwkSHGp2ck4B8nRkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785843995; c=relaxed/simple;
	bh=PS53bviljSfzpToelxToKYs0tHz4kHoF7ijd5lS67GY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F7hRCpbXjd6jqFrj/0AWFb+8q3WEJGBQ0S22eTMoOeSCXkajlbaCP97aSMTD2bl7m3OZ0VrPcNwFxUN191IZyYNCEUEkvhymqcABshOeYn4gSDUvBcmAPYb68LSEMvuuRKsut2i4D4Q8mK66QKEDEgho4A1Z/1CAxIaTj+52v1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr; spf=pass smtp.mailfrom=linkmauve.fr; arc=none smtp.client-ip=82.65.109.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linkmauve.fr
Received: by linkmauve.fr (Postfix, from userid 1000)
	id 4E3F070A03F7; Tue, 04 Aug 2026 13:46:31 +0200 (CEST)
From: Link Mauve <linkmauve@linkmauve.fr>
To: linux-media@vger.kernel.org
Cc: Link Mauve <linkmauve@linkmauve.fr>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Bradford Love <brad@nextdimension.cc>,
	Kees Cook <kees@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Deepanshu Kartikey <kartikey406@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] media: m88ds3103: make regmap_config static const
Date: Tue,  4 Aug 2026 13:46:22 +0200
Message-ID: <20260804114625.2314430-3-linkmauve@linkmauve.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260804114625.2314430-1-linkmauve@linkmauve.fr>
References: <20260804114625.2314430-1-linkmauve@linkmauve.fr>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This struct was previously carried over in the m88ds3103_dev struct,
even though it was used only once at probe-time.

This reduces the size of the m88ds3103_dev struct by 192 B, by putting
it in the .rodata section instead.

This regmap_config previously set lock_arg, but without either lock or
unlock callbacks this argument was unused.

Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>
---
 drivers/media/dvb-frontends/m88ds3103.c      | 9 +++++----
 drivers/media/dvb-frontends/m88ds3103_priv.h | 1 -
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/dvb-frontends/m88ds3103.c b/drivers/media/dvb-frontends/m88ds3103.c
index d79b88848a8c..d3a69a8ec3f6 100644
--- a/drivers/media/dvb-frontends/m88ds3103.c
+++ b/drivers/media/dvb-frontends/m88ds3103.c
@@ -2045,6 +2045,10 @@ static int m88ds3103_probe(struct i2c_client *client)
 	struct m88ds3103_platform_data *pdata = client->dev.platform_data;
 	int ret;
 	unsigned int utmp;
+	static const struct regmap_config regmap_config = {
+		.reg_bits = 8,
+		.val_bits = 8,
+	};
 
 	dev = kzalloc_obj(*dev);
 	if (!dev) {
@@ -2067,10 +2071,7 @@ static int m88ds3103_probe(struct i2c_client *client)
 	dev->config.lnb_en_pol = pdata->lnb_en_pol;
 	dev->cfg = &dev->config;
 	/* create regmap */
-	dev->regmap_config.reg_bits = 8;
-	dev->regmap_config.val_bits = 8;
-	dev->regmap_config.lock_arg = dev;
-	dev->regmap = devm_regmap_init_i2c(client, &dev->regmap_config);
+	dev->regmap = devm_regmap_init_i2c(client, &regmap_config);
 	if (IS_ERR(dev->regmap)) {
 		ret = PTR_ERR(dev->regmap);
 		goto err_kfree;
diff --git a/drivers/media/dvb-frontends/m88ds3103_priv.h b/drivers/media/dvb-frontends/m88ds3103_priv.h
index d7d16e7904da..a29ba664377b 100644
--- a/drivers/media/dvb-frontends/m88ds3103_priv.h
+++ b/drivers/media/dvb-frontends/m88ds3103_priv.h
@@ -33,7 +33,6 @@
 struct m88ds3103_dev {
 	struct i2c_client *client;
 	struct i2c_client *dt_client;
-	struct regmap_config regmap_config;
 	struct regmap *regmap;
 	struct m88ds3103_config config;
 	const struct m88ds3103_config *cfg;
-- 
2.55.0

