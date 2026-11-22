Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795354563;
	b=uyEttbTnjSsNaQgJdv34mlK00qC39fXFGB3rDetZqiuqvnoF+X9kV3ULSf9kOkcYAhTf
	 Iq9x8Ho5YLseys04bTPbUhQ3k5olk3mUQ05ehRLAn/gXR5cEbwcJ7hbfjit+PGANnnBZp
	 tWSgMtITDmHHW51ObwKLmxFlQhtVI5Gg/mp5PnC8QuasMqRjOp203MwRhhwWmoOWbJ2hl
	 nxkEAt4d3tfcnw6mRwkaflLahR/tZX++smsMoOEUm27YAwG2N4VOAUmoxZecDWxUa99Oo
	 wdRJ6px9NiWhKb9ZgGPk9Yx18NR75QUaMGq1DGSCHPKtjgYw6NLk4nFD23yoIVj+D1Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795354563;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=0tuOivg5ChLx19EHxXqO3UQCSOt1zkhAShfYbzfVufA=;
	b=vLDa5JOZQuT4c76hto2Ii7/wkoQffWWGM8nMRahGLIRZwRBwb4Fa/hgeXiNEO0Y4gjpJ
	 /IVSSuH+IZU1OC37+j+uNQdM0v6tseEHRKYo2fiszY5e1/82upoy4/5WTAsZ2AYdrtSfR
	 Bxge2YW4S/64vjoARGggY+u9PgXXRFU1eKha7YmWOfN6ng1shMRE6Y1NdZbXkudqPL+yM
	 kgHCN+huYaZA7ArOOrr9rgPZ3k9HDP2S2E/ZwKhgAFjP2Xfg+317P5ULRy50LCOJ5sONg
	 rU27VpXggbzu9rAW5g7R09ywWp+sBv3u4E24WuChLURSTrhwUZSSkfz7MBWlzw9v2+A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q8c93KjS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B06606A333;
	Sun, 22 Nov 2026 13:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q8c93KjS
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795354562;
	b=IIRBZfvDfC43ALrU7GL/rh9m0kmRkncRWhPBbwmN4g43BMJoSpITuLFze/XNE1ugSQ6D
	 stz3glmOg50d7yIp+p5HscigOC5Mscmfs8R+I+5nYi9aPOZ+f1Ye2386BH0t5iFyIoxC8
	 JNkumZH295W9yU2RZ2QyfKxSj9xATZbsdsVUg/5RwWwrDVRKKyr9FgpN8ULmtOLp5kbQs
	 WTZ1cscsdkPQ5yJPGBvHlCalAMMWzVXoKsdpCQ4jB0ewOU9j6GwvkAKdfHJ3X4YcdF0OV
	 f/+j4gPaK5Ch5Yo0yuNkRdldm6q+9p8cz+Km2i6LXujuxqMfBnnupsoOK0Rpxk1h1gA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795354562;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=0tuOivg5ChLx19EHxXqO3UQCSOt1zkhAShfYbzfVufA=;
	b=TPpYkM/3uXKFd480C3+TXOOwePRDoWNGFL99wGtltSkBXkWCdI0qerCD8T0cud/pBQ3O
	 vogUxTKnQRuHO+OVWlHQKNyQ6rJxu90KBfysENVQi75bI86C9/9wuYFTKRl59JBDokLDP
	 MAvsL5EnwtUonjGULqOUVQsHfKWI63Enu4z0nORFiSojZDYIPtpvnRJh2RQyh7jf49bg4
	 tdV25uS4THXYk8vXvtEXnIgILY637+3m1DbhmB8Dkw+UrwUpegUfKgAdvLric6uJsjo1D
	 kE2HSsKst7ksQ5SH/26Ttwx448bRTqEqDGzgoTxHndWFOhhCEU4iDmR6OrCEFbtEEmA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C3DFD1F000E6;
	Sun, 22 Nov 2026 13:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795354562;
	bh=0tuOivg5ChLx19EHxXqO3UQCSOt1zkhAShfYbzfVufA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Q8c93KjSEiseDyh1b5Hcwx0Z/VdEk6Rwx56CZmn2++D70xAD4qNCNkn/uzX6mnh9j
	 lEHCxUhewgDQXA/v3roiyHGr0W3G9PmZzHOfQvKg2CTDgpQ0sWNwfxu555WF0goyxq
	 DRh7m48NyZizInPGiKb05gMLATDUegARa8dKujSCTz55BBH87exxG7Y4kvzBXdiwuz
	 wMChHlyioBKxx3aSjp8vQVLftKNRDnSw2H0qBQIziowN21642Dhqvb2LAWXIhJHIbJ
	 gvK7Ui5FNCC7ZTxsZW3xfpnTTnQjbv0BlKsNHWDmJZepONntVXr/nrZUzWDsuQvAkX
	 8PFHLs1yXeP+Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 51C224C0A6;
	Sun, 22 Nov 2026 13:35:51 +0000 (UTC)
From: Robert Ijtsma via B4 Relay <devnull+robertijtsma.gmail.com@kernel.org>
Date: Sun, 22 Nov 2026 14:35:49 +0100
Subject: [PATCH 1/5] media: qcom: camss: vfe-17x: check status1 for RDI SOF
 interrupts
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
Message-Id: <20261122-camss-fixes-v1-1-9df4deb87ea2@gmail.com>
References: <20261122-camss-fixes-v1-0-9df4deb87ea2@gmail.com>
In-Reply-To: <20261122-camss-fixes-v1-0-9df4deb87ea2@gmail.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Robert Ijtsma <robertijtsma@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795354550; l=1123;
 i=robertijtsma@gmail.com; s=20261122; h=from:subject:message-id;
 bh=/XplKxzo3xBe+qvINmUy9iYAgDI+ymaYkcn4JNfIyLM=;
 b=THI9NN12J8zHoYM+F9D7O4jV56puBXikRwbTvHTZW5S8l23e/4DVDRNNeeVT3upVMGxykRLZL
 0IuSQQ7CGkSB0E0dooOCvWZZuZEr6x3Ln1bcUjEcagTO4WkUK4TuQPV
X-Developer-Key: i=robertijtsma@gmail.com; a=ed25519;
 pk=qiDyKVqFicxFIR5sB5m+p9SWPKL2/+mMoiQnUx0C9P0=
X-Endpoint-Received: by B4 Relay for robertijtsma@gmail.com/20261122 with
 auth_id=1604
X-Original-From: Robert Ijtsma <robertijtsma@gmail.com>
Reply-To: robertijtsma@gmail.com
Content-Transfer-Encoding: 7bit

From: Robert Ijtsma <robertijtsma@gmail.com>

In vfe_isr(), STATUS_1_RDI_SOF(i) is a bitmask for VFE_IRQ_STATUS_1
(status1), not VFE_IRQ_STATUS_0 (status0). Checking status0 instead
tests the unrelated STATUS_0_IMAGE_COMPOSITE_DONE bits (27..30).

Check status1 against STATUS_1_RDI_SOF(i) as intended.

Fixes: 7319cdf189bb ("media: camss: Add support for VFE hardware version Titan 170")
Signed-off-by: Robert Ijtsma <robertijtsma@gmail.com>
---
 drivers/media/platform/qcom/camss/camss-vfe-17x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-17x.c b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
index 62c2405..502a0d4 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-17x.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
@@ -356,7 +356,7 @@ static irqreturn_t vfe_isr(int irq, void *dev)
 			vfe->isr_ops.reg_update(vfe, i);
 
 	for (i = VFE_LINE_RDI0; i < vfe->res->line_num; i++)
-		if (status0 & STATUS_1_RDI_SOF(i))
+		if (status1 & STATUS_1_RDI_SOF(i))
 			vfe->isr_ops.sof(vfe, i);
 
 	for (i = 0; i < MSM_VFE_COMPOSITE_IRQ_NUM; i++)

-- 
2.56.0


