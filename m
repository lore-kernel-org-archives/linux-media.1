Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463F5324B24
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 01:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789434818; cv=none; b=NE4d3HdoNKq48KS9dra9QmZk2vpjAy6bAwXyC5OireMWlpPkVz3R+7BXSFMejysVIVgkDaax1yU35UBZImrnXVVIEIjK3YYvE/nj8b41rKXMYIYR7NEV3FCpc6QWOVbjWfWQAvqIyesiUuV3+Whf1RfLG8MndKSSgiPkpv/m7zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789434818; c=relaxed/simple;
	bh=ArUMxvEg/9Wg+ds61xB4rMefcv6aLplEv1aBo/D5quQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qpu8prIgz1yOWi81kcOhUwzjTWjSOei9gIUsRfbAfsU1cIo9UvuPk5Gp0xwrOdu9FJU+hz+5XKy3ggUnEt2q69Y8vjCB7uDAvIW81VD5jQI8nSgV3ZuuhuS6v85Oas6ecm49nDr+xt4pW2y3XcGuLrrBccBTLaRd7PKKo1wrteQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FnmhLOqr; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FnmhLOqr"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-5309a20a55bso26870741cf.1
        for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 18:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789434815; x=1790039615; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AXgWED4DR0uWovVFKapj0G3QwW4Ar6tjesWzskazBmE=;
        b=FnmhLOqrE/AzmawEiKmoUTmXC7lptpm5Dok05KhkdnjSPdfZwCyOvtzkd3z/WC8wuR
         lu84UTHgVSbOZC/A2kw7QM6n3tWynrUz+bcGyq2WI77hce7+VzSnmsT52Qp1k8u6F95c
         DxekIXHqvNzh63kY5lSvPmHfKxKjUoDGjiKyUopXjTrGWDenFoUTM3gBHu9MFdStx/Sf
         hZieqXs0Js19wkKsgE1iRw12TRlQlOLOciLyoyhdUpMPswolMm+dkpUysypn+qdSMsZD
         7BvApNnpvmHWdibqky4DG76eYdEE4Hz5hwgfln0vC3v+EvL+S8RYw2SoRjhSwF93GAf5
         32Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789434815; x=1790039615;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AXgWED4DR0uWovVFKapj0G3QwW4Ar6tjesWzskazBmE=;
        b=wWsoQuqN9gs+Y4G0hriALK13Askah59jDm1udpolXDDa65Rm9Tz0rMwI5NaVGouZa8
         tBrBMI6TtYZB0Icrp+dpZRP0ch/ekawdrEudHekuyXEk5uqvkQJQbomCb34ImXjAqeKb
         ivWiL+9b/eXAboXNff5xcKj00RXtsct9hfW5g/Cr2a/L+2YyZLH2UJLbxaiAwABvvAYv
         utKWYhvto41ayolOGZ5lb6nGtn+k+YSODXr6R5HL3xZ6XXm3/ChzdOThisdJpEZjbphe
         kWNrt6PXDqI509S5XWX0iDTSSb1M2chpRJ5gX8JUJ0HPeByV0b+tfguAL7Q19d5okqt8
         bS6g==
X-Gm-Message-State: AFuF++n3IUyJoPppj/kdCAoe3jNSQPamUxgNAditnHcftN5bG1k/TsmZ
	vs/9HPJTVI4eaCtR06ZR3tR4wo8rPaRFgdQTHf26sWWK/mda4ltFJ/4=
X-Gm-Gg: AYBFou0TIuXN5DSzLdgcxopEcaWAi3coXuwmtgQ8G0V47nK10KptWrJqv0k6wIdJDGX
	mpo/oG+oujp3TGQ+ZHgfz2pVEw8rFNy8rH80+0YYLkxobC2RgLQ+/YQKMlK4yhMsIxRiAQwUPn8
	F2xmhP41IBshhOfTCIFbqCb4KTxfcLdNOMOsrN/NKlZ3KxsRfg7L+dXmXV9gu0/FNm3OTsHmt68
	LTl7GMmfs0Bx/+TL3EU9jLDSPCNI8fm3ADHnMgjR+iQJ8zllBv3UDvqmLit9CxdDVOOxIpA5a5T
	Cn23gnpjia49zWwvmObl5O43mucyJ4h/PqS5RNa1hgiwMB202IFyI6FeAJFe2ASmCoJWIuZukka
	Czqoq3VPXZbaoupkvA9PJKQbuYCXfDJTPyRkjSI5CtT4GiSvxoi3CsZtGJaMfPLcOMK/MMSTFs7
	EL479T2Dq/uBi5tPLD0XSGLDBidmepLky/SpvPnf3JGu1GyxQC5r1lq4wMk+bWr4PRil7vnhaU7
	22EGbOmbjer0IigEZ/ayqwzCh7CxwBrEtDUE6eJyfSuGpjfaTHtE8rOGVjUwTJDPLTu0+X9Wg1H
	dTXs7oX4kjZq5e4Biq3Q+T12wZQNyMQ5+TpsK6Wb3KG37dxG2t510A6g2cYQTAPMmfIVc+7JswI
	=
X-Received: by 2002:a05:622a:506:b0:530:5ecf:6e9a with SMTP id d75a77b69052e-5310cf6d5c1mr80899411cf.22.1789434814869;
        Mon, 14 Sep 2026 18:13:34 -0700 (PDT)
Received: from 6e-wmo5420-02.ad.psu.edu.net (6e-wmo5420-02.ad.psu.edu. [104.39.213.233])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f4b699bsm109060396d6.37.2026.09.14.18.13.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Sep 2026 18:13:34 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 1/2] media: sti: hva: Drop redundant clock preparation in probe
Date: Mon, 14 Sep 2026 21:13:26 -0400
Message-ID: <20260915011327.57695-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hva_hw_probe() prepares the clock separately from the runtime PM
callbacks. The callbacks balance their own clk_prepare_enable() and
clk_disable_unprepare() calls, leaving the probe's extra prepare
reference behind on removal.

Let runtime PM own clock preparation. Runtime resume already prepares
the clock before the IP version check and encoding operations, so the
extra reference is unnecessary.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: 57b2c0628b60 ("[media] st-hva: multi-format video encoder V4L2 driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/media/platform/st/sti/hva/hva-hw.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/st/sti/hva/hva-hw.c b/drivers/media/platform/st/sti/hva/hva-hw.c
--- a/drivers/media/platform/st/sti/hva/hva-hw.c
+++ b/drivers/media/platform/st/sti/hva/hva-hw.c
@@ -329,17 +329,10 @@ int hva_hw_probe(struct platform_device *pdev, struct hva_dev *hva)
 		return PTR_ERR(hva->clk);
 	}
 
-	ret = clk_prepare(hva->clk);
-	if (ret < 0) {
-		dev_err(dev, "%s     failed to prepare clock\n", HVA_PREFIX);
-		hva->clk = ERR_PTR(-EINVAL);
-		return ret;
-	}
-
 	/* get status interruption resource */
 	ret  = platform_get_irq(pdev, 0);
 	if (ret < 0)
-		goto err_clk;
+		return ret;
 	hva->irq_its = ret;
 
 	ret = devm_request_threaded_irq(dev, hva->irq_its, hva_hw_its_interrupt,
@@ -349,14 +342,14 @@ int hva_hw_probe(struct platform_device *pdev, struct hva_dev *hva)
 	if (ret) {
 		dev_err(dev, "%s     failed to install status IRQ 0x%x\n",
 			HVA_PREFIX, hva->irq_its);
-		goto err_clk;
+		return ret;
 	}
 	disable_irq(hva->irq_its);
 
 	/* get error interruption resource */
 	ret = platform_get_irq(pdev, 1);
 	if (ret < 0)
-		goto err_clk;
+		return ret;
 	hva->irq_err = ret;
 
 	ret = devm_request_threaded_irq(dev, hva->irq_err, hva_hw_err_interrupt,
@@ -366,7 +359,7 @@ int hva_hw_probe(struct platform_device *pdev, struct hva_dev *hva)
 	if (ret) {
 		dev_err(dev, "%s     failed to install error IRQ 0x%x\n",
 			HVA_PREFIX, hva->irq_err);
-		goto err_clk;
+		return ret;
 	}
 	disable_irq(hva->irq_err);
 
@@ -405,8 +398,6 @@ err_pm:
 	pm_runtime_put(dev);
 err_disable:
 	pm_runtime_disable(dev);
-err_clk:
-	clk_unprepare(hva->clk);
 
 	return ret;
 }
-- 
2.51.0
