Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946C539F190
	for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 18:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781461684; cv=none; b=temruG2ewlrwzIw5DF01P/7Dt7zZU9Xr1Y/AW7bFqwlczqrVp/7yvbIcz31NhiNtzwIbN16B6ob5HZWTsUSYdb46rRby7lTCUxEvScD5Z9XfxHAL1sVsU3+91pgQiS+jhr306oWGd60FSIBp9YJeSVb0ZBvYKvOs26vbmvj9+YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781461684; c=relaxed/simple;
	bh=9VQXb37/Or/qSNElFDrUrry0MSn8N1cForwPp7aEyK4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C8VG/4dNizhYGe/OjinuQp4Huc6Py93QYIdkWiQKmu289Zk0/f7SyvyZWznu9HQi1Sad3Kb0+y4dpTFPAimhQrEpDIR6r9phCXqM7x0TJFBcp8YW0SNsO8KNyKeDcGv6dRlU/2HQMEmmDQmPu3Iq8wxq9Sr534eMFfF/75louoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HTWJfckn; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HTWJfckn"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2bf20f6be6bso19083175ad.3
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 11:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781461683; x=1782066483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9qsrt0s8kgZXuYTqnpy+aWUwIfATz6S7ngV0zP0tRrc=;
        b=HTWJfcknlWSBgArKxPdQwJTOHsU7rgphxG4+WSEc8ytKFbMmTuPTdziSK8ACiO5HPV
         0MCEzmdDC4w4gtS53FOL4zxwF+VILy6wE+KMDYkSge0kObwkP0RGLV3E6yHJVgiOw/pe
         YkaXEfhva3WmCNoYPfPzNWYeJoy9YFMVX8UyZbNx5p5K/2a7GjhOGjT+A5ZFP2OIDSsf
         r8q74E7d8HCpPnfYUhel6F2u+SiytAsl3W6vnL/SCWhYq2Mq9FB79AXOW4cuzLPE0GH1
         W1ZrwOO7nCOW/AhIDwRbWtzeftr83XVin7i5cuRXcQNsPzYTodTSdYxMTNfQORasrOSq
         1Gkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781461683; x=1782066483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9qsrt0s8kgZXuYTqnpy+aWUwIfATz6S7ngV0zP0tRrc=;
        b=QGb+p8xcK3xRH6+F3IAEEadtEdLrdEg3PqWDiqcFa2qz+31eUbp0IbfMobDAz6Csnh
         51ZV9DNo+n7tBebzcM41FPwqshnZ6wBrxvHSaOqs/G9IKukecd8o49NuLKOKU59qFyRQ
         e/WnjVMVAH2gS4hRqeFCL6AOndPNd9fsi8tk5BdOX2EJztyDL544bjGdr2ObMzkD6+NL
         jjWj3U77dfL2dILfyQBTqMLqWISRr07B1h+Jz+9fgVaTfX2/It7EkDHIHAJDdu96NCmj
         aElGS3C8xa3P1eQaSVIcyDAioKZQtp/tRXDy00UOo2q4zjt93GIFYwU82HRLbQzY3IZx
         Y4uw==
X-Gm-Message-State: AOJu0YxO90yHsNVw9mYPot3T3yzHW6dABCGTmG7I6698a3urOI8UKCsZ
	GiWiWv0/YUd7NPHrXViwNeLqTnMFZvl7g+QVta9XdeBDnRA/bXZeJqO19sGUknZq
X-Gm-Gg: Acq92OFc0qAy4mb3kw4nAyCQ1OtzG3M8144ffEjkNNm7NDZlb1HUwlg1/xpIiFStSCw
	k1/Tp4Bc8I5yemkaALio7Nh+SQg+BqAtuv0PHkX3wB+xAVr6LX2Lchppph4hldWeUiv2bNj0N3D
	wpkFR4l3Xqw/edSYQp8//DrZW6TAxOu/nc3gumf6kjWGpx1pcKfKxSCBUkfwjYBpN4JhuLdgzGV
	kWKjS955smL2nF1iQAxgpeer+vfT1p3mW1jsa2AODN5hmHMrN9+sMYDJVPQDEgONG/OtaaJGfWz
	RhycTD53AvIL7DxW0iRQyU3y4nx4UwMs0AHHxmx8RC5gs7GGQJ0wjNpUiABB55/QmICI2yhW6Xh
	WJaWSSCAbrBNuBaIwErZJBdtncN4Kw+p9q5Pt33PqIGCqDt2G0xCXmGBy0jDZ0CTJxXVlh/0Ph5
	mha2VDvOu2dkDtf6ZdQRNXPDDL45TZ8I9K/Itbj2tObipV3LBDnN3+
X-Received: by 2002:a17:903:1b63:b0:2bf:9760:b963 with SMTP id d9443c01a7336-2c411d797f1mr136555315ad.26.1781461682966;
        Sun, 14 Jun 2026 11:28:02 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e5369sm79161335ad.9.2026.06.14.11.27.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 14 Jun 2026 11:28:02 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH v2 11/22] media: platform: csisp: Add missing media_entity_cleanup()
Date: Sun, 14 Jun 2026 23:57:07 +0530
Message-ID: <20260614182714.7999-5-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260614182714.7999-1-birenpandya@gmail.com>
References: <20260614182714.7999-1-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The media_entity_pads_init() (or media_entity_init()) function initializes
the media entity, but the driver forgets to call media_entity_cleanup()
in the error paths and remove function. Add the missing calls to fix the
API violation and prevent potential future memory leaks.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/platform/renesas/rcar-isp/csisp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/renesas/rcar-isp/csisp.c b/drivers/media/platform/renesas/rcar-isp/csisp.c
index 8fb2cc3b5650..51db5ad25c47 100644
--- a/drivers/media/platform/renesas/rcar-isp/csisp.c
+++ b/drivers/media/platform/renesas/rcar-isp/csisp.c
@@ -556,6 +556,7 @@ static int risp_probe(struct platform_device *pdev)
 	v4l2_async_nf_cleanup(&isp->notifier);
 error_pm:
 	pm_runtime_disable(&pdev->dev);
+	media_entity_cleanup(&isp->subdev.entity);
 
 	return ret;
 }
@@ -569,6 +570,7 @@ static void risp_remove(struct platform_device *pdev)
 
 	v4l2_async_unregister_subdev(&isp->subdev);
 	v4l2_subdev_cleanup(&isp->subdev);
+	media_entity_cleanup(&isp->subdev.entity);
 
 	pm_runtime_disable(&pdev->dev);
 }
-- 
2.50.1 (Apple Git-155)

