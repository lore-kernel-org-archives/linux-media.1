Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBD2451071
	for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 10:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787050611; cv=none; b=k5QCJQgWqB/7Ai6mcTewTeLeSBDKP7hESSn9sFZHT9fn/EsYLKbdErnccbx+6jfCBB4GOoFoZ8cZgYHUTXXgvkA7zAT+0lr5G0cm1UpR2RwbDy20tXM1g+yNqPDA4VaxkeOwubZHySOIR3Hm/kTTX2GLJhDWbIzSK+b41ujSTKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787050611; c=relaxed/simple;
	bh=LtJEwEmUeUmRecVw8rIzf4qNZ0bPe8mKIWeBWWWXbl8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=em5KdfUUbYXfBicM6MbRnFEHuSIk6uoie3McAr1QuYSgvY8gyXMBnEGLN7e0y1VdMhIVUzsVU9HQ1L9okC0Kkvy//8x+YPfIwcGJGo67AJcA1D/g2uEduHSQXhga0YLV6ARS0fFqkOei6CBaEDDjBzLoUejIpti6OsOm1MpV9Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DD8ATTlC; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DD8ATTlC"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4815b8781c7so1805907f8f.0
        for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 03:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787050606; x=1787655406; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r9shV1QZCHqW8FXaqflZ+eE8Gymv9k8sKCSVo4d0l9E=;
        b=DD8ATTlCWDBKGbXeqqeHdJwfA5+hY20YA0vcT48IUWCi7WwQHzTw7UFPtKeLh7zKDQ
         hVIp6Mh3Zy9r+hlkcV7tq4lfSRj8KarOMH1hsU0wtU5TsMwPpQojH+nbj6GlOLbIeLv4
         +jhZO00vcRxiZHNXGgeF3S+hR3L32dB4COdBPhYuHCNQFm0yKxrmuDtj6bqNZ+dc+YXg
         +YtFIbR4weY1BBQz0B7rP74nQ/MdPXSdv8GEvvNZrTZ3qEM7+90jFhcskr9MeYecdSFy
         qEbjkpuDZQpGRMLUGgTgtiysv0GbpIBS/C1CEamLhE0U4nsXfqErXQbL14F8RQRKrdoG
         uHSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787050606; x=1787655406;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r9shV1QZCHqW8FXaqflZ+eE8Gymv9k8sKCSVo4d0l9E=;
        b=PWETBdIRo5ZOCScf8N/vUqGFo4SE0yRfJ4KH4amXkDRmDiC47fCb7Nk/lYt9xlXZ8A
         No6mGffsFDOpb/LoIbKtGViH+Gfi7RVT7T7t8TkfO5v/tqpajlY+Oou8K8Nu1Rt62HsO
         AzhmENc0a3NgcNAeguZ3ZmiHhM0ZvapCCQdGtMYMVJxdtHA/NgePeyt4wC+dLTsrQq+3
         aHHzyh17QirRU47DC2NFz2Rm5mStf9kOX/DyfpSriIFXADWeNyx++4ez2yUEuJHokvSa
         EvoTPV0qnhbbCO2xzMzwTAvNoA0FUMuDrwyXs1TJNmQSrHh2vQTzrz++VN1f8H9NVxvQ
         lorA==
X-Forwarded-Encrypted: i=1; AHgh+RrB28D8NnjUZxZwMEDcNEG1kT21Nc1uABjmL0HjhsiXidayjwpaua9GDdYggt/U26lRu0r4b0u4qhlJeA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLgErhC/ad81s1tGcnTZYZ5e1hLKNP5jI7e1Wzlulux7xqeNC6
	eDsc9I3/7554KVVb28rblgRUhSJx0GjpdfrrqvkqXkms/uH7E5HYNgXQ
X-Gm-Gg: AR+sD13DcXxGHxH5peSBEcrKqSTBCge+rHuW3C60usWMCtuUw+GDNHIrk4WhbNLFAX4
	lD6DmouU79P/F5FGUNFDQTpjPUN0FPTky0iADGSOnMaYfd8u0NetAHAta6H9yHfF1LVT5l61DMv
	PZiIO0Nj1t15C+D7Ijg5Xrfo/Do3/M+Ur+/UChzLcH/FpW3j0OojaonKZaFSnRZpCPSIaruPJ0Z
	bJf4vn1vetuMj1DHtIOc+BmWlFIBZtE8jOuiEkJqGWsa2T70GkGfFRMfBPM2N9QX4bnvAa9nrAz
	1s+dmldBa5rQ/8eS6fuufq1ZJ22GSR8+qRjwURIAYESpqcMIgYsURW7bapRMfx4V0VoCI5zOtAj
	KgqYeMBdkG4x5RVaRxl5+WpWA+G3o8A0iGijxz4xkj+lYsUO8UIRKEoOhsuc8owEYMWrrv3Y9Ew
	eX1tajf9jPmnXpAUEmXj6b0ewRUELp6TLjqBO7xZH6ih31CkCfYP6yu61blp4iBmo0jpy85lBd8
	D3K3vC/kMOMi1Yq9TRj0lcmML8aHJcA8P3qkq7JGHaOlTkf
X-Received: by 2002:a05:6000:2994:10b0:47f:86af:8fe7 with SMTP id ffacd0b85a97d-482a90e928fmr10235086f8f.22.1787050606226;
        Tue, 18 Aug 2026 03:56:46 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5b816f7sm10433069f8f.34.2026.08.18.03.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 03:56:45 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michael Riesch <michael.riesch@collabora.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: David Carlier <devnexen@gmail.com>,
	stable@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] media: v4l2-isp: reject zero-sized parameter blocks
Date: Tue, 18 Aug 2026 11:56:42 +0100
Message-ID: <20260818105642.65381-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v4l2_isp_params_validate_buffer() walks the blocks of a parameters
buffer by adding block->size to the current offset, but never bounds
that size from below. A block with size 0 is not caught by the
block->size > buffer_size test, and the comparison against info->size
passes as well when the driver's type_info[] entry is an uninitialised
hole, both sizes being 0. The walk then makes no forward progress and
loops forever.

Drivers build their type_info[] arrays with designated initialisers
indexed by their block type enumeration, so an enumerator left without
an entry leaves a zeroed hole rather than failing the build. Drivers
call the validator from vb2 .buf_prepare, so such a hole turns a
VIDIOC_QBUF on the parameters video device into an unkillable task
spinning with the queue mutex held.

Reject a block smaller than its own header. A block's size includes its
header, so anything below that is malformed whatever the driver table
contains, and rejecting it is what keeps the walk moving. Blocks
carrying only a header to disable a block are exactly that size and
still pass.

An empty type info entry can then no longer stall the walk, so skip
such a block instead of failing the whole buffer: drivers may reserve
uAPI block types they do not implement yet, and are free to ignore the
block when processing the buffer.

Fixes: 3cb6de6fafb8 ("media: v4l2-core: Introduce v4l2-isp.c")
Cc: stable@vger.kernel.org
Suggested-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: David Carlier <devnexen@gmail.com>
---
v2:
- skip a block whose type info entry is empty instead of
  matching it against a zeroed entry, so a type the driver
  does not implement is ignored rather than failing the
  whole buffer (Jacopo)
- reworded the commit message, which no longer leans on
  rppx1: its missing AWBG_POST entry is being fixed at
  https://patchwork.linuxtv.org/project/linux-media/list/?series=29170

 drivers/media/v4l2-core/v4l2-isp.c | 41 ++++++++++++++++++++----------
 1 file changed, 28 insertions(+), 13 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-isp.c b/drivers/media/v4l2-core/v4l2-isp.c
index 1eb46e080afa..439477b2b941 100644
--- a/drivers/media/v4l2-core/v4l2-isp.c
+++ b/drivers/media/v4l2-core/v4l2-isp.c
@@ -84,6 +84,13 @@ int v4l2_isp_params_validate_buffer(struct device *dev, struct vb2_buffer *vb,
 			return -EINVAL;
 		}
 
+		if (block->size < sizeof(*block)) {
+			dev_dbg(dev,
+				"Invalid block size %u at offset %zu\n",
+				block->size, block_offset);
+			return -EINVAL;
+		}
+
 		if (block->size > buffer_size) {
 			dev_dbg(dev, "Premature end of parameters data\n");
 			return -EINVAL;
@@ -100,23 +107,31 @@ int v4l2_isp_params_validate_buffer(struct device *dev, struct vb2_buffer *vb,
 		}
 
 		/*
-		 * Match the block reported size against the type info provided
-		 * one, but allow the block to only contain the header in
-		 * case it is going to be disabled.
+		 * An empty type info entry denotes a block type the driver
+		 * does not support. Skip the block, it is up to the driver to
+		 * ignore it when processing the buffer.
 		 */
 		info = &type_info[block->type];
-		if (block->size != info->size &&
-		    (!(block->flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE) ||
-		    block->size != sizeof(*block))) {
-			dev_dbg(dev,
-				"Invalid block size %u (expected %zu) at offset %zu\n",
-				block->size, info->size, block_offset);
-			return -EINVAL;
+		if (info->size) {
+			/*
+			 * Match the block reported size against the type info
+			 * provided one, but allow the block to only contain the
+			 * header in case it is going to be disabled.
+			 */
+			if (block->size != info->size &&
+			    (!(block->flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE) ||
+			    block->size != sizeof(*block))) {
+				dev_dbg(dev,
+					"Invalid block size %u (expected %zu) at offset %zu\n",
+					block->size, info->size, block_offset);
+				return -EINVAL;
+			}
+
+			if (info->block_validate &&
+			    info->block_validate(dev, block))
+				return -EINVAL;
 		}
 
-		if (info->block_validate && info->block_validate(dev, block))
-			return -EINVAL;
-
 		block_offset += block->size;
 		buffer_size -= block->size;
 	}
-- 
2.55.0

