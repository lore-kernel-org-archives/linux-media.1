Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793727677;
	b=p3tTx12wrrAgdezKywcg8KLYt41SwFOTACIPESAh0IPyvJfE4H97+Anf9igZYeU7qCRb
	 icxHHUYxc3sAna/+FwrpO6fv+minjO/QaEMNmEhHVI0eP9wUFFGsWI83zlm21dgkC56aD
	 h8Kw2zvoRTAwzo/uNyiSwaE/vWAJNpmIkXlasT+BjSwKeiHuAhDwwAA/LegT0s/ewYODi
	 r0XYsBZZxyP0EPOPqEZHPupZoiRVkPIJW3xjYDNRqlo8nCtMpxIgFL4hD1mjndPVK9QRn
	 jB4t4/WZ1w/7o0IFd90FbI/JOXpTUUMde6Jo739gszEYOFUprY+q4dqTvZqCrtAM5GQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793727677;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oHNHvREYR0wm3LWmCNsyJYmhjyQVEt+abPAwNQDa1C0=;
	b=HTaGPcPVMF7Bfed1osVz4neMeHKqnCxjo2U5niVzJUAYNS5Z1xrMIAJqDORULRsYhhJg
	 knM/dflrHFHxG3jgpm12qhc+aJ6WAfbjnN2jcPLWwRhOJmyihZLHUO7tjGstGJWMHJ8fL
	 l8Vib8LK4ZoahfytyHNYNOnixJIyJY8AcIp4Blpz2KE/4VWyQHcivWetEuzkzHuCav1Rj
	 7zRqMtIPwvBSVxuKUtO2Jct3E6DBponEnslE/Qwo7giuCyJmqO9gPRqtXljVRCGUR8XBr
	 L0jhS40QrasKbdzmcXRbTNnB8ed25l0N9HmaAp8aOi23Q66Kt4YyCRF/oGzItoSO7tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ycpcYZEg;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23217606A32D
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 17:41:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23217606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ycpcYZEg
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4af52002471so9461955e9.1
        for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 09:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793727675; x=1794332475; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oHNHvREYR0wm3LWmCNsyJYmhjyQVEt+abPAwNQDa1C0=;
        b=ycpcYZEgDDc8l1+keLvcgI9t9iBNb+CdwryR8PY8LUYsRLvqH4O8LWbcJzpjZLP6P9
         gcjK0cPqosWluXgcSEZ0w6NAckG9jI7YD11AUg8xjhqqBjyjAw984+p6Xou3ekGD6XSI
         B1NdNB2fHzlnWGp8DZt6rJCzzkt9WCtfuCVc0Oh4edi99w/YEm+bW6LLIv0wcc7hzdXx
         6Sx2TUbENT5I/EIHd86EsU8f2RAoag3co6YHJM6KGB70bx1XSmNlBUwFgMrpVi3aKjtN
         Vd5c0B5bsAMqVoXLS6yG3sih7MPJ5G/rVUepQCqGgnGzVsvvmN+i91JReBxxH9UfnH/r
         LI1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793727675; x=1794332475;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oHNHvREYR0wm3LWmCNsyJYmhjyQVEt+abPAwNQDa1C0=;
        b=ynlfcz3kwvzHHJOf2ncG+E5jZa5tRUkBmizGWZLti1ccdloVHYzyg+Z5vVw/J00iOv
         xswzfIbOUv9hxLdFQJUdkexNNI2pQVArqjUvxi8GIDxuVz0cZPoQONqfw9weHJORPi9l
         IKQKB1lqum07UnCQBcJ5u0oXsfqH5yXiIPgM071VPW1ZIn1WdEeSx5z14qXb+G4qnYTx
         j1soiegtljFkbY7H9iS9KIFFp0wV4dK0D+nn/9e9d6/HFkMf4JZ4Gzt6qJTOYnEhU9za
         4BybFD4D2iaVSI3W9NK6T6H7lHK6LWxvTaPjnT0OUWpIKvYot7YDccfC1jdp44PqL75k
         TZ7w==
X-Forwarded-Encrypted: i=1; AKwUvBxe37+2dmQ2eaCk8TOAp3ajd40zuwEDy3MalFBHnzfi/r4MxaOi0wHLjzofsZ/fIgornRKjZ252hKSIVg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+5QkqXiHFhm2pq6OOEjqMZA49lxkixIquYb3zT+7cQEvbKp7dD
	GdGw9DhA/aDDP8NHSBeimFlNUFBXdVNs1VsV5hLedT1liCyYoc7RbPPh
X-Gm-Gg: AYBFou1SPCWIJY/IYvcRegN/P0Ya0VezoOf6BlZVETpltbD3Tikz4WmltGOeYei1mss
	XmMrTK/aiyPwm1lYkBK8MLqdxclX4DPrfTTnbbLgf0LJF6V4Pxj66SlBmS9HzKfjB3cQtsUuXsN
	zMT5WINDtuFo78z4o90lB/GoIyVARqbJgfflBTu294iqCJmBzjtwI0i9mi+NlM3bv8/4ofzmCP4
	fZqKHKn7g3Mfxkbt9YaP16tw6HO7pMn8+2avSQyTpZTnILULkADSzFv6ejS3wPO5YAwG3HWUDzV
	jB1WsaI3G0VeI+lt86tjx+sTu1ZEdbOPLBguSFcEbl+wZRVryE50JBe69mvKVwhuRqa3SC1D8Dk
	RIy4rtEntDkMDXaTgukAjoLODOITqdkshiNwGIqfpTU+SnJnSUFQwg3Nc9crTG4REdogSdZ/bpW
	UVmr4Rzf7nrM68dSqoMDTzv2BalDALkEVqyLrHiXLsH0XpNq2cKaZv4OLYQ2L5GQaS0aUxkXUs+
	XQIGCu+JWiAHrtDruRPo3jJAjp8KDTaq+jWB3wnNfDrrB432fKSICDiE023NATsnVKopuplbUAN
	UyXHkFT1KWnDXIBsFMZ707VUFdNZXFhP43/WBsgPCIvZVxGiUasyV942d0W+qW0NEbyjVmRPFt9
	OA8HajF3C8+ZEPY+dPXc=
X-Received: by 2002:a05:600c:1798:b0:4a0:1f9e:5f78 with SMTP id 5b1f17b1804b1-4ac1228a41emr201492065e9.0.1793727675455;
        Tue, 03 Nov 2026 09:41:15 -0800 (PST)
Received: from thomas-precision3591.paris.inria.fr (wifi-pro-83-006.paris.inria.fr. [128.93.83.6])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4b2a879f401sm69989215e9.5.2026.11.03.09.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 09:41:15 -0800 (PST)
From: Thomas Fourier <fourier.thomas@gmail.com>
To: 
Cc: Thomas Fourier <fourier.thomas@gmail.com>,
	Yemike Abhilash Chandra <y-abhilashchandra@ti.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kamil Debski <k.debski@samsung.com>,
	Archit Taneja <archit@ti.com>,
	linux-media@vger.kernel.org (open list:TI VPE/CAL DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] media: ti: vpe: fix double free after video device registration failure
Date: Tue,  3 Nov 2026 18:40:34 +0100
Message-ID: <20261103174036.62882-2-fourier.thomas@gmail.com>
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

vpe_fw_cb() is called asynchronously by vpe_probe().
If video_register_device() fails there, all the cleanup functions are
called. The driver stays bound, so vpe_remove() later does all of this
again, freeing dev->m2m_dev a second time.

Leave the cleanup to vpe_remove().

This bug was found statically and is theoretical.

Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
Fixes: b2c9472f0559 ("[media] v4l: ti-vpe: register video device only when firmware is loaded")
---
 drivers/media/platform/ti/vpe/vpe.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/media/platform/ti/vpe/vpe.c b/drivers/media/platform/ti/vpe/vpe.c
index 81bd1f9cee30..761aa40a066e 100644
--- a/drivers/media/platform/ti/vpe/vpe.c
+++ b/drivers/media/platform/ti/vpe/vpe.c
@@ -2496,12 +2496,6 @@ static void vpe_fw_cb(struct platform_device *pdev)
 	if (ret) {
 		vpe_err(dev, "Failed to register video device\n");
 
-		vpe_set_clock_enable(dev, 0);
-		vpe_runtime_put(pdev);
-		pm_runtime_disable(&pdev->dev);
-		v4l2_m2m_release(dev->m2m_dev);
-		v4l2_device_unregister(&dev->v4l2_dev);
-
 		return;
 	}
 
-- 
2.53.0

