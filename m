Received: from mail-qk2-f41.google.com (mail-qk2-f41.google.com [74.125.230.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E0A27F72C
	for <linux-media@vger.kernel.org>; Sat,  3 Oct 2026 00:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790987102; cv=none; b=lvGpJFAOO58Qmj44xaA3mI/2tXdP5nmKIVYe5BOSzBQEWvDitFAdRQp2b7k4sRyphIo9E2nRc/3tBGexPRBLuiz94Pr/Y1iln8GvfPSEFFb9NAhILH6RaO33nhERu4CdmyKzZNjQ8FJwC3ohezhTa0rapvBrijpTMOVzJcuQYUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790987102; c=relaxed/simple;
	bh=6ckQJEHVNOJV2V7bIgVUTxZBGwUPBL7mdcXUXsKMJ40=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aZTSq4fhx16ZKfxFQjPlfinIncZ4jd1LDAx+mWpiQOqU+eW1Td5Qwj7mlQAsETiWXTbK2Ohaw8FSk6E5pmXL2v+hY/Gojqzoyei+xXHOyQ7hqSRIUwJw6dWZgZh7cz2YSGX92a+f6UO8nuAkzXs7lk66WkIfluer0DCc68DL35o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QaT459JZ; arc=none smtp.client-ip=74.125.230.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QaT459JZ"
Received: by mail-qk2-f41.google.com with SMTP id af79cd13be357-93c5818c4a4so8219485a.3
        for <linux-media@vger.kernel.org>; Fri, 02 Oct 2026 17:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790987096; x=1791591896; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/TPkrn/h/1/hQC4aM5Wt/WQn40axj4PKDixOVSYImwc=;
        b=QaT459JZ09Vex4/ev2Y2pEZbxS1kc7slXjSQcOdfOGhAMqYnNFyoeg75Np2EbvuAbJ
         mGOmENpQS07TwSNyF0WEdbf6g4Cy4SFo1zWvUx9xe7G+MOtOoA/cB8k6a8/huPjsnliU
         vvogHEjFzYpMQ7KiT3fBu3f3MuEGQ+OPC/nHHxk4ruj2iFr6NGDXUKVl5qlD8yEBUBRM
         hoNoEKgmT+v+kV1ZyB0PafvBrmmdA7UT/jzHEe+1aECPBw2oXXwUN+k9EPdktqHOluNI
         G0hzsWmGHuOgbUmEvZuNZBNG0GelRNmtKRtzX/Xh1CilORjFz5od/TqfsohHklzz3YDp
         yWkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790987096; x=1791591896;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/TPkrn/h/1/hQC4aM5Wt/WQn40axj4PKDixOVSYImwc=;
        b=i2+u1AsrCl7atR0sULz4uysWCJX4Eq9UmlDzy7Gdpp1XOUZ3J03w3iYD3vvBwnyW1/
         Sp6yagDzNuq4olgiaAQg4S6SPq7VmY9m13yroMA3PUgTO+AlgHQHF0ucqj7NMRV9lGtO
         fXyjDIbR5Iu7GUtEmQDeamprMAsqIICAHwgSmnX2KAz/TxQ2f02J0RBLgEUSMlJmCazQ
         wD1Lrmh8XHB7qS+SYzOSyzTeesNW9+rm3mpH+V7pXCkvB8f7DhydilLrHXCG2B6uTJZ5
         p1gDmTCTfjRM230lPkj/c3FBfHwEM3ICHhHoZikSZ4xJeMYw0kSwCUpEzQaTLCh2MvG4
         RHFg==
X-Gm-Message-State: AFuF++mHgHZGurWJPyQtn3uUGRURiRi8ZaKNQ0znRzdF5efmH2hpN6vj
	7ExGqbzWMKyxU4qafPNeGDi0r1eOVWkzFJ0rROTdwx33KoQ48XT3GR0=
X-Gm-Gg: AYBFou0BeIAWS2sPdbsiQtaZpsnHj2Sca+gIyzX9nTZwWzoBaHHXE0+aJbv67Ns8sAf
	fIv+cM/dutL4hfMpNaLGLIK+FKQxmrGUReU07E/AA7ZDw6tPGUDSI/p1huvNtibIK/l8LglfgrB
	0HDuknd+O5dtJbg8uSauobzfRVWvh7m743INyqE1fdQxvohJRYk/UW7TVTdLWSphfTPRhiA/NYl
	8ma0LmumsZWa0BrrqNeF4y3gv7tYfQwL7WdsRBJMvLBa9kO19ktkmaQKM70wcQdffIROipu0MnF
	RtoLEGhIugommaMljthQenkt8I21tkfCg0YnH0lnHPRXP29EsI9Es2WqKa+7R3eR2GmR/mJNOuf
	vy/d9N0LN62/9LTgBt3XumJXuB39nvL6v0d1M4q+Y+ZZ0mmJdvOszDCOLdUNIscCUBlQnd3ioMz
	h+RSFubDqka6lI7e9bWHLFYahkXWhK1SOlo659Ndmu3Wp+WzVQkHY/tJgEJHFrHxQk2TJ9dL/hw
	W1K5HmEccNDz1tMmVaDaOG55yfHsEQOROybZguKeh6lhcAdBwXMxgNwZo/KKOh9K0Si9tfAmltM
	nsNH9Yw92vYsu0aSNUoebo8Nmpno
X-Received: by 2002:a05:620a:4504:b0:939:7683:33d5 with SMTP id af79cd13be357-93cf16b4c31mr814263285a.19.1790987095939;
        Fri, 02 Oct 2026 17:24:55 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93cca1a48a5sm341771585a.14.2026.10.02.17.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 17:24:55 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Maxime Ripard <mripard@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH 1/2] media: cadence: csi2rx: free error IRQ before private state
Date: Fri,  2 Oct 2026 20:24:50 -0400
Message-ID: <0d41c39bc84b97efdb8c06ef451fdaefcb331058.1790986123.git.mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The managed error IRQ is released after private state is freed on remove
and post-request probe failures, allowing use-after-free in the handler.

Free the IRQ before releasing private state on these paths.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: 9f2d0da9b8c3 ("media: cadence: csi2rx: Enable csi2rx_err_irq interrupt and add support for VIDIOC_LOG_STATUS")
Assisted-by: LLM
Cc: stable@vger.kernel.org
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/media/platform/cadence/cdns-csi2rx.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
index de7cce76397ab03b3dcdc4b5e68d2d92dca183ea..f8c626e19aa84569737aa785a31a0f8c94087613 100644
--- a/drivers/media/platform/cadence/cdns-csi2rx.c
+++ b/drivers/media/platform/cadence/cdns-csi2rx.c
@@ -993,7 +993,7 @@ static int csi2rx_probe(struct platform_device *pdev)
 
 	ret = v4l2_subdev_init_finalize(&csi2rx->subdev);
 	if (ret)
-		goto err_cleanup;
+		goto err_free_irq;
 
 	pm_runtime_enable(csi2rx->dev);
 	ret = v4l2_async_register_subdev(&csi2rx->subdev);
@@ -1011,6 +1011,9 @@ static int csi2rx_probe(struct platform_device *pdev)
 err_free_state:
 	v4l2_subdev_cleanup(&csi2rx->subdev);
 	pm_runtime_disable(csi2rx->dev);
+err_free_irq:
+	if (csi2rx->error_irq >= 0)
+		devm_free_irq(csi2rx->dev, csi2rx->error_irq, csi2rx);
 err_cleanup:
 	v4l2_async_nf_unregister(&csi2rx->notifier);
 	v4l2_async_nf_cleanup(&csi2rx->notifier);
@@ -1030,6 +1033,8 @@ static void csi2rx_remove(struct platform_device *pdev)
 	v4l2_subdev_cleanup(&csi2rx->subdev);
 	media_entity_cleanup(&csi2rx->subdev.entity);
 	pm_runtime_disable(csi2rx->dev);
+	if (csi2rx->error_irq >= 0)
+		devm_free_irq(csi2rx->dev, csi2rx->error_irq, csi2rx);
 	kfree(csi2rx);
 }
 

