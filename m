Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795211986;
	b=fZVV7DxIH9F3jmyZ5UPZmwZqIsWNJHnymKq/nrgWPL2obXFhbl6mmPEZEEVJL7+O2rvL
	 lJMK/wtvhwewZECWqMIM082CCktnZ6fbYALosaeHGKEkcJWdJO8GcwnWZsSUiRUILb/HP
	 rfM2sBo1AwAKdQH9hhtLWouBb4ISn87pj/UNhMwsoTLx7vi+GCeIU/gpm4iIT/GPHlsoi
	 4TBK8Bd0IdOpkgbbERcSs9jzq63/1Me2idiINJvjoNgjGZuEI6PjZRw18xXxkzumSoX4T
	 ahYKjofCJMz9HVIKPl5krmFAqGHpIBtqmKabk+rMRtSrdOWoPCixzeDRfdViS8lhEKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795211986;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=yQp6wu37grFSLFpLYqDqLuKQZrEDeFa5v47ChyJcE5k=;
	b=ALB8rhYIWAkreJwM4dbbNA3KEWIyqAwC1gFUBHwVHuNgfvgLjqs0HpL0U5hmH/uvcoW5
	 WY5ft+Z1kD1T2mygts5kbbTZY4l5QhUy7nIWvsPKy2oeff5+6ok7NjO8vFfFZSONHt1Iw
	 JvOM5QKYFbRiPb/0nrBJ2D/VQFcnao9sZcBtLoZm6VlgQZawUXr6mpIjap8I0U6XsOo1i
	 2SgWcSR7Ej9rxnS2vzBcGEitcOsFUcRvUsvHGq8GQ985M2pUjW7QQqR5AdRgIKD0Wf4iB
	 g0L7UezZCqa7Gn9+upboWO6byjHGZo4jcned/WBTpm5g/hybSnL8tuaPk4gaQZpsarw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--briandaniels.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=g781nT6c;
	arc=none smtp.remote-ip=209.85.222.200
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E98260A2637
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 21:59:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E98260A2637
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--briandaniels.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=g781nT6c
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-949b0d322fcso248174485a.2
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 13:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795211975; x=1795816775; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yQp6wu37grFSLFpLYqDqLuKQZrEDeFa5v47ChyJcE5k=;
        b=g781nT6c760iZjIVLDh4MGsfSFp4okZX+bxwJFJILGMVaPKRxxnd2oanYks6PZeVoY
         lB7XXMJngUQpjwOX2ATZMaEUVL8NvUiYTGDwcOsfDEMMctSirp90UAjiIaO/4VzOngBz
         X4JFXqOejur02MfqVfYcncNyflhXxOKspWhCjdi/BwNXMVM+KtzJFTIfwbq+rLAR/hWs
         maUFak2ctArvqm1REFfvuFVL2gGbYQhoN9KHM7IS2w+kJ+CjXzhrZ18ndQm8fsG/J0+U
         eWRLYAvqsR/2FvzCPpZpwjf/DMi3HkTnONS8AkcW+X9nGXNS+ftxSRvCuQ9X7MIzVQC/
         05sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795211975; x=1795816775;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yQp6wu37grFSLFpLYqDqLuKQZrEDeFa5v47ChyJcE5k=;
        b=IRlgjbk+MIwR//kVYjIE5OOI19J0ejqUrAtWdt9kH/9Pv9D0fEMpXyo2Jy8TAbaLdo
         egvH5v65aoKXCZEXzu9JYi0cOgtmP37HZ+RAJIlbW3olK30uxWFCtzei71zyZlnXGCJk
         NMDeigyXl3ipnGGpPkBnl7qMtK0OUZWH9gTG25a/3jW9VmtFkrvUM5db/SQSWS7S8P2S
         m1uodGGRuF4dbMdE2bHCWtbQBBNR+DaCfhhDhvqYD6qwwXKNu7XnNP70RTlcLme2kbbZ
         s7aXTxwqt9uYgzCFVaZxMRhvYmlQm7BIlAC+rkRR8FgUxoLc5jAdlvxCU9KKTYqVP6Dv
         4hFA==
X-Forwarded-Encrypted: i=1; AL+hErGkfBodBvz+D02Fr1BixsCSx5bN5KWGcYYRQPVuESbY5WXlJLFBfQgGsjUh/nD42h3eMcfCs0U9Q6N+Uw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9nfzkZSna2A8lkGPi9is/U9rblbRzomCDKv5n06SeVrHGMtw+H
	1mfJj3PeTBxVa8JoSOSqWBlBaKQ3qABixVpaF5uBPCBuG62vu1u+55+fIpzpn9MF634auyYPT7I
	SavrsswaPNRBOKdoBV3Ex7e9noqbt
X-Received: from qkil7.prod.google.com ([2002:a05:620a:c07:b0:93e:7793:940c])
 (user=briandaniels job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:620a:4556:b0:93e:c691:a1c with SMTP id af79cd13be357-949bab3d32emr690699785a.76.1795211974300;
 Fri, 20 Nov 2026 13:59:34 -0800 (PST)
Date: Fri, 20 Nov 2026 16:59:16 -0500
In-Reply-To: <20261120215916.3149345-1-briandaniels@google.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261120215916.3149345-1-briandaniels@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261120215916.3149345-7-briandaniels@google.com>
Subject: [PATCH v11 6/6] media: virtio: clear the size of legacy controls
 built on the stack
From: Brian Daniels <briandaniels@google.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: adelva@google.com, aesteve@redhat.com, changyeon@google.com, 
	daniel.almeida@collabora.com, eperezma@redhat.com, gnurou@gmail.com, 
	gurchetansingh@google.com, hverkuil@xs4all.nl, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, mst@redhat.com, nicolas.dufresne@collabora.com, 
	virtualization@lists.linux.dev, xuanzhuo@linux.alibaba.com, 
	dbassey@redhat.com, laurent.pinchart@ideasonboard.com, 
	Nick Rogers <nick@getfieldwork.ai>
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

Assisted-by: LLM
Signed-off-by: Nick Rogers <nick@getfieldwork.ai>
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

