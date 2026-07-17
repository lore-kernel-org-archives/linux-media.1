Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F4A39768C
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 09:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784279569; cv=none; b=WzICgXBdJCv3M09XiHK81MTOVQHaFtHLaf52+N2O42QQQwCo4JHx6yiYm77lJ5ZySuzGWMB7pZfZvInRlqHb/V0FGA4TkwX0FHhKcLwbCYJm57yHiVJxkyr7jr2nEp/vt2NOVYeGlWTY8oUZdqQX45HlLSoN0t/9hXe8M/n+0rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784279569; c=relaxed/simple;
	bh=yIz4iQK5+XnSElbvxpVyKeCtm2aB0XPWq06WwcY0akc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bsu34OjueAsnbzjyE/gkWhb4nhabN2Pt2brjc+HOUC3M8WdKoH0+dn8LPfDG7U5IZA40t96XFQ9snMNE47OKEPNVk3AT5AoJ/079USPqTwdTHqtuBTg03AegU1nwLyj0j/hbUKQ7+bFdiX+Q58Unnwu41sqjGC0/ecNMrQz36zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sCBrHF6L; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sCBrHF6L"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7e9ecb1e13cso5773688a34.3
        for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 02:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784279557; x=1784884357; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1vjRQW9QVJHcJVvAFqOxAUXoWYTgSZXMsr0BOdEwxOE=;
        b=sCBrHF6Ln2FGGcwIUwNvKoSdPmWfQnfbsE9ADXb+kbHjVTmVe3p0zZWW9IUFIUOMmd
         BIeSCFEFGImbBlV5vRcjg4o8X2XBGqTIPMJBdlVWVNWM/ARmBvHGihZhZyJO3O86ODHE
         UuG0O3yskfFcauwXbsjt18UZpUDkD8zPxni5LgRZnQhugHlx10+eZOx2OYPMWMFL85Nr
         qGi3nlAxQEOlvBIlYuhKoLU1dXx3rvfbp0LjC5leFYJYXJuIBIOooRbminn9Sjtdj3a1
         2xysxT9ca5ysGgk2A0dxLc2DtQxftPLDd+2hPAbW45zyRQgV4Mf5CGmuayrxw8l3F4wU
         gXrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784279557; x=1784884357;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1vjRQW9QVJHcJVvAFqOxAUXoWYTgSZXMsr0BOdEwxOE=;
        b=BpdJYKWTzqu4F7ItD49SBtRQM0CPkvBlccC6REv20AQKWU+3OYhwJuGUDpUULsFhVB
         dVNwr1SosIHS5eBPW5189empd5IBRaIOOEJpXg3jPRqhPeGwlvrhQ3+scgaKnIymej14
         YYdF3yUPtyqn0Jta5E4/mmc6Ij4k4FnFp4dumew0ti7GBRcnseUzcEw0S0AGklZuWeoi
         Ff+N0lyVOdtsWg55wImVcz4FSQmzDOE+WcT5elcw0M1QYFnhLNAYIyAJCIk2o7j3poMz
         J+jmFDwy715WNfLT4n7lX8Sbi5DqQGobf6H/6eX3XLiNBfdm31uTwHWVFH4qvuzk3oPx
         dD/g==
X-Forwarded-Encrypted: i=1; AHgh+RpvCRC3QUj0SKgP0wb7P5n11LG12S9YdPHMLzgnXMm3zsl19a58erwWcMYPOAoAMwGBcs1cgYE6k/cmCg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzF0bNC9dkgEiCWlcOkc72CU3J5wA1edZEbM3DWkbHZKolEGZoG
	SpgBBzo9I4H5uWUoA13KZoAmGpxj9Na2zUJsHso+7iXFgoPbYMlSZD/KObcdrOCo1LY=
X-Gm-Gg: AfdE7claG4H3OxUicypyBMPF+0x6TYbNvi0fgzB5D44xukO/Yr+n8dEqQBL8C3bKxmB
	hhVCYnDqo+4KIKKMYfV+TPVpCDXqO2JwMSchT3tPxHDLiXNfmWsF2dbeZFrmXxmoIc+Gld5QmoA
	se9O8hu8Eavz5l6+u25NYsrJXuRREMFce4tnvSiSdTuP4qKfvzT6N3Mp056SkzMoCtd4O99e8MU
	Wyvb3T3J3r/TbtVpRNaDNn/07/Q7Y55TuMtP+l1YlIB8nwcPJnQOWvr4NbG7c9D7EucL/iZd0q3
	TvQwuTw6q+CQ3URNBztf9MZy5xQFW21dMe6zGJE2yuqqVZDbyGGGNQIyvxSl6dqRhhj0pL+R+Gf
	3OfkDHmGe8P5kqXpgIZSN2ZM022M5qtYAq4BwgCgqoiqWG+4G1ar4s1U0rtP6/GBf3mOduQ==
X-Received: by 2002:a05:6830:6f4a:b0:7e7:7fbc:8e51 with SMTP id 46e09a7af769-7eda153c745mr905058a34.24.1784279557354;
        Fri, 17 Jul 2026 02:12:37 -0700 (PDT)
Received: from localhost ([74.80.182.90])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7edad91b8a5sm899701a34.5.2026.07.17.02.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 02:12:35 -0700 (PDT)
Date: Fri, 17 Jul 2026 12:12:29 +0300
From: Dan Carpenter <error27@gmail.com>
To: Alain Volmat <alain.volmat@foss.st.com>
Cc: Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] media: stm32: dcmi: fix some error handling bugs in probe()
Message-ID: <alnx_dGHIBYpZuHo@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

There are a few issues here:

1) After we assign:
        chan = dma_request_chan(&pdev->dev, "tx");
   Then the error paths need to clean up before returning.  The first
   error path does a direct return.
2) The error paths check "dcmi->mdma_chan" but that is not assigned
   until later so it results in memory leaks.  Test "mdma_chan"
   instead.
3) The error handling calls dma_release_channel(dcmi->dma_chan) before
   "dcmi->dma_chan" has been assigned which leads to a NULL pointer
   dereference.  Use the "chan" variable instead.

I also moved the call to dma_release_channel() after the call to
dma_release_channel() so it mirrors the allocation code better.

Fixes: bc901885fae0 ("media: stm32: dcmi: perform dmaengine_slave_config at probe")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
From static analysis.  Untested.

 drivers/media/platform/st/stm32/stm32-dcmi.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
index eeb0199864dd..c9f08b2465be 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
@@ -2024,8 +2024,10 @@ static int dcmi_probe(struct platform_device *pdev)
 	mdma_chan = dma_request_chan(&pdev->dev, "mdma_tx");
 	if (IS_ERR(mdma_chan)) {
 		ret = PTR_ERR(mdma_chan);
-		if (ret != -ENODEV)
-			return dev_err_probe(&pdev->dev, ret, "Failed to request MDMA channel\n");
+		if (ret != -ENODEV) {
+			dev_err_probe(&pdev->dev, ret, "Failed to request MDMA channel\n");
+			goto err_release_chan;
+		}
 		mdma_chan = NULL;
 	}
 
@@ -2206,12 +2208,13 @@ static int dcmi_probe(struct platform_device *pdev)
 err_media_device_cleanup:
 	media_device_cleanup(&dcmi->mdev);
 err_mdma_slave_config:
-	if (dcmi->mdma_chan)
+	if (mdma_chan)
 		gen_pool_free(dcmi->sram_pool, (unsigned long)dcmi->sram_buf, dcmi->sram_buf_size);
 err_dma_slave_config:
-	dma_release_channel(dcmi->dma_chan);
-	if (dcmi->mdma_chan)
+	if (mdma_chan)
 		dma_release_channel(mdma_chan);
+err_release_chan:
+	dma_release_channel(chan);
 
 	return ret;
 }
-- 
2.53.0

