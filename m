Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792895242;
	b=4WdyRptYC7gGH1WgTmqM4hU0KviY9A271jbNklFRZ9bNtMXdDihV9mb553gcV4vxZncV
	 FioK9PTW707LOtx/Rfg5br77T3hqGvE+FPuJRqv3FGQ0lTnLz4LCr4j7n8erzEWF6tu6+
	 jVdycFwRMVUNZGstXx2FfjlQJ4HyPWUiAMWHPhqZg9Sxhca4lES4vkmGR4lIOheMLo0rh
	 IjScCe42u1fCYUugV3BntWtK0lVXtm0iY/cCfV8zTNhcyDqCzjNnm9O6I1mY/5Za7uD2x
	 xKXwu3MfLbEwzWgmdmcPkTJ6uxnRiZC6bP7rgDZqUPdC4BpqU+CINCQCADZQXtXmo6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792895242;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=ILnphfN7B6opEr27AV5yqaLcUyXkLPZvSA1w4t2wHN8=;
	b=FTkzR2GhiZz0P4BKqJCXWjH85XjADMIUGVY7Njh7YRXTWQcbbTAzBjB8qkCFLFPAjZCL
	 850H/a2mRApSFnazmoDwCyECrI1oNLUseedNlKM95tK0ZxOBQN1EnS6+nRFmQFDSgAPOg
	 /NC0diwnAvZ5O8CR3PrTd6v69NA4a0J0h46OsibIWGqLd29/s2F47F7R/b3v2qvDWTTRq
	 B/PXxnSueb1RWcg6ODM++Q9U2C15GEfTE8pEyWAxXheaNIrsa16WvXz2np6S55QUsqkY6
	 x/6uJvTcM5cpBC0uDxV1g+Cg5fhowR98DC3w9nM1vFE1Idiw/A9+w57DNjxx1WLy2/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RaXn1+ak;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47C3606A31A
	for <linux-media@vger.kernel.org>; Sun, 25 Oct 2026 02:27:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A47C3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RaXn1+ak
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3acd21ba21aso1571873a91.1
        for <linux-media@vger.kernel.org>; Sat, 24 Oct 2026 19:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792895241; x=1793500041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ILnphfN7B6opEr27AV5yqaLcUyXkLPZvSA1w4t2wHN8=;
        b=RaXn1+akRAg/67j9inzsGfdYM4IjBVcMsg1U1Ef8LmhifXBuKl0E7FMZdagML6aWjE
         5qdq112ofBvQVY8tjaSUL74pF1Wp2c6pok4LvL0e8Bt9B4XI2NBPNkceIAwG+EZoengE
         dDsLsEeQF1yDZkv9uwn+oN2wOCGxuHAjbILMRPgCXYDJvnn2/EXsGJGwvbpCj1cE6fqN
         T+1D7o+V7nHc/QMOn9BvWMdCjkFBeXESL9iaL1lFGRBOxFBhf8LicHyROAEH8bEO4P7e
         LS/r8yHRKAwP50hv4Une7jh7Xq3Ze40M5tGBjQnJUGxRgpfC9WPsr2Z1phNP0AU39U00
         kGfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792895241; x=1793500041;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ILnphfN7B6opEr27AV5yqaLcUyXkLPZvSA1w4t2wHN8=;
        b=t66lnkoVskuqywOn2j1vfCCYYFKZPz+ayLL2vnbJ38zAzY+n1cYf3JUliAiqOKbtM2
         d1mi95ayvljozs3rg1EHCNVlIdBk13cpfCodP0dp/UWfy/32CCt7TwKLcqi512mlzAwX
         P+D7Fx1g4fQVf44wTeG6/IKF70UPbRecVa3VIqoFbXDCO9PJxq1bASRuWyR4ls7bWV62
         VcBFyLjS9O0KxMd/pvRbs1ST1qOiGxiANRa3T6HFoWxuMrFx8KYa4zTbkKCH9zrI8X84
         oT2UKhgzduzxMJdH58B7iDsjBB9G+jgq/0PNCfo7lWPpTUW/A58VQFwHCiY+rwoEm+ee
         V/+Q==
X-Gm-Message-State: AFq9FYJb5PTjkjXH6s3uqcTVQV4mrIIMxgw2B0PMtVI4u9Pp15qiF4Zr
	6TSPwDNJ20fBzB0Thb9L6TCmYL8MDToxHkbE2/nVGxU8+HcqEtEkrkXr58RKHBaoR9o=
X-Gm-Gg: AYBFou0yjXzh3eFpbYKLbmTsHykPCHCWipPqqdJggpcTZPKz1wLrjjTBQvr9ywGau65
	NbT4q1u6CMrFPErSMYHX14stbrGR8hKSmBgHyBv+A5myixVWiQqWlkBBz/4H2jkPi0s4tP/IsCD
	N4JGBh0w10bDDZOOenEYkCmunL6Xlot9WhSJds02+07P0HhDBEXquC66k9G6jOhQMoTkcjLSVcb
	h6VQ7rmXb0RMHWrE8qODl6rnvmvlZm+7PxBWI5M5g7r2pLsV78df2hPAEQW4w7A/KGHooQovOpb
	5qEtxty29qaNhw58udD99uDH1SDjTk7XczxVwgedAzVRYNmxeU/nfD0YI0Pjw+IW7r1dyDLa7Qv
	4AA+Uq2Yq0guj3Ps9z1ld17oTseoUZkhsNwDJjmL38fJ5t9ovfSeemMrPoCMGVQLsXg5DlntcAf
	SDXJck+KkG/0hu0uer/ajuo7JyhdHjQRKoNx5dPxRzWsJ8/YJGSPQ8yWu1+YqoXFesvubjqncph
	v6lZCK/hUCBI4MVHtSwIzN/NOyHHNoZglGuLv+AzqRmRyYFMqDRv5WrT1Fi+BMSTHBNaqMPDd1n
	Ho5FY5I=
X-Received: by 2002:a17:90b:3143:b0:3ac:da41:ef7e with SMTP id 98e67ed59e1d1-3adeafd27aamr2667251a91.52.1792895240980;
        Sat, 24 Oct 2026 19:27:20 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac5:6216:1250::1d3:c4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebad6306sm3064944a91.2.2026.10.24.19.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 19:27:19 -0700 (PDT)
From: David Yang <mmyangfl@gmail.com>
To: linux-media@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	stable@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Zhangfei Gao <zhangfei.gao@linaro.org>,
	Guoxiong Yan <yanguoxiong@huawei.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: rc: ir-hix5hd2: set up device data before requesting the IRQ
Date: Sun, 25 Oct 2026 10:27:02 +0800
Message-ID: <20261025022706.1905466-1-mmyangfl@gmail.com>
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

The hix5hd2 IR interrupt handler passes priv->rdev to the
ir_raw_event_*() helpers, which dereference it immediately, and
devm_request_irq() unmasks the line as soon as it is called, so the
handler can run before probe() returns.

hix5hd2_ir_probe() has requested the IRQ before assigning priv->rdev
since the driver was introduced, so an interrupt already pending when
the line is requested, e.g. decoded symbols left by the boot firmware,
would pass a NULL rc_dev to ir_raw_event_store().

On Hi3716CV200 the handler ran 8 ms after the device was bound and took
a NULL-pointer fault in ir_raw_event_store() from interrupt context; on
Hi3798MV200H the same fault killed every boot 25 s into startup.

Request the IRQ only after the device data is set up.

The same ordering was fixed for talitos in commit 666d66df2525 ("crypto:
talitos - init tasklets before requesting IRQs") and for bgmac in commit
ac1f6e58cb77 ("net: bgmac: enable interrupts only after NAPI is ready").

Fixes: a84fcdaa9058 ("[media] rc: Introduce hix5hd2 IR transmitter driver")
Cc: stable@vger.kernel.org
Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/media/rc/ir-hix5hd2.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/rc/ir-hix5hd2.c b/drivers/media/rc/ir-hix5hd2.c
index 1b061e4a3dcf..c3b984a0c2e4 100644
--- a/drivers/media/rc/ir-hix5hd2.c
+++ b/drivers/media/rc/ir-hix5hd2.c
@@ -316,6 +316,10 @@ static int hix5hd2_ir_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto clkerr;
 
+	priv->rdev = rdev;
+	priv->dev = dev;
+	platform_set_drvdata(pdev, priv);
+
 	if (devm_request_irq(dev, priv->irq, hix5hd2_ir_rx_interrupt,
 			     0, pdev->name, priv) < 0) {
 		dev_err(dev, "IRQ %d register failed\n", priv->irq);
@@ -323,10 +327,6 @@ static int hix5hd2_ir_probe(struct platform_device *pdev)
 		goto regerr;
 	}
 
-	priv->rdev = rdev;
-	priv->dev = dev;
-	platform_set_drvdata(pdev, priv);
-
 	return ret;
 
 regerr:
-- 
2.53.0

