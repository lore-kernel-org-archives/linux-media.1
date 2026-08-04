Received: from linkmauve.fr (82-65-109-163.subs.proxad.net [82.65.109.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4746837E5D2;
	Tue,  4 Aug 2026 11:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.65.109.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785843996; cv=none; b=atwSbOStoxQCD8mIjgsyHMGI1iA1GEKGVhvEGzd/C2OQMNmzsFSqkpXJk4R2OaFLgmvI3NzyKIDELIleJVgeaL56Z+lTnvW0wVHQSYo5nUXT982mr8b9r7TcRSY8KWLLGG6gA3rHtPvkf1SVxgYzSju24jSppPT0ofa+j2D3w4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785843996; c=relaxed/simple;
	bh=6XA+f7YeuHT6NUeoGCMUaQCLaQvBd2206ZW1XOlBKWU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f4UexvyIL/XjiWurvlgKNM521CUoqM/EyCRbYOra6NYewt01oJXmkN5KlqjQVnqvGCHSC5JNK0qYAVcEfIbmAtnw+rTzkDHkwYNxx8eZ6FEMdTTsjrbB9KvCdjqKlmxTLY//eQTZfzcxCkSlSsoRcq/IwoATYKGISHHv90nCTy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr; spf=pass smtp.mailfrom=linkmauve.fr; arc=none smtp.client-ip=82.65.109.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linkmauve.fr
Received: by linkmauve.fr (Postfix, from userid 1000)
	id 4B49970A03F1; Tue, 04 Aug 2026 13:46:31 +0200 (CEST)
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
Subject: [PATCH 1/3] media: rtl2832: make regmap_config static const
Date: Tue,  4 Aug 2026 13:46:21 +0200
Message-ID: <20260804114625.2314430-2-linkmauve@linkmauve.fr>
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

This struct was previously carried over in the rtl2832_dev struct, even
though it was used only once at probe-time, using purely static data.

This reduces the size of the rtl2832_dev struct by 192 B, by putting it
in the .rodata section instead.

Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>
---
 drivers/media/dvb-frontends/rtl2832.c      | 18 ++++++++++--------
 drivers/media/dvb-frontends/rtl2832_priv.h |  1 -
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/media/dvb-frontends/rtl2832.c b/drivers/media/dvb-frontends/rtl2832.c
index b31cdb44b383..6f359036862a 100644
--- a/drivers/media/dvb-frontends/rtl2832.c
+++ b/drivers/media/dvb-frontends/rtl2832.c
@@ -1039,6 +1039,15 @@ static int rtl2832_probe(struct i2c_client *client)
 			.range_max        = 5 * 0x100,
 		},
 	};
+	static const struct regmap_config regmap_config = {
+		.reg_bits	= 8,
+		.val_bits	= 8,
+		.volatile_reg	= rtl2832_volatile_reg,
+		.max_register	= 5 * 0x100,
+		.ranges		= regmap_range_cfg,
+		.num_ranges	= ARRAY_SIZE(regmap_range_cfg),
+		.cache_type	= REGCACHE_NONE,
+	};
 
 	dev_dbg(&client->dev, "\n");
 
@@ -1056,14 +1065,7 @@ static int rtl2832_probe(struct i2c_client *client)
 	dev->sleeping = true;
 	INIT_DELAYED_WORK(&dev->i2c_gate_work, rtl2832_i2c_gate_work);
 	/* create regmap */
-	dev->regmap_config.reg_bits =  8;
-	dev->regmap_config.val_bits =  8;
-	dev->regmap_config.volatile_reg = rtl2832_volatile_reg;
-	dev->regmap_config.max_register = 5 * 0x100;
-	dev->regmap_config.ranges = regmap_range_cfg;
-	dev->regmap_config.num_ranges = ARRAY_SIZE(regmap_range_cfg);
-	dev->regmap_config.cache_type = REGCACHE_NONE;
-	dev->regmap = regmap_init_i2c(client, &dev->regmap_config);
+	dev->regmap = regmap_init_i2c(client, &regmap_config);
 	if (IS_ERR(dev->regmap)) {
 		ret = PTR_ERR(dev->regmap);
 		goto err_kfree;
diff --git a/drivers/media/dvb-frontends/rtl2832_priv.h b/drivers/media/dvb-frontends/rtl2832_priv.h
index f11ba038d5f0..8cf3266e14b0 100644
--- a/drivers/media/dvb-frontends/rtl2832_priv.h
+++ b/drivers/media/dvb-frontends/rtl2832_priv.h
@@ -20,7 +20,6 @@
 struct rtl2832_dev {
 	struct rtl2832_platform_data *pdata;
 	struct i2c_client *client;
-	struct regmap_config regmap_config;
 	struct regmap *regmap;
 	struct i2c_mux_core *muxc;
 	struct dvb_frontend fe;
-- 
2.55.0

