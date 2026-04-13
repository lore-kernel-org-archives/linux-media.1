Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47D736404A
	for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 09:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776073646; cv=none; b=hOTPqT+cMxpiRBCcAdUD9/KDTDnqHL18FfPQfhSqdWkEKtpYQmrmVpWskn6baLumttDoLS1x7k4ZyQeiNfeNc3KBdIEzBSiCT16zr5Eh978Sns9R6ngGAMfjUPukFae8K6TMpsf9qS4n9wrp6RX9p0Uj4tZPSkwCZ6wgq9bBPM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776073646; c=relaxed/simple;
	bh=DmoE7tr1zPSRHVsLQKU6hLCOuaZ8/p/RFXwT0WPJ6os=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ojMNjiXy/7RaWp7FXNxeWzUARwtf/tvYsxNBXDM76A9ibynFUdoRTrYfWju4Kqk2ydZ09tMqT0sCcLcj3zbs6pjVtViVdda4aRSsETMLrYE+DZ8EK36Ga3azgf4ZHTHb1R12MVexOBRMo9uU5aPsZgjbr0aE0GFR+0B78n/QvLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZBE8nDEZ; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZBE8nDEZ"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-483487335c2so45364315e9.2
        for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 02:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776073643; x=1776678443; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zAmXK2IVpf9olAwmPM0IVEvZQa86m9IE4TqbVDkGWa8=;
        b=ZBE8nDEZzYaqOataSkyWuYoA7FlzW0+vYGoVjw779gdULFNxBuy0zoeUp9GBA735qn
         opV3aQ/VYkO2DTt5nL8WiWioMP8x4fT9UUKT33+hYc0TvIF8wG9oFhLcT4z9rOhySQ2i
         sUF/belqvJcx/eSmHbbfl06+vMXQO9DZXq0Kd5NGHhOX77xHTpJCVcse54r9KKQ18IHO
         aWYsqMcSNF5YeHdr0RSCvXOo/R0PokcDBkDn9FWGOkES4Y6QFWHZ3slmhx6yQMImzns0
         AmsHCw+DlOnsUUQ3as0znJLu0heS38fUC8g4FQhANknabQHalH8MqSduGVRgAJkghqSR
         +U2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776073643; x=1776678443;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zAmXK2IVpf9olAwmPM0IVEvZQa86m9IE4TqbVDkGWa8=;
        b=j1n8neK5VwyB0xds/Nx4kAg/3ynTj8YdJplImBovHh4O3y6ItgpWr10Pkun97Zq55y
         LjxwapKXnI98EGXTBtIO8yMi6H7ElGYM+dtVmJhIGIyvoh5fGuWT4BYj+kXoO7F6C80H
         i+4d18HSrTsEjp3z0fJCqsfXMZwfkXlB0rdmRydc/WFifWu9kwn8SdZBF8fuXHEYjW+y
         0pZstyT2UL9m3y6iCvYaEPp+NhNhyH7Hmv8syhK1MgEs488tFQ+ydf4eD0yOyWH/NWuF
         8kIbNEd1iLI+bnWCBuJQlAM3Cp7m4LQLKWr655KslC61jCwPogFzxSVSrVI4RkIBdbpg
         DpHQ==
X-Gm-Message-State: AOJu0Yzw5W3loPrva2jQMjqrkGzSclJUdM7vJpHZthjtsCkbFoEIIB/4
	J3CQsshvo3cDPjANZkDhHn6h33eUiU9oY7m8WjlzwvIvDi7M9oZ2RJiE6L2JVA==
X-Gm-Gg: AeBDievVadk02INdxuuyHPbjhZgcZDLQvchx/CPAiKmAq2oO9Vtfi4+lhF0WyKNnfJw
	vxel+rvCnqIGbDSORAPnU4Y9MTG9J5PVGqYJqaKhrY9XA2Na/13pt6mpbpbVszr5qitmo1WMVAu
	EOaJALDfyNp4bSwStJ5RTdiUTUlIbau5Vl2P3LtMoUdNPqsPJkGxl4YWwfdXUD3a+GKPWwFtWV+
	pT/2k2BEfba641amJ9EHfLy4Uwp+QiSe9ZVKOvOEdxshNhO7mRx5kDg61ZwLt0SQVObHDIAQow4
	UkumtKT0rs8Fnz7u646OgW7ERO9jZEz7Xqx/v+wxpGN4g33x9TwE/qxx8ek+Wfga4zjydNC63BB
	e+wWhTwbSrDgibF0Da0iGEwX+4298jh/ZP4QpMpe5cVVTi+qUDcFLJMo09Au8YUDk/M7kfkz19j
	JawNU93CoBi1gYZIIAK9rswoMr2leXQxZElLiGHRnE60CFijTmnKT78p2dUlAoGIU0W5jWhCO3l
	lyUxQdCZbbcgapKYg==
X-Received: by 2002:a05:600c:3f0e:b0:485:3f72:323f with SMTP id 5b1f17b1804b1-488d67e6973mr171180725e9.11.1776073642579;
        Mon, 13 Apr 2026 02:47:22 -0700 (PDT)
Received: from localhost.localdomain ([37.60.47.23])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d683c902sm95058725e9.22.2026.04.13.02.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 02:47:22 -0700 (PDT)
From: Esther Zilberberg <esty5664@gmail.com>
To: linux-media@vger.kernel.org
Cc: nicolas@ndufresne.ca,
	Esther Zilberberg <esty5664@gmail.com>
Subject: [PATCH v4l-utils v2] v4l2-tracer: retrace: support all mplane planes
Date: Mon, 13 Apr 2026 09:46:39 +0000
Message-ID: <20260413094639.8615-1-esty5664@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For V4L2_BUF_TYPE_*_MPLANE buffers, retrace_v4l2_buffer()
only restored the first plane from the JSON trace.

Restore all planes by iterating over the "planes" array and
reconstructing each struct v4l2_plane entry, assigning them
into a properly allocated array.

This ensures consistency with trace output and prevents
incorrect buffer reconstruction for multiplanar formats.

Signed-off-by: Esther Zilberberg <esty5664@gmail.com>
---
v1 -> v2:
- allocate planes as a single array and populate it directly
- change retrace_v4l2_plane() to fill a provided struct instead of allocating one
- fix indentation to use tabs instead of spaces
- add blank lines between scopes for readability
---
 utils/v4l2-tracer/retrace.cpp | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/utils/v4l2-tracer/retrace.cpp b/utils/v4l2-tracer/retrace.cpp
index 010936c0..f4e4d3c7 100644
--- a/utils/v4l2-tracer/retrace.cpp
+++ b/utils/v4l2-tracer/retrace.cpp
@@ -199,10 +199,8 @@ void retrace_vidioc_reqbufs(int fd_retrace, json_object *ioctl_args)
 	free(ptr);
 }
 
-struct v4l2_plane *retrace_v4l2_plane(json_object *plane_obj, __u32 memory)
+void retrace_v4l2_plane(json_object *plane_obj, __u32 memory, struct v4l2_plane *ptr)
 {
-	struct v4l2_plane *ptr = (struct v4l2_plane *) calloc(1, sizeof(v4l2_plane));
-
 	json_object *bytesused_obj;
 	json_object_object_get_ex(plane_obj, "bytesused", &bytesused_obj);
 	ptr->bytesused = (__u32) json_object_get_int64(bytesused_obj);
@@ -222,8 +220,6 @@ struct v4l2_plane *retrace_v4l2_plane(json_object *plane_obj, __u32 memory)
 	json_object *data_offset_obj;
 	json_object_object_get_ex(plane_obj, "data_offset", &data_offset_obj);
 	ptr->data_offset = (__u32) json_object_get_int64(data_offset_obj);
-
-	return ptr;
 }
 
 struct v4l2_buffer *retrace_v4l2_buffer(json_object *ioctl_args)
@@ -284,9 +280,20 @@ struct v4l2_buffer *retrace_v4l2_buffer(json_object *ioctl_args)
 	    buf->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
 		json_object *planes_obj;
 		json_object_object_get_ex(m_obj, "planes", &planes_obj);
-		 /* TODO add planes > 0 */
-		json_object *plane_obj = json_object_array_get_idx(planes_obj, 0);
-		buf->m.planes = retrace_v4l2_plane(plane_obj, buf->memory);
+		buf->m.planes = (struct v4l2_plane *) calloc(buf->length, sizeof(struct v4l2_plane));
+
+		if (buf->m.planes == nullptr) {
+			line_info("\n\tMemory allocation failed.");
+			free(buf);
+			return nullptr;
+		}
+
+		for (__u32 i = 0; i < buf->length; i++) {
+			json_object *plane_obj = json_object_array_get_idx(planes_obj, i);
+			if (plane_obj == nullptr)
+				break;
+			retrace_v4l2_plane(plane_obj, buf->memory, &buf->m.planes[i]);
+		}
 	}
 
 	if (buf->type == V4L2_BUF_TYPE_VIDEO_CAPTURE ||
-- 
2.43.0

