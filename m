Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A4B2882D6;
	Sun,  1 Mar 2026 01:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772328660; cv=none; b=Pzhs+w1gX9RM8/wiRR2eTQ/765ZNtW42v562Rblz9ZjRQmVXEDqlsSWOrVdGwh1kpMXlrIvu4soBK0UoN1hntX1VcwC/Ii7drBQxSSz8zxA4TVEI1L+UnrR3VFIsf0uQKUWklhNzE9JudJOEOvviGUVbGK0IVFeEkF3S1NmvD1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772328660; c=relaxed/simple;
	bh=mpiC9xljl7dj+601z18lVm9ShfISnfT4pIJ29B2acow=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QFRtW+aLQrgTCGA8jAv/skO+QqSczO10M5oQpACcSy9uUpOaS9jRB6xDyORlc0yXUhGV3IeLF5ff3BFMVB9lU+WYo1l1ElZki/IT8T4IoE+jWqJ3VXzVe9B4VB7j300XFN+1b9FH0gezyB/5d/tGip3m/ir0T9Z9MeTFndkcdyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nmUgo1jr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nmUgo1jr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D73DBC19424;
	Sun,  1 Mar 2026 01:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772328660;
	bh=mpiC9xljl7dj+601z18lVm9ShfISnfT4pIJ29B2acow=;
	h=From:To:Cc:Subject:Date:From;
	b=nmUgo1jrgE6ezDtGclVlzEy9aJZneCVoVOJrCgxOp2CPKovVnqq/qSHWUnIKdVPT6
	 /frf8toJP6sc6jOJkMYux61u4m9rKRUY0qqAMKB3D8M2YUJzTD3QMpMBMw+Z5MBO6l
	 ab8SjAKPhsZcIDT7au9Uh7Iv6Qz5jw1bHjdB6hJIieqicr5cj+W6By805ZW2Mw5acr
	 880nDjGLr5ljV383rWwvU3PeyNf+NseDAW1iLa5UVGSFK6a93Qb8T7acTob3IRFAW5
	 L82rjYu4cZnq1vxusMwnRgdbdWyICd056XEnIwv+Ws3x8uO7/dXWeOr6j6Kb5HAmU1
	 trsAt6EHJXkhg==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	benjamin.gaignard@collabora.com
Cc: Jianfeng Liu <liujianfeng1994@gmail.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: FAILED: Patch "media: verisilicon: AV1: Fix enable cdef computation" failed to apply to 6.6-stable tree
Date: Sat, 28 Feb 2026 20:30:58 -0500
Message-ID: <20260301013058.1689335-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit

The patch below does not apply to the 6.6-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From e0f99b810e1181374370f91cd996d761549e147f Mon Sep 17 00:00:00 2001
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Date: Tue, 9 Dec 2025 11:34:01 +0100
Subject: [PATCH] media: verisilicon: AV1: Fix enable cdef computation

If all the fields of the CDEF parameters are zero (which is the default),
then av1_enable_cdef register needs to be unset
(despite the V4L2_AV1_SEQUENCE_FLAG_ENABLE_CDEF possibly being set).

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Fixes: 727a400686a2c ("media: verisilicon: Add Rockchip AV1 decoder")
Cc: stable@vger.kernel.org
Reported-by: Jianfeng Liu <liujianfeng1994@gmail.com>
Closes: https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/4786
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
[hverkuil: dropped Link tag since it just duplicated the Closes: URL]
---
 .../platform/verisilicon/rockchip_vpu981_hw_av1_dec.c  | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
index e4703bb6be7c1..f4f7cb45b1f1b 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
@@ -1396,8 +1396,16 @@ static void rockchip_vpu981_av1_dec_set_cdef(struct hantro_ctx *ctx)
 	u16 luma_sec_strength = 0;
 	u32 chroma_pri_strength = 0;
 	u16 chroma_sec_strength = 0;
+	bool enable_cdef;
 	int i;
 
+	enable_cdef = !(cdef->bits == 0 &&
+			cdef->damping_minus_3 == 0 &&
+			cdef->y_pri_strength[0] == 0 &&
+			cdef->y_sec_strength[0] == 0 &&
+			cdef->uv_pri_strength[0] == 0 &&
+			cdef->uv_sec_strength[0] == 0);
+	hantro_reg_write(vpu, &av1_enable_cdef, enable_cdef);
 	hantro_reg_write(vpu, &av1_cdef_bits, cdef->bits);
 	hantro_reg_write(vpu, &av1_cdef_damping, cdef->damping_minus_3);
 
@@ -1953,8 +1961,6 @@ static void rockchip_vpu981_av1_dec_set_parameters(struct hantro_ctx *ctx)
 			 !!(ctrls->frame->flags & V4L2_AV1_FRAME_FLAG_SHOW_FRAME));
 	hantro_reg_write(vpu, &av1_switchable_motion_mode,
 			 !!(ctrls->frame->flags & V4L2_AV1_FRAME_FLAG_IS_MOTION_MODE_SWITCHABLE));
-	hantro_reg_write(vpu, &av1_enable_cdef,
-			 !!(ctrls->sequence->flags & V4L2_AV1_SEQUENCE_FLAG_ENABLE_CDEF));
 	hantro_reg_write(vpu, &av1_allow_masked_compound,
 			 !!(ctrls->sequence->flags
 			    & V4L2_AV1_SEQUENCE_FLAG_ENABLE_MASKED_COMPOUND));
-- 
2.51.0




