Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE691F3BA4
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 00:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784765712; cv=none; b=ESjKUgsP1O/5P5hLHUasFEJOmSx/eXLMLMO1Kkrz+aWjo4WZAPPVvzQuRRwjhvZMl19y/G62Hhu09iRgFUue3c+ds8+g9UcYn1sxWP3ct2zqrPxQTle6NnfEQCGMONHHGLJXfgplSHUmsXBjt7oOBWxkJQJEheYWnuUrbSUGR/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784765712; c=relaxed/simple;
	bh=TLQfSVdlMTqTPTmDzRSTa3i03iriBuDGFkfWKfK6fyU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NKAmm7GUT2qnOSi30nFdRJif0HYu2Sp6XiVLzeO6inR5Num0yzALqBmlNBrBW/PMQtnYBi9K403q8cNgeJorTLTAUsz19Vk9WBwJVs9JDWpWSIpjEI6yrqe0AypOn84bUg7TIhy0mEu61kwx5m0WCOOZ9I/6dUmu4f8uhuIFTO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rJpItQGi; arc=none smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rJpItQGi"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-668296d0ff3so34220d50.0
        for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 17:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784765710; x=1785370510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qp9RLqBI1+mbcSRTjHjiXFbp1lu8yHG6RRkL9RL0Njc=;
        b=rJpItQGifPt0Iw0d1A2ErjLDdK7kFYV/xRigglNk+yuXLotftw/i17UiEHk3xnm5oc
         /1eTNum7M+etTKjv2mObifD7mB7h3q5siTPmLpdnR79X5YEUa5xbuYAnzc4zwCsPm9eK
         YW5nOgJgCvP/MM5F/pcOOcmo108vuDzICFzgHVFiOWcMvLTR7cQ0QRqN/EZ5MeTA18Qr
         AJHBd0oYuYOfpTshECOcssZxWH8IvQr2JXSSaBcxYntjpilun0Pq+17nrE2YYNUyAQBh
         W3rE6WfRuEWoR2/vFpmd8SrC7RLjWoJmfmVyxH88oPvJoUWKsayIVUA9IFA6UNq5Qmcl
         E4LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784765710; x=1785370510;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qp9RLqBI1+mbcSRTjHjiXFbp1lu8yHG6RRkL9RL0Njc=;
        b=a6mmqBpnP/JJH6ywkKupQTz05i1brLD+2tsm3PpEnCEuKZbBpprD9mSn83WFFBiU8V
         ukPZ7FeLR4fqy9PKNxdIqn9khNPBxsSnX+DPYmZbGxrzjkotDkVPYkZUYrQebRIiY8dD
         kFt+ocfD+LYK2iL0JvhWUqrafnOKXSb+yLKAQBd1h7ZOT+Idt8i98lyjyhL2C3aIIYgn
         UyLp832N2Wy0R0nGVcBowLtnKFbZxT2rxj/qbdMtuZnkJZSBTZFPr+6A2gDijnacYaFx
         IAfSmkQiBg6ebS0RUP0l128MW8rPYAN1KUhnCwx2/MmY9dfybFpoIINNxhJSlR53wDyi
         kJrQ==
X-Forwarded-Encrypted: i=1; AHgh+RoY5ZfhcNdY80AjlxJhJ8rqjZ4rJypCbfw8fD+YvAb6g8bTNLPA7YvjSwVX/U6FirGKUpDumv72nKIt5A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyAEbib8qVTRoQldi5ZeWaNayt4moxhDqUe7qwvt5WVeEM4364O
	KUPNoHOAdeR3VDj9sN47UPnY/P/DF2tWNwm1dmNBzBfRrI+uSxZTjIJ4
X-Gm-Gg: AR+sD1122AlkhbZ889sHUHuZFKRUdmbsYg3CdqEF0loYKX03bnoN7rfpPaB4/G4yMFd
	tDLg725z45dUEOU39ZWM95O8Hw/t44hUyIttNkGgjcbaz7XYMLn5C7KQfa8LTLmGhX87FQ4nRps
	vXgrPngrBAWIQMx8yG7Wcx1HwsavxSAEPNe1FOATYIbCftXzVXKHj7zcgJq3fXmU5jtgRB+VPJA
	nhNgQm5TOIuTJ4OX62yAuSYvCUZQxCYzCgHxSMpe/L/FrmkeYUPRlaxH2y/5LTdeauLBGxfSI5D
	+Ky70vohFnCgrTKlS783zkiPVFZOenvCnOacT2Rsop1koQ0nqBfWhemHFSdZw56X1ERKV8SpZoJ
	RfzSRv/yGJJAdH1gylYpAWJiDYx0B/+nX2+wYvPyNjrXaBAcjYrxtFjS0dsuyfZtuqciwWznPqi
	5IRUv18j4oJV2sU0s3iwfmOhHypGdukozJ62yEPqIbBMeAMLGskHz9Rh7f9QBiTU7QFqIO1i1I8
	kJqqZ8zs7sreaTg+w3XvPRHZqhMNujEYFclzuh7uT5O/xVT2pz6oGm3my+pOas5P4o=
X-Received: by 2002:a05:690c:4b86:b0:81e:8985:e0e with SMTP id 00721157ae682-81f4c30bdbfmr2886347b3.37.1784765709572;
        Wed, 22 Jul 2026 17:15:09 -0700 (PDT)
Received: from LAPTOP-83ECOPAB.f7a5e5c3-cab1-4810-bdbb-207cdd06de9e.globalsecureaccess.local (76-204-101-112.lightspeed.tukrga.sbcglobal.net. [76.204.101.112])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f33c397c9sm21446967b3.14.2026.07.22.17.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 17:15:08 -0700 (PDT)
From: "Cen Zhang (Microsoft)" <blbllhy@gmail.com>
To: mchehab@kernel.org,
	hverkuil@kernel.org
Cc: kees@kernel.org,
	rongqianfeng@vivo.com,
	axboe@kernel.dk,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	AutonomousCodeSecurity@microsoft.com,
	tgopinath@linux.microsoft.com,
	kys@microsoft.com,
	blbllhy@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH v2] media: dvb-core: add upper bound check in DMX_SET_BUFFER_SIZE  ioctl
Date: Wed, 22 Jul 2026 20:13:06 -0400
Message-ID: <20260723001306.84709-1-blbllhy@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dvb_dvr_set_buffer_size() and dvb_dmxdev_set_buffer_size() pass the
user-supplied size argument directly to vmalloc() without any upper
bound check. This allows excessive kernel memory allocation via the
DMX_SET_BUFFER_SIZE ioctl, which can lead to system-wide OOM conditions.

  Kernel panic - not syncing: System is deadlocked on memory

  Call Trace:
   out_of_memory+0x12fd/0x1370
   __alloc_frozen_pages_noprof+0x2620/0x2fa0
   __vmalloc_node_range_noprof+0x7fa/0x1490
   dvb_dvr_do_ioctl+0x11e/0x260 (drivers/media/dvb-core/dmxdev.c:296)
   dvb_usercopy+0x15b/0x360

Fix by cap both functions at 64 MB and return -EINVAL for oversized
requests.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Fixes: a095be4b030c ("V4L/DVB (7659): dvb-core: Implement DMX_SET_BUFFER_SIZE for dvr")
Cc: stable@vger.kernel.org
Reported-by: AutonomousCodeSecurity@microsoft.com
Link: https://lore.kernel.org/all/20260722193719.81157-1-blbllhy@gmail.com/
Signed-off-by: Cen Zhang (Microsoft) <blbllhy@gmail.com>
---
V2:
 - Add Cc: stable and Link: tag

 drivers/media/dvb-core/dmxdev.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/dvb-core/dmxdev.c b/drivers/media/dvb-core/dmxdev.c
index 3c8bc75e4d6c..b4dc87945be1 100644
--- a/drivers/media/dvb-core/dmxdev.c
+++ b/drivers/media/dvb-core/dmxdev.c
@@ -20,6 +20,9 @@
 #include <media/dmxdev.h>
 #include <media/dvb_vb2.h>
 
+/* 64 MB upper bound for DVB ring buffer allocations */
+#define DVB_BUFFER_SIZE_MAX (64 * 1024 * 1024)
+
 static int debug;
 
 module_param(debug, int, 0644);
@@ -292,6 +295,8 @@ static int dvb_dvr_set_buffer_size(struct dmxdev *dmxdev,
 		return 0;
 	if (!size)
 		return -EINVAL;
+	if (size > DVB_BUFFER_SIZE_MAX)
+		return -EINVAL;
 
 	newmem = vmalloc(size);
 	if (!newmem)
@@ -333,6 +338,8 @@ static int dvb_dmxdev_set_buffer_size(struct dmxdev_filter *dmxdevfilter,
 		return -EINVAL;
 	if (dmxdevfilter->state >= DMXDEV_STATE_GO)
 		return -EBUSY;
+	if (size > DVB_BUFFER_SIZE_MAX)
+		return -EINVAL;
 
 	newmem = vmalloc(size);
 	if (!newmem)
-- 
2.53.0

