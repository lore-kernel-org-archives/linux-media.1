Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500183438A0
	for <linux-media@vger.kernel.org>; Sat, 12 Sep 2026 05:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789192736; cv=none; b=kgt0F9ZRqq52QJ9xrm0nJrm8mBgl3fcm3EGHXmLhvLxx34iGLTDBc5SlVwfMWmdgTfYUyDAzj21z+yUJDGfQrKqo5KNjv6Dnieo+6viZXeaFINrDXiRdOqH4NxY8XBa5t1M94apE5So2RK1YYEX01x/dgP/S2D0n554I3YrEUrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789192736; c=relaxed/simple;
	bh=ueoTsFOT6IEBMH9w1VXnKEUIt4SYl9OsCzBkVcPRlxk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NVp9P+KtPWzQtSP+gpwd9U7r4ZtU/BW1QBipyWkE+1VaJoRo/BVz0zr4vQJ/KzNydXWsxbJioSSyNMF+Zk2mWhdQFbi7yefDT2mrFz9X8yXZVqdpnmM26dqWV/sOyzwSR5U31MtMJAQkDYywfRSdt1r/Smv6E7H6brsmVHlqiBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y5r5edcD; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y5r5edcD"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cc9f581c4so1553015e9.0
        for <linux-media@vger.kernel.org>; Fri, 11 Sep 2026 22:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789192733; x=1789797533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=91A0MwjfK7mjbvi90xRjfD+giwnVd22Z7TdoxKf1o0M=;
        b=Y5r5edcD+iQ0UbMlcI2S/08v4etT6QuUV27xbesjs+1sCp48xAuib/ZP48rdNccCwB
         VHZVmUROd+oTYnVt5JkxXTDA9jEAC17v6mPH2zVDBAP4vQBMRTS4Wprh8H/6WdLHr7O4
         7q3qfhrJkdZWvwqP0CHJVA1Zm/DjdY6xmeAy8MRJos41wv5n5ZPGb3OzAl2LJF1ZuNKe
         6JVQ3uwXmdobEWE/dzqw9ypZj00veyMFqdFr678rUSWaRdU/dCpkxnHH3z6HmnokgCbX
         +hA28EFNDbSZEZxV51gdTUguHrTBRWM+2xY22ANo3xpsJa19sw4fRE9CtncESqSgBMhf
         zK6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789192733; x=1789797533;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=91A0MwjfK7mjbvi90xRjfD+giwnVd22Z7TdoxKf1o0M=;
        b=YOR/GqkD/sFqHLSFqkXNtyo4nafXreFYVlzoUyktwklSoGseG9BN4LlZrGVkWnSSrF
         eCnbFPcIYk0yE72dE/9wjR4+MOJ8M/cHTr83r5jRHPFWfuvMPoNC9XNeMT+cmESC3z9M
         yJHQeD4L+gJzSLCMK2XAIZgaKdJpl0wPUh/mqn52X7wMLQDGT6BDzXX+DqA4r0hLXc9R
         XokEN9IU4H87RhGTl8M0oH1U6VV0yHOWdbgmPYJWKPBIBITHam2TA6tn7qydxmveATO/
         JRz3ZAV5tMA7W4Ui00t1dXUYUVUr1pI/eMbOIwcG1pgnIOJ9OFlz7etwg5IhnVkQbbs5
         nUbg==
X-Forwarded-Encrypted: i=1; AKwUvBz+y4NTFZV37H9BYghdhoksHAFuOwR2ueaJZXgCCFf5BVvEcu+o8G5Lh7y70LSeZve9jXHltni9JPSXfQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mTAVm1shRKWoiIDnNnKO+pmjT0FGFg2zjkYMppuiVs/moNrxrd
	iAYxKbMLTay9g7MtSV7YxdMq+7giPyaijEb/KsQq2MRIPiwCpD/So8Ah
X-Gm-Gg: AYBFou3XhTw7RwkDtfc/OnymisEWq+WitmnLbLNY6QQNjjV4UtfrA43uICXPPoS3xrJ
	gW6g0mndKr9SZt9ajYGcftMXsIbuVajE7qznJXfOvMXDNSb+cAjMIJjiVhzePCiao35w0V3uu1K
	9X7pZSaeJFjCzqH8PE3WOCHIwIHHHBjD0Ph2sZXTYyQACFJsgtQJUl79Gx541/ldt7+rSWMT89c
	SYDmvD/pyJE9UFUcblNilQZ4H0RCoS9dtnkROXNJDTOAfgnD2RMSj+EwzJmPPq6OsNE0M6JYl7c
	Mub/tgIvVdH0vBlaKHa4KbdYdVB4tQr7Iur8t/8XtbJ+MR7pNPFLlrT1v716HxfhFzxcEA1hFL4
	8l9NZHQ+cAo9VNNG5PGAPy335qGElt+I8p3h5urnVDfrHb1n3+vHtOK2sDBdOuYDPYkYoDb2758
	PUoRd6ZYqXtSy5E+orJXCEQDojUzPU57k3jHdv6HneBygVnDp9y4i8EKqU92ntFP+4T4+feO8sU
	x1fnCAgeeBPs9rhwLJxZXLu8tFmGGuP3enXQ1WVf/hzjsYHQXhEWlhgV+QuEVuLQye4SzjC+ujW
	1+azkJMU8N5dftp/gc49H5jR3jAwPsu8frAH4kOB4GkGzE4vIWAHOaaN4oAFKGMJmjx9sF6vh4x
	KEF2Bneg=
X-Received: by 2002:a05:600c:c162:b0:49d:2936:8ad1 with SMTP id 5b1f17b1804b1-49e60f5b03fmr93484435e9.1.1789192733201;
        Fri, 11 Sep 2026 22:58:53 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b260-f201-9983-e8c4-aff5-7a36.310.pool.telefonica.de. [2a02:3100:b260:f201:9983:e8c4:aff5:7a36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60ababd5sm175215525e9.4.2026.09.11.22.58.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 11 Sep 2026 22:58:52 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: v4l2-subdev: Fix media_entity_operations references in kernel-doc
Date: Sat, 12 Sep 2026 07:58:50 +0200
Message-Id: <20260912055850.39828-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel-doc comment of v4l2_subdev_link_validate() refers to
media_entity_ops, which does not exist. The name is
media_entity_operations. Say media_entity_operations.

Fixes: 5fd3e2412ade ("media: v4l2-subdev: Support hybrid links in v4l2_subdev_link_validate()")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 include/media/v4l2-subdev.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index d256b7ec8f848c51416cd1b62ff931ddc4feb4fd..6c4a0a6334e8e210c5da48527c1ad514568bd633 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1236,10 +1236,10 @@ int v4l2_subdev_link_validate_default(struct v4l2_subdev *sd,
  * width, height and the media bus pixel code are equal on both
  * source and sink of the link.
  *
- * The function can be used as a drop-in &media_entity_ops.link_validate
+ * The function can be used as a drop-in &media_entity_operations.link_validate
  * implementation for v4l2_subdev instances. It supports all links between
  * subdevs, as well as links between subdevs and video devices, provided that
- * the video devices also implement their &media_entity_ops.link_validate
+ * the video devices also implement their &media_entity_operations.link_validate
  * operation.
  */
 int v4l2_subdev_link_validate(struct media_link *link);
-- 
2.39.5 (Apple Git-154)

