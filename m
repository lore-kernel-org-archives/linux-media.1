Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7E743CE7D
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 14:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785420879; cv=none; b=OUbPS0ILhV5eFWEMqYIKkrSeEmcKgz+tTPJxGyfsURF9O+Z5HHKLt4Vap6g/XlvAh11uPu8ac8BPBujuDtgnglGBcynPAynI0xN5z829BwYD1uIE17L1NCs24BdQ4AyZfpf/rYS0GPqRT15FVV0Bv/eoEFHKirMC0xWUAeRSSho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785420879; c=relaxed/simple;
	bh=LFAVFR/Ebd0M8gVoXYCoH/VogyPRgNY1LFnFp/ZjP10=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Oug8o6qvMwBILxk09VFVvj8RazssJfXiwYQY6kLANOiV+RIsKRPqeo8+m1keyT1r2hYbU7X+bmBinRWO7ff5dWGw2SniNF1hpNr8xuG6LckIsI2oh4bZRYKfjJn1Z/c7oe8tiTm1Yozc+umYQMfPKvDAftdtjKjveV56wN5/Pv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TlHN+I60; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TlHN+I60"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-51c2a818fc4so13550581cf.2
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 07:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785420877; x=1786025677; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r2Ag2eYiDFYwVSdn+oCdd0do6bhUzUtBZUhVY0F4OiY=;
        b=TlHN+I603i5D7i6/c4uyfDF3JNOPP6FU9mcolDbcVPoJ1HpWcpp2DtuoUu7tGE92lo
         +S5VbL5WyZ0J8s32P4l1Myg1OJ/i1FCnWvAGbMyEkEvkMVj7wwnl95Ab84irpJG8EI7a
         6Ks1qAJPxQgE+hKSYemw/OfBTukIduFWOxV7ATwLK+NCMx/tmGFVNS1pR/ZvM+vdwdUz
         m2uIN9sbfexu2toBo1nm4MtECXGzbpMt8CcKv0PD1pSWRxATLjEl3AKuge6mMWdmmbx8
         MOGy5pombvvVBjl01R6i/ZBlP35pF4Uaic4aVCKtZU+SXD23NgAKmP2QTClisdcM/WT1
         IZJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785420877; x=1786025677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r2Ag2eYiDFYwVSdn+oCdd0do6bhUzUtBZUhVY0F4OiY=;
        b=EsHfp6zyv7oh2wu2/LqBfXU4+cbaSYXx9HlYldqtq1RBqn9AS4N3dbDhLZvFr6Fz0F
         uDBRgRYUN9cFl+Gpq9XytV7tH93BhJ3sBN8BdxGnAhbWVcMFJibcVZbn59YxJico3xiN
         d03VoHY/+fEsbat0Ee8NYkrWIIqzUkrjceq7rSp4f6id2fKg3f0IzI2bfGKNLc+5mM4+
         nrhK9GlPbE/rSaiPs9rt4q16kZSd2r10qcI2Et/2muY++ItMqQjfQNcATDwsiANJTCN7
         Qyv3LalVqtGAGlAHC2/miEQbfRzPptE7x6X3xE0jdJVubJcRVxzUzW8Jnn6zw8qso7mF
         MHiQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrl8Q6MdaPcZizt62LHzXrCgXBC7tQTR8KqcioRLZvImucGSyGtZqmXLJSmuhlR15M6zH98+DajqAnqZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6fEJin7nGegGDA8yrPqHkTaM3BMJZ8BYBGH6tV1axZ1CuGbSF
	YSV5YZK1yBGUesBNa4f2zqr/NCMrv7Y01FlTyAU7jQ7rV1PTtEASpr0uxZbPU3PV
X-Gm-Gg: AR+sD10SNX+CXPb5NIsJoyBfWzLzqHLOLVzkashQDF3QUtKmfwoVuxjF+Os9NlvbrNN
	EFOhMcNjkS96y/ygRFtN/upxn6Ayo700d00heU/Kr4CXmBZQDJIMgNi9T8TUe0GrbZzBE4uIUJl
	v4BkAMUliovDztki2k/153/5Ta60ZvN1BoegZCvf2oyjqP+U9e79ZYYvUtzJpBtdzGJvuOeEwaC
	I8A0vqdTbb0maZEAierlsP60HEusL5AopihPZaOIJVV3suUAJokDHIpNlXSEtNvbrUxhNb/4R8X
	/RKGvTYoYQHlJaTFaaD6sZngCqbok0X9KFFJNthy0bkUkmLc4KBrJ5kPL8Sq1w2GVIS5sTluDbA
	B+srQXVQY1aLQue0qbd/GtDfbZSlEZPRxmUkYwyoh/8A25+UT3xZhIdkaLf1TOXum+mI7W5Bm7V
	31mPtS9U36A1FN3jdc2zY2527LWzZ6SdX2k67Oaqv3iv+0AD2Has6djZYcBe+SiFEFjpctWT0ha
	ZaDAXkpU0Mir9vPo4fbKYXumWS7sUDzVGEV0NMsg+8=
X-Received: by 2002:ac8:5750:0:b0:51c:9e6:ec42 with SMTP id d75a77b69052e-52b38678acbmr30445901cf.57.1785420876340;
        Thu, 30 Jul 2026 07:14:36 -0700 (PDT)
Received: from LAPTOP-DPAKMOI4.it.purdue.edu (pal-210-106-74.itap.purdue.edu. [128.210.106.74])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-529e2ff6f31sm41998101cf.27.2026.07.30.07.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 07:14:35 -0700 (PDT)
From: Yifei Gao <gyf161023@gmail.com>
To: Bin Du <bin.du@amd.com>,
	Nirujogi Pratap <pratap.nirujogi@amd.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Sultan Alsawaf <sultan@kerneltoast.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yifei Gao <gyf161023@gmail.com>
Subject: [PATCH v5 2/2] media: amd: isp4: fix self-deadlock in isp4sd_pwron_and_init() error path
Date: Thu, 30 Jul 2026 14:14:04 +0000
Message-ID: <20260730141413.4136502-3-gyf161023@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260730141413.4136502-1-gyf161023@gmail.com>
References: <20260728190754.363464-1-gyf161023@gmail.com>
 <20260730141413.4136502-1-gyf161023@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

isp4sd_pwron_and_init() holds ops_mutex via guard(mutex) and, on any
init failure, jumps to err_deinit and calls isp4sd_pwroff_and_deinit().
That helper takes the same ops_mutex, re-acquiring a non-recursive mutex
already held by the current thread, so any init failure deadlocks.

Unwind the error path in stages instead, releasing only what each
failure point acquired. This also avoids the issues that an
unconditional teardown would hit at the earlier failures, such as a
runtime-PM underflow from pm_runtime_resume_and_get() and MMIO access
while the device is unpowered.

Fixes: 4e5e7a7ddb4a ("media: platform: amd: isp4 subdev and firmware loading handling added")
Assisted-by: Claude:claude-opus-4-8 smatch
Signed-off-by: Yifei Gao <gyf161023@gmail.com>
---
 drivers/media/platform/amd/isp4/isp4_subdev.c | 28 +++++++++++++++----
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/amd/isp4/isp4_subdev.c b/drivers/media/platform/amd/isp4/isp4_subdev.c
index 48deea79ce6c..868d1c74d35e 100644
--- a/drivers/media/platform/amd/isp4/isp4_subdev.c
+++ b/drivers/media/platform/amd/isp4/isp4_subdev.c
@@ -687,7 +687,7 @@ int isp4sd_pwron_and_init(struct v4l2_subdev *sd)
 		if (ret) {
 			dev_err(dev, "fail to power on isp_subdev ret %d\n",
 				ret);
-			goto err_deinit;
+			goto err_module_disable;
 		}
 
 		/* ISPPG ISP Power Status */
@@ -697,7 +697,7 @@ int isp4sd_pwron_and_init(struct v4l2_subdev *sd)
 			dev_err(dev,
 				"fail to set performance state %u, ret %d\n",
 				perf_state, ret);
-			goto err_deinit;
+			goto err_power_off;
 		}
 
 		ispif->status = ISP4IF_STATUS_PWR_ON;
@@ -709,12 +709,12 @@ int isp4sd_pwron_and_init(struct v4l2_subdev *sd)
 	ret = isp4if_start(ispif);
 	if (ret) {
 		dev_err(dev, "fail to start isp_subdev interface\n");
-		goto err_deinit;
+		goto err_perf_restore;
 	}
 
 	if (isp4sd_start_resp_proc_threads(isp_subdev)) {
 		dev_err(dev, "isp_start_resp_proc_threads fail\n");
-		goto err_deinit;
+		goto err_stop_interface;
 	}
 
 	dev_dbg(dev, "create resp threads ok\n");
@@ -724,8 +724,24 @@ int isp4sd_pwron_and_init(struct v4l2_subdev *sd)
 	isp_subdev->irq_enabled = true;
 
 	return 0;
-err_deinit:
-	isp4sd_pwroff_and_deinit(sd);
+
+err_stop_interface:
+	isp4if_stop(ispif);
+err_perf_restore:
+	ret = dev_pm_genpd_set_performance_state(dev, ISP4SD_PERFORMANCE_STATE_LOW);
+	if (ret)
+		dev_err(dev, "fail to set performance state %u, ret %d\n",
+			ISP4SD_PERFORMANCE_STATE_LOW, ret);
+err_power_off:
+	isp4hw_wreg(isp_subdev->mmio, ISP_SOFT_RESET, 0);
+	isp4hw_wreg(isp_subdev->mmio, ISP_POWER_STATUS, 0);
+	ret = pm_runtime_put_sync(dev);
+	if (ret)
+		dev_err(dev, "power off isp_subdev fail %d\n", ret);
+	ispif->status = ISP4IF_STATUS_PWR_OFF;
+err_module_disable:
+	isp4sd_module_enable(isp_subdev, false);
+	msleep(20);
 	return -EINVAL;
 }
 
-- 
2.43.0

