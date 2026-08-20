Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403053988F8
	for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 20:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787257553; cv=none; b=Y9G7Sf1vvHXhZdu3L4Bsktg2yV720mjQBxHbS0Tv1NzIJ6mnKqYVmXX924O3itr62BM8B9caVQCj4HOsQB8g/jsJre9DNtis/DjDs7s/vS1BzhywwXjYwfvTx5kZV8U4NI1IzeUydeso4WNPrID/t4HQuGc3XBmqwxBFx3IWqbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787257553; c=relaxed/simple;
	bh=ntpplDcF+FslIX1ddbZSXGjVaEffYQG3VQ0+0G8CC/s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OB1qb16WSl4gVKMcbWz6Ga1HgrFNKdwpNRdOo+0PT8i9PNLPP83fQKP/QRMe77dggeEOZq+aRnEZ1I+cR9zgv1jQW5Q9/AEE/XGXD4+d9s/eRoe5SFJio4EjmLPS4v5EHHH9y235P5krC/kNcbl/DFBHtrvreqApLJSIT4zTGH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=adR0YNOH; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="adR0YNOH"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47fe89fb333so203203f8f.3
        for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 13:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787257550; x=1787862350; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ii76HjEkopbbT6Ldx/oR8y34K/ojZGJXj9TiNldisUY=;
        b=adR0YNOH6uSFRPapzgs7Ep3rcipQAMvjUCmOsZnmhlQK135nCvF2joLRDnGTqwGTEf
         v6qDR79bLxj2ExbqjzPdOAmTO1hdfYOHeDgeb9JXGFErt5yrVizMhCVBXoM0Ph2WY7S/
         jEi58G5vHUbb8UQupqDqMs1sF3TqkETFLm5179LuhL+mmITOshSv7K5RMHplqiGJTTh3
         7gkHdcTvGt/EzoRTAm6qvE+JW0UvM/n2Le1taQ4u/i+gIm1r3t9IBQjjEg1Ustcq0JJW
         H63/z6Uw96iql1W5qeE0Q8miyPv0rY0WItlh/XxbwOiQ4oslNl2vfcKXNKE18ifCpYj+
         EHKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787257550; x=1787862350;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ii76HjEkopbbT6Ldx/oR8y34K/ojZGJXj9TiNldisUY=;
        b=TGazMlqZJW55HC8pJUIcQ1+n1x8ncY0lyoNQF7d8ODNpWKvl7iSoiW0aqxUg4v5anw
         j5JF2bHAqL0ghma5QeTwH0P05x/lRYzUJn+QEH5EOy7gfnrsf9Ze0Q1kTVAtdDhg5s12
         9x+xp4fB29s9HdNGhhgiPrqem2d2iQSBIYLWsXsogBAarx8lvKEEOVZG1XnYS8OYubJi
         2kQuVOdDX2xYSgdx+nEQkGS1Gxlwkgp0nu8jekqZyZ1Q39nUrsRolnyVL1hm67o50i4s
         YlCratTsOKphAgpOoJfPYr7VL2q389sAPoVini0goiYKX05jtQdLRNxT0IsGupUdjr2p
         ZykQ==
X-Gm-Message-State: AFuF++nZQjHkTkpg6j3fPGsjlN3GTO7jKEtLwsK4gsWoVEU6SBdC2zXf
	b+UZxUFGQMgcRJuAscJPCeIluB6bOgIRjTrZEtSWbvJ5U4S6+rk8xt43
X-Gm-Gg: AR+sD13/J2qVz84dUmvaN4nqh8OfayWQACZVpPr/Dgv/8+Y0JiI4bpWmm+Kjk1Dx3Mg
	r8xABSmOTkLvLSfdYUwo5k9jP84iuOsFXpazl6AJiOafBfhU4OOcf+b1Tpii95rM3cJ89dH4qa/
	zdmtO1Mpdc0Kdjs/e/szC0kUaQMlh7RohR+OEkaccbbFYM8+WaARneLevzki3Z1euUdFeqNps6M
	vmyls04XcYLWvsFW/1NKTZ7CNQBddJsTuqABjYWjA3Na7rFUQypWtkOgB+J1VMKqc+eLod1DyEM
	986rEPJ13e8c+Ml4vMgyNkOZlb65B8KF5gDV/BH2jFaZcf3WgEediJ1cvJ9cSLum49xE+JqDQIC
	YpLA/RuR91Q9J2TqLkvxvcL6SBn5SKeZP4jKzvQFw5pBoNKhCpy1nSVuHPLIsOInMfN8UR/rw3e
	9GA7PCNv3LMrriZz89S+hWlmEiZkCmVDad+7Aj/DQXk3Bd9e3iQOcUgsEE9XH9mVQZV6NiiOjTg
	b8QBk5PIzNcI0gwT8+e9UPD/qFxkPLXVJ5OQ2ZWrRaxM5kA8eVYY8d5vmM=
X-Received: by 2002:a05:6000:2582:b0:47f:80ee:744f with SMTP id ffacd0b85a97d-482c0b99a89mr2069279f8f.16.1787257550271;
        Thu, 20 Aug 2026 13:25:50 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b1441753sm16977694f8f.5.2026.08.20.13.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 13:25:49 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH v4] media: v4l2-isp: reject zero-sized parameter blocks
Date: Thu, 20 Aug 2026 21:25:44 +0100
Message-ID: <20260820202544.1256265-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v4l2_isp_params_validate_buffer() walks the blocks of a parameters
buffer by adding block->size to the current offset. A block whose
type_info[] entry is an uninitialised hole passes every check on the
way there: a size of 0 is not caught by the block->size > buffer_size
test, and the match against the type info size compares 0 with the
hole's own 0 and passes as well. The walk then makes no forward
progress and loops forever.

Drivers build their type_info[] arrays with designated initialisers
indexed by their block type enumeration, so an enumerator left without
an entry leaves a zeroed hole rather than failing the build. Drivers
call the validator from vb2 .buf_prepare, so such a hole turns a
VIDIOC_QBUF on the parameters video device into an unkillable task
spinning with the queue mutex held.

Reject a block whose type info entry is empty. The driver does not
implement the type, so it cannot tell whether the block content is
meaningful, and accepting it silently would leave that content
unconstrained until a later kernel implements the type and starts
validating it. The size match then always runs against a non-zero
size, and no block can advance the walk by zero.

Fixes: 3cb6de6fafb8 ("media: v4l2-core: Introduce v4l2-isp.c")
Cc: stable@vger.kernel.org
Suggested-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: David Carlier <devnexen@gmail.com>
---
v4:
- drop the block->size < sizeof(*block) check, redundant now that an
  empty type info entry is rejected before the size match (Jacopo)
- commit message reworked around the type info check

v3:
- reject a block whose type info entry is empty instead of skipping
  it, so a type the driver does not implement cannot become
  unconstrained uAPI (Jacopo)

v2:
- skip an empty type info entry instead of matching the block against
  a zeroed one
- reworded the commit message, which no longer leans on rppx1

 drivers/media/v4l2-core/v4l2-isp.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-isp.c b/drivers/media/v4l2-core/v4l2-isp.c
index 1eb46e080afa..8e6c2ef326aa 100644
--- a/drivers/media/v4l2-core/v4l2-isp.c
+++ b/drivers/media/v4l2-core/v4l2-isp.c
@@ -99,12 +99,25 @@ int v4l2_isp_params_validate_buffer(struct device *dev, struct vb2_buffer *vb,
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

