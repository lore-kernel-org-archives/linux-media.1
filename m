Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793723915;
	b=gQ8vaIttEDI9g93i6iHtpifJItiuWWQ1JdDiSwQC/vx3XxniDRzCEDyczN8gT3Ms4ljL
	 qgYbseJv05Ai6pl6dhBkZMFQGmLUOnjnAQjMqrQ+PUFjcVI6V9w/LHdtvfhXN5/1cWrS3
	 U+x/XVpeHXoCnbQJfniaq0SSiaal26+cpOkCukestnPakwPmiZ87sXESOb1qEPzuR91cK
	 8xhziYudMKXgt0ZkjqTjQJTC/hUm74ibQxxv5YeYhpEv0F6QyrijQdFYoPZ1p9S26mId7
	 eWNkPYXfwAAxsFgkCzwnvJ7LnIkqACQBJvssPwhTvCPdv/F8k4TGGRuIitAsUaCqBvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793723915;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=w6Fqdp6/PUxQDxS0m+JBmY/nceWZDOAC7M2eIuiqIFA=;
	b=TJFTpjQJqwcmhVGJ1gJrCzPgBY4zXJx+QfJADReceyKI9/sJsnYeQ0J7HDKoXVw0eaWB
	 OnkYDR25PFiVX58TkETbMtfdXQA39Pvm4jOnQJ18TMvwZeR7vBFOZbzpJ02O6tY8Gm3Ui
	 XKPusvwJUyGOr4zcL32pXAtrPgbrr/h3IH9fR4YDNNrJrkduUxbKbZF2q3pSJF5dwqzQm
	 w5zEob7GsR9xHNLG3yiprBIcUOo9l4VF6qK/fW10wKHoWk/+k9y2+JcEJ0yBSUh6PSibC
	 IEswVz6SuuuRQshAPRo2MRJJ6m3RciCTVSx4gZBLXPV1zH4XMu6Vtu8KxewC0YrvOEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nRCbTsFa;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2B46082BDC
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 16:38:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC2B46082BDC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nRCbTsFa
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso7323393eec.0
        for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 08:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793723914; x=1794328714; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=w6Fqdp6/PUxQDxS0m+JBmY/nceWZDOAC7M2eIuiqIFA=;
        b=nRCbTsFaD7OM8zXTqBqhbT9Z9VMiXVdc+mCNlaYpWnmvIYn/8iOs029tKfUyGbsCYX
         ZbwixDVd7M7F/xVppowGYAqsQq9mMw8W41WuBapO84qmyrsOecFuEB9slI2VYgEBKnPK
         H6RLT1NR75itzIHKf56twiQCF/f8bvnPp4L80ZWwCRUzF50zQOeb+URbNHozfn7yoJrp
         OfVrXw7B+NzhrAB/c6Hn/lEKSuV5dT60YnDo1sP2Hub4L1xbMxYSrkbXsfkGoNNKLJnz
         fN9CoPMT0pp275pAMnMcGyObwJ5G3iUZLPUaDwJzb2XlNCb48vckaxma6GlUKicOBRMS
         xJWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793723914; x=1794328714;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w6Fqdp6/PUxQDxS0m+JBmY/nceWZDOAC7M2eIuiqIFA=;
        b=rcdQY5uOP16QlORQlSUP+imTL4iJAARl6lZmRfAP7pXiiWHTEHwYgFUFL0jodhtwn6
         3wX5zQQMB3K68SRaCGhAFf+aIwNy0tZsxnya3ZmsKvsYqGkgCbpRt8KMlCVGF47gqGNt
         tH8uInR+6WGDIkMkeVpQvNVS2mreB8fdz5112gbIPi5g/KoFGs6nYM1XEUJxcnDITUuV
         qfJ0mM/dzpDtIskyw7ZJfPH0j4R/IpKztXDl/jPyjr2jnKchSV8jtDEJpPG+5cdRwEvq
         MFkgFPK44aXjaDIef6LOxhbHlAQIEwLeY2h/qQPTCgqYeqZzg2h/6Jv3yPPi6gSfSH+x
         Ggqw==
X-Forwarded-Encrypted: i=1; AKwUvBxAKnpPf13MT86atXggQsUni4a9+mhOgIzeTqXCuSqUem90KQGF8eOtt9qTb+eAE1N9jOYSv0T5Pa+gJw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8klRTb8oeZ1qeFKBUmcx1TTwyzZfSdb2Epr5kBxs5fR30+7ai4
	xqu6tc7jiybzitBkssthKvttbs9iHsS4R5cNOIP+cKhpDP1AwJ/s1cWd
X-Gm-Gg: AYBFou2KgA+ZqghHvSlCyqZVS6wkv4d9PdP0rqI0lmHRHZb3ts9iQToJZAZzBjH5Txb
	4YiN1BmWNs5OYGDy/Klac7qfHSYPDjce5YG+/xklyHnJ3RpP7vGkWvahtFV5/2hG84Wa5HVBa7/
	xPONM2Hg+oaaiTtgpReLMytNObAm8HIDL0RM5R1s2ZHYmYo1WkQXVdrWOzV1zbpdISWNf62sCIm
	y9v4r8NgoK8viJ+/l9M26PFUPURAKTvR5WDD/kNXfIhe7aVgUK14zHjYgAt16jgpysJTdJCqJ7v
	ZW8oJwWFzKM1jDIng3aUG/Z0rSUY7xYaya4C0NIufEbNi8nVZ4newIe5r6KJlUPexRdFcafjieC
	0wJYFGeURJIPNiCbkqcHE5NIaePorwHDC6ue8aNSRRIlLL09OIm5smCvtsaso0Fg3XkSKbGoiPE
	dYA/ed+UILIO7by4aLZJNzHM2mT1YIsRPyy4xtn0Dh0F1hOHt32/F6C7Hf4PHC0OZtJbRdQGTq2
	C3VjGZTy9+vL/QXJTTvII9Y08//IWRIZuwG17BBu3iTv/qxiAQhoxNYWVvXDTFmYX5le12YrOTI
	OxigA1ggjkXg4a3jSQG+dFkVyE2/uofOFmvkKM3j+oDiMLOh/vZlDRCI/Pzshj3C8Q==
X-Received: by 2002:a05:693c:6092:b0:35e:5ca:e0df with SMTP id 5a478bee46e88-36a424609c2mr24955730eec.35.1793723913578;
        Tue, 03 Nov 2026 08:38:33 -0800 (PST)
Received: from arpith-debian ([2402:3a80:40d:48cf:34b0:c816:2853:c60c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a429018casm43671843eec.14.2026.11.03.08.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:38:32 -0800 (PST)
From: Arpith Alexander <arpith99@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Antti Laakso <antti.laakso@linux.intel.com>,
	sarang.sapre@intel.com,
	Divyamani Tripathi <divyamani.tripathi@intel.com>,
	Manik Bajpai <manik.bajpai@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arpith Alexander <arpith99@gmail.com>
Subject: [PATCH] media: ipu6: Check firmware is started before close
Date: Tue,  3 Nov 2026 22:08:14 +0530
Message-ID: <20261103163814.96980-1-arpith99@gmail.com>
X-Mailer: git-send-email 2.55.0
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

Commit 70e3fac3ec78 ("media: ipu6: Move firmware init/cleanup to RPM
callbacks") moved firmware start to RPM resume and firmware close to RPM
suspend. The suspend callback closes the firmware unconditionally.

ipu6_pci_probe() wakes the PSYS. The PSYS's parent is the ISYS, so the
PM core wakes the ISYS first. At that point the ISYS driver isn't bound
yet, as isys_probe() returns -EPROBE_DEFER until the PCI probe has
finished. isys_runtime_pm_resume() is therefore not called and no
firmware is started.

The PSYS is released with pm_runtime_put(), so the ISYS is only
suspended asynchronously, and the driver core's pm_runtime_barrier()
cancels a pending suspend request before probe. The ISYS can therefore
still be runtime active when its driver binds, although its runtime
resume callback has never run. The next runtime suspend, such as the one
the driver core requests after probe, makes isys_runtime_pm_suspend()
close the firmware, and ipu6_fw_com_close() dereferences the NULL
isys->fwctx. On a Dell XPS 13 9340 this oopsed during boot:

BUG: kernel NULL pointer dereference, address: 000000000000004c
Workqueue: pm pm_runtime_work
RIP: 0010:ipu6_fw_com_close+0x9/0x50 [intel_ipu6]
Call Trace:
  ipu6_fw_isys_close+0x29/0x90 [intel_ipu6_isys]
  isys_runtime_pm_suspend+0x4c/0xf0 [intel_ipu6_isys]
  bus_pm_runtime_suspend+0x12/0x40 [intel_ipu6]
  rpm_callback+0x5e/0x80
  rpm_suspend+0xe7/0x620
  pm_runtime_work+0x98/0xb0

Only close the firmware if it was started, i.e. when isys->fwctx is set.
The check for a failed close is unchanged. A runtime suspend without a
preceding resume then does what the suspend callback did before that
commit.

Fixes: 70e3fac3ec78 ("media: ipu6: Move firmware init/cleanup to RPM callbacks")
Signed-off-by: Arpith Alexander <arpith99@gmail.com>
---
Tested on the XPS 13 9340 (Meteor Lake): no oops on the tested boots
(the unpatched kernel oopsed on its one boot that probed the IPU6, three
boots with this patch didn't), the ISYS runtime suspends when idle and
resumes for streaming, and the camera works.

This only fixes the suspend path. The ISYS being runtime active without
isys_runtime_pm_resume() having run also affects anything else that
relies on the runtime PM status before the first suspend, e.g. starting
a stream, or ipu6_isys_isr(), which v7.3 guarded with isys->power.
Making the runtime PM state consistent when the driver binds would cover
those as well.

 drivers/media/pci/intel/ipu6/ipu6-isys.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
index 094a98e31c06..9c3818c904cd 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
@@ -821,10 +821,18 @@ static int isys_runtime_pm_suspend(struct device *dev)
 	struct ipu6_device *isp = adev->isp;
 	int ret = 0;
 
-	isys->adev->auxdrv_data->fw_ops->close(isys);
+	/*
+	 * The ISYS may have been runtime resumed as the parent of the PSYS
+	 * before this driver was bound. isys_runtime_pm_resume() hasn't run
+	 * then, and there is no firmware to close.
+	 */
 	if (isys->fwctx) {
-		dev_warn(&isys->adev->auxdev.dev, "failed to close fw isys\n");
-		ret = -EIO;
+		isys->adev->auxdrv_data->fw_ops->close(isys);
+		if (isys->fwctx) {
+			dev_warn(&isys->adev->auxdev.dev,
+				 "failed to close fw isys\n");
+			ret = -EIO;
+		}
 	}
 
 	mutex_lock(&isys->mutex);

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.55.0

