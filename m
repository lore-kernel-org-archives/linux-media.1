Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C8337CD32
	for <linux-media@vger.kernel.org>; Sat, 12 Sep 2026 07:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789198048; cv=none; b=VMkEqC6qlp5382Cww8eHG/HZFunnH/W3uvAPBfHaGIjpIi/KL3Xzh9Pht5l+KkjhMwR8w5vNZ4lyaFQAdDSy/BwG3u93CCWMx8kbEo404Uu4RsMvcumlZUxmbE/zhm0RV7bcEzVv5YhRffzp0xM8DEJpikf022sVxOreYNPNUCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789198048; c=relaxed/simple;
	bh=xWwLKaPrCyo0dT0sNxMgIyzP50ZuIJtRJfZmjZRt53Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mCnQMIZbzVvvviapOU521Mm2Sc3/gGe+i+W/oXSfOIDtpsi0kiFPpbNDMRkeltSIDJjef1g6aq3MD2Hfcx0gm+p8PwNjqkpXns1sQHXpoACCXnf3bv45xoiO+3hQdJAL/zCo1XTCOGBXosZCpJZz5dDNJlHzea18aKwTiAhv8NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lSHEUNjf; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lSHEUNjf"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e620fa473so1420505e9.1
        for <linux-media@vger.kernel.org>; Sat, 12 Sep 2026 00:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789198045; x=1789802845; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Io592Y89AofpdUrmSgsTJ42xjhFrTGkqh8KCwi7QkhU=;
        b=lSHEUNjfHadbOhqLER7lnQlLQJlhNhT0QdyKUkOWllool1nz2myr4+VR93bVZdZdJa
         qO3a/QNIEFloLkG9bwqfBvlNOHI6IIJhNyUOaAXm4q3RnOb17bf25jyjkNmF2qakDBBU
         4MTK03egDrE/umE3gVOUzDfr4jRKPyMr2D/UsST3A8YeH2Vjn0H1srrBV7EEArXmA7v6
         7hzkLTFAF7EqUwxXDnM0XsNVVxVf6/hxYjoDkjzpPqtu24ROYp5tVdT6ocf5KeqPlwPg
         5MsK8cjS5f844UAdYHGsUC0WzjgVbQPy8R60eg8j8X4W2sk2qFfqbX+wJFb9kmlM8aQY
         Uaog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789198045; x=1789802845;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Io592Y89AofpdUrmSgsTJ42xjhFrTGkqh8KCwi7QkhU=;
        b=a8hJtUZaxgyHqUI9A4bFZehAdzfRsjKdBsHBOSJ8eIIAaPX5S110scO9mQB91Js5Zx
         Igqal+fNIFawtia0Gxbe2ccD10oFDcTGfIpE9tx/TxgYbywOCKLlleIPaRDxJvCMItgt
         S7+bdVH+DAt4x9lgx9NIps/IKP/nyJ1qppGEYycedif59j+Rnja3i8oD95WtlOoqDyrJ
         5f0E0Ce2a93AaUi/p1wlT6qb9sQTlwKJcC0gy4llsgXy4a4bS8Cp5JMWt4cI+sLBPOEy
         p4DD30i6y2gDWTdNNscOKPcSljiummRI8kfepLSOggeP1IjOUVwUh/WLnriJsnce8f5J
         fU/g==
X-Forwarded-Encrypted: i=1; AKwUvBwLGL/r62sSE+DhsB3xJq8p7WDV7rKMKwFKWj9p42SFZznzmCAugVhpKwCK4MiOmIZRnoNd1klsSNZmvg==@vger.kernel.org
X-Gm-Message-State: AFuF++nABnv8KINdysbkFKaZ6vJDc4sXCgStSTp8w9c10LXolT6GoLpk
	m6EkjADVx1oDWVB93xUV9imb1Pmv/SCqelhZGOS1HIImDHwx/wfnOprG
X-Gm-Gg: AYBFou1XOSFqzZZuQAGh7LODww0N2HnwrfreepP+I2r/u+xpA1U0TytMfIlG+PHhU/Q
	eZA8SeP7EboSQK9njUJ8w5grEyrZdPCF2ro3VjgSbO1wzWrHTvoDq7f+B4um+0xJVYBmVAqmJQU
	gwY8vWAFw6NTFZldKjxKYGbV53ZTNTwkCddXGPEyiKrWEaIWuAfFCpjmLlLaLu6K+p9d2mrS9np
	ONk9kIUBGTHgYBToElq9mbzUwQ2Dpi09hCE24G/4H+BycCaFENgCCfTJhqnugiULtqMVq541ekL
	4RBpgwhUFIc/Z9U5xTSaI6BgyMuq/ha2EO2XzlEVZFmU4bPbAJ7a+Cr127JrpEdaG/QxaKfr4pj
	wm8lJWeip3RbgTJu02S0xfk3j+ohoVb4VmOdhw5VS9MIWx1V1MdesgBbfCnxfXu77f8rNONJ5Ov
	W1sgInUIzvznf6asfWp4Xxn1vEBG+5+UkFhxXv0sv6UMQVA3MSHEIoP9gn+iXioUiBxd7YiUgyK
	mMIeArw/wPREoBEHYy30LoPZBTZW8K1CQauhd/Ml/501D0RXnLu9aBKSwQXHcGCyyrnkO11D8FW
	veRR8+wzTFTwYmlxHxraD22umtTn+UsepnYz/ec05AOE5FNLxWTRW7Qe9VD0QWhU9WQc1NVNgCm
	XFW3AbA0=
X-Received: by 2002:a05:600c:a47:b0:49c:fc6c:be03 with SMTP id 5b1f17b1804b1-49e6cbf762cmr14438255e9.26.1789198045202;
        Sat, 12 Sep 2026 00:27:25 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b260-f201-9983-e8c4-aff5-7a36.310.pool.telefonica.de. [2a02:3100:b260:f201:9983:e8c4:aff5:7a36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60ac411asm129447425e9.8.2026.09.12.00.27.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 12 Sep 2026 00:27:24 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: v4l: cci: Fix devm_cci_regmap_init_i2c() kernel-doc return value
Date: Sat, 12 Sep 2026 09:27:18 +0200
Message-Id: <20260912072718.50636-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

devm_cci_regmap_init_i2c() returns a struct regmap pointer (or an
ERR_PTR() from devm_regmap_init_i2c()), but its kernel-doc says "%0 on
success", which was never true. Describe the pointer.

Fixes: 613cbb91e9ce ("media: Add MIPI CCI register access helper functions")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 include/media/v4l2-cci.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/media/v4l2-cci.h b/include/media/v4l2-cci.h
index 4e96e90ee6369f14b43e012cd7044d14bcc5a7f0..a603d419ecaa2cc3771da41ddf5f27270318dbf5 100644
--- a/include/media/v4l2-cci.h
+++ b/include/media/v4l2-cci.h
@@ -132,7 +132,7 @@ int cci_multi_reg_write(struct regmap *map, const struct cci_reg_sequence *regs,
  *
  * Note the memory for the created regmap is devm() managed, tied to the client.
  *
- * Return: %0 on success or a negative error code on failure.
+ * Return: the regmap on success or an ERR_PTR() on failure.
  */
 struct regmap *devm_cci_regmap_init_i2c(struct i2c_client *client,
 					int reg_addr_bits);
-- 
2.39.5 (Apple Git-154)

