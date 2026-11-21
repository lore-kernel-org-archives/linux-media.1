Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795233353;
	b=Ka3kxeC2pIX/jUgspOLTcoLziKJd8lPKO1zJ0z1xRwHZ6BPRcAxq6XHxNQqLlJ5sYimj
	 olynBlYJs2FfvhyNQU1Q6ryai1rvDWmyKFmnDzGtxEVGwEhutRagJWwmj6V5/9FnxfAEP
	 0GRSPihiz6hGl89gWnBhzXGDR6rE4tq9HbDR+NoarDJG8IXWApj7df3E9DkF+CZXYmv7O
	 sbdUymVItyaju8pJ5uN7O2zr/4mDkiG8dKa1X22MixuTNjD0pvw8LUgsMz3Tx6+/ar/sZ
	 hezPinTgeK2XqG5dmhzoQxzuH3ESC0nDmK+jBvI7exq9/TltrEQJXUI+Ib2HdKHylzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795233353;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tltDCiy5cuzdulawCOgmvyY3l0pK0A9bj1d/Pm/aQJI=;
	b=REX5/OxMqa4jmX3DTp1SUsB35QuxVnAHE48+ZudA/5hxZp28GQXX62v5yuQgL0KCbO2S
	 Hguvqo4jZ8om4EsW5rm9umAr+T4FnOQhYp78+GmVViPV/KeXDsFYccExkpwg/uJ8peLJi
	 9x45bVlrQU2Vs0g5KQas8cPi4g41u3huseVtsUhYmVommOWNXAQWQ5/0DacgJbZDewG3/
	 KHC3/nPkt/QAEqx8CnPtEyB54GmpDyGl2v3MxCvqLeiq1/6I4v+PHMkuO+RjcBIWfMJsR
	 TvheEXIijFLQ7gdyHitOIauH9iNh3LchsCJbk8V33dCVMtZZJfWwhp7yp2syfP5WApw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HtICAuiY;
	arc=none smtp.remote-ip=209.85.161.48
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F4160A262B
	for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 03:55:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7F4160A262B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HtICAuiY
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6d68de53053so1123995eaf.0
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 19:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795233347; x=1795838147; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tltDCiy5cuzdulawCOgmvyY3l0pK0A9bj1d/Pm/aQJI=;
        b=HtICAuiYsZgY0Ps8vbd5Y3nnKnocs9UsFED8RvnEjHixkieFdSveRngDoZisBvbef0
         S070B53+UGxDwS2mkDROf+n5bB7vDgCMuVv/D3j6WN5yaUB/ZqZFwP7sTfEqfzsS4Smx
         WZBAf/kYWQl5U2F9bFobMDE9Dn3hJV8kPctAPCfVB/sjFvixFUB3z0enO2Dp+3REUMc5
         lC5enpwkiaLlAJdFWpbBegNU+ltwm7Vq9eVVanCg+qfYY4bCE3SSjPP0STvxREFpbriH
         hejjPHOXgHUdS1nH7F0tpXfgWHBi7+uxMHFx1yI4OnxcDeNjlFxiDJYicacnzdGlsVMw
         /91A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795233347; x=1795838147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tltDCiy5cuzdulawCOgmvyY3l0pK0A9bj1d/Pm/aQJI=;
        b=K8owq63XXaHFRPgX6hp1kWeA0zd/OdHCeYdCsn+Po0tHJ7M6o2BuIgwbBjHnh9ADRN
         JRp8E4DhKthGnErq3EDqhM6XbQOQJh0v8nfeqVGxx9Szvfi6PGTvrCPo2dx24nzzzNfe
         ALnxUFen85NTeNNZKSB1Q4UtKk0fkmNj+vJl3x2hHTj3+pThDH1kbgzFg8YtZWOYJGLg
         8qC3WPR5tjO25Zyiw3frHtQNrCy3DqKdvKE2kr0fNPtlRm8z89AfC09tFn3aWrYuE6qe
         jYkABFDXcgqCzkTmqneSxaVhixNLLyqAfAx2/Y7f25k/dxkfugib4i99XimlMbX24as5
         PeLg==
X-Forwarded-Encrypted: i=1; AL+hErHEj8NHInucigZIo4bNZC0x0gsCr73UyJ8aLOpW3YlolPS30m1wWAPG0xvz6znX6/+hdTu9Uksr1q3XZg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/6oiZChT4XKJ1nh802Sbh16BUlDX4hMKH+hNn2azHYJQxXNzE/
	kM4U0ab7MnrwXKwQ1YeGcfft68IxRsGTzNzzaL10Zcd8Jr5MKx6borI=
X-Gm-Gg: AYBFou1EgI93l8d+AuzahdoHMzvw6Mj0fMCQrIUqdKPj9Fc5sClrlaIQ30SQdCHdtB/
	qO1gZhcn8uDg50CAh5i1PnlMP0Ohran+8bAik92Z+efuuHYsxTs2nmXk4MP7elKK3XrcCK4xq9y
	iaUmdcQczKvz0pjGaGYx+6nJJiMOPWpkgzYwtsr9qN2g1KO1CP6mEYhoDcnk4jKOmjTicpJTK8v
	nH6CbRw7jA5gZlGWUqQECYfUcmqO0UB5/HsJthpye20O/Dkx75K5wRV7dhptnJi+/zRAFAZrbhh
	6TQ9P4k8VPI8Jsx9vfkTuX4NtziWi9dacT+iwU1JB+ocATa+4CV9WXqpWyWh/pkyWVTKQpwkW6Z
	bhwdVkDZ+MgjIqPxCYbIcXggCWOPRD7aDPDBI7GFep5A4S18+q0ONyF6qjMeCi36wSddHl0l/xR
	1eIyBP03ewF21c+8IXedcqbJ9QC/h6WvRhAY7oHiB7hry53ZvRf8ZTdiexzsfbK+dsshZ6gtoa6
	lJ2oiBTBoO7VhDOpiIDwznXp7xMTMewqUJXdBO/YjRa1OiUa55LDq4ukmaxrApTzMq8qQxRA+P4
	hOmlNydrGX9HpjIH58cMkOnodf56/FFm4RMjTREiLqxFGYFj3zQPU3mw
X-Received: by 2002:a05:6820:2488:b0:70a:347e:4e9f with SMTP id 006d021491bc7-71b3952cb48mr3400899eaf.59.1795233346574;
        Fri, 20 Nov 2026 19:55:46 -0800 (PST)
Received: from miso.lan ([136.62.61.36])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380b6f82sm2878076eaf.10.2026.11.20.19.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 19:55:45 -0800 (PST)
From: Matthew Laux <matthew.laux@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mehdi Djait <mehdi.djait@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Matthew Laux <matthew.laux@gmail.com>
Subject: [PATCH v7 03/12] media: tw9900: accept the TW9910 chip ID
Date: Fri, 20 Nov 2026 21:55:14 -0600
Message-ID: <20261121035523.26764-4-matthew.laux@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261121035523.26764-1-matthew.laux@gmail.com>
References: <20261121035523.26764-1-matthew.laux@gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow tw9900.c to accept the tw9910's chip ID and revision fields as
well as the tw9900's. The tw9910 is a superset of the tw9900 for the
functionality used by the tw9900 driver, and USB3HDCAP/XCAPTURE-1
capture devices can have either chip.

Signed-off-by: Matthew Laux <matthew.laux@gmail.com>
---
 drivers/media/i2c/tw9900.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/tw9900.c b/drivers/media/i2c/tw9900.c
index e9d384039b50..df8c7b1f3450 100644
--- a/drivers/media/i2c/tw9900.c
+++ b/drivers/media/i2c/tw9900.c
@@ -23,6 +23,8 @@
 #include <media/v4l2-subdev.h>
 
 #define TW9900_REG_CHIP_ID			0x00
+#define TW9900_REG_CHIP_ID_ID_MASK		GENMASK(7, 3)
+#define TW9900_REG_CHIP_ID_REV_MASK		GENMASK(2, 0)
 #define TW9900_REG_CHIP_STATUS			0x01
 #define TW9900_REG_CHIP_STATUS_VDLOSS		BIT(7)
 #define TW9900_REG_CHIP_STATUS_HLOCK		BIT(6)
@@ -51,6 +53,7 @@
 #define TW9900_REG_VVBI				0x55
 
 #define TW9900_CHIP_ID				0x00
+#define TW9910_CHIP_ID				0x0B
 #define TW9900_STD_NTSC_M			0
 #define TW9900_STD_PAL_BDGHI			1
 #define TW9900_STD_AUTO				7
@@ -574,6 +577,7 @@ static int tw9900_check_id(struct tw9900 *tw9900,
 			   struct i2c_client *client)
 {
 	struct device *dev = &tw9900->client->dev;
+	u8 id, rev;
 	int ret;
 
 	ret = pm_runtime_resume_and_get(&tw9900->client->dev);
@@ -581,7 +585,7 @@ static int tw9900_check_id(struct tw9900 *tw9900,
 		return ret;
 
 	mutex_lock(&tw9900->mutex);
-	ret = tw9900_read_reg(client, TW9900_CHIP_ID);
+	ret = tw9900_read_reg(client, TW9900_REG_CHIP_ID);
 	mutex_unlock(&tw9900->mutex);
 
 	pm_runtime_put(&tw9900->client->dev);
@@ -589,11 +593,17 @@ static int tw9900_check_id(struct tw9900 *tw9900,
 	if (ret < 0)
 		return ret;
 
-	if (ret != TW9900_CHIP_ID) {
-		dev_err(dev, "Unexpected decoder id %#x\n", ret);
+	id = FIELD_GET(TW9900_REG_CHIP_ID_ID_MASK, ret);
+	rev = FIELD_GET(TW9900_REG_CHIP_ID_REV_MASK, ret);
+
+	if (id != TW9900_CHIP_ID && id != TW9910_CHIP_ID) {
+		dev_err(dev, "Unexpected decoder id %#x (rev %u)\n", id, rev);
 		return -ENODEV;
 	}
 
+	dev_dbg(dev, "Found %s revision %u\n",
+		id == TW9910_CHIP_ID ? "TW9910" : "TW9900", rev);
+
 	return 0;
 }
 
-- 
2.47.3

