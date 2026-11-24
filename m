Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795535136;
	b=lVzXMhs3jt/08rpZABmqBx3VJxRfo1wHmS84fzyNCuKWUGfnaCN3R5ThHjJ4BBr1LBxU
	 2D4qpaT0s9hBguzX2fVauhiuKAyAge5q3Vu8R83xlEH5t7KQoOBbwTh6a2QII6q0Z49OY
	 bTNDqGISLukOEXfbfsFM6vyg9BK7ENTxUsHCyOs7NQa8ukznxw9So12CjYrRPSdj61BdL
	 l6/lDf+MUvlAQQLvWPDOKSBwaRL1hqhNJFS68HxVB7LEb94TTDiMsZEBekQEGqLy72rRy
	 OWSY6SRnohhWa7eP/Y1e/h9/RRcCuMxyK8ddvna8QalCZi7IlnQqqMWLwUVSqXZlCSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795535136;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5N56MgLFon8GdL7QzFpPjlEu7rx1MbvlYKRTu5FbU1I=;
	b=wg/AjiWskGhlwfWZcVs9jm4nNq4ziP8fn+8Dq3Otyo0dGOnYMvKTj+T+rFNYSUYWVGi6
	 v0+bI49FTAnrnWNgAtt5AF142ORCiPY9qT0zQ8T4j9n6tEx7Oi8mtcjE6LX0iH9fnqskH
	 gOa0MxviObIoKsMIEgNMZiaY4xto0DfIxaMuHcCj/Spw2AZ1AziXtRgZuMDOcVBYKE14Z
	 Gh8dsvadhZVxTEEOuhZVZAZ45sFQUv4CubnS+YYUSw5aYcEwzoz1KDqyWvdl8jBCNCTKs
	 tmT0OzHbzyBzhXKB9cn20ViYB6a7HAydRP+k35rwgXI7EnVCX2HQttuMbVTmCnR/uZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=002ECCbG;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA22606A321
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 15:45:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FA22606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=002ECCbG
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b402824d07so3168144a91.1
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 07:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795535136; x=1796139936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5N56MgLFon8GdL7QzFpPjlEu7rx1MbvlYKRTu5FbU1I=;
        b=002ECCbGoe4UvZrDiR8+fQIJbNmAxO8iRI7uDaM42niaGUYPgQXdlnHjkyX0nsDLrU
         Ze7K68D7fIBGkDIT4B637oXrGl2E+23Id/8+5WhhbDOrcw8sJYHHS55Evjw0mn3/pWT8
         JeeIumNTNxU5+BuLGul4WQ24pKlA8Qe8StoOFxVBTnbs0xLQyn5mXVZ0hurTXG4TslUS
         7BTXqdBGAvHNMZ31HHj7xrYnMeiLP2MCuGzud64zEKWg7GkswqHF1gJhRrcvX/sZjDrv
         iHy2tYdjan2IKlC81Nf036sgN13ZnQWwjClgHP2de8BtHSqxOl/PSlKAHVV6KJhdL4PV
         810w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795535136; x=1796139936;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5N56MgLFon8GdL7QzFpPjlEu7rx1MbvlYKRTu5FbU1I=;
        b=XqNeGbIDGfJHcSvGLR5UrCgp8776+qya+d05LDw0xm4lUSH7VTyP0P5PXpB2Mf+02x
         SVr3Kx+9mdofwjfCAh0/3Y3y5kI6VBRS+qxKJMZWvI/rcOjNDQPrXaWFyf/9s4DI3Kk3
         3JxTTZNfkg6r49PzVHJ8dkyMviasmQqcPWudXMxZqou+i6JUomj4bUVmWS9uJZAwkwH8
         9OxTkPmFwtKmu5/yz3kCVJ7nTuv2CG/J+GIMetCMMSojf5C/I2FLSaiI7yvTr0A9PDFV
         Je8r7gvjTDbMnquvCoLp7gzBoFbYFEjDv6r29Jt8TAEgG2PzCR1ksLuOoBnxiqRMj5qF
         J0ug==
X-Forwarded-Encrypted: i=1; AL+hErGaRyc2pbL/wq2lsKIkcyMl9oYF4z54Y+YHAMFj0h2nA2dlLp/BkZ+/9l5gGbr0MMfuVRiyK+AubgC/PQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9TxnWwAFwNqMBrfDwW+vRkmxH4oAH3C5aNDMLrAaF1GpqU6EtO
	+JTLi8aBMK+h1pYu75W5ekuG0q76lZvWHXYldguP8YcHzhKO/L52U+U=
X-Gm-Gg: AZFdTZenTmEBzLulG7K4JRmhVKL6LT7AtlcHRs+W4eugl46Pl9IR2oy3BHqzM1MVmN8
	DMiRT/ZDf35/W26ugxrRRMOyMmRjz7hyRzc93oXkQR7F0bdVstvgVzSp8MtBkfxx2xfr5iGZdOz
	lclq2Q/7M2vjZDbuPyKuiMflbLJCHpyZkc5w4JLoTeOGmcak2oSICPRWd/O36whkmd+3Kk/gzcD
	MSOTcy3l2OJY5lxteqzAnBaNrm0HQcO1XrgNbQGPTpR11Kku2qTmc0Gnba5twtxqr4daftjLX5o
	EWVHNHyKhzumjmjt4cBg7irEGyMp3+oyspsW0ikmIvQ4frcs288P7qGFYUzJ+e2pMrDxblfqeFF
	F/Wf0BJINKtv9kxR9Y8/qobilNz4T4D55HzjpTmKGr6+bA0dmEjfJSYgUiAFzSRvJT9HfWLUp+J
	2Im7rYUvyDIY2d5UDrc0ij3aT6BjhPTGywpQJc2C5d8GduIoBsVDu/ut2BltyFjZvd4hp+30fsH
	81TWSBFfcmLiJCJ44j8K3LHyqycdCGKBFeZsr8k1kCNSyP088iCEnA+mdOfhKwDE37aDRdHauPZ
	IH78u0Vf6MfTR1xJWj98HHSDJs+vY4sr6he5g8vX+J16XxdQWEoyKR+Ku/QPdKhCBZuT
X-Received: by 2002:a17:90b:380e:b0:3a6:e99b:bbdb with SMTP id 98e67ed59e1d1-3b41c9493ccmr14751455a91.50.1795535135546;
        Tue, 24 Nov 2026 07:45:35 -0800 (PST)
Received: from localhost.localdomain ([2406:3003:2002:639c:5da8:85f0:b5f6:2eae])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b409330ae8sm26290347a91.7.2026.11.24.07.45.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Nov 2026 07:45:35 -0800 (PST)
From: Yige Jiang <yigejiang86@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Yige Jiang <yigejiang86@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] media: saa7164: Keep the frontend alive during DVB teardown
Date: Tue, 24 Nov 2026 23:45:30 +0800
Message-ID: <confirmed-20261105-31-0973614e74b7@gmail.com>
X-Mailer: git-send-email 2.50.1
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

On HVR2205, the frontend is embedded in the si2168 demodulator's private
allocation. Removing the demodulator I2C client frees that allocation,
but saa7164_dvb_unregister() subsequently unregisters and detaches the
frontend through the freed pointer.

Unregister the DVB frontend before removing the I2C clients, and detach
it before removing the demodulator. Keep tuner removal before frontend
detachment: si2157_remove() still accesses the frontend, and on HVR2255
lgdt3306a's release callback can free it during detachment.

Also clear the published demodulator and frontend pointers when HVR2205
frontend attachment fails. The existing error paths already remove the
demodulator, but leave its pointers set. Since the PCI probe continues
after the DVB registration failure, a later remove can otherwise tear
down the freed client and an unregistered frontend again.

Fixes: 504b29cbb0cc ("[media] saa7164: Add Digital TV support for the HVR2255 and HVR2205")
Cc: stable@vger.kernel.org
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
AI assistance was used for analysis and patch preparation.

Based on next-20261104 (8b7179210b22).
Compile-tested: x86_64, GCC 14.2.0, W=1, drivers/media/pci/saa7164/saa7164-dvb.o;
baseline and patched objects built with no warnings.
Static source review; no hardware, boot, or KASAN test was performed.

 drivers/media/pci/saa7164/saa7164-dvb.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/media/pci/saa7164/saa7164-dvb.c b/drivers/media/pci/saa7164/saa7164-dvb.c
index 3eb749db1ca76163c1b16578ce858a4b54a4e82f..76fe0fc56867434eef87a86d869bac343daeaf47 100644
--- a/drivers/media/pci/saa7164/saa7164-dvb.c
+++ b/drivers/media/pci/saa7164/saa7164-dvb.c
@@ -492,6 +492,13 @@ int saa7164_dvb_unregister(struct saa7164_port *port)
 	if (dvb->frontend == NULL)
 		return 0;
 
+	dvb_net_release(&dvb->net);
+	dvb->demux.dmx.remove_frontend(&dvb->demux.dmx, &dvb->fe_mem);
+	dvb->demux.dmx.remove_frontend(&dvb->demux.dmx, &dvb->fe_hw);
+	dvb_dmxdev_release(&dvb->dmxdev);
+	dvb_dmx_release(&dvb->demux);
+	dvb_unregister_frontend(dvb->frontend);
+
 	/* remove I2C client for tuner */
 	client = port->i2c_client_tuner;
 	if (client) {
@@ -499,6 +506,8 @@ int saa7164_dvb_unregister(struct saa7164_port *port)
 		i2c_unregister_device(client);
 	}
 
+	dvb_frontend_detach(dvb->frontend);
+
 	/* remove I2C client for demodulator */
 	client = port->i2c_client_demod;
 	if (client) {
@@ -506,13 +515,6 @@ int saa7164_dvb_unregister(struct saa7164_port *port)
 		i2c_unregister_device(client);
 	}
 
-	dvb_net_release(&dvb->net);
-	dvb->demux.dmx.remove_frontend(&dvb->demux.dmx, &dvb->fe_mem);
-	dvb->demux.dmx.remove_frontend(&dvb->demux.dmx, &dvb->fe_hw);
-	dvb_dmxdev_release(&dvb->dmxdev);
-	dvb_dmx_release(&dvb->demux);
-	dvb_unregister_frontend(dvb->frontend);
-	dvb_frontend_detach(dvb->frontend);
 	dvb_unregister_adapter(&dvb->adapter);
 	return 0;
 }
@@ -735,6 +737,8 @@ int saa7164_dvb_register(struct saa7164_port *port)
 	return 0;
 
 frontend_detach:
+	port->i2c_client_demod = NULL;
+	dvb->frontend = NULL;
 	printk(KERN_ERR "%s() Frontend/I2C initialization failed\n", __func__);
 	return -1;
 }

base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
