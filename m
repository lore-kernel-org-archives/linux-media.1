Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668FD3B776F
	for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 06:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785305260; cv=none; b=mzT0Y3i65NuVWc2z3u+qCF/DwjM5e9FcgPYsEP9cFmBEhnaToCfZgtVr8VJEeTV4/paGsTQFtr62/WHCtx8VCSVZFu0nZNLgy6/kLU/K6MY1+czo5RvcCMTqsZfLhaRcnhRI2aBTHwNALDPAVrVc1aoZ/xxoVB4Tv54HMGsBPOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785305260; c=relaxed/simple;
	bh=/0LTD+YuOEMyez71enerk8KZbgf5cRv7+phqHZi7pfU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IQPjFKY1JrCX7yWexAJKCwsit+lEdt4Gr1mNec1l3i9MKq1YrPfRZKx5PhFpehzUAvz2KXdT1g85dsO71warNzKC2bF41gW9YGsuv/btMbNHE3Wx0SFBRy2xy83PzxdTVwLoE/YgH5KRE1LvHpttf7UqI5h9DOtiR7L+YNiasGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FX5reZ4M; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FX5reZ4M"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-845c92bc464so534428b3a.2
        for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 23:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785305259; x=1785910059; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Au3B6tmLC3tMUt51a77RTkKN+/zhxdhlLpZElLCtiTw=;
        b=FX5reZ4MH4dZ+6yb3ZgO9dfmXq0fPMkhvwTu6tfeXxQByFFwtBXIKuh9v5mMa+5/D4
         IQS+eHbNFNnI+rgLmS0pucab2X6/266Ox1RqumZq0gvD82WNgCGTX6Xnkcl85bL8NQli
         CT1jxWuqcmV4q1oOPOm9khW4JuLXRt8OOWCCJDc59zJAqZDuGkp1sI0tHjjkpLkRn6Ja
         6t633YzBRYCZ9MMwx86j/ZuwuYZccoca52Qis4dTpmrCMeNU/tIK5WNizf/CODnTwZFe
         XSXDX5PINZdywL2Wy5CtBlmOS41XrgH6E9PjfqFb9eTSsnD+LOIRIN/DP38Jywd/r43h
         AkCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785305259; x=1785910059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Au3B6tmLC3tMUt51a77RTkKN+/zhxdhlLpZElLCtiTw=;
        b=J4QWqNCuEXJotygmdOsjdVr32EOAsrCl8C7pZe8ZopcqlBe4Rpjt0ZxckCtvQ6IXOG
         +43OiMeDwTvHZNWCyYpsiIwENI2QkiTbV4qa1b1X2XFOPWXlGSdi4i8fJT1DDuLiXBCK
         4cVA5GwzPdQDd6M+WDJ9MMlPlEi/hA+q1Icfh2pjx8SusLjQIYDCKTWE2/Rnz6l3NIP5
         mEv/yliWlzDt4mNyFn/v4nrhhqFZyarZW8hTgzvIOdlzYqf/1/A2TZjGKWvp+CEMbVVK
         +GYRKQQhFLpNVuzvTwU5FKajgozEAkcmMC/6/HbcDdTN6CvOgadoOzPyN8y+6J3uB38F
         mUtw==
X-Forwarded-Encrypted: i=1; AHgh+RpIRUn5zNB4ZXl2guwMQtNRCm1PHiZcM8ufoQojVmyhwwFoOCPEe0Jf1WsmNtmJdUF+nsKvqanVy+/WLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHAApypOiti9kmX7GpraQOyQhxVdApYXAD1yzu2RlhKsaAVBkA
	MFS1feg+T1U6JMA/+ijH5gCAndpQQPM7hQ1EQdHkuNV8gh9z2sSuVdHl
X-Gm-Gg: AR+sD11qlfy+fV5CTEI4CF8/xmBnEYOB9AQ7M4TwnZqgeju0kbzbbjjvS6TcWZk6eqO
	KuPGVXWxv6eR07uyrd80QfgcdTMNG08X1g2ubmBp3eDnp9wLQtwGl4b2G+umbftcXw3FNgQefxC
	1S/4AjUAyeHir1vrbH6K4r0jfOw+AvsS0OFmBaSBfe52oa2RmDFl31HReaInTE3NnqrIAXyqMgz
	b7VGOWydalIcJIV8T69lCLAOc/8ajRqNrtSnidvatufJgz2FLIIMN9LnmgSgIk/qSHOIRezicAP
	ypSwvB559Ml3PrurtwigeE9Hi141XkERUZAswbe0iOT0IIsbyxJQELda4RgwHAvthacZhQ2UGLC
	orzFBuS080vswjS9Zyd+f10Wc2CewSAruuAIUrmNxUM5m9PX2VEgBaVBSQWLG/9ygoGPj5KTi2z
	gtKQszD82CTnXdNRJboech8yFwqFvAoNsrIOo7EnP6VoLkmXKrpsvBB78XhC8X9jyGPVG0sgy2K
	KmtEKoBYPmwvknhcL/w4X2UaHtcSh3oebLPghIIv4+j3mLySes=
X-Received: by 2002:a05:6a00:399a:b0:848:2f74:1d5b with SMTP id d2e1a72fcca58-84e932ca215mr5555635b3a.65.1785305258751;
        Tue, 28 Jul 2026 23:07:38 -0700 (PDT)
Received: from debian-rockchip-rock5b-rk3588.. ([2405:9800:b670:b64b:1c6e:95da:41c0:e7b6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea02f8473sm805504b3a.31.2026.07.28.23.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 23:07:38 -0700 (PDT)
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	jkoolstra@xs4all.nl,
	Frank.li@oss.nxp.com,
	Tharit Tangkijwanichakul <tharitt97@gmail.com>
Subject: [PATCH v5 2/2] media: hantro: use DEFINE_RUNTIME_DEV_PM_OPS
Date: Wed, 29 Jul 2026 06:04:40 +0000
Message-ID: <20260729060440.2092-3-tharitt97@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260729060440.2092-1-tharitt97@gmail.com>
References: <20260729060440.2092-1-tharitt97@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The runtime suspend and resume callbacks are currently guarded by
CONFIG_PM. Removing the guard directly would leave the callbacks unused
when CONFIG_PM is disabled.

Define the PM operations with DEFINE_RUNTIME_DEV_PM_OPS() and use
pm_ptr() when assigning them to the platform driver. This keeps the PM
callbacks available when needed while avoiding unused-function warnings
for CONFIG_PM=n builds.

Signed-off-by: Tharit Tangkijwanichakul <tharitt97@gmail.com>
---
 drivers/media/platform/verisilicon/hantro_drv.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index d6fcd4f7f9da..35302cf9f233 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -1284,7 +1284,6 @@ static void hantro_remove(struct platform_device *pdev)
 	pm_runtime_disable(vpu->dev);
 }
 
-#ifdef CONFIG_PM
 static int hantro_runtime_resume(struct device *dev)
 {
 	struct hantro_dev *vpu = dev_get_drvdata(dev);
@@ -1314,13 +1313,9 @@ static int hantro_runtime_suspend(struct device *dev)
 	clk_bulk_disable(vpu->variant->num_clocks, vpu->clocks);
 	return 0;
 }
-#endif
 
-static const struct dev_pm_ops hantro_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				pm_runtime_force_resume)
-	SET_RUNTIME_PM_OPS(hantro_runtime_suspend, hantro_runtime_resume, NULL)
-};
+static DEFINE_RUNTIME_DEV_PM_OPS(hantro_pm_ops, hantro_runtime_suspend,
+				hantro_runtime_resume, NULL);
 
 static struct platform_driver hantro_driver = {
 	.probe = hantro_probe,
@@ -1328,7 +1323,7 @@ static struct platform_driver hantro_driver = {
 	.driver = {
 		   .name = DRIVER_NAME,
 		   .of_match_table = of_hantro_match,
-		   .pm = &hantro_pm_ops,
+		   .pm = pm_ptr(&hantro_pm_ops),
 	},
 };
 module_platform_driver(hantro_driver);
-- 
2.47.3

