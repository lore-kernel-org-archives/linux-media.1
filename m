Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795242623;
	b=mh6IWB79T5Ep8qoWoVadl6i7ik52rbmioy3G9DWY4z9keUWNJ3zehDAGc9gyykdN9o8b
	 zxlHtRmdXmsTA87F4qkEvV2NLWuhFoNNraqvQ+kpLKRDqUnQV43ZSc+o9k9F4mnHJVxbx
	 s7dgq5z3tOCqF+vw8WA4cSMFznywADf5va910bGr+ONyoLxnSlqkMzqS3w+Y1Po8BK4qF
	 mlz1n9JEmUymhnpmS5m40FkcUWGJ9+Iu+cnSdCUC7GbKktrqkJVfPinYJ4JnU42f+rQBm
	 rehufE4kff+v3FP6HSBkGFHWfLptU+ZdPwtsNG40WCKrlCoBVF+UlgW0OfMX3uEJYtA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795242623;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=E3eSco/DGJQbQNBc6DVRc0KKsxNtSjGfkJNnHbsunqk=;
	b=mxve05Derb4VuJODvhGCh9qyStOwuqmVBb/zEJZ5q8mZZwYGy4RljFIgcb7YlOV0dGZy
	 mKUBNJGc3ubbysIofk8TXzuRmv7irOPm4BG3deRcc0uAM5PWlwxuKwoRQgbxIDSk6zwxt
	 GOeTibzOxKylSkiLI1Yy0GBwN9pMMekHAMpL4coN6SIuVeaX7/splCLpN0K18I4/+0075
	 hPGxcT6Oa3RevWrbUQL8YAno0nNsPxt0NTYq26+1RLi5kbftvyFxdJ1RnrUCNzL5ZJQoe
	 BpRVUCCewiAnn+lRjuzCw5LmznJSnsSb88/tqXvZjRAFlYAo53UkA0y343vAFYov8GA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dlGenvA9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45630606A682;
	Sat, 21 Nov 2026 06:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dlGenvA9
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795242623;
	b=q4SH99T3J/9nau3VAKqYyLSA6bYUFtyiKx7Gbls+ueKXEl2131eM3qwJxCxyN9SEfwIj
	 0qttqqeDGnOslFcWc8dH90IXqrKbNH802g3cu8aW6iYwt5l46nM4Xk725NxWEAyFcgC1N
	 YQGtmEwWlrK0E2IbjlRZWDAYjYR5ryaSHh3hmGBbL6uB4olr20l2yVTB4Scu6rOc6Jtsp
	 S7H7uk7AWWyQgz25HJ/QFQ3CHPt0ZDsmOZU+suo7gBrqIo8iJYfKFdysDKyYO7z/EoJyI
	 aKd8uH0+uIpcsSsUhjsv/1b/Y6kPjnz2l2KBKMcEfHoImqiDofuCQ22wEZ499WQlMWA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795242623;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=E3eSco/DGJQbQNBc6DVRc0KKsxNtSjGfkJNnHbsunqk=;
	b=QJ7C8mLZmGFruCyXMJCm6WDQyYtF8K49lHH6sYTKrtGESqTTqEThJsaZrpI/ZfyoCnAa
	 j6fOX2dPAAC/rtSd6oRSN6iEb3ji4swYclBPrbPhB2932rpDshyb8QZkTpu7MEhId12Xj
	 ULVs6kOwVVZsaItJqk4oVFmJSYLUa6Q8xQogelZbZI9dKo7qivV2iGbnHwmhWFT+ov1Qe
	 oyLKypWDWr6vWVIEehPjBlMd+lxYpaPIfXjtRIGxaKYtHoi8QkLiiS1iD99mppvVinWRa
	 mXtDfV9KLNsUGvMUmlP08EUtiwhGZ4nBMu8NZ3Ntv9kVex4LG0xS1tCkZ+G98/lEv+Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 086331F000CA;
	Sat, 21 Nov 2026 06:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795242622;
	bh=E3eSco/DGJQbQNBc6DVRc0KKsxNtSjGfkJNnHbsunqk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=dlGenvA9G7Dm9iTYhSxMsCuqHe3A7wKC7we1IMimaCHjDPsBwZ57/ohr9BX5FKodI
	 rHBnpAWMeaf0cSMEhSAd7d2Bd6IFwv5q/ZbaiN7GGMQ6A6VaKL4cRNSMYNIo6wO28Y
	 UwxZYFGLyI5i0b613nJ4pyF7Cqj5NA/oSlieiO07WibjAlVGpykpz56zK1HixuLkJU
	 BQPcpEXRjT5IjN+JWm2VhM7mYfHrZNVjAVlHPyD5WE2NM1tUDP8TCbaoBjNkHSkrEs
	 0m1kI07YceIay0/ifl4oHOqzcAHHVwAXq5Qo148gggPT59NNNbnMGy8XPfk93GTPj7
	 7k6qMo6PcTJSA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 877634BB28;
	Sat, 21 Nov 2026 06:30:21 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Sat, 21 Nov 2026 06:30:22 +0000
Subject: [PATCH v3 2/2] media: verisilicon: Handle VDPU2 decoder interrupts
 like the G2
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261121-vdpu2-errreset-v3-2-073b5e5bdd64@gmail.com>
References: <20261121-vdpu2-errreset-v3-0-073b5e5bdd64@gmail.com>
In-Reply-To: <20261121-vdpu2-errreset-v3-0-073b5e5bdd64@gmail.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Jonas Karlman <jonas@kwiboo.se>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795242621; l=2022;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=XODhh5Dd9rMUpP33KPbOb4EVOiXmSAe1+k9Dq3skJb8=;
 b=CdFflbvT8l/U4XCM+0ECupgCV1WJ5De35FbZIRZqABSUKoTdZUGX23wEnKFr6VfaBR6VJ41Nf
 9sZr2w6mg1eB1J7oz4EtCDfbpbnK6a30Pt44KW+XC02GXSwx59Rhcr3
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

Do as the G2 interrupt handler: ignore interrupts the decoder did not
raise, report the error type and don't finish the job while the decoder
is still enabled. The decoder disables itself on errors, except when
its input buffer runs empty; a later interrupt or the driver's
watchdog then ends the job.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 .../media/platform/verisilicon/rockchip_vpu_hw.c   | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
index 4bc1bdb41c70..3bc4400d5778 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
@@ -388,13 +388,31 @@ static irqreturn_t rockchip_vpu2_vdpu_irq(int irq, void *dev_id)
 {
 	struct hantro_dev *vpu = dev_id;
 	enum vb2_buffer_state state;
-	u32 status;
+	u32 status, en;
 
 	status = vdpu_read(vpu, VDPU_REG_INTERRUPT);
+	if (!(status & VDPU_REG_INTERRUPT_DEC_IRQ))
+		return IRQ_NONE;
+
+	/* Read DEC_E with the status, before the clear, as G2 does. */
+	en = vdpu_read(vpu, VDPU_REG_EN_FLAGS);
+	vdpu_write(vpu, 0, VDPU_REG_INTERRUPT);
+
 	state = (status & VDPU_REG_INTERRUPT_DEC_RDY_INT) ?
 		VB2_BUF_STATE_DONE : VB2_BUF_STATE_ERROR;
+	if (state == VB2_BUF_STATE_ERROR) {
+		if (status & VDPU_REG_INTERRUPT_DEC_BUS_INT)
+			dev_warn_ratelimited(vpu->dev, "bus error detected.\n");
+		if (status & VDPU_REG_INTERRUPT_DEC_ERROR_INT)
+			dev_warn_ratelimited(vpu->dev, "decode error detected.\n");
+		if (status & VDPU_REG_INTERRUPT_DEC_TIMEOUT)
+			dev_warn_ratelimited(vpu->dev, "frame decode timed out.\n");
+
+		/* Still enabled: a later interrupt or the watchdog ends the job. */
+		if (en & VDPU_REG_INTERRUPT_DEC_E)
+			return IRQ_HANDLED;
+	}
 
-	vdpu_write(vpu, 0, VDPU_REG_INTERRUPT);
 	vdpu_write(vpu, 0, VDPU_REG_AXI_CTRL);
 
 	hantro_irq_done(vpu, state);

-- 
2.55.0


