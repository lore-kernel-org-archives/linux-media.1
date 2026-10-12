Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282D631E84B
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 04:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791780452; cv=none; b=WATQ6LP7fhQjh/HM2+VA/1n5VJzLnnaAAgVFCMTuZFzZqF5wJVoT5JFNCAwa4auNCH0VTpAC+hKWNlW1gGQldtOjK1WJ6MQssOtWndAEn3updE4/y4C1m7zH5aUwXAlqn6Um1lYHewXWY1XwMcmjT29BeNDpgZpLRfzUJi/I5bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791780452; c=relaxed/simple;
	bh=rHZ3blwmnCwtQE8g8vuh+GnhZEPjJ38mSCnJsVHGq0s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PGVPK7NeSQIsQhU/Hozq7dUvMGCgKmH8vkuo1df16A2ZB+4yIihkUA2IckTBCY/A2/ZAVNCo788EchmYylSJYEq0AA/8V4Ud6q/WkQ7Cu+gB3RQWjXCXIedczRrNhEMp4IFlBGRb9WTrUVDqTyN0ErqCFqjCgNGOtotm+i2z5OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OgLb3cIr; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OgLb3cIr"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-917a9f42283so18561876d6.0
        for <linux-media@vger.kernel.org>; Sun, 11 Oct 2026 21:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791780450; x=1792385250; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pwHcr7X/ONR4Ul02KZqQ9Bn6G0VNj5fx1pck5G2EhHI=;
        b=OgLb3cIrul9TRAghF8w2FppoB88m4wDGTQT8OBsjzxa9JUW4WgQVCFZUTC872/M6+M
         wrbWHkTym3mjfLyjP2UKsa/XCRggTVehekziJnuDxa7gjGK1Q6BkSP89LMlrD1bvGyVc
         PmLSMhRlnmDsnct5+YTiJqrhR+pREze/VtRRamLBOtT3s/ed6O1sC0xQMtHgHMKmonts
         Pqtw1cx/kf/5E39QV2DsFevlrRqooBPXJXmNwimnQZ7HLQPBvTDeBUhnkfMT+q5Aqc7V
         YP0g8cA7tBvo8e5zMV2VFGiKdSSDNxmH91+1EyKSo4/zh+051qMad9SBN10aRUuRtBMe
         NiKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791780450; x=1792385250;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pwHcr7X/ONR4Ul02KZqQ9Bn6G0VNj5fx1pck5G2EhHI=;
        b=uQLfUZmDE6h4KQ1Wt8hp/Qe9IRE8wc/OtS2pAXAVxgMFICsNdeH5BAqeLn81TJNwFH
         3sOj6936bOdJaV6yuerr49GMU/S9hssH5HTmLnEYVBm297W03rjgwBuvJlFxtrHQaya6
         p+bINkT+eKaAeDgLyRKinXcS4QziGqXJgoVc4/sQ280586qrQfJALUl/QD2DRnyJ8qpn
         24wNmpx/ytGsOYcm4GtwICvlYxuS+uuMvR6aCmdBQTjTSQqJDHjNAvZEwhOasuhGkVY5
         MA+HLzqdU+W7y5vrsitHIMocl4LrhM7hmmaWS8sfXLjpIxLySpta0q1vY80zMRhsh5pI
         3N+w==
X-Forwarded-Encrypted: i=1; AKwUvBzQ+dOsZUAc4yXnSypd2mh4SOC2zzI345lbqX5qImDWM73iwY93qzIG1Imgps//izMm2r2X8KDTXpnvrg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIhu4uDciWqWO6yUGkIBYr6+5jmJaIysKjZ98YYBTmy6XPcaRsc
	mIJxGRHgAmbnc92oiJaWbHBCOrg68w5iz791FXxnrnX2Ki99b2NtlC0=
X-Gm-Gg: AYBFou1TMIUB22AnARauugS6qyt//1DexN6Ck42rak82q7B8f74y0ZlI5jHw9lpeSd3
	SRF/5GFB5EzUU//LExjGi32WTMTiXKD3M52QxW2Wo8t2oEqIeY6/fqfI180QX0L73/+HLkzpPEl
	HbCg5jicz4E0IqSxyWvZJ6PecmrxF199r2E/ZhQjXW029mfX/rEicxIbAd26e/MRTKuyJ88wFk8
	YrhuE/vBFzyP5zM5oG7Xd9lUe6iWVsD9T7pH+XQilc2eNEcua1ci2fpgnIn7nGY2trIb7s68b7B
	/vFQ8zGbF9h3qekgFgmuqdUNUkzJlnzevjGxoxaGB9vWSCo2O+whTtzMP6ho7UTFX/pk76xwefv
	xqATgRhYhRZEuwu9h5/HtFlXKfjNn0E0v2LB8hRoN/xR+H4KiZu6Zcg9zsmtYiAKnfToH/napBd
	J+VDW//92DTbLx7taOkq46v9BE4HKjtHXIiRYiXLRhmGVjKxSP0u5Msnw41L4q7uiAqcAJ0pn4Q
	j/lle9racoLVWhyQDXCcr/A8YF5T1PNWECmi4ngzTaiTYOUHQUpdTwNViVCi67yX9n65XNm775n
	bkdUrh/pWncex8xy9sp33kEmbACmiA==
X-Received: by 2002:a05:6214:85d2:20b0:91b:5e33:9858 with SMTP id 6a1803df08f44-91b5e3399d7mr99215696d6.54.1791780450035;
        Sun, 11 Oct 2026 21:47:30 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b812ba8c7sm17513956d6.38.2026.10.11.21.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 21:47:29 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] media: atomisp: drain assert recovery before tearing down resources
Date: Mon, 12 Oct 2026 00:47:24 -0400
Message-ID: <20261012044724.160902-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The threaded IRQ queues assert_recovery_work, which can stop, reset and
restart CSS. Removal currently tears down CSS and the CPU latency QoS
request while recovery can still be running.

Disable and drain recovery before atomisp_pm_uninit(), keeping the IRQ
available until recovery finishes. Then release the IRQ before CSS and
firmware teardown. Apply the same ordering on probe failure, and skip
the uninitialized recovery work in PM-only mode.

This issue was found by static analysis.

Fixes: 93d3fb35aa10 ("media: atomisp: Remove watchdog timer")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 812230397409..768b35468380 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -1443,9 +1443,13 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 	return 0;
 
 error_unload_firmware:
+	disable_work_sync(&isp->assert_recovery_work);
 	atomisp_pm_uninit(isp);
+	devm_free_irq(&pdev->dev, pdev->irq, isp);
 	ia_css_unload_firmware();
+	goto error_unregister_entities;
 error_free_irq:
+	disable_work_sync(&isp->assert_recovery_work);
 	devm_free_irq(&pdev->dev, pdev->irq, isp);
 error_unregister_entities:
 	hmm_cleanup();
@@ -1464,15 +1468,19 @@ static void atomisp_pci_remove(struct pci_dev *pdev)
 {
 	struct atomisp_device *isp = pci_get_drvdata(pdev);
 
+	if (!isp->pm_only)
+		disable_work_sync(&isp->assert_recovery_work);
+
 	atomisp_pm_uninit(isp);
 
 	if (isp->pm_only)
 		return;
 
+	devm_free_irq(&pdev->dev, pdev->irq, isp);
+
 	/* Undo ia_css_init() from atomisp_power_on() */
 	atomisp_css_uninit(isp);
 	ia_css_unload_firmware();
-	devm_free_irq(&pdev->dev, pdev->irq, isp);
 	hmm_cleanup();
 
 	atomisp_unregister_entities(isp);
