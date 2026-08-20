Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13FE0420E8F
	for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 11:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787224653; cv=none; b=IBPl8pqFVSh+JXd+D+8lzxyug9f/z1Z3VnHqnRIje+4wvW917tKZ6RDmSfchni9Yr4OkPQ8ndzAkae9Z0eK0ht/fcEzS2n6JJq8ty8JI6KLASc+IQAyKi7WCazQyBGKOWWtvMfm2akGC64Sy1+7ft2Mk8ja4O+mqTJ+2KgXXQaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787224653; c=relaxed/simple;
	bh=hJkDm3W+fV7ZpBCUJIAmMowzdA2NGP/qVikG0lIhhuo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S0vKp88S7ZPm1vobEGXz7BYLGd/kG+PO7Wv1jy4jOoEQawPhj7jbUFPWK2bBj5iPrkbd5ud0iohCDw23kdAa7dfyYehHKlGcTcn2N/WbnQB5tDM/fquzpMOcNLu/RmW5UG9VpumTNcsSDBlOfD5P24YaGocW6oCoDhyhaXAC/yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IYhBugEs; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IYhBugEs"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47f71156e1aso981008f8f.3
        for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 04:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787224646; x=1787829446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=o/+XjvBzWoD2MQbLHFqUD6b0gTe8eLRAGn6npcOPS8I=;
        b=IYhBugEsjgG2ts7uUHamFNSjeJwcgbAkMzSBmmSOzY/siiFzBVlLQmMthstqNu2lSw
         tDOOQOEnC4wsj/D/qfwwiHEWczJjZ/VhpHv/sYq4/uQePt1YYjLjJLFJ7wuSD5xvbWHZ
         1WTAlB0rlQSiYClUIpZv23Xha38nXdxr9HT6x8qFaWnCY/F1SXCcbHIFpWnELxBYHFpI
         GxBCtIrgVq5i3OaiAI3h+c8cN8OTf0iA06K8ixhB9bdAVZgVtg3FDtgid7XuOdjx1beV
         pH2TxLAXneY6gjxQ3GNVzHIq2shx2LyYaUaZsTEqWrx3VlvvvriyK36rdD/Z5DxvDEvV
         j1Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787224646; x=1787829446;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o/+XjvBzWoD2MQbLHFqUD6b0gTe8eLRAGn6npcOPS8I=;
        b=Ogun8e9CpAppl/cOlWKPguyV2X/2OdsabbRKAVRnbWNqM1gjo15AAKvrvEIDN8guGV
         tUUf/ggVyVGN4pvAE83TYhUx0GcOrT4r6Kbpl10jqzTVQwkiURmf/PeBUzfHmVoXXKV5
         pF0h4C3Q+ySPTzv9p7AwzwPMF6wlxP0+MZfrcYQC3YVCGY4js2IZWIAmQQ37r/R//Qtn
         SgEnzDeZ6Y31phNlKCzUH5l6IuASztt4p6ZScNX251teha0tMQ2gKg5RvSM/njo5Hc1p
         PqHc8xS4l6FRpTV2TQ7c6zyXt6QoIDNBAGYQAg/4ivsjGD8pdUKjU44DDGAWwjFo1zuP
         FZCQ==
X-Gm-Message-State: AFuF++mzIKFcWoCpQqmqKgliYymJncy0miDXnsUxtCkOF5nrLfJCXZms
	Yc9vn6jouaxj2SLrCtM2g/2HPDI3S+x7gvX44rDUgCz7z04BS+/OLAGN
X-Gm-Gg: AR+sD11gmgggGjxHyD2rJxznMzn1YfsgZBBdG5G84feZ3FaqQrYcaPvbE0jLwCIGkvh
	4LvTGqhMdmoIlM9d6QWbMGcwQiGFTPzQVVue7si5zB6L/6WKSzU2r0e9vVdAb9hcEkw5zPk5hj2
	U00Do3G42KqxOUcnCVCbLLOdHKydhHEEVPBQABST2N2teGzotz+MIaMg8pB/F8ehiQ8qkH9zkM8
	7/mgbbe1l4HNQrpc1q0Uzoo5XnKN8+RfTZV9wWfV+3eohkdJA/mh1+XU6Gyu8hYZQ0RAJSvAK0t
	Rj26Ao8lXeoP5pMusP1if33AzIH9RIvnVCPg9IFrME1vzhHFMXZyYADTUS3pHhomBjHExBLMuvb
	trXzCF+9WkuVIg3DzzcgHAgbBHsBetcjvcMYyPx58i5pdJQUzuw5QCkGaT8S5iPplr9dxbPyWr/
	3m+Q3nqcm9LhnKy0haTdsfLcsOhIwJ9/cGCJHlMW0EOoDbWzxhyD31xrnNLHZFhnH06LLNhUJyX
	Og/AUALNJXnTWNrVajxlQVq/eoo1SEcwWSoiQmdIqYCsNgw
X-Received: by 2002:a05:6000:41c7:b0:481:5167:abda with SMTP id ffacd0b85a97d-482b1e9e2a8mr21500418f8f.9.1787224645446;
        Thu, 20 Aug 2026 04:17:25 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14b8050sm12957987f8f.19.2026.08.20.04.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 04:17:24 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH v3] media: v4l2-isp: reject zero-sized parameter blocks
Date: Thu, 20 Aug 2026 12:17:22 +0100
Message-ID: <20260820111722.1233915-1-devnexen@gmail.com>
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
v3:
- reject a block whose type info entry is empty instead of skipping
  it, so a type the driver does not implement cannot become
  unconstrained uAPI (Jacopo)

v2:
- skip an empty type info entry instead of matching the block against
  a zeroed one
- reworded the commit message, which no longer leans on rppx1

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

