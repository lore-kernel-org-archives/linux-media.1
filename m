Received: from linkmauve.fr (82-65-109-163.subs.proxad.net [82.65.109.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475BC37F31A;
	Tue,  4 Aug 2026 11:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.65.109.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785843995; cv=none; b=IV+p+4er4JumUcetiSfP6Qb889ew7R9pFHOgHWMVWVT6MOw0NnySWjIt0j2aiZYdgC2YBerCYqck3I2ee7QLhlnfGtxquieMUjRuz5cnc3otoNOkJi/QQO181OBoiKuj8dbB2lqYkXgjFOZ9rurgNpD6qxkxaaib5P86Yjug3oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785843995; c=relaxed/simple;
	bh=mVZHd2a1Qn/dHgkZGRVnwnOgDG707obb9Q8WRtYqGtQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CGoWF4m2D/Z+cNjl2AQXEiaGTb/eDWOPbCbKGhb5Uj73DTzP4eIw3FjEOssJy+oJnBe60fJ7QXM04CyF9as9D4W1VCWgKKMFn4+4R9tlkrWas5CKEcvBfWCXbFel4EBCLAFqjBswwsFB5LZ96fSiZOq0WB7SOlgBBgfZ8CrSQlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr; spf=pass smtp.mailfrom=linkmauve.fr; arc=none smtp.client-ip=82.65.109.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linkmauve.fr
Received: by linkmauve.fr (Postfix, from userid 1000)
	id 5179670A03FB; Tue, 04 Aug 2026 13:46:31 +0200 (CEST)
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
Subject: [PATCH 3/3] media: ts2020: put regmap_config on the stack
Date: Tue,  4 Aug 2026 13:46:23 +0200
Message-ID: <20260804114625.2314430-4-linkmauve@linkmauve.fr>
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

This struct was previously carried over in the ts2020_priv struct, even
though it was used only once at probe-time.

This reduces the size of the ts2020_priv struct by 192 B, at the cost of
moving it onto the stack of ts2020_probe().

Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>
---
 drivers/media/dvb-frontends/ts2020.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/media/dvb-frontends/ts2020.c b/drivers/media/dvb-frontends/ts2020.c
index 8775083f4dd6..27f096ce522e 100644
--- a/drivers/media/dvb-frontends/ts2020.c
+++ b/drivers/media/dvb-frontends/ts2020.c
@@ -18,7 +18,6 @@
 struct ts2020_priv {
 	struct i2c_client *client;
 	struct mutex regmap_mutex;
-	struct regmap_config regmap_config;
 	struct regmap *regmap;
 	struct dvb_frontend *fe;
 	struct delayed_work stat_work;
@@ -559,6 +558,12 @@ static int ts2020_probe(struct i2c_client *client)
 	u8 u8tmp;
 	unsigned int utmp;
 	char *chip_str;
+	struct regmap_config regmap_config = {
+		.reg_bits = 8,
+		.val_bits = 8,
+		.lock = ts2020_regmap_lock,
+		.unlock = ts2020_regmap_unlock,
+	};
 
 	if (!pdata) {
 		dev_err(&client->dev, "platform data is mandatory\n");
@@ -574,12 +579,8 @@ static int ts2020_probe(struct i2c_client *client)
 
 	/* create regmap */
 	mutex_init(&dev->regmap_mutex);
-	dev->regmap_config.reg_bits = 8;
-	dev->regmap_config.val_bits = 8;
-	dev->regmap_config.lock = ts2020_regmap_lock;
-	dev->regmap_config.unlock = ts2020_regmap_unlock;
-	dev->regmap_config.lock_arg = dev;
-	dev->regmap = regmap_init_i2c(client, &dev->regmap_config);
+	regmap_config.lock_arg = dev;
+	dev->regmap = regmap_init_i2c(client, &regmap_config);
 	if (IS_ERR(dev->regmap)) {
 		ret = PTR_ERR(dev->regmap);
 		goto err_kfree;
-- 
2.55.0

