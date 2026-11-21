Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795229427;
	b=Db3NgAPtcYdr3iUnwCaaxzZ0MJ6vTWgTaegva6E7IV5My0D/NX1x0OQQ1rfhZLxKrcZi
	 ZhYBOhgZpZgvP9NNvUtRu2USOud/gDkajpZ89sQiqtmuqUB4MbF4c9yPnRA5uz+A5+ds6
	 rGna/i3Xey3oRvwCEGQLg0+PUnPvuzSXT0kRTIR+8u70rla9S8zK/QSnbMpJDnNhL5t/p
	 LzuyYxy+rxuR500X4EfxDYeJAS6rE3ZwFnWWsM9K4xED0erqKEnjKX8eZuLTA9qaYXVEI
	 9MlqBDEU5IOiMpFMDo19I9o7sPWjSZiFO9OvuqOZDGyaKF/XMCmKXDSvE8po68yOjTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795229427;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=DKXb3XP5512p3dJHGo2KoBBF7YTIyEsZxlx/DyWyIB8=;
	b=C4i/+ulSxloqki29LxGxunIgyzCl5uPmMTEEyirrxOlSGpRUgewJWCG4EVC2gRkboSja
	 y5vaeGmeQ41kaS2pkdhXMbSKj/JEMNsjD0QORXbnEMXFJY7E9f5O+19KmUEfgMGX6RjO5
	 hYM23QZ/jULNejdlJhG89yzpZMGojb3VCl9viUfVek/g5154zC03BpElVrrpazPVFCbOV
	 RJNCkr70d2N45ONTdWniBbh8+KUzvNVVJ38zMi5dmuzViAMLMINB1PQ7yyu/HjUf9/i64
	 MMngdngP4MFNRIcULtziCRkNGteIcmCIlsNixjpmR2bVv+9eLcp6oC5YliZ4xdxsUYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--briandaniels.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=n595g1o+;
	arc=none smtp.remote-ip=209.85.128.200
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646EB606A6B0
	for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 02:50:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 646EB606A6B0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--briandaniels.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=n595g1o+
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8b4d9d2e261so25960077b3.0
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 18:50:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795229423; x=1795834223; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DKXb3XP5512p3dJHGo2KoBBF7YTIyEsZxlx/DyWyIB8=;
        b=n595g1o+Ws9OCWESRJo9DQ080tYkjD8AvEja2lJmeWN0UVnCdcva6KNYXPt5jwUO3R
         llkL8/sOGi0V5HAOEcN8+bMu2Yrm2qu5SoFix3LoNNoY9Pr8Wtjoc3Bk4/iNv5IwTODz
         2DjJTlHsjSOj5wfyKlRpyJpXK9WDRLUihSbK53GlmgI6ZNUhKbrzKOk1j2SDgrzZ7Fek
         3vjmQv5QLG1dB8qokK9Lug3K8hjc6tORk5iY7B+hUy8lSGNrfWSfEYLRpB4WeyqBA9tN
         A0Px6VHsuC58GTuAjv3xVp/duBvxUcq+SQQK2KMnmE7TJBkX3ge8S5e7MtlIj2ivVuPE
         Y+VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795229423; x=1795834223;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DKXb3XP5512p3dJHGo2KoBBF7YTIyEsZxlx/DyWyIB8=;
        b=1dyhp6uT6ixxUTY/nvdt/BN6gxmwG1CDB0uOmrAtZpPP5nBYd9Wk7GnwhL8GTHIzaT
         DHPEsdvVHLNxi/3YkkB2H2RBNaIR7OZUbhIIB6Ug/erlohfZwRmBN9orhOB8qEf/DPg8
         BWDonNzFiHkSKD6kLBm7p7hckH5UdU58/Rnc3l9ny88e1ZiU7KOey7R5DP2tjpj7tnyt
         NEL50NvF56Cb9Gj7Qe/Be9/6nSlVBA3s/r6HH5hX/TFf2WrJeJV5mRB0r2YHLeI5czUR
         rKB2fFajnIill7+x3O4eM34nAKaUvCikGD1Mv8JVqclovJ4W50p0TghFqUHFisAfbPIq
         B+Lw==
X-Forwarded-Encrypted: i=1; AL+hErFcVHSqSOAmPCBTTzI5QL99+OhpEWsRoZQHILDVPzA5O3TZIX7CPPNpMd68gPhf5Kb4NdWkWBBJchcsKA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8yT/1S0VxbsY2L0yewO5w5t2d9Hzi3J/xEhLPBqq8WFDWy+t2J
	k/8Yn75k8KR8dEgMeWggsm1G71RbUjWMws3WdnRuePyzQDQaFlG0K6aUoFOT9N4GBDIw96pvSsf
	JjkBUm8e6FGxkgdKKpLresYbIavSY
X-Received: from yxvc11.prod.google.com ([2002:a53:ef0b:0:b0:67d:aba9:9204])
 (user=briandaniels job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:690e:43cc:20b0:67d:baf9:116b with SMTP id 956f58d0204a3-67df42c4555mr1179076d50.9.1795229422929;
 Fri, 20 Nov 2026 18:50:22 -0800 (PST)
Date: Fri, 20 Nov 2026 21:50:07 -0500
In-Reply-To: <20261121025007.3445723-1-briandaniels@google.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261121025007.3445723-1-briandaniels@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261121025007.3445723-7-briandaniels@google.com>
Subject: [PATCH v12 6/6] media: virtio: clear the size of legacy controls
 built on the stack
From: Brian Daniels <briandaniels@google.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: adelva@google.com, aesteve@redhat.com, changyeon@google.com, 
	daniel.almeida@collabora.com, eperezma@redhat.com, gnurou@gmail.com, 
	gurchetansingh@google.com, hverkuil@xs4all.nl, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, mst@redhat.com, nicolas.dufresne@collabora.com, 
	virtualization@lists.linux.dev, xuanzhuo@linux.alibaba.com, 
	dbassey@redhat.com, laurent.pinchart@ideasonboard.com, 
	Nick Rogers <nick@getfieldwork.ai>, Brian Daniels <briandaniels@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Nick Rogers <nick@getfieldwork.ai>

A driver without a control handler receives VIDIOC_G_CTRL and
VIDIOC_S_CTRL from the V4L2 core as a single extended control that the
core builds on its own stack, with the control's size left
uninitialized. virtio_media_send_ext_controls_ioctl() takes a nonzero
size as a payload to copy from userspace, so these ioctls fail with
-EINVAL whenever the stack is dirty. GStreamer's V4L2 encoders set their
profile with VIDIOC_S_CTRL and cannot negotiate, and v4l2-ctl cannot
read the MIN_BUFFERS controls.

Legacy controls carry a 32-bit value and never a payload, and an array
that comes from userspace is copied into an allocation, never onto the
stack. Clear the size of each control when the array is on the stack.

The core is being fixed to zero the structure [1]; this keeps the driver
working on kernels without that fix.

[1] https://lore.kernel.org/all/20260923160936.33445-1-nick@getfieldwork.ai/

Signed-off-by: Nick Rogers <nick@getfieldwork.ai>
Signed-off-by: Brian Daniels <briandaniels@google.com>
---
 drivers/media/virtio/virtio_media_ioctls.c | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/media/virtio/virtio_media_ioctls.c b/drivers/media/virtio/virtio_media_ioctls.c
index aa56efe9a..ad240073a 100644
--- a/drivers/media/virtio/virtio_media_ioctls.c
+++ b/drivers/media/virtio/virtio_media_ioctls.c
@@ -6,6 +6,7 @@
  * Copyright (c) 2024-2026 Google LLC.
  */
 
+#include <linux/sched/task_stack.h>
 #include <linux/mutex.h>
 #include <linux/videodev2.h>
 #include <linux/virtio_config.h>
@@ -593,11 +594,31 @@ static int virtio_media_querycap(struct file *file, void *fh,
  * Extended control ioctls are handled mostly identically.
  */
 
+/*
+ * VIDIOC_G_CTRL and VIDIOC_S_CTRL reach a driver without a control handler
+ * as one extended control the V4L2 core builds on its own stack, with its
+ * size left uninitialized. They carry a 32-bit value and never a payload,
+ * so a size there is stack garbage, which would be sent as a user pointer
+ * to copy and fail the ioctl. An array from userspace is never on the
+ * stack: the core copies it into an allocation.
+ */
+static void virtio_media_legacy_ctrl(struct v4l2_ext_controls *ctrls)
+{
+	u32 i;
+
+	if (!ctrls->count || !object_is_on_stack(ctrls->controls))
+		return;
+	for (i = 0; i < ctrls->count; i++)
+		ctrls->controls[i].size = 0;
+}
+
 static int virtio_media_g_ext_ctrls(struct file *file, void *fh,
 				    struct v4l2_ext_controls *ctrls)
 {
 	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
 
+	virtio_media_legacy_ctrl(ctrls);
+
 	return virtio_media_send_ext_controls_ioctl(vfh, VIDIOC_G_EXT_CTRLS,
 						    ctrls);
 }
@@ -607,6 +628,8 @@ static int virtio_media_s_ext_ctrls(struct file *file, void *fh,
 {
 	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
 
+	virtio_media_legacy_ctrl(ctrls);
+
 	return virtio_media_send_ext_controls_ioctl(vfh, VIDIOC_S_EXT_CTRLS,
 						    ctrls);
 }
@@ -616,6 +639,8 @@ static int virtio_media_try_ext_ctrls(struct file *file, void *fh,
 {
 	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
 
+	virtio_media_legacy_ctrl(ctrls);
+
 	return virtio_media_send_ext_controls_ioctl(vfh, VIDIOC_TRY_EXT_CTRLS,
 						    ctrls);
 }
-- 
2.56.1.750.gf70dc682cf-goog

