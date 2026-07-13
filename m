Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3547B30F927
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 17:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783963008; cv=none; b=Xbshv+sakxsCQuNtCptW7ruCFn6RsIsTqJ55YoFw+g5WPM2QLmqTu9JSg9/w09efQFa1m02Ypu/AB7K43F2TZQdXS7h1XqoJ9+Tmk4XDq2dhy4SMOOzc5doOJLQ+tAsGLNGbg3mQDzVfMcnogIqyEFM3anymevipH0Z4ENfc4LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783963008; c=relaxed/simple;
	bh=DtDlb4T/GlICkbzrC4fhGZYL7BcVSaw/4uXDAPCLN2w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YnKph5iWqRGN5yT7G7lKeMF8Ky3Kc/dwkx7KCsFV4WmAa5HYksgoE8lP5AUC9E95t4qTiRQB5vU72gH4af256jf3pa1ChHgzldAM+ngA6HscASW9pdjUUCSEetza16FlTlHCZ15HARO7YpdYbe4AcKzy3I9av58Lko6FTATtl8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lr2RXsZd; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lr2RXsZd"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so2186485a91.0
        for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 10:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783963006; x=1784567806; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r8F7PDpBGQrWy7oTUa6pu42Pf+937GWEA5yn0veEyiU=;
        b=Lr2RXsZdvxSUVYKcfulvklbhUhu8npH2JQEUKC5yPf7ItCmPWvG3NXopB+af24s5a+
         UapGKAJx77a0jjFjn+yJiK5keNGj8WSeZYV2tu+hZ5+dCLl3TqT3eYcRforF9l/2ThJZ
         Dtqe6XIVTNdgApjtcwfskrTA7fSqKXipwOeTxuYvdGKnbG64v0Jbs6UDDTQ4mfMLRHu8
         Ar7wm9RZqi3nzFmbOxVlQ9iStLoifVn0ti9NtPYMW/If2NdNYy49wI+fN+tXTgj1unjb
         o4g1WcaX8Dbu5nbrdhX1qH+fS65O0licOdDXRvwaLd8xePSDKAvBrEc+uzCtOdsIwdRr
         fdlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783963006; x=1784567806;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r8F7PDpBGQrWy7oTUa6pu42Pf+937GWEA5yn0veEyiU=;
        b=rMOSQ6VPm7gZEH5Jdoe6jYmfmGRGdkhCktYpPUQLTcrQ4KJXKLXCkv40tToCJZ5uPa
         LS21si5W7KYn9CFo8wNSPjZLJUUGmJ7jQl4ib6lkPUKAnlpkcvpWzxY3FXWoBtPLHBWE
         w56I4ZtJGyjKyEgAPfRpV9zl8cha1kDtBn5JF8KXzMC8qOl4fzFtlwCwErOV29lOafHH
         Irg2XM6RJI1jD5DynuloADha1DUgDdLtsXOiQkQpO8Da1UBD7ErXIUz1mx0ti47jLanr
         BiMOpdBOudmF6rJBuJ+KLqWz9+sDVFqh3B90FsexU14uRpHCBDuiRQTuZO79neFal1pB
         rnxg==
X-Gm-Message-State: AOJu0Yxu2IhQpT0TH0WVeO35FZ+uBf8ViIUi12qlCRP5dANesBvvjSKI
	Dh5oYsXTe15yaFMTsoqNRYi0UPdL8pDsFGQu/tdneHxVMx9aHRasaKFQ
X-Gm-Gg: AfdE7ckGwWCB7DAMsQ7TZmO6eSdu3oYixdb80AMZFh2MQA/H71ggP1dChPgNQji+iVR
	dEJ4mLKdNu36Piz1kMTJ6yt+kkfsZANW/tSWQIMPs6ihw9eOUCkQSL+OSJOBNmV1CfzAWMveyQX
	yPdx1JqqRfFZ1IHXpZVHErKK6o2QhMtBqE5TmzxGcKRJA70OCQfB4F8Xu+oT7vzV23M/Pm7rNtm
	FDYEsxSq2D6Lmn/c+5vi1+AilunK3lPtnwhsS21u5YylR86QtxMEO8Mu1uEp5E9exNUP/35LS1o
	RYKmwME4Ci7yH7sZSBIqYCx/f42sXDTP2SafSLJFySIhoxWBOYsNoWQnGOn5iaxA3UkuZ3WuDsF
	Ogkz4LCa6a0newPCVUnN+khExwZnU5rjtScJ3Tpb/zW106xxvFU65KPslkVSFY3Gf2Z9ff5Z0i+
	OVVsQBYidlLhGY5ZpWGupyK+SCQi2NsHJCIRayrIQjslioftOExIz1NiFCIkwKKNQRO8k9koRtH
	3X+4GViq5o7If6+9K6UeVAa+30D5Rzm6S6yWj25TTBYe9M=
X-Received: by 2002:a17:90b:58ce:b0:381:152b:d596 with SMTP id 98e67ed59e1d1-38dc74cff62mr9789745a91.11.1783963006364;
        Mon, 13 Jul 2026 10:16:46 -0700 (PDT)
Received: from OMEN ([103.184.238.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311a6115e61sm55281016eec.22.2026.07.13.10.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 10:16:45 -0700 (PDT)
From: Alfie Varghese <alfievarghese22@gmail.com>
To: neil.armstrong@linaro.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alfie Varghese <alfievarghese22@gmail.com>
Subject: [PATCH] staging: media: meson: vdec: propagate devm_clk_get() errors
Date: Mon, 13 Jul 2026 22:46:44 +0530
Message-ID: <20260713171644.691-1-alfievarghese22@gmail.com>
X-Mailer: git-send-email 2.54.0.windows.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vdec_probe() maps any devm_clk_get() failure to -EPROBE_DEFER. This is
incorrect because devm_clk_get() can fail with other error codes like
-ENOMEM or -ENOENT (clock not registered). Hardcoding -EPROBE_DEFER
masks these real errors, causing the driver core to retry probing
indefinitely instead of failing early.

Propagate the actual error value using PTR_ERR() instead.

Signed-off-by: Alfie Varghese <alfievarghese22@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index a039d925c0fe..fba1e7f88d81 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -1026,24 +1026,24 @@ static int vdec_probe(struct platform_device *pdev)
 	    core->platform->revision == VDEC_REVISION_SM1) {
 		core->vdec_hevcf_clk = devm_clk_get(dev, "vdec_hevcf");
 		if (IS_ERR(core->vdec_hevcf_clk))
-			return -EPROBE_DEFER;
+			return PTR_ERR(core->vdec_hevcf_clk);
 	}
 
 	core->dos_parser_clk = devm_clk_get(dev, "dos_parser");
 	if (IS_ERR(core->dos_parser_clk))
-		return -EPROBE_DEFER;
+		return PTR_ERR(core->dos_parser_clk);
 
 	core->dos_clk = devm_clk_get(dev, "dos");
 	if (IS_ERR(core->dos_clk))
-		return -EPROBE_DEFER;
+		return PTR_ERR(core->dos_clk);
 
 	core->vdec_1_clk = devm_clk_get(dev, "vdec_1");
 	if (IS_ERR(core->vdec_1_clk))
-		return -EPROBE_DEFER;
+		return PTR_ERR(core->vdec_1_clk);
 
 	core->vdec_hevc_clk = devm_clk_get(dev, "vdec_hevc");
 	if (IS_ERR(core->vdec_hevc_clk))
-		return -EPROBE_DEFER;
+		return PTR_ERR(core->vdec_hevc_clk);
 
 	irq = platform_get_irq_byname(pdev, "vdec");
 	if (irq < 0)
