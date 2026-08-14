Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58FB3477E58
	for <linux-media@vger.kernel.org>; Fri, 14 Aug 2026 13:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786714868; cv=none; b=qS6t7/scVNu4Bj8Wh+y5coDIgYOmm57ikcbxSF8/SSNbfli7sPAAH11pODoAqsP4YyO+ypt2H2cHKGsgZpK8LbmIMeE/HOSusLgyYNfmFIf2ur03ydqIikZ//+1SBx7uagqkDUo6vLp8YH7TmrYRBvLOzbwOsmcZS3ItmU1CtOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786714868; c=relaxed/simple;
	bh=PqBnIeW+UOiXNmqu1QbWmEKTGtUcTjE+KWkPWTsNXSM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L/X4vsxjjn5GqME45QoPgbooLLgoK03+y/Tmih2y4ToCQVluh5RSa1p+Di96an/NKygcN/KM0oTNXs8VZdO0hX3E72PcOK5q3++a91I97ci/6O+01a+dcksOrld5YHu7f/zEyzdlR3HR23zOQRieykAJzVCCSV9arcZZY2rMF4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aohMCvwt; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aohMCvwt"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so1346453a91.0
        for <linux-media@vger.kernel.org>; Fri, 14 Aug 2026 06:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786714866; x=1787319666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tuserjfmudQFk0/rFIBaVa/4z/3CGpRiipPmxmBr8zQ=;
        b=aohMCvwt3D8lrRSviBQUdnEAXkhX926475DnoK/XQSrif6cZmm7FVTojCjY1PYbrdu
         p94npjm1caRYSLyeSjF/Fv49czUdO1jnQeC2bFiVcIzy6SJsHB2/IupaW5tpLrAc5bn/
         vqqLZ6klABPQBPHx3jy1RBFHhj3BIM3MzIw2KTSYpx4UAeiLG6Ujob4nXaQHsexry0vh
         JC2qdK0+WeeDKBO3hYIrR0myEH34/QXqIYlLcm3ewzq6euj0hI8VspW2r7Vixy7APX/U
         iuFoPCQll5kvRWnTtjR6ELiV1mdTtb4q5nEguPVJbYpTH7fSrWO7Btj5Tf2urBI9jjq9
         ES1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786714866; x=1787319666;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tuserjfmudQFk0/rFIBaVa/4z/3CGpRiipPmxmBr8zQ=;
        b=Khn3vBDv+aD0mX9N/GIy1BZMs5rhoMu2TkWuGdcrh+piqRQxUbSvlvZB5drn1duJGe
         KedrQi5CT/H/N8uG15BgywR77cmjSC8exsD8Z+qFhntLF0+WpXpNzOIHjzdgrvc8H++k
         9iPBQie14XCEfS1Jbd1QvZMAaCIfI4rPVolf54dFO1IRzk7SLS8Un9UhSHRyr6MlF+VV
         dlAkFTzhQbRdj2/o420e6AA3NA3Ku4TVkBWyKwuxIUSnKfqBlPUbV1YIDGvi4uB24Kb9
         rfjWuPga+7E0AkNz9Sni6uZdRYCYpGBW7+kpWZatBrMgUf2h2SwPBln6IZ0yaKG/hjSN
         uI0A==
X-Gm-Message-State: AOJu0YwCqI6ItGYyctKTFIe2OsN6QNCyfpSpqscjlKVv+UT8nn8PjRj/
	qzqYjozbODZSnmP7z/Qta1YonrxiPAHGidwbZaS/YlZYlnJ5mPDtHHH+
X-Gm-Gg: AR+sD102qCBxkHTftBayhbnHvos1PeubPl9dX9z+oPb2wBGEdv7NaxcBdS34fVdui4e
	hV1pSwnT4bHqp4URvPdiqTGj0PvQ8VxjZLn2itRP9RubBYRTWTSNGfUVOuPoonT/QBzeDesuN/T
	IqyCWiW+5XN2A2Jn3459jWdPZYevW4eN82TPCRZ9XSZj9/2AaA7aKDY0pW0pddK4RsV7IABxtxi
	igMQhpcfONbANdrGspsJffWtfu3waGB+xc4Cufs22SrCIDjVK9RYdkGEbfMroNbxkyiwlcRscpz
	/7mq7UHbSU1rXsHKr6nf9QK+bVVHHjRxKvNJWbn9SQsnL+81hpDTAXOKVP88DpTG5M3pN7p1o8S
	nzNDN7loQiEeD9+66GSMDrxNXvGyJ0e/G6vpbGFCpmdhd8/rFPNiqogrhxOEcfZYBXw+zsJZlMr
	/6gZdlUSXQlHqqnyXO3+LwkWY3neTaZmlXbrwTjq5nw53W3QiSWhHN8zxN2aQlkuR8QkKT1aNgb
	AmX+Npz
X-Received: by 2002:a17:90b:5807:b0:37f:ed7e:7e42 with SMTP id 98e67ed59e1d1-3933b958ad5mr6627036a91.14.1786714865667;
        Fri, 14 Aug 2026 06:41:05 -0700 (PDT)
Received: from haichao.tail057a43.ts.net ([2001:da8:e000:1206:e9af:7c0e:be31:2c3f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-394ea97207fsm2766660a91.1.2026.08.14.06.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 06:41:05 -0700 (PDT)
From: Ruoyu Wang <ruoyuw560@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Steven Toth <stoth@hauppauge.com>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ruoyu Wang <ruoyuw560@gmail.com>
Subject: [PATCH] media: au0828: Free URBs when starting DVB streaming fails
Date: Fri, 14 Aug 2026 21:41:00 +0800
Message-ID: <20260814134100.1387349-1-ruoyuw560@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

start_urb_transfer() stores each allocated URB in dev->urbs[], but sets
urb_streaming only after all URBs have been submitted. If a later URB or
transfer buffer allocation fails, earlier entries are left allocated. A
submission failure calls stop_urb_transfer(), but that function returns
immediately while urb_streaming is false, leaving both submitted and
unsubmitted URBs behind.

Make stop_urb_transfer() release every populated slot regardless of the
streaming flag and clear each slot after release. Route all start errors
through this cleanup. usb_kill_urb() safely handles both submitted and
unsubmitted URBs, while the existing preallocation check preserves the
lifetime of shared transfer buffers.

This issue was found by a static analysis checker and confirmed by
manual source review.

Fixes: 265a6510629a ("V4L/DVB (7621): Add support for Hauppauge HVR950Q/HVR850/FusioHDTV7-USB")
Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
---
 drivers/media/usb/au0828/au0828-dvb.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/media/usb/au0828/au0828-dvb.c b/drivers/media/usb/au0828/au0828-dvb.c
index 31123e6f9fc31..aecc133ea11bb 100644
--- a/drivers/media/usb/au0828/au0828-dvb.c
+++ b/drivers/media/usb/au0828/au0828-dvb.c
@@ -163,9 +163,6 @@ static int stop_urb_transfer(struct au0828_dev *dev)
 
 	dprintk(2, "%s()\n", __func__);
 
-	if (!dev->urb_streaming)
-		return 0;
-
 	if (dev->bulk_timeout_running == 1) {
 		dev->bulk_timeout_running = 0;
 		timer_delete(&dev->bulk_timeout);
@@ -179,6 +176,7 @@ static int stop_urb_transfer(struct au0828_dev *dev)
 				kfree(dev->urbs[i]->transfer_buffer);
 
 			usb_free_urb(dev->urbs[i]);
+			dev->urbs[i] = NULL;
 		}
 	}
 
@@ -200,8 +198,10 @@ static int start_urb_transfer(struct au0828_dev *dev)
 	for (i = 0; i < URB_COUNT; i++) {
 
 		dev->urbs[i] = usb_alloc_urb(0, GFP_KERNEL);
-		if (!dev->urbs[i])
-			return -ENOMEM;
+		if (!dev->urbs[i]) {
+			ret = -ENOMEM;
+			goto err;
+		}
 
 		purb = dev->urbs[i];
 
@@ -217,7 +217,7 @@ static int start_urb_transfer(struct au0828_dev *dev)
 			ret = -ENOMEM;
 			pr_err("%s: failed big buffer allocation, err = %d\n",
 			       __func__, ret);
-			return ret;
+			goto err;
 		}
 
 		purb->status = -EINPROGRESS;
@@ -235,10 +235,9 @@ static int start_urb_transfer(struct au0828_dev *dev)
 	for (i = 0; i < URB_COUNT; i++) {
 		ret = usb_submit_urb(dev->urbs[i], GFP_ATOMIC);
 		if (ret != 0) {
-			stop_urb_transfer(dev);
 			pr_err("%s: failed urb submission, err = %d\n",
 			       __func__, ret);
-			return ret;
+			goto err;
 		}
 	}
 
@@ -249,6 +248,10 @@ static int start_urb_transfer(struct au0828_dev *dev)
 	dev->bulk_timeout_running = 1;
 
 	return 0;
+
+err:
+	stop_urb_transfer(dev);
+	return ret;
 }
 
 static void au0828_start_transport(struct au0828_dev *dev)
-- 
2.51.0

