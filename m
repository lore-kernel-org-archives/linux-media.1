Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792785548;
	b=NdVoS7/mOygwJziNGbpBYlr9R1Zz///SHG4PicPTsoivhTcbfi7X1lStUVzcUGDcUQAN
	 ByyJX6/9goDYP+wbGYA7l7AEBFa77LZCBH4KhBOiReOBvXiZve43JeIq2mXSbAv9mY4hU
	 /+lzMeRizpqP8Nt2wyuf074dC/8Rloge3Wl6DjVlYK6Ej6ZP3c/i4I2xgd0+rP3fGc8iP
	 wc03++TQwXgOT2UrfldRs6jhcZE1U/rcB5H/2YIWEtdPG5vlBh9u26g2VZxmutZYiZ9Hq
	 s/dDEEqZjd8omeTD5ItaCWV27ckZeKCHx2jDTDmnRl09C8Akw1FW6Rid1Utg7xQoNZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792785548;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JgDO3SFp1m6M1lz5CdRvRXPq4mg7jU8g8yshNtlwqpA=;
	b=D/FFZ90GAeK/mcNSmzGESnVuz1ER6LLiWmUDViJKzIbf0A28+JzlwCpKeXunWelGCBxM
	 LlbjQ7tug7SCrjvWfyYPu06GIhoD4oy56KLNsx+Q+vqtBgLpFwEed38f4ak9y5s2lp2Qk
	 qJ4hZA/bah9/w19x2MrA7YyocSWvrVY6V1F+niPWFhcc2z/3THMwPFYtb36Hg9u6Jj8GE
	 L5mQPTWwrvGBBrFrZp+mFS0rM3yP8Ngd3WgkUZVsLbh8uw3ZY1Lz2SLX5j9j4P0TfsFgl
	 JM8ZA093jR36fJ47pxHArXKvEO/UPSymYauOV84caKMiR/DXe0B/AfiW/PfahKiY/lQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=e99B5ETi;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3910B606BEE6
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 19:59:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3910B606BEE6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=e99B5ETi
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a2d6cf958bso2255745e9.1
        for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 12:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792785546; x=1793390346; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JgDO3SFp1m6M1lz5CdRvRXPq4mg7jU8g8yshNtlwqpA=;
        b=e99B5ETi4RBzE2GcWHPMXnk1i+Y/rXnacXMKRYTFPrTq1wjfb7kd7insXYo5/dJsey
         gtIsw+nWx6Oj3qXvDpEoFxMtSagGOMbOBnFrqYegfEquvHFGjNvZiyMeghOHB+TzGYl1
         WL5R17K12izNfs/nsUbAnF02sTdTbYmHcHSlTtBMusfGfiEFglfZ2Yp/U/t05do/HS9d
         HUcjb/oswYgOkagKFFZIAYubrUBtvJKX+fFpcta+eWmF49NUdE3DiY/06cao3BzcWGZa
         YGZ8dvAlnRCuP5xgGkYJtEMi2WQPJnHnEH/WRYWGWr0wzC1t9u+KiQXuzg2bKsaqS3yb
         RDIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792785546; x=1793390346;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JgDO3SFp1m6M1lz5CdRvRXPq4mg7jU8g8yshNtlwqpA=;
        b=bd4VDwBnNcZIXge0Z4EZJvqpvXYXowR0UVKb2B4ufKNO4oLhxIdP3S+UhWxx6k910w
         ZphPWVUq6jp2RAJETphjXBp+/KPme4jhXiAtbAW94PM3zIG7GB1VaWwmcfYbkhvcRm/1
         hBNQXD+P3nv/qWTo14P9PZwM3Shn8FBO8a0hq2CyE7WAKm1zAOsqw6fCPizuvKgbA3ol
         gk1qEPlAN5tR0bI3r67C+VyJWNQ2nxF1z/Da2ug5wUz4vYJggougI6pm9LQrxPdH9zk1
         GtfdxF7lcndkXqJ4iVKxuikYElId9Q4sQn6t2mlyfnSZE+ESnnS+5nG9/YVCYC53PUg9
         qoLg==
X-Forwarded-Encrypted: i=1; AKwUvBxGM8JTWSwlU0p9OpC0Ro90dNQNfXgBvpmRsrmyGPZSkTsIHsK9zDlPhzoQA99hqzWZ5Ki+R7Pe0ZLWbA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJKgbac0ipHN16PbKAVBkYQmTB00NZVDLGqDKnZVGH6mc95ulp/
	SsE720k46vBWaM2y6MXYw+DEMkiNnBNhj7HibAfRPtIdennWVs31tOg=
X-Gm-Gg: AYBFou3rHt/vNEjoqPBPaXnnA4KNCFhoM5Fq0iiHAiLW3cJc2ZMfPgNLJ63TlhBgem9
	s1lUIwYJG/jJh8LnEH1if7UPF0M4DaITO5KyBJse93CX1JjxIOsaqE+y/FWIIBSODdMZYet9RFI
	Dnt4T4t3t4mgNkITUZ7RrTos9oQZyK21/J1bDLTQV84kM31NMJXAnyffwqlxuimmMRfoN0JQTXy
	5o60jSxTp/sV3BuOVq217+rB6rYSoFhl9n+X/MnUdaePD0dRhMZByOdtCFF/koPr5ZAeSkYEWEz
	+43yNo9/ElmmSOi6h4zMp5umHuAHOGkzDq9jeMAh1wkBuhT8vNoaxKardXvokBHv1iHhBT77scP
	mLuSN7d+64uy6++gFIFJ9U2wqJHpIfub7/9cuYSQN2lJgVw2hUAgSHQQGCc1P/dxDWN2xCNgyw7
	+mXPj9s71tgnHW3eg7jNhTHfP3ZqH5EWV3v/A1XjRTBxvMIOnbaH96nNLvMKeePYJS4dfkkLq7w
	da3schsERUggkc5yQoHPTDQ
X-Received: by 2002:a05:600c:3f16:b0:4a2:526b:d417 with SMTP id 5b1f17b1804b1-4a2526bd79fmr22530685e9.7.1792785546492;
        Fri, 23 Oct 2026 12:59:06 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a2ed5a2sm5021145e9.15.2026.10.23.12.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 12:59:04 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Kees Cook <kees@kernel.org>,
	Lin Ma <linma@zju.edu.cn>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH] media: dvbdev: fix dangling minor pointer in dvb_register_device() error paths
Date: Fri, 23 Oct 2026 19:59:04 +0000
Message-ID: <20261023195904.3557984-1-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
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

From: Tristan Madani <tristan@talencesecurity.com>

dvb_register_device() stores the dvb_device in the global dvb_minors[]
array via dvb_device_get() and releases minor_rwsem before calling
dvb_register_media_device() and device_create(). If either of these
fails, the error paths call kfree() on dvbdev without clearing the
dvb_minors[minor] entry and without going through dvb_device_put().
This leaves a stale pointer in the array that dvb_device_open() can
dereference under minor_rwsem, and bypasses the reference count
established by dvb_device_get().

Fix both error paths by:

1. Clearing dvb_minors[minor] under minor_rwsem and calling
   dvb_device_put() to release the array reference.
2. Replacing the direct kfree() with dvb_device_put() to release
   the initial reference and allow the release callback to free
   the object when the count reaches zero.

This mirrors the cleanup sequence in dvb_unregister_device().

Fixes: 0fc044b2b5e2 ("media: dvbdev: adopts refcnt to avoid UAF")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 drivers/media/dvb-core/dvbdev.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/media/dvb-core/dvbdev.c b/drivers/media/dvb-core/dvbdev.c
index d753d329502a6..c931c467d4c52 100644
--- a/drivers/media/dvb-core/dvbdev.c
+++ b/drivers/media/dvb-core/dvbdev.c
@@ -551,6 +551,10 @@ int dvb_register_device(struct dvb_adapter *adap, struct dvb_device **pdvbdev,
 	if (ret) {
 		pr_err("%s: dvb_register_media_device failed to create the mediagraph\n",
 		       __func__);
+		down_write(&minor_rwsem);
+		dvb_minors[minor] = NULL;
+		dvb_device_put(dvbdev);
+		up_write(&minor_rwsem);
 		if (new_node) {
 			list_del(&new_node->list_head);
 			kfree(dvbdevfops);
@@ -558,7 +562,7 @@ int dvb_register_device(struct dvb_adapter *adap, struct dvb_device **pdvbdev,
 		}
 		dvb_media_device_free(dvbdev);
 		list_del(&dvbdev->list_head);
-		kfree(dvbdev);
+		dvb_device_put(dvbdev);
 		*pdvbdev = NULL;
 		mutex_unlock(&dvbdev_register_lock);
 		return ret;
@@ -570,6 +574,10 @@ int dvb_register_device(struct dvb_adapter *adap, struct dvb_device **pdvbdev,
 	if (IS_ERR(clsdev)) {
 		pr_err("%s: failed to create device dvb%d.%s%d (%pe)\n",
 		       __func__, adap->num, dnames[type], id, clsdev);
+		down_write(&minor_rwsem);
+		dvb_minors[minor] = NULL;
+		dvb_device_put(dvbdev);
+		up_write(&minor_rwsem);
 		if (new_node) {
 			list_del(&new_node->list_head);
 			kfree(dvbdevfops);
@@ -577,7 +585,7 @@ int dvb_register_device(struct dvb_adapter *adap, struct dvb_device **pdvbdev,
 		}
 		dvb_media_device_free(dvbdev);
 		list_del(&dvbdev->list_head);
-		kfree(dvbdev);
+		dvb_device_put(dvbdev);
 		*pdvbdev = NULL;
 		mutex_unlock(&dvbdev_register_lock);
 		return PTR_ERR(clsdev);
-- 
2.47.3

