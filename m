Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FCF9259C80;
	Sun,  1 Mar 2026 01:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772327990; cv=none; b=MiphWK4qMpf9PMCSWqNqA6+nWrZFFebvtHK7juKOOVQanxYsO90+cQWMdzixujJSOul+CeJgWzJ89YdQz0/a2bQMGIerjsTt/MaFY5470ibP/tomVrFFOAofmUEflWxrgPb06gBxL+hwrWj/xpHbgzgvuOK3LdE9rKHc79EtLh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772327990; c=relaxed/simple;
	bh=8HWlHUoKFmh3jh8W3WSGJzHOoxrEt60poeRlUEbtgv8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Zd2rb7aNY9yMziZyNs1KtCY3Xin5dwXQu83nzggH19+ZA/LSxwX2u0tn7Ee5o0nbLx0ezqqul969EhxZ4vi8qnjPZIQp5ZKEVfpk70I4CDlGNiTAEmiSvs4GEvgo8PhqSYu6QoOustjHmP+rmejB8NhBqSiqWa4R5xFMhmQMKuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fCFfuGnv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fCFfuGnv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 933D9C19424;
	Sun,  1 Mar 2026 01:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772327990;
	bh=8HWlHUoKFmh3jh8W3WSGJzHOoxrEt60poeRlUEbtgv8=;
	h=From:To:Cc:Subject:Date:From;
	b=fCFfuGnv80H9u02Qyapooka2u7VN+CzhNkMoK0dlh7ZTOXZclsRrnYYxZoQtNmZWv
	 635wBqFr/Jb4Jtg2BGudedbeCpmaxRRQDxRxVwXBBQPe4PqYzJf51ukq2tLUU9LtHr
	 sNWINNXs59Pbs6BMkaANZrrY81Qdu27Cr+A/9eOMYGNY8rYVeUPAueQTpyXSl/7YiZ
	 C/c1ZA2QzrjCjtWeyLeuS6KUtFr2VMJuIpHDbsXj0tXrwSJ9ZVhEGPZgI13uk3c+0t
	 VC55zcVM3Dx9fGqTABgpP2LyfhKRi/kwYDTGq9P14t04up0Wcpvt4UKwaAzHHiImcy
	 MGWQiOMDWJZ6Q==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	benjamin.gaignard@collabora.com
Cc: Jianfeng Liu <liujianfeng1994@gmail.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: FAILED: Patch "media: verisilicon: AV1: Set IDR flag for intra_only frame type" failed to apply to 6.12-stable tree
Date: Sat, 28 Feb 2026 20:19:48 -0500
Message-ID: <20260301011948.1675062-1-sashal@kernel.org>
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

The patch below does not apply to the 6.12-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 1c1b79f40ee4444fa1ac96079751608b724c6b2b Mon Sep 17 00:00:00 2001
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Date: Thu, 8 Jan 2026 14:29:46 +0100
Subject: [PATCH] media: verisilicon: AV1: Set IDR flag for intra_only frame
 type

Intra_only frame could be considered as a key frame so Instantaneous
Decoding Refresh (IDR) flag must be set of the both case and not only
for key frames.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Reported-by: Jianfeng Liu <liujianfeng1994@gmail.com>
Fixes: 727a400686a2c ("media: verisilicon: Add Rockchip AV1 decoder")
Cc: stable@vger.kernel.org
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
index f52b8208e6b93..500e94bcb0293 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
@@ -2018,7 +2018,7 @@ static void rockchip_vpu981_av1_dec_set_parameters(struct hantro_ctx *ctx)
 			 !!(ctrls->frame->quantization.flags
 			    & V4L2_AV1_QUANTIZATION_FLAG_DELTA_Q_PRESENT));
 
-	hantro_reg_write(vpu, &av1_idr_pic_e, !ctrls->frame->frame_type);
+	hantro_reg_write(vpu, &av1_idr_pic_e, IS_INTRA(ctrls->frame->frame_type));
 	hantro_reg_write(vpu, &av1_quant_base_qindex, ctrls->frame->quantization.base_q_idx);
 	hantro_reg_write(vpu, &av1_bit_depth_y_minus8, ctx->bit_depth - 8);
 	hantro_reg_write(vpu, &av1_bit_depth_c_minus8, ctx->bit_depth - 8);
-- 
2.51.0




