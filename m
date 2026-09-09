Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E02246A61C
	for <linux-media@vger.kernel.org>; Wed,  9 Sep 2026 12:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788958148; cv=none; b=OqkCUaWMr5YNT5w1y//sNq37apM/KADl3pelTWeDKuOrw32RBQgT3awB3YODJ438AjsWbxKwEb2vunzc2AcY1lb9V5G+apcnJbNnsi7w9PND0PXCm37dKKK0daGQAkNSZDrFdtI601b9s3mYha6AtailuJFKAoFMmJUyotKw+fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788958148; c=relaxed/simple;
	bh=hN5YqIuRrbX9JeIHbZFR38P+bgEjxMdH+mpTAANDP9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JxicfYX+AjfSRm+hRSHw25SzlY4oGSY5j6Lj2jnikOIHvbdTSekUOc49iYGm8G6e5IKQeoyD3AOBgVCuo4JaaA2/v4V1ER9Z5Q2dakXHK6SJ8wn3QuWGTT0uOdmNYKWv5O/gFg2SvXH4pIeFItq6ST0sPATtsmX0wKmh4SbvR1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LrdC8CoM; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LrdC8CoM"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2db22383fe8so1548355ad.2
        for <linux-media@vger.kernel.org>; Wed, 09 Sep 2026 05:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788958145; x=1789562945; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KGx4vLZZaltL+dPFi+7Q7o/I6lu7iduAD/4ZglDevmE=;
        b=LrdC8CoMLsopAHoHE1L8k24Ga6u437GaG/VGCV5grvG20frR83PdjoSOPLwt2r0Anp
         JvpwqpSDapbkrLoH2zLvmv5l3iyYKWjoPIkNzDEwJWnzIJ2iOJEMy9+m5Hhj7yZlsY9R
         EBnHI5vplQNQB+fBnVSfZIwrHT1LR+6D3rTMcm9UPn9P0MKv/R2J2U6fYXXtrftH0r1d
         tItr0PfgXVh8toj2IGW3Qg1TfaaQaiM8iS3dNXBAZTb/gh/25JwKBdzaIS97l6vp71Zu
         FRxIvOgw8GzbPzOrzpG0bo9IBXTdnmMQcufqcmNy0lOI/7ZxUyyd25s0QU/VJuKoB8ZE
         kn+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788958145; x=1789562945;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KGx4vLZZaltL+dPFi+7Q7o/I6lu7iduAD/4ZglDevmE=;
        b=nvEAan3+vYuY3+BTGdY1mK6HNplHJtR4FsXZVK0QJxtFo77gYnH7bWySOStZqy3P9v
         Z+JS8YLMjpyNWWP6Ka5f9U4WJNhI+4i7Rd8T1wdcc2uvEE+uCLxJf4CU8LRaXAnLn2D2
         fBdMRpq2aDam3pn6Eo8kwZsCP6a+IWGEXJru9iQCbKlUdLU+CFnhC8aa3AsQk4690nrv
         dxZukys+gVRvjRCTJsk4zF1mkK3+VYIDhxuqftzp6DdwncR4w2U+StR17+ekldE49J6p
         P/xMkqE6xPDOJhMQTUb3I7bi8P6QztfSaUMEft+x26c5FCLmiLQECDrlwtpTTnK69hAK
         zVDQ==
X-Forwarded-Encrypted: i=1; AKwUvBxo3p43CdKrzfRwqLy7QWPKAXKlpo6F3FQJDrM5cRHc+2Ix3SCio+SnyFVXD8+X9GrkXI0FFQHmxaWW5A==@vger.kernel.org
X-Gm-Message-State: AFuF++mM3yAjlRfOqCJi7KU+8JOJdwV7Cp15qv6e/i8wJblXubRJs7vB
	sEmN1eU+I9hNdrR5D49DMmtqooPKtUsWpYx5faAxRhjHvkzsfUbCrP/Y
X-Gm-Gg: AYBFou2zB7I842HCGXfxyjXhectErT6EBcjjuExx3y0MFiXyI3/pddypwiOPOveKx28
	EiJJoIzAzOB+KOR0Agqv93Iv2R35e1z3oFNJqhDd7MzR/mWJ0lCGr9Zn8XSqLWwuLnK6ygV4CYf
	O0N77ELb/G9QZq3IN3NmxLBkwkI0gvukjb+LqU/9KQvKsIZ10kLiZq/l+HDWJSNEbLHlcnj/iKA
	wjGPOZe/XOAFD52VxAvZztwRCj3RB+erD9LNnVTpFutVBg898pvpE8oCCjjEaDWAsHsYJBUfJOa
	GQ+QFkaVFmSl2LkNabysGfRtPMbRKBz9diLIjTWm7REigAnuolNWNEu/qlADzLD4TuygP6xZsRi
	4DUmFwsi6WWFOxCndqSVitKYqn+SiFtpNdexin6bjSxv59f/7C88CDZKsl/rqsVxzSEtlUxyHFX
	OV+1w0hYZVmBwPqNPFMX+Zmtsld0MbdjU6XcCOFYjSmxl1Njg54IQpmmizR492iAB6Yt3WxyoGi
	w==
X-Received: by 2002:a17:903:350c:b0:2d8:d4d3:da4d with SMTP id d9443c01a7336-2dd07ccc33bmr14553335ad.17.1788958144625;
        Wed, 09 Sep 2026 05:49:04 -0700 (PDT)
Received: from adriano.lan ([2803:9810:3d22:1608:e46d:9e65:1b2a:35eb])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885ca07sm50266670eec.1.2026.09.09.05.49.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 05:49:04 -0700 (PDT)
From: Adriano Cordova <adrianox@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	Pierrick Hascoet <pierrick.hascoet@abilis.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Adriano Cordova <adrianox@gmail.com>,
	syzbot+2a3de29133b40e8f69f3@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [PATCH v2] media: as102: initialize mutexes before registering frontend
Date: Wed,  9 Sep 2026 09:48:58 -0300
Message-ID: <20260909124858.213790-1-adrianox@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The bus adapter mutex and the stream mutex are initialized after the
frontend has been registered, but the frontend's stream control
callback as102_stream_ctrl() takes the bus adapter mutex, which can be
used before it is initialized:

	INFO: trying to register non-static key.
	...
	as102_stream_ctrl+0x27/0xc0 drivers/media/usb/as102/as102_drv.c:259
	dvb_frontend_open+0x7eb/0x1410 drivers/media/dvb-core/dvb_frontend.c:2825

Initialize the mutexes before registering the adapter and frontend.

Fixes: 41b44e041811 ("[media] staging: as102: Initial import from Abilis")
Reported-by: syzbot+2a3de29133b40e8f69f3@syzkaller.appspotmail.com
Tested-by: syzbot+2a3de29133b40e8f69f3@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?extid=2a3de29133b40e8f69f3
Cc: stable@vger.kernel.org
Signed-off-by: Adriano Cordova <adrianox@gmail.com>
---
Changes since v1:
	- Succesfully tested agains new repro. Added 'Tested-by' tag

 drivers/media/usb/as102/as102_drv.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/usb/as102/as102_drv.c b/drivers/media/usb/as102/as102_drv.c
index 6b1d3528a0a7..a6dd675689f5 100644
--- a/drivers/media/usb/as102/as102_drv.c
+++ b/drivers/media/usb/as102/as102_drv.c
@@ -287,6 +287,12 @@ int as102_dvb_register(struct as102_dev_t *as102_dev)
 	struct device *dev = &as102_dev->bus_adap.usb_dev->dev;
 	int ret;
 
+	/* init bus mutex for token locking */
+	mutex_init(&as102_dev->bus_adap.lock);
+
+	/* init start / stop stream mutex */
+	mutex_init(&as102_dev->sem);
+
 	ret = dvb_register_adapter(&as102_dev->dvb_adap,
 			   as102_dev->name, THIS_MODULE,
 			   dev, adapter_nr);
@@ -341,12 +347,6 @@ int as102_dvb_register(struct as102_dev_t *as102_dev)
 		goto efereg;
 	}
 
-	/* init bus mutex for token locking */
-	mutex_init(&as102_dev->bus_adap.lock);
-
-	/* init start / stop stream mutex */
-	mutex_init(&as102_dev->sem);
-
 	/*
 	 * try to load as102 firmware. If firmware upload failed, we'll be
 	 * able to upload it later.
-- 
2.51.0

