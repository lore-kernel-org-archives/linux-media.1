Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E8D35AC11
	for <linux-media@vger.kernel.org>; Fri, 14 Aug 2026 05:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786685188; cv=none; b=MPfHis8vzZdnbMX7ICtlgCB7gXTywFxph7X2NOZYm9jgiXaLHIqdp1SuXUPrUUeQdSLFoK9zOGqLgWI92egrAzsaoMoF0eicjekoS9KMNmOyONk1JcHEudV6wJUmllPdvTDii84Z9zhrxS7iE6/VDRvxhuQflvO87X2RFZltq04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786685188; c=relaxed/simple;
	bh=pW7D05ISpQgyDNkTLXmrnAUg5iPB5RsD2+wUMaP+KUU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rxuG9K4k1Ubr24RYgI4TlFEOArXqY3H/83iqYZp/QL/MtWN0vw2aRsS+1asxMeOmmLCk+0eRs8IHDZdGOaAmpwKpiIrj46c7U7yMMDWfQslLoJ6oaYGsX9Y9CQgTf3jkeJ1cAaY6bNOTThbugCdN5/6YzvEsBOsG2B4RbAjfcvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ggUogy8C; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ggUogy8C"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-836c590b61eso10450497b3.0
        for <linux-media@vger.kernel.org>; Thu, 13 Aug 2026 22:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786685185; x=1787289985; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zrUwKSq5HeSG1i2WP2CVyRO5QXQtrMc0uYjdUEKvfyU=;
        b=ggUogy8C1o837Lz1LPk2lYZRobUGGBFc2ZikuatJa3Z/ZMmdxHugNZ5ALn14PFojfn
         naOkzikMgqw6o4MmqgRyTsjN8RqQKyTeeId+5U/9zo6KHub2VsfJ0Eh8LFldX56ujh+z
         cHif2kKsXZAxjR7wJ94QU/JKlE1upJpENQ0wCnc6nj/NyYrrdzWwvwKyW1hzH+sJu3c6
         3RhmCrrLJxXpZRWzSvOTNy917cUfSC2IuVNzGhRq8x0lFaKM2xkiVnWMupzcog4dg8+g
         +fDP0//bW6IELFY1D5SKOrP9oyF2vbOhail2v0VBuSXPa/38pSexBZc4ZieJgrqyoIu/
         D5yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786685185; x=1787289985;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zrUwKSq5HeSG1i2WP2CVyRO5QXQtrMc0uYjdUEKvfyU=;
        b=EtFvTs0I9nclUsMDQkcCKbnlXUrpOPqgutWGm1GawZkNFwTYyAI9ui1iK1uNH6ehsW
         rCHScg1AHNdaqO/LIV4Zoz1Df90jMkEb9AGcouGzeSCQ8z7eWwe9GVaFaGRCkoa/bcc2
         N2DJoiKXR2Hzm8UntIOeHHDDKs25w6PgNKtSWzv+BdnqbuBhM3idUECzqZ2drTkExc8K
         +mSbMg7TO5elp7d5G+AHC+wVTqPX07bkyueI9WOX7up2DGCjoLUiEiMmW2+qPXZEn1zf
         C4hhdVQ5ELtcEWLYyqvad1N88XdNE2TJtzsYJVRdUWLJFUi+jvz7RwdE7Yt/TKgsAupF
         Qo7g==
X-Forwarded-Encrypted: i=1; AHgh+RpG3QzukNu2xkpDqtPIav/Wjy2JYovHe5n1mH2OTlh7Wy/VrEhs9GTdWsFCk1O83QFMNCTbWsmYrC8HnA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXjzpO6f9PDXBEHqlLG5LMA9dn65wJTpLX3IogTGXD2zaDigQt
	EBlZ+i1jd0iH9A1IsoJDxjwyXg9J1WuUbyeHr9jT6jPYY/IWQkpSnE9F
X-Gm-Gg: AR+sD11XTO4dnxkbNrbkGu76fKSY0Si5sGmHwLsCAkGqCMAMqqzW4mhdYY3J4YXeLsM
	9PC7i+jQt796jUSztXd01r4VY6o/DBMCdRvR2n/Vswz2678dNsR2fGROQ6snxPbmZPYnQsxyV6h
	RQmQukmbXw5utM5RMviJDRil11VchmjUE/vVfyWKbVrNfpqzNiMRBbKbjwROYiYBPZFXVi7r0yt
	dl+87XhAxdD1V1kzElNN07bn26BJOKqldNxHUUZJegzz3VAc294Te15GO241oskuPOtCa0jjNTy
	abyNjzX9wK6ID8ZR/yoXoC5RyFk3v4su928hF19K9D6cuBzt3TdnlJNe71/c3hNj6bY7Ka2e9AF
	/4UsOkupZA7QP+qTN05nQH75s/zzLn37UqXP3BjPHh93dvvOXBHc7USkMCz/2s3A4dOo19358qU
	T/6ACDa+9RxzcSF/BFea5tyCNKgdBNjHrj6yYNdvbs8kWZQyAYoPC0JwBEU64cuI6iEmc=
X-Received: by 2002:a05:690c:39d:b0:833:968e:c236 with SMTP id 00721157ae682-8370e1b7cb8mr15102727b3.13.1786685184664;
        Thu, 13 Aug 2026 22:26:24 -0700 (PDT)
Received: from mac.lan ([136.55.173.105])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-836bbdc0ac1sm8756617b3.12.2026.08.13.22.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 22:26:24 -0700 (PDT)
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
Subject: [PATCH v3] media: dvb-core: add upper bound check in  DMX_SET_BUFFER_SIZE ioctl
Date: Fri, 14 Aug 2026 01:26:08 -0400
Message-ID: <20260814052608.39361-1-blbllhy@gmail.com>
X-Mailer: git-send-email 2.52.0
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
DMX_SET_BUFFER_SIZE ioctl, which can lead to system-wide OOM
conditions.

  Kernel panic - not syncing: System is deadlocked on memory

  Call Trace:
   out_of_memory+0x12fd/0x1370
   __alloc_frozen_pages_noprof+0x2620/0x2fa0
   __vmalloc_node_range_noprof+0x7fa/0x1490
   dvb_dvr_do_ioctl+0x11e/0x260 (drivers/media/dvb-core/dmxdev.c:296)
   dvb_usercopy+0x15b/0x360

Fix by clamping both functions to 64 MiB for oversized requests. A
quick survey of SATPI, DVBlast, dvbv5-zap, minisatip, TVheadend,
MythTV, and MuMuDVB found the largest requested buffer to be about
30 MiB.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Fixes: a095be4b030c ("V4L/DVB (7659): dvb-core: Implement DMX_SET_BUFFER_SIZE for dvr")
Cc: stable@vger.kernel.org
Reported-by: AutonomousCodeSecurity@microsoft.com
Link: https://lore.kernel.org/all/20260722193719.81157-1-blbllhy@gmail.com/
Signed-off-by: Cen Zhang (Microsoft) <blbllhy@gmail.com>
---
V3:
 - Clamp oversized requests to maximum instead of returning -EINVAL.
 - Clamp before size comparison to avoid redundant reallocation.
 - Explain the choice of the 64 MiB limit.

V2:
 - Add Cc: stable and Link: tag.

 drivers/media/dvb-core/dmxdev.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/dvb-core/dmxdev.c b/drivers/media/dvb-core/dmxdev.c
index 3c8bc75e4d6c..330255312c85 100644
--- a/drivers/media/dvb-core/dmxdev.c
+++ b/drivers/media/dvb-core/dmxdev.c
@@ -20,6 +20,9 @@
 #include <media/dmxdev.h>
 #include <media/dvb_vb2.h>
 
+/* 64 MiB upper bound for DVB ring buffer allocations */
+#define DVB_BUFFER_SIZE_MAX (64 * 1024 * 1024)
+
 static int debug;
 
 module_param(debug, int, 0644);
@@ -288,6 +291,8 @@ static int dvb_dvr_set_buffer_size(struct dmxdev *dmxdev,
 
 	dprintk("%s\n", __func__);
 
+	if (size > DVB_BUFFER_SIZE_MAX)
+		size = DVB_BUFFER_SIZE_MAX;
 	if (buf->size == size)
 		return 0;
 	if (!size)
@@ -327,6 +332,8 @@ static int dvb_dmxdev_set_buffer_size(struct dmxdev_filter *dmxdevfilter,
 	void *newmem;
 	void *oldmem;
 
+	if (size > DVB_BUFFER_SIZE_MAX)
+		size = DVB_BUFFER_SIZE_MAX;
 	if (buf->size == size)
 		return 0;
 	if (!size)
-- 
2.52.0

