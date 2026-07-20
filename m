Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9712B18B0F
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 01:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784509726; cv=none; b=lMh1cbOsfSiQzVCmZMleZDTbmP15qImXgb4t1AzFOI+reS//2ZAp1FlslZXxhPQY6Hg+IHZIwgpqKd60DcSw3hMte4B0yuFqBPjgXniQIYM+GxXoZ98Wz5zwU+HQXBQRC6lZHI2qY7KlYDlKQB6UHwSxfwvbbesBnJz5L0Ji69Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784509726; c=relaxed/simple;
	bh=j/s2cxXiaH6OTTBFgZ43/4hQvhiS1ZcYib4v6cYv6xM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WnrTkGAoO8T364ZQF0N3CNQYTcftO8DsmCIPn/Wf4leocbWhDJEbaKuhkFYl29PSMBhpSw89cW8ZnHNhFuEmUIHBv/1moKBmdW9PSFHQKAFyji9Vu7i4oDBSYvG3p9X/UPnWu6XmfPXhA+MCZPiyrm3/rhR5Z4RJCARFhTdq6Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sPoT4pCM; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sPoT4pCM"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-ca957432c7fso6551890a12.1
        for <linux-media@vger.kernel.org>; Sun, 19 Jul 2026 18:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784509725; x=1785114525; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qYMlSQEUCe4nBEX5myvu3Fc8b2tc06YkU3XYdFYY5ig=;
        b=sPoT4pCMXc3h4hwe36wqDoqL6bEdxQDiHxdFi9zqEEqonluPKrbOaJrD4B4dO4lcfR
         3FjBy4XUKrus5Q4UhdB+OpM2vWOOrgvlL+fljnCgQNZqnvtEt1OvXPJfi433g1YOfDMH
         jzdYCB526UvPHr62EsTcUnprVZ77N8ANlnZIZOdDOU+/p5Qr3o2W1Jg4HxB+jb52eyXX
         sq9McbvFMiAp/LWbzimbQ1BNlem+g2ft/6m7UuaCrs1cL8qWCroIy2osWxtHZKjrK3dZ
         zWw8GvVqm1M90nTYqJ8uyWggbUZwNJfNSBsM7vLRnI26CkqxsAJ/3YHr1sBJDMRO4SVj
         ap6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784509725; x=1785114525;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qYMlSQEUCe4nBEX5myvu3Fc8b2tc06YkU3XYdFYY5ig=;
        b=eti2pDfnwjQmeMTvsmrc7kjz5u13rDl+3/svZ+4EHbW6Z1sM+hOQtYB87Yqmb8Zakf
         uh+E68mc0Nn5aBqJWHi/6PyMfTieJKUXG9bBbbUzHc36dHMcK+DVj44d+ioTdahkQrJk
         0cm2D1giL4GrLK4MRVj6f6iUMSY7hRJ5Gh7OajvUMgr3vnXQXH0kbIfHEssAolKWIA5o
         EnxlqQQQukk89aoZg3aCPBB8KG6L+UHffPo90iagkShc849gg/Lff/1Wyj2ekwJApauQ
         kGzQtTpeKIZCvSTrHptegtGRrNYJm/iIIXPTq+J0F5AaLct3onW7oSEKjcAOYTju561D
         Sw0A==
X-Gm-Message-State: AOJu0YzykCv5pZNBWgEXqtcKq5OGqXs5ii4q+GjnFN2vpsU9HXoLllEh
	+oBhPYKFuDVjBIVMKTu8APnOs3klIRNI8/hH2bHldOUxh02bbYGq7UziHLONdxVEP5P+SA==
X-Gm-Gg: AfdE7ckuSUnzMOYEKyjPS4WEBUnZAhmmPt4/mv8/cL05tgqN2CwtRWpKAnKJpVpKRqd
	Ee3i5J3UEhCweU/iSQKq+2acDGU7z8WZDFUm7vf3uZM4d01Q5F/7tg+6BufV80gX6886+mqcEPf
	wWkSvgaT5h3VH5CDOm2V76gPqCbLoR3rdIOKFL5A00fOcrxSA1OaA1D+5bwhGB1EyfS78L73o23
	HTiMJLL/XB4/GIVueXHxNVUc8Mbp8UUOL+iNCUNvJ8Os+zbLzL+bSjq0q3CJNGo2AMikq2fyh1G
	mYh+z9/0vpRLAcFLMT7zcWzTMpZTEP3Umyk6eYAPGzGE2VP9nx+bWzDfI6Jiy0j0hcJUi+cDmRQ
	N4dHeNKd9xzgpvh2cqIpylKunnmwb1lqemynJSaX335DGP1UaQnaSkFWT0s3DEcLfHXh2DMSsh4
	evYI/3OqhU/L8o8NCwPbYueCgqV2EI
X-Received: by 2002:a05:6300:95:b0:3c3:9cf4:a993 with SMTP id adf61e73a8af0-3c3ada0bfc7mr12729209637.70.1784509724843;
        Sun, 19 Jul 2026 18:08:44 -0700 (PDT)
Received: from White.tail445f11.ts.net ([45.119.30.153])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a20b037sm32054518eec.27.2026.07.19.18.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 18:08:44 -0700 (PDT)
From: Nikhil Gurudasani <nikhilgurudasani314@gmail.com>
To: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	mchehab@kernel.org,
	hverkuil+cisco@kernel.org,
	crope@iki.fi,
	u.kleine-koenig@baylibre.com,
	kees@kernel.org
Subject: [PATCH 1/2] media: dvb-frontends: a8293: validate platform data
Date: Mon, 20 Jul 2026 06:37:44 +0530
Message-ID: <20260720010745.11275-1-nikhilgurudasani314@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

a8293_probe() dereferences platform data before checking it. An I2C
device instantiated without the expected platform data therefore causes
a NULL pointer dereference during probe.

Reject devices that do not provide both the platform data and DVB
frontend.

Fixes: b561baec11a4 ("[media] a8293: implement I2C client bindings")
Signed-off-by: Nikhil Gurudasani <nikhilgurudasani314@gmail.com>
---
 drivers/media/dvb-frontends/a8293.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/media/dvb-frontends/a8293.c b/drivers/media/dvb-frontends/a8293.c
index 52e3dc928327..14e7f6bda10c 100644
--- a/drivers/media/dvb-frontends/a8293.c
+++ b/drivers/media/dvb-frontends/a8293.c
@@ -213,11 +213,16 @@ static int a8293_set_voltage(struct dvb_frontend *fe,
 static int a8293_probe(struct i2c_client *client)
 {
 	struct a8293_dev *dev;
-	struct a8293_platform_data *pdata = client->dev.platform_data;
-	struct dvb_frontend *fe = pdata->dvb_frontend;
+	struct a8293_platform_data *pdata = dev_get_platdata(&client->dev);
+	struct dvb_frontend *fe;
 	int ret;
 	u8 buf[2];
 
+	if (!pdata || !pdata->dvb_frontend)
+		return -EINVAL;
+
+	fe = pdata->dvb_frontend;
+
 	dev = kzalloc_obj(*dev);
 	if (!dev) {
 		ret = -ENOMEM;

base-commit: a52e6f7923c17a672135b485ffd96fbd72f46267
-- 
2.43.0

