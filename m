Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795609720;
	b=gQOrt0rSN+/sBwEAXcS1TsQvM9GUe2LHfRNxcVz7SDi/agi/M6/NJuAFckITXBGKOJjU
	 oeEO56z0+ZdfX7eI1hw+YpptwYgwxpOmIuk75l4fNGSyI/gYrruRW8wuFMFMAHa41fi7l
	 nWowLWs8ycbleU1jU4VR/hw5woQjFckzwY9IbztFrX7ahnE6xyam4RVNp+7KUNip4TljD
	 QC6Atf1Myc+DR2anEfvoQxIUqrLL+PS16pw32jRqeNry7NcHKr3jJS3pp6HGgEZ6XFOaM
	 cOhTUcWq+xtTnTlZPXRB1fpL+kSgOzgbz1bGEhxUQLwHo6+W3ALmUligtwZcPdyeMmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795609720;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qdmFqie+LOrd1V85imiYgzqHYT4TnBZbGY1vS7eeizQ=;
	b=spVjZae8XrD334jL0gfKs5XnH/gvNv9b+m8tJ1sgMLeSOOyk3SCpwXaONGe7CfZtqyPJ
	 QS4ixUNIWX0HGEhZJxMvQf4FKMxSPV3xJbqyYzzFmJ2Mgc3E07StscwG2Ck8ShpK2totQ
	 p49xFWzvE0Q8VxJRoX8pKDVFvM9lUbESfW1F1ruLHze430oN7gZnG7lSd0PlvfwY9FSB7
	 yR6sJ53gc2g8ukOV7tjtQvJQ/14HXz6DDWuX1Vief+em5leT05/ckyGjEiT4pso5sdb8Q
	 ohBT3oXdNOxs8PWpacRZADsSTua5YXZe6iyMwhOiHvFM0tI82i8s812B8sQaIWqeDEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=E645YLk8;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4E8606A327;
	Wed, 25 Nov 2026 12:28:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A4E8606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=E645YLk8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795609711;
	bh=g00izwTwgCeq9Gr7RcuHIq/8Y3cTVgp+ooEPGe/N+eU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E645YLk8TrBk4rleM1W4b7lnGkPHdGZXRmX+gfcTi5aVAuZx82pBNi269KqNzpOJe
	 7avv3Ur5sd5s2+zG54gXKqQq2E1iJQibCMT7uGEAhTw3oarRaCCCo0WdKtFokX1RyQ
	 vk7ou1xZH4YZS0y8j9KbiH9pD1A4vs7AmZKjtvXbqPFhEdxY63k82naDw6dDioNLRo
	 YsKPQ/daEeC/j9WN4xAEJTDkY/T37S+q1lXpng4Imkmj2l3pE52/hNeAEjkZ/+j7+V
	 mEQ7pgr7cEDPhA0Pp7MC6/s/cQ7Esf/+fcGJ0i+lhM07VzpUFK6fT8uoEU6q0c5vT7
	 N/E9PFiIk9zVw==
Received: from benjamin-XPS-13-9310.home (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0227C17E0309;
	Wed, 25 Nov 2026 13:28:30 +0100 (CET)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: nicolas.dufresne@collabora.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	heiko@sntech.de,
	hverkuil@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v9 1/4] media: v4l2-ctrls: validate AV1 reference frame index
Date: Wed, 25 Nov 2026 13:28:22 +0100
Message-ID: <20261125122825.236422-2-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125122825.236422-1-benjamin.gaignard@collabora.com>
References: <20261125122825.236422-1-benjamin.gaignard@collabora.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The stateless AV1 decoders use primary_ref_frame and ref_frame_idx[] to
to find the matching reference frames.
V4L2_AV1_PRIMARY_REF_NONE is the value of primary_ref_frame indicating
that there is no primary reference frame.
Iterate over ref_frame_idx[] to check if the indexes are in [-1, 7] range
like described in AV1 specifications.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
changes in v9:
- Split core changes and drivers changes
- Add V4L2_AV1_REF_FRAME_INVALID
- Rework checks in validate_av1_reference_index() to be sure that
  all values of ref_frame_idx[] are in the correct range.

 drivers/media/v4l2-core/v4l2-ctrls-core.c | 30 +++++++++++++++++++++++
 include/uapi/linux/v4l2-controls.h        |  2 ++
 2 files changed, 32 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index 6e751a043a21..e707897e36fd 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -817,10 +817,40 @@ static int validate_av1_tile_info(struct v4l2_av1_tile_info *t)
 	return 0;
 }
 
+static int validate_av1_reference_index(struct v4l2_ctrl_av1_frame *f)
+{
+	int i, idx;
+
+	/* The valid range for ref_frame_idx[] values is [-1, 7] */
+	for (i = 0; i < V4L2_AV1_REFS_PER_FRAME; i++) {
+		idx = f->ref_frame_idx[i];
+		if (idx < V4L2_AV1_REF_FRAME_INVALID)
+			return -EINVAL;
+		if (idx >= V4L2_AV1_TOTAL_REFS_PER_FRAME)
+			return -EINVAL;
+	}
+
+	if (f->primary_ref_frame > V4L2_AV1_PRIMARY_REF_NONE)
+		return -EINVAL;
+
+	if (f->primary_ref_frame == V4L2_AV1_PRIMARY_REF_NONE)
+		return 0;
+
+	/* If set primary_ref_frame index must be valid */
+	idx = f->ref_frame_idx[f->primary_ref_frame];
+	if (idx <= V4L2_AV1_REF_FRAME_INVALID)
+		return -EINVAL;
+
+	return 0;
+}
+
 static int validate_av1_frame(struct v4l2_ctrl_av1_frame *f)
 {
 	int ret = 0;
 
+	ret = validate_av1_reference_index(f);
+	if (ret)
+		return ret;
 	ret = validate_av1_tile_info(&f->tile_info);
 	if (ret)
 		return ret;
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index d17e41d51d2e..f21f00fd5a84 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -2940,6 +2940,8 @@ struct v4l2_ctrl_vp9_compressed_hdr {
 #define V4L2_AV1_MAX_TILE_COLS		64
 #define V4L2_AV1_MAX_TILE_ROWS		64
 #define V4L2_AV1_MAX_TILE_COUNT		512
+#define V4L2_AV1_PRIMARY_REF_NONE	7
+#define V4L2_AV1_REF_FRAME_INVALID	-1
 
 #define V4L2_AV1_SEQUENCE_FLAG_STILL_PICTURE		  0x00000001
 #define V4L2_AV1_SEQUENCE_FLAG_USE_128X128_SUPERBLOCK	  0x00000002
-- 
2.53.0

