Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F39243F088
	for <linux-media@vger.kernel.org>; Wed,  2 Sep 2026 10:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788344873; cv=none; b=lZwtt+MAfshOJX8Tae+XRefjWuTEcAn1TOXfIRdem9W2h3ltPNVwVwAkxtUXiXa8HObpL4xTBO46iqyw0Tp6S10/cTGnIjQOeX+ZpM0/AfPXXV4Iljes8GUU2nCuYcOwiA0NF/TLK/ZgXaw+eNQDn5N8QwyYWHYSgaH8jit7TYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788344873; c=relaxed/simple;
	bh=8yGxgAW6MTnYw+RaeljUxIp18Gj64RmbQf+PJvEG+Ng=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=r95lgn1FUwHBECgGPiXMYYtSXImodE9hclLKD/eH4e/6gntvsP4UdN+TmW69V/28tm93N4Upt1qp1WAytQlfM+mZAYGxzflzBguzXmrMs0dsegEw/ZGvRwhhxOeqaTNNH90JgojSctxBldzbVjzYWv0JXbq6oNEpPg4Qjh+Wd8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ngKupVfs; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ngKupVfs"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3a20f06cce6so8494721fa.1
        for <linux-media@vger.kernel.org>; Wed, 02 Sep 2026 03:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788344869; x=1788949669; darn=vger.kernel.org;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v1nCzi1zT/GmlzO8p5LsbwyL8JQR2Z796nsEcDW8jXI=;
        b=ngKupVfss+yfumhOvi2nsutZE5q7kgBvXh1whRlpfFSoZLFOU8blrM4CwM049jIVhK
         g37ayXYlX5YaqtHO4hfbQKsuBePVCxDgNaykA7xlBm93CxWBIB50yNCe7++ngxt+mNn8
         JKdumOtj7RnncJTfh1Pzkx2uMkyOEZ204+E0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788344869; x=1788949669;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v1nCzi1zT/GmlzO8p5LsbwyL8JQR2Z796nsEcDW8jXI=;
        b=Q5eM97ItUrrHPOXuFPbnFeIBhMdb+/ncFde0py6IrM3thQOturzbjp6qkBYQPhWy7i
         laahy+k5x1PIapGQSnkIDGc5ioVG/Zy9W+AKNnqqnVbQAgX/TeMNkWSjEQMCIJ795a8L
         ThlVnubSF9N7Vh2YpyQAh0E2uimp5xAbKrkqaYdJwuayLiUR0K8e8tbZ0cx0476F8QZ4
         7J6whQuKXPVlPfbOt6i7a9Ddx5C9AVOiKmtbbqO8Hkxkiq+N+jR7ct29nxzegBPkCvfs
         0sNoBCV51d4/+CBZv0bsojT5qo5p/gnKm4OCW1bk5L+7+/RKLFXZbkLtblBGTTn84yv9
         kI0w==
X-Gm-Message-State: AFuF++lrUXebqq5kHVJPRCwDa26E2+yi7domi63hZ1sOTEUMjFBB1jvp
	NUYIcZ3jd6bZs4WjWHBfnErx08otAM6St/MODXRlAgM4ywPCkfXdx6HqC0Pn3cfL9mfK5WopCnh
	nfx/5Tw==
X-Gm-Gg: AYBFou1TXUVsZisgmxWqd68a8B35lQbLgf/ohwb5kjcBasgq/snC78o63dngR7q9Wnb
	2dShILDYU3k0D/NJO0y/7vyT+LASIKxcTQ/LF3tLc9f8jmvaiLQq3+zIkbt979PNqST8UrTtCWW
	RAqaS8cJvl8TmZgY7RoOmnEO3NCMKjcifg1QkeqbCBoXFNJzMQcdWxLBHXlYcoSfWqmUMn4pphF
	DZuTiQs27AMScqkHdTiYXLGhQlkZwm2iH/bWZnV3a1p+ymZT6wnDbF/5w2kBU3I4dnXO+Niaw5S
	iPfcbAOl3OfpLHn2z5so6sa8uWpOOJUsv/IpcPVt8wE6F+pqL6oN1J6YrjDsLNCGubBcL7x7L8S
	VgarZJbtSSY3dGCGCHf9yanYFvGK6wUN3ESk/Bq6luRH79dW0ROTBhGwi2nv1izYRu3stI89iUh
	WeVWe8MkbYVtTyHGxLaM2cdCIu6t9o3Qd08oxFJanOwAh33Ip5aTvRPmSMTjyP8IQUiQ2M4O/M5
	EToJsJpmIbpoijp1TIZG7MNYZgwzJR/5dUxMIA=
X-Received: by 2002:a05:651c:2122:b0:3a3:2550:d76a with SMTP id 38308e7fff4ca-3a35555815fmr3794561fa.6.1788344869255;
        Wed, 02 Sep 2026 03:27:49 -0700 (PDT)
Received: from ribalda.c.googlers.com (11.36.88.34.bc.googleusercontent.com. [34.88.36.11])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a34a8f0ef9sm4910841fa.5.2026.09.02.03.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 03:27:48 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 02 Sep 2026 10:27:40 +0000
Subject: [PATCH camorama 1/2] v4l: Handle properly ERROR buffers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-contribute-v1-1-a45d6e93efd1@chromium.org>
References: <20260902-contribute-v1-0-a45d6e93efd1@chromium.org>
In-Reply-To: <20260902-contribute-v1-0-a45d6e93efd1@chromium.org>
To: linux-media@vger.kernel.org, Hans Verkuil <hverkuil@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3

If a buffers is flagged as erroneus ignore that frame.

Now that we are at it refactor a bit the code to remove code duplication
for the usrptr and mmap implementation.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 src/v4l.c | 73 +++++++++++++++++----------------------------------------------
 src/v4l.h |  3 +--
 2 files changed, 21 insertions(+), 55 deletions(-)

diff --git a/src/v4l.c b/src/v4l.c
index aa706f9..48357cb 100644
--- a/src/v4l.c
+++ b/src/v4l.c
@@ -414,9 +414,9 @@ unsigned char *cam_read(cam_t *cam)
 		convert_to_rgb24(cam, cam->tmp);
 	}
     } else if (cam->userptr) {
-            capture_buffers_userptr(cam, cam->pic_buf);
+            capture_buffers(cam, cam->pic_buf, V4L2_MEMORY_USERPTR);
     } else {
-            capture_buffers(cam, cam->pic_buf, cam->bytesperline);
+            capture_buffers(cam, cam->pic_buf, V4L2_MEMORY_MMAP);
     }
     if (ret)
         return NULL;
@@ -1587,14 +1587,10 @@ void start_streaming_userptr(cam_t *cam)
     }
 }
 
-void capture_buffers(cam_t *cam, unsigned char *outbuf, unsigned int len)
+static void deque_buffer(cam_t *cam, struct v4l2_buffer *buf, guint32 memory_type)
 {
-    char *msg;
-    unsigned char *inbuf;
     int r;
-    unsigned int y;
     fd_set fds;
-    struct v4l2_buffer buf;
     struct timeval tv;
 
     do {
@@ -1609,6 +1605,7 @@ void capture_buffers(cam_t *cam, unsigned char *outbuf, unsigned int len)
     } while ((r == -1 && (errno == EINTR)));
 
     if (r == -1) {
+        char *msg;
         msg = g_strdup_printf(_("Timeout while waiting for frames (%s)"),
                               cam->video_dev);
         error_dialog(msg);
@@ -1616,61 +1613,31 @@ void capture_buffers(cam_t *cam, unsigned char *outbuf, unsigned int len)
         exit(0);
     }
 
-    memset(&buf, 0, sizeof(buf));
-    buf.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
-    buf.memory = V4L2_MEMORY_MMAP;
-    cam_ioctl(cam, VIDIOC_DQBUF, &buf);
-
-    if (len > buf.bytesused)
-        len = buf.bytesused;
+    memset(buf, 0, sizeof(*buf));
+    buf->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
+    buf->memory = memory_type;
+    cam_ioctl(cam, VIDIOC_DQBUF, buf);
 
-    inbuf = cam->buffers[buf.index].start;
-    if (cam->use_libv4l) {
-	    for (y = 0; y < cam->height; y++) {
-		memcpy(outbuf, inbuf, cam->width * cam->bpp / 8);
-		outbuf += cam->width * cam->bpp / 8;
-		inbuf += cam->bytesperline;
-	    }
-    } else {
-	    convert_to_rgb24(cam, inbuf);
-    }
+    return;
+}
 
-    cam_ioctl(cam, VIDIOC_QBUF, &buf);
+static void deque_good_buffer(cam_t *cam, struct v4l2_buffer *buf, guint32 memory_type)
+{
+	while (TRUE) {
+		deque_buffer(cam, buf, memory_type);
+		if (!(buf->flags & V4L2_BUF_FLAG_ERROR))
+			break;
+		cam_ioctl(cam, VIDIOC_QBUF, &buf);
+	}
 }
 
-void capture_buffers_userptr(cam_t *cam, unsigned char *outbuf)
+void capture_buffers(cam_t *cam, unsigned char *outbuf, guint32 memory_type)
 {
-    char *msg;
     unsigned char *inbuf;
-    int r;
     unsigned int y;
-    fd_set fds;
     struct v4l2_buffer buf;
-    struct timeval tv;
-
-    do {
-        FD_ZERO(&fds);
-        FD_SET(cam->dev, &fds);
-
-        /* Timeout. */
-        tv.tv_sec = 2;
-        tv.tv_usec = 0;
-
-        r = select(cam->dev + 1, &fds, NULL, NULL, &tv);
-    } while ((r == -1 && (errno == EINTR)));
-
-    if (r == -1) {
-        msg = g_strdup_printf(_("Timeout while waiting for frames (%s)"),
-                              cam->video_dev);
-        error_dialog(msg);
-        g_free(msg);
-        exit(0);
-    }
 
-    memset(&buf, 0, sizeof(buf));
-    buf.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
-    buf.memory = V4L2_MEMORY_USERPTR;
-    cam_ioctl(cam, VIDIOC_DQBUF, &buf);
+    deque_good_buffer(cam, &buf, memory_type);
 
     inbuf = cam->buffers[buf.index].start;
     if (cam->use_libv4l) {
diff --git a/src/v4l.h b/src/v4l.h
index cc69875..15ecd6c 100644
--- a/src/v4l.h
+++ b/src/v4l.h
@@ -167,10 +167,9 @@ void get_pic_info(cam_t *);
 void get_win_info(cam_t *);
 void get_supported_resolutions(cam_t *cam, gboolean all_supported);
 void start_streaming(cam_t *cam);
-void capture_buffers(cam_t *cam, unsigned char *outbuf, unsigned int len);
+void capture_buffers(cam_t *cam, unsigned char *outbuf, guint32 memory_type);
 void stop_streaming(cam_t *cam);
 void start_streaming_userptr(cam_t *cam);
-void capture_buffers_userptr(cam_t *cam, unsigned char *outbuf);
 void stop_streaming_userptr(cam_t *cam);
 
 #endif                          /* !CAMORAMA_V4L_H */

-- 
2.55.0.966.g6673acef38-goog

