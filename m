Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240ED3C2786
	for <linux-media@vger.kernel.org>; Wed, 19 Aug 2026 21:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787175310; cv=none; b=lcksSZw9C5h+9w9MYBHzEeU5KlzyRNWykVXDpe6+KznW/XRuwvnzK+61tynbtSfnFDQpEXWA1681Y1X/jQm3keNRL/ETEOl9ESwJ2U2zQi3ZEiF2uB3oEfb2p4lP51K7tX8KmXrDhCjFvfh5LcwP0Hs63Zs7EIraYJZIAHOBhLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787175310; c=relaxed/simple;
	bh=XCyWI21c6Ia4UYKaZMPJwr2tuL0rzz7GONunasW8keE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l7fDDl8q2BY1aWeNVLmcnZSCEppFcn1JYd/iK9azkPyy21Vs0fbKX9LRcYlOj+TkxqR6uyDYEhLlmlWmO8LV8x5tjxF/uWCK9P11w08apn6ch9Npmab0L0E+w8UmBLxyhq+c3P4oFX8tZRA8vV0wCyIRNPVfHiQ0EFz9lFQOqBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hkt2rffq; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hkt2rffq"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49800c6a846so16032585e9.3
        for <linux-media@vger.kernel.org>; Wed, 19 Aug 2026 14:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787175303; x=1787780103; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XoBJmiYxKbOhM9EJaI6KrJ7+GoQWOfMWCpsZ2kanZl4=;
        b=Hkt2rffqbv+NASAbl+uxj2WE1L7qNfmhlq0C00DdEAk8t486A9L9M17dNbstMf9bm8
         UhG1jfiiz3dJbAFfiG6IJYBvg1y6poSnk2WafHZoTnXx6KvOUKesERfoHTYK7+zzU8Sc
         n+WN01NGHAPtzRxZyfOzSkV1u4zg/GVaHXhhqbJjacTDeXeFG+4owynBNAsB5ibp4CF+
         lpwjEdHXky132FYCkp8NM4C51kgSAJ1+mLyF3wFGlrKlup9Yf+1E/GgJPMgRIGlTQ/Ik
         AJ55Nl9uPDzRRMoKL8EReLga2Accp5yk2I+8Dq+4wCiD+LWOFjsbkCxNi4/B56z+su1G
         ptRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787175303; x=1787780103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XoBJmiYxKbOhM9EJaI6KrJ7+GoQWOfMWCpsZ2kanZl4=;
        b=ZpwpoND7l/jjL1cJmj9nUe6muoKm1PAV2IRIiWQsg1BC2IohlcjtQ/Dg//1of6PLs5
         iC6J6l7WbXhAU1HmtcvFmlvVxz+mLZcY0hIkjHrhzvs6hnAd1ff7KyaLfKLuOqa5Zcx5
         XmF56X7tFYnV76xtj6bfDx6F981bTzXLsUAeqdy6fbDBoCrr7IgVak+o2CUDoCJOKEFl
         WvDArwMgREvR3LMCDjkQDq63yaB5bdDxmqo9piyNR8UnPVTxmWO3Blp0WhFpkeKTmjzb
         LuOISYqkdyWU+p6LKROICbhyu7RYPPy6dEt2aqGiQ6QIxxaA8bUf1klTF1Vb3DVFiTWY
         CUmw==
X-Gm-Message-State: AOJu0Yxm7XR3hNcCBc9grpVGRXTyP22p2rw7/eVu0UuThGjfuNCbE/xl
	w62yOInK4k0CTSeARIQXHF8FGtym1iAnF43kq3vcUlSG+NTvF3JUJCc1
X-Gm-Gg: AR+sD11CkU/bduh+ii3856ri9+PGtQ/ruhe64c5pmzkd1VvUCv+p2zFW+fcELZkiNE8
	Quc71BpZvD1c9WSRxRtfJ5hhM+8umz6TSypUaAZptpwFXYtmvPqWNq2P8grqDk/Ut3sxJmrtHx0
	Y10Pxktxsa8LcQ2L/ekPIRBHa9+3TssqvYjsGuX3BPNyToGunKBz0ydoMwKFa/hvUAeNqCVuN9/
	pYNT6tSFPCtFFaqQ8yqZfc0kz5GNaSel597lEled5BY0dKnQiTX8VoJjW/dotlHJ1TRvJ6AeSEb
	/1gcqFXn9l9AwH68nBkh2pGQKt2HD9Mc3eTaYiqV75jXx2gFWHpx2miHkMzhfboaAkq0de1z7TV
	jZ16A6XY6I3iuA0GreEl8MxVMnZ0OoV46UL4L9yIkEVCYzZMGA0VgiSqKpqBnoHydzTRhHtTZ+g
	QI+l99F5UBlkt4uaCuaKdj/++n1ikvhpNcElk7Am3UsMswhu9zagViNI+3cBKNzGZqUg5y4BCZh
	3R2wbXXJS0U8gNHVIidtOOm2lrXCnVBEQrFPITtHB2imh6I
X-Received: by 2002:a05:600c:37c6:b0:499:60bf:c6f7 with SMTP id 5b1f17b1804b1-499aa1dbb12mr157441035e9.13.1787175302615;
        Wed, 19 Aug 2026 14:35:02 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b19dba34sm9633365e9.9.2026.08.19.14.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 14:35:02 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH v3] media: v4l2-isp: reject zero-sized parameter blocks
Date: Wed, 19 Aug 2026 22:34:56 +0100
Message-ID: <20260819213459.1220894-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260818105642.65381-1-devnexen@gmail.com>
References: <20260818105642.65381-1-devnexen@gmail.com>
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

An empty type info entry can then no longer stall the walk, but a block
matched against it is only constrained by that header size check. Reject
such a block explicitly: the driver does not implement the type and
cannot tell whether the block content is meaningful, and accepting it
silently would leave that content unconstrained until a later kernel
implements the type and starts validating it.

Fixes: 3cb6de6fafb8 ("media: v4l2-core: Introduce v4l2-isp.c")
Cc: stable@vger.kernel.org
Suggested-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 drivers/media/v4l2-core/v4l2-isp.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-isp.c b/drivers/media/v4l2-core/v4l2-isp.c
index 1eb46e080afa..efe994b4c4d7 100644
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
@@ -99,12 +106,25 @@ int v4l2_isp_params_validate_buffer(struct device *dev, struct vb2_buffer *vb,
 			return -EINVAL;
 		}
 
+		/*
+		 * An empty type info entry denotes a block type the driver
+		 * does not support. Reject the buffer instead of ignoring the
+		 * block: accepting it silently would let userspace fill it
+		 * with data that a later kernel, once it implements the type,
+		 * would validate and possibly reject.
+		 */
+		info = &type_info[block->type];
+		if (!info->size) {
+			dev_dbg(dev, "Unsupported block type %u at offset %zu\n",
+				block->type, block_offset);
+			return -EINVAL;
+		}
+
 		/*
 		 * Match the block reported size against the type info provided
 		 * one, but allow the block to only contain the header in
 		 * case it is going to be disabled.
 		 */
-		info = &type_info[block->type];
 		if (block->size != info->size &&
 		    (!(block->flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE) ||
 		    block->size != sizeof(*block))) {
-- 
2.55.0

