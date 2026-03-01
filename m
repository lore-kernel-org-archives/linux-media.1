Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09CC1EDA0F;
	Sun,  1 Mar 2026 01:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772329282; cv=none; b=fwishEX10OBcmdovc+Mjik2XdfgCsJTNeLq0W/fw5SiUg3iZuxk6TZwh+nyzCgU4ulvoYx5TEw7e8Q+9dEaeHQDnewi54AUR+SJtkcrD8XzyZGekLUZByMb92NXsrRC1Han5QunIANsGI8mpu+W/tzVFAkl7CQ2P8eajcKSi/+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772329282; c=relaxed/simple;
	bh=kXMnfB+P3C2UuzFdPoYS1AVomD3U4G8VIoWVF/JpwaE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jUOUUIVEvcBpXAe8qysrGEe/4BtiqBnFEFAfNXHkt8T/353NL/S5ZNTFRz5Pr9O4wyb3OtUD1qch1zj2EPPv+FDNK9ZH6A2nveRQ/QLBGF+afWy8Mulx/RF7vuJ0BTxabaXANPZEIPcXJHF49LYSglMYWFzKbHo+utlW0G5ojtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jr7N6s8p; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jr7N6s8p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2271C19421;
	Sun,  1 Mar 2026 01:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772329282;
	bh=kXMnfB+P3C2UuzFdPoYS1AVomD3U4G8VIoWVF/JpwaE=;
	h=From:To:Cc:Subject:Date:From;
	b=Jr7N6s8pw9oeAnDEJElNZw/49fE35Zq13TK6450TecH0GB0lUjbI5S+PasP/4Y7Fq
	 aEdDq+wz3kKqLc6oNJy9B5ECPCjwcvH4P4Zvvd51xyYsKrAX3kRWV74oXAuccM/1l1
	 D6mrfyfnSw8IWagQi3Dfvtl2gOsC/v98eaEzuyoRS0oPPcfmjrhOufMK9yBgnPw7bM
	 vBYqeyl4iGQkxIwWmXbfc4eKKGEn71nzocPCieWk4031puRummTzxNtV9xlBRidk3V
	 Dl5ZULk+OwNYHzilnmjff/D2LjwQYIk/L1kTI2dt8loqVGJ10xMyu/B8C9/xpq155L
	 SyPusUe6IJzWw==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	alperyasinak1@gmail.com
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: FAILED: Patch "media: qcom: camss: vfe: Fix out-of-bounds access in vfe_isr_reg_update()" failed to apply to 6.1-stable tree
Date: Sat, 28 Feb 2026 20:41:20 -0500
Message-ID: <20260301014120.1702931-1-sashal@kernel.org>
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

The patch below does not apply to the 6.1-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From d965919af524e68cb2ab1a685872050ad2ee933d Mon Sep 17 00:00:00 2001
From: Alper Ak <alperyasinak1@gmail.com>
Date: Mon, 29 Dec 2025 10:52:17 +0300
Subject: [PATCH] media: qcom: camss: vfe: Fix out-of-bounds access in
 vfe_isr_reg_update()

vfe_isr() iterates using MSM_VFE_IMAGE_MASTERS_NUM(7) as the loop
bound and passes the index to vfe_isr_reg_update(). However,
vfe->line[] array is defined with VFE_LINE_NUM_MAX(4):

    struct vfe_line line[VFE_LINE_NUM_MAX];

When index is 4, 5, 6, the access to vfe->line[line_id] exceeds
the array bounds and resulting in out-of-bounds memory access.

Fix this by using separate loops for output lines and write masters.

Fixes: 4edc8eae715c ("media: camss: Add initial support for VFE hardware version Titan 480")
Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
Cc: stable@vger.kernel.org
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/platform/qcom/camss/camss-vfe-480.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-480.c b/drivers/media/platform/qcom/camss/camss-vfe-480.c
index 4feea590a47bc..d73f733fde045 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-480.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-480.c
@@ -202,11 +202,13 @@ static irqreturn_t vfe_isr(int irq, void *dev)
 		writel_relaxed(status, vfe->base + VFE_BUS_IRQ_CLEAR(0));
 		writel_relaxed(1, vfe->base + VFE_BUS_IRQ_CLEAR_GLOBAL);
 
-		/* Loop through all WMs IRQs */
-		for (i = 0; i < MSM_VFE_IMAGE_MASTERS_NUM; i++) {
+		for (i = 0; i < MAX_VFE_OUTPUT_LINES; i++) {
 			if (status & BUS_IRQ_MASK_0_RDI_RUP(vfe, i))
 				vfe_isr_reg_update(vfe, i);
+		}
 
+		/* Loop through all WMs IRQs */
+		for (i = 0; i < MSM_VFE_IMAGE_MASTERS_NUM; i++) {
 			if (status & BUS_IRQ_MASK_0_COMP_DONE(vfe, RDI_COMP_GROUP(i)))
 				vfe_buf_done(vfe, i);
 		}
-- 
2.51.0




