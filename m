Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616903;
	b=bJyFA/F8sgMT3y94ZRWUjJSrGQB38lDVN0jycgCXhMC6m8LlOZftTl7m6J6SsdfzWPLb
	 yp+ubCQ+6sXDmtrxUkqO2m0hA90colfjbXPgw8vHq0xqf3LTHcoiZDvFVNiftFargQaV1
	 DUPDfOcMCiKMW/lg0LHCP8rMK2WCDoFsaVNh064gh3E2zyy3zQA10d9YsoTr+q2DnxfK3
	 B1ylpcv6EXxIm24m5tHErwM+sU/QE/GZnpoC+HKH4J2zVaREgFUfTsuSbt1gIPLm3dl9I
	 aL+h/PKOYSldwyCLHj6yolAhMPXk5TH+OJUc6WC+skFhQveVOuxKrCbzvkDmGpbONrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616903;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=uSesaCAY+uIr3oSTEUZtMDZF+TzayUSuf5NedXKeA8o=;
	b=VYiUucBhtM/96J2QsXC/4/iPsWXYx1uAy3L2gHO/YCXGDqTSOoyHjK0kkWJaDx+4pucn
	 p/LMIFwyeN3RlVBZbf6kcnazyPYnrqLMMbpN9LhWn0enVUmxtSrqUD9sg81XNnulk+4IR
	 lyjwOCR4HW5oHiwUNVThlEiPeBBbCmehr/BinIXZyNbq4+xyAV3RacmKCXnRoBqP0nPmR
	 fQZMPUjo0XafJBhUbQMF3MaZ16zZ9PMMApTOpnpIUHA85T0w3nS2i0BKw2B3kpptxCIj4
	 qoVjNbi/Br/OjjAHL2YmE9mQDy0/zdYuLSV10dg2Dm2Hv+qkUoOXwWFlBHrUg2z5XLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rjf5coCS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6076606A324
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 10:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rjf5coCS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7A2D1F00A1A;
	Mon,  2 Nov 2026 10:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793616902;
	bh=uSesaCAY+uIr3oSTEUZtMDZF+TzayUSuf5NedXKeA8o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Rjf5coCSfkwrRqfAnpU69wkPv6Uh1wghXxL6qi/qqJkRqnFy+h62k83jc1wNuKPQW
	 FsFt9g/ufceyJNJDCK+1grHJS+eG2PQxGaHjVNqfg2j8hJTFog7HoPUM8TKZr5pQrZ
	 ujjafjev7fogIiAwRY9KFGyc9d2Jq+6MsIMiYbCgXiSsddi/MFeXkgBppLJYq2yS3L
	 nso1s/C9KYwG766b0oWbNVoIqCkh1bP3+4baFkLtYuOEPbdgJrIHKPyaU4pZKX0VkC
	 vhnEjTPbglrQ1kL36oTWpLoCbjFYgCLCxHznW1PEmfqA+LeFSRLBE05hjiGkS5wD/Y
	 Lnnphxk+THv6g==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCH 04/13] media: i2c: adv7511-v4l2: call cec_s_phys_addr only if EDID is present
Date: Mon,  2 Nov 2026 11:36:55 +0100
Message-ID: <2e25c7038aecc2720a5fe9afc43ca840e4609e98.1793615824.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1793615824.git.hverkuil+cisco@kernel.org>
References: <cover.1793615824.git.hverkuil+cisco@kernel.org>
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

If an EDID is present, then call cec_s_phys_addr. If not, then
call cec_phys_addr_invalidate. This helps the CEC framework differentiate
between CEC_PHYS_ADDR_INVALID due to no EDID, or due to an EDID without
a Physical Address.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/i2c/adv7511-v4l2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/adv7511-v4l2.c b/drivers/media/i2c/adv7511-v4l2.c
index 27e0e2c31dbd..1cc87049c6be 100644
--- a/drivers/media/i2c/adv7511-v4l2.c
+++ b/drivers/media/i2c/adv7511-v4l2.c
@@ -1466,7 +1466,7 @@ static void adv7511_notify_no_edid(struct v4l2_subdev *sd)
 	ed.present = false;
 	ed.segment = adv7511_rd(sd, 0xc4);
 	ed.phys_addr = CEC_PHYS_ADDR_INVALID;
-	cec_s_phys_addr(state->cec_adap, ed.phys_addr, false);
+	cec_phys_addr_invalidate(state->cec_adap);
 	v4l2_subdev_notify(sd, ADV7511_EDID_DETECT, (void *)&ed);
 	v4l2_ctrl_s_ctrl(state->have_edid0_ctrl, 0x0);
 }
-- 
2.53.0

