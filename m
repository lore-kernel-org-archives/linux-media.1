Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8785030171C;
	Fri, 10 Apr 2026 06:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775801744; cv=none; b=LqzAIXy3hjjoB5tJ4+ZOFgPdOD90BP8LIADC5lWZ5AnDrrU+mFlKPIAjGURkuuoHudeU8eaJp9tCYXBjE0Mp0uvW+V6GJSrNySqRF4bB+71RR0H5Kctd+MunfIdh7tMAz7CkVDDFmZQ+IbFC7V9k7VBBMK0m7mQ7kB5DhLzgbHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775801744; c=relaxed/simple;
	bh=M4ZvHRLjaEnVv6jn0UrFfImmOzcuCGWp0QomZ3x9aM0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=W4xl+OafqeOGWnXrjtFalMz3cmiLS2tk6bVKAWX1wekLL1vct7+7omPmsBaTTqPSeCDjSvfbe3mxyHJ3IOneT7/yPksJfGO9oTKySA/YEiZZPGmdMkDtm4s+TmhqiRyl6S+RTw8LF/8PSP8al7eTCl2J62fkxGCE70WfGlVfLe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q9hT1EWt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q9hT1EWt"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6A9C3C19421;
	Fri, 10 Apr 2026 06:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775801744;
	bh=M4ZvHRLjaEnVv6jn0UrFfImmOzcuCGWp0QomZ3x9aM0=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=Q9hT1EWtpmIKbgvRcxp50jRAKt8+iLJYvb1arV3CLQ+nwpROmel2pCPHSDRflGOQw
	 nzYrnx+LhBvyFZ1pSO/7h3xJxnkge7vdC1fOaNoxzz+xBJuFvRLYLBNAMkkZpEdw1i
	 YOWHiMP+nBYB8T10gxhUJJVR2Tk0LX+IqwAvLtPNY3pqK/g/zjt+AJ9x7os869rdLv
	 Pxf8L4pIDm9yf0mMA+tw/BVd/Eg6MDCi6+KH6s8Tlm9l5nA5TNxbpej6XDTCuouDUf
	 vxxdRyZAqbR1FBM87ewaEx57IdBy4faAjoDR9uWJjicgmgaIVukzeZCaGNflda1qEB
	 aZyPah8zRVP7w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DFBAF36B91;
	Fri, 10 Apr 2026 06:15:44 +0000 (UTC)
From: Rouven Czerwinski via B4 Relay <devnull+rouven.czerwinski.linaro.org@kernel.org>
Date: Fri, 10 Apr 2026 08:15:42 +0200
Subject: [PATCH] media: verisilicon: remove hantro_run declaration
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-hantro-dangling-declaration-v1-1-9a5cd401e1e8@linaro.org>
X-B4-Tracking: v=1; b=H4sIAI2V2GkC/yWM0QrCMAxFf2Xk2UDXDUV/RXyITTojo5O0ijD27
 0Z9PPdyzgpVTKXCqVvB5KVVl+LQ7zpINyqToLIzxBD3YQxH9LHZguzfrGVCljSTUXMPaRgOnHu
 mPEbwwsMk6/tXP1/+XJ/Xu6T2TcK2fQCtNtI5fwAAAA==
X-Change-ID: 20260409-hantro-dangling-declaration-a337df1daf42
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775801743; l=1100;
 i=rouven.czerwinski@linaro.org; s=20260126; h=from:subject:message-id;
 bh=S0B4Mku1guaft4/xRhZzu1ThAb3ZD3LGOoP/Tz4zCTw=;
 b=7E6nGoMWJBA5PgHEOkOKz1jYhKj6PFmoJ6mDMXpGK+YWJZp4CEAev4BXVwo+lLQaef01nbT5p
 3g3pCcNPbjyAgv6neHlgj05TGfATo/w8fx9F2WK5CfrarKI9VZgMIOu
X-Developer-Key: i=rouven.czerwinski@linaro.org; a=ed25519;
 pk=/5pmUK/XIAIIo8JA0axgfy1k8NRhRTQkxVwZYa1ga7U=
X-Endpoint-Received: by B4 Relay for rouven.czerwinski@linaro.org/20260126
 with auth_id=616
X-Original-From: Rouven Czerwinski <rouven.czerwinski@linaro.org>
Reply-To: rouven.czerwinski@linaro.org

From: Rouven Czerwinski <rouven.czerwinski@linaro.org>

The function hantro_run() is declared but never defined nor used, remove
the dangling declaration.

Signed-off-by: Rouven Czerwinski <rouven.czerwinski@linaro.org>
---
 drivers/media/platform/verisilicon/hantro_hw.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/verisilicon/hantro_hw.h b/drivers/media/platform/verisilicon/hantro_hw.h
index 5f2011529f02..13e573f1f19d 100644
--- a/drivers/media/platform/verisilicon/hantro_hw.h
+++ b/drivers/media/platform/verisilicon/hantro_hw.h
@@ -427,7 +427,6 @@ extern const struct hantro_postproc_ops rockchip_vpu981_postproc_ops;
 extern const u32 hantro_vp8_dec_mc_filter[8][6];
 
 void hantro_watchdog(struct work_struct *work);
-void hantro_run(struct hantro_ctx *ctx);
 void hantro_irq_done(struct hantro_dev *vpu,
 		     enum vb2_buffer_state result);
 void hantro_start_prepare_run(struct hantro_ctx *ctx);

---
base-commit: 591cd656a1bf5ea94a222af5ef2ee76df029c1d2
change-id: 20260409-hantro-dangling-declaration-a337df1daf42

Best regards,
--  
Rouven Czerwinski <rouven.czerwinski@linaro.org>


