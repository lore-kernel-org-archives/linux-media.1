Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795187134;
	b=eK/tULiPhqaFl1bceK2lbD3KRp9Q+Xxq8KFBqbM4TlEMrUGIxqG80ZnDBkP6R4sgVb9q
	 gQQdl/lFlaRGO+jlW/A75hO+ScicjQ6mVNR7EdVXMlxbLa7JrPUooQIN1YXMfcbH0gWw3
	 NRFl1vjLMxGaJlzXTHJlxfX9khfpsJnKCd8KQE0jykzlsishy4eMT8N7kE/9BuzSJxJA6
	 dKcsblMclT7XuwwLofuebfprUPqQPI8x4zCkqJQHFzsspBJxhaATQSm8kuPxuikJGHc/R
	 JpTLWZpnmwKuGKjapgFZYug1MksQKDOIr6R6Dn6Zxx0Mk2x7uwnxv9qRUJ4Ojq/S81w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795187134;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GU02ZU4XYVJyKUMUy5YJptd8c90LCChC8APXWglZWps=;
	b=AhH6BP1JrR1At2TgS5AhGqqHvBLBbmDk7IBb/KWE/cJS6IwGGx6Hwk89MsRu4rCprcFr
	 90gHqH68uDFanjwKbIjgrDcr+f2WmwTWfhl+4b6SlgcqBM917XNhdzuCA1xobmQQCAI67
	 urfnu/WYcOQz6KZAYv/txq+WNPcixZVr7sWuCxk22D0WuUeBTXtqDZNFB5gQHJy9nboTZ
	 Po/QcxXxj6/0kbiiw8Ufb5ECj1fVyRTKnEeqYvFrNrkSSutPuclAI32NWBn36Foa3D1Nc
	 2PwrcAJNvY9zJsNwNlrRdbrV06aKa+NKV84btHMuVr/UP+sZY4WQcjeh0g8bX4yS3/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RauuJ8HY;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F11606A320
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 15:05:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27F11606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RauuJ8HY
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3866a784546so511545eec.0
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 07:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795187133; x=1795791933; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GU02ZU4XYVJyKUMUy5YJptd8c90LCChC8APXWglZWps=;
        b=RauuJ8HY8rF+7vLcJ4LbSGBJwfzuXFXpOY0oOXHwjLY/8n9cQuo7OLFxpW1e8k4xPl
         TqAgNyfOS/hA2UWJqqh+1BYMdrVA2g8H6aYoe1y5FZiuY63TS1worEYanUlBX/3/vaeJ
         biBq6Tp+qvGIM7g9LgtNvkIxMroUdhSgbQwv6mvK3Y7wa6AA1jP6qfHPfzTo7C3XRVa/
         4pQqVfOYALM2kyo9cSe4LJJi6/1XY9I4NpzJLii1piKoU4eumJnijQHEWwogXRCXCbUo
         sZwDP4xthJElCE421iUbRGCX2qCKUJsIeC+z89MDBbV1/CfjA/5yXlf2sn1Rd21HGtDU
         4P0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795187133; x=1795791933;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GU02ZU4XYVJyKUMUy5YJptd8c90LCChC8APXWglZWps=;
        b=yHvRsiUkyOhDR9YqyU+h55C6Dj1luygggqWeI2mi2gXiizq/eg6Peg0HsyNdMwAjr/
         tO6Nz/dCXeUQlhorscK2pGz5B4OsXFLJhzfRocOIGtFWN4weUNO54t+7d790eMBvL5q6
         zUvfl0xprJqsPZoTNkjZgoHTRdEoSf6ewWcSBE/52Ab9zcU6+5ObIQV1isNX69YrPOR3
         IuLbzeN8IyrqTmIVE7xwjC9miWyRwFTf/8rujSyZQ36c05ws+82pk3e0fEPAaIB1/6xH
         iqdPg7u8Zvh70edwubJnDDbjLwYndX9ARRq9SR27Dq6Hcj1oOvlVJrfrSmAA3DE1ZsJ4
         srBw==
X-Forwarded-Encrypted: i=1; AL+hErFRE7GB4f7xceZTQNeYWZ9NRvaBz2266+IObFsejA/nl5LuJytiRCuHHFZeWx9hI2Msfw951cj/EIDdKw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9T0uOAzMuVs9ZjlE5V7xx3axW2CtwYXoCmidB6Xn4OmqIKy7TB
	YdBp0i0n3193ylg1Uf7JEGE3jf9XK2KpThy6ep5XE4flYdp89vv03YyW
X-Gm-Gg: AZFdTZcoEMcQksakhP2E/zqVWPzGbM5bu4pwMEqE4I4YeOix+TCEBiqnz75VdrrN4V6
	wceUZ4RdlYF89fntBDT7hhY1lI/Uz0CHG2uNWk80NEkVxnt3L9relQCCH5ArvlOzV+KGMoS2PqN
	BIuM8beKuW+2CKRw1CoO7HLVMdQsL5NsmHuClrt0X7oG3GzMocg9zqZpBwEk8nYphwO3orgw7zF
	isV4wEyBXICFlj4nx6a7zT64A8bc0mf02Z0ZVT5ypcLv6iEZdDcQTd25THtHWmkAVvIBmogr03N
	bo6dubtVsSAffKncs8JWbETud+5o3VYA1AsevTns9A42Cgd806fBFHJbjMAyR7Dt8msRFVJNPf1
	eMMD4dJ00YlBoLlJOwNMqrXDfnDvAFbFjK+aapbg+URn0b0J3NGb7JI9bG5/XF4Z6Ud7xF3E0EC
	CbgS878ch5StKGHbt9pCweZEjiAh1fsZA63fyCv0RceP8y9lvm4SDBR0SL0yaKBkRzLOS1nnDlT
	gX9+EsUFQ4rPdr7Aavh2L+k1rWVhlgIHlbshSAzRRA6un9YF1UG9DOtMa7XrMCF4soTrmtuxkh0
	jgqrHxw5T8Jg5JWP8UBzCD2Y3AeTvtxMZ0SbiidWtNN1bVm2Dpbo0ZfJCb+CSjsc
X-Received: by 2002:a05:7300:881a:b0:385:8aea:11bf with SMTP id 5a478bee46e88-3858aea13eamr3807906eec.41.1795187132892;
        Fri, 20 Nov 2026 07:05:32 -0800 (PST)
Received: from IN01-9QQVVV3.CAMNWK.COM ([171.76.82.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm8632923eec.7.2026.11.20.07.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:05:32 -0800 (PST)
From: Shitalkumar Gandhi <shital.gandhi45@gmail.com>
To: Ricardo Ribalda <ribalda@kernel.org>,
	linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shitalkumar Gandhi <shital.gandhi45@gmail.com>
Subject: [PATCH] media: i2c: imx214: Fail probe if no link frequency is usable
Date: Fri, 20 Nov 2026 15:04:33 +0000
Message-ID: <20261120150434.14603-1-shital.gandhi45@gmail.com>
X-Mailer: git-send-email 2.53.0
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

If none of the link frequencies from the device tree passes the PLL
calculator, imx214_parse_fwnode() sets ret with dev_err_probe() but then
returns 0. Probe goes on and only fails later in imx214_pll_update(),
with a less helpful error message.

Return the error, as the code did before the switch to the CCS PLL
calculator.

Fixes: b9b359662952 ("media: i2c: imx214: Make use of CCS PLL calculator")
Signed-off-by: Shitalkumar Gandhi <shital.gandhi45@gmail.com>
---
 drivers/media/i2c/imx214.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index 4f4fdfb30..60a457195 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -1373,11 +1373,13 @@ static int imx214_parse_fwnode(struct imx214 *imx214)
 			break;
 	}
 
-	if (i == bus_cfg->nr_of_link_frequencies)
+	if (i == bus_cfg->nr_of_link_frequencies) {
 		ret = dev_err_probe(dev, -EINVAL,
 				    "link-frequencies %lld not supported, please review your DT\n",
 				    bus_cfg->nr_of_link_frequencies ?
 				    bus_cfg->link_frequencies[0] : 0);
+		goto error;
+	}
 
 	return 0;
 
-- 
2.53.0

