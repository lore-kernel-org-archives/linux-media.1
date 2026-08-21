Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F71340416
	for <linux-media@vger.kernel.org>; Fri, 21 Aug 2026 18:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787337399; cv=none; b=Uoe5fFMr8ZPDqiyXSaJNJ7hCMUI6wdSIYCBil096DBeO1Z6p8jImnHWWVD1TsNAb+bK01XnCELGXgDsRL+ExATMJS4YFoel66GUcOvlDtYaJvro4iFzKOU/c1N6Lnq/NbEEEbXTtMUkYK9zt6Oor5A3X0CxVP/XoL1jikktngtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787337399; c=relaxed/simple;
	bh=WkR+wBn5rWHo2juP9fwXXl8qDi9aXwLygzvkehc/ToE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UUOIiGZkbUWgx/MT9f7kAoe8F8Lm6G9ozA79iPlhMZQ1uS0ak30dkVTKYrcQZh1zTjETUfzDkFJd6ulCNkvvzMha6veaXUqCUOleHvUUcepHpLNEnpuolRAvRMBmVky2pIzEVThqh/vOiDK1j8NepSPXUrDxQrx0xZgmSx16SIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lLY6yy0f; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lLY6yy0f"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38dcbade417so1402332a91.1
        for <linux-media@vger.kernel.org>; Fri, 21 Aug 2026 11:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787337395; x=1787942195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WWwVfN6RhXJbFaz6Mb6103XR01JhOX/M+rzE4uTiAHs=;
        b=lLY6yy0fRdnKT28ETL2FZlGIxOGUd8t3qIXmcDMO+ayMZcVH8wHU0C9ZiaOMzE8rJV
         vFOdzFd4lnmj7DvllhtySVBAbuB4HB5RklWR8E5wuukzS7otgrvzyL4PESiusuKjJhmO
         mz1WSh/Ic/bmY3iIqC07cwu+ugjOfmTl1474hyNtm7sJxu81gjYlm3tJ9wXHYAG5benz
         TLo0EtSCWsQvhCnjGUZDVxVWAR1wTjtHvrPU65vgpqfM/S/fsnmxdzNTMaWBbt559b+c
         PKf5AaC4RwbEhJtRsYZhin9AXf/RMZuzmjRolAN1CPzdrrDJLIQMLxyTz8TFPzwp2gDn
         uShA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787337395; x=1787942195;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WWwVfN6RhXJbFaz6Mb6103XR01JhOX/M+rzE4uTiAHs=;
        b=e5356D32Hb/JF0qAWWtELQLwEsj3DSzYc0gBNcOQyZ7MiaS8AQ+cFyq9MsquhLYu4c
         O+C9yAMIozY5hOcEHfx1Savo9kzNJCPLA6XzVdXHsaWB0ec0r6Lh5UNndVWocxH9D7Ld
         oG9jxhvM6jV56KfRnG/g8vrhMN+0RQDuu79xJy13/PKovZWo4KXuZbpKGT5jUyCj1Egh
         6K0Y8f2ZVp0DDyifchukH53ADbfsih7CHZ961VoyPdrc30ANRMYsfuS/8qu0OTi4hLna
         p3Ba9xDagY2lyavxe4ZU/czaldnQxf80DNLuZkYRm7mTSpN8RM41ZxMJip2VTVXGdR+K
         IFjw==
X-Gm-Message-State: AFuF++k6ywGpmdfsbqGWkY72rd8SrsDtCgko3YMpHq6u6bBIhYLSEGQo
	KaIIUgT0vvg8/0BhQqVSId7bq2s6wiSFbsHsVW2AtmMcC2mm9wlusHMh
X-Gm-Gg: AR+sD10VeWCgNxr8L9t7edq0o0PQ61dBkaWTbWu0DpPrbP094TrIE5jAiZn5CwVRndw
	pM09tyStGzO5ZSIoUivLSqVrX4/Dtw8Xj91xE/PMbhEHnVkHhzWFo4MiPB/F0HAg2Tf2P3mGneX
	YjHNTIDIYraI+QN5oDuGCI7MIzNyCJZkAM1hABVlzE3Nb1xfv/o2NNPHWBgc0ugbsdoqzgXSMOI
	yUfOLTWQimRmoD7+tIA/5xJ3hu00zaOikQggFEMKSRwqr3FofgAn100nQudaCc/YW6SR32qvezF
	7mKytUFPpQ2X7wjdtXGYK8Jt3QsXYaoxt4AAwcYh7i4sJ7o6LfSn1ytC0cr/zYDH3tfG1E66K34
	vwBMxA1zVsRR3S/YJ3KYmysb2l/n245GuAyzSc79/hhegAeq+BLc3O/rf/7185tIeQLD0Mh3Zvg
	Ymn90o3yl/FaaKrUgFeFvGASf1T6/m8PD+QC7WjaJVf1wiLHDEvLwHklcq3CZGZ4fVXtjJVyq4R
	zoIjsdiImKPY8/+21fCnGM=
X-Received: by 2002:a17:90b:1d83:b0:380:9f17:6df3 with SMTP id 98e67ed59e1d1-395c3367376mr12407437a91.4.1787337395495;
        Fri, 21 Aug 2026 11:36:35 -0700 (PDT)
Received: from niharika-QEMU-Virtual-Machine ([223.181.119.104])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141860ec7f7sm78192c88.6.2026.08.21.11.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 11:36:34 -0700 (PDT)
From: Niharika Khare <niharikakhare2101@gmail.com>
To: sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH] media: mc: Remove spurious WARN_ON in __media_pipeline_start
Date: Fri, 21 Aug 2026 22:28:07 +0530
Message-ID: <20260821165833.10042-1-niharikakhare2101@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Vimc driver's entity topology has three capture nodes and two of
those (Raw Capture 0 and RGB/YUV Capture) are reachable from each
other via enabled links. The crash report and the C repro show that
the two capture nodes attempt to invoke a STREAMON session one after
the other, which resulted in the WARNING getting triggered by the
media controller.

  vimc link validate: Sensor A:src:640x480 (0x42474752, 0, 0, 0, 0) Raw Capture 0:snk:640x480 (0x42474752, 8, 0, 0, 0)
  vimc link validate: Scaler:src:640x480 (0x33424752, 8, 0, 0, 0) RGB/YUV Capture:snk:640x480 (0x33424752, 8, 0, 0, 0)
  origin->pipe && origin->pipe != pipe
  WARNING: drivers/media/mc/mc-entity.c:785 at __media_pipeline_start+0x1add/0x22b0, CPU#1: syz.0.17/5912

The graph walk originating from Raw Capture 0 (first STREAMON in C
repro on /dev/video0) reaches RGB/YUV Capture and marks its origin
pad's pipe with its own pipe. When RGB/YUV Capture's graph walk starts
(second STREAMON in C repro on /dev/video4), the pad is already
claimed. This is a legitimate userspace request but not something that
kernel should allow while the pad remains claimed. Hence, the kernel
checks the pipe and returns -EBUSY instead of raising a bug, same as
the other non-origin pads. The check on origin pad's pipe needs to stay
otherwise the origin pad case would go through the increment on the
start_count path, even though there exists a loop few lines below this
block to check the pad and return -EBUSY. The check also provides early
failure detection and prevents the complete graph walk.

Fixes: ae219872834a ("media: mc: entity: Rewrite media_pipeline_start()")
Reported-by: syzbot+68e901d044baaea1f60c@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=68e901d044baaea1f60c
Tested-by: syzbot+68e901d044baaea1f60c@syzkaller.appspotmail.com
Signed-off-by: Niharika Khare <niharikakhare2101@gmail.com>
---
 drivers/media/mc/mc-entity.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index 3fa0bc687..7b4ef2c95 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -778,12 +778,18 @@ __must_check int __media_pipeline_start(struct media_pad *origin,
 
 	lockdep_assert_held(&mdev->graph_mutex);
 
-	/*
-	 * If the pad is already part of a pipeline, that pipeline must be the
-	 * same as the pipe given to media_pipeline_start().
-	 */
-	if (WARN_ON(origin->pipe && origin->pipe != pipe))
-		return -EINVAL;
+	/*
+	 * If the pad is part of a different pipeline than the one passed on to
+	 * media_pipeline_start(), the pad must wait for the ongoing session on
+	 * this previous pipeline to complete before it starts a new session.
+	 * The request for starting the pipeline, although valid, cannot be
+	 * served until the ongoing request finishes.
+	 */
+	if (origin->pipe && origin->pipe != pipe) {
+		dev_dbg(mdev->dev, "Failed to start pipeline: pad '%s':%u busy\n",
+			origin->entity->name, origin->index);
+		return -EBUSY;
+	}
 
 	/*
 	 * If the pipeline has already been started, it is guaranteed to be
-- 
2.53.0

