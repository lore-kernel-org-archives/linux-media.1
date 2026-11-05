Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.251.234.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793906350;
	b=l8gFmpjm5UbrYEtPNZD8FaNAPtutcQ6EYGDxYpHwJF5te60BwqQe6LMvbX5zRZIlHr3x
	 HTTuuFokexTJ/dcRG+D5bpGuaVqBVdw746bEr4TkNBUVkjddBC6ap3hu9LnnJEn+V99Yc
	 OC+tRCEaDPGQ7qUzpXo/FLGCOZNdo4QS1W60CZDXOlzTlcv83USUzZ05Leyc6xfN3Eu0j
	 OMggIve1dILxpC9UZuUKVGki72pqZvWqzFBOi5J1wtuPDVPWUYjodhDFZiF4F87dnbTA0
	 rYzmXdIjILTo04auSH+F2ZJETZvX+DshX+AWEU4b0aSCDOAUZbVuHQ4L8exsrubToGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793906350;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:In-Reply-To:References:
	 X-Mailer:From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:
	 MIME-Version:Content-Type:Feedback-ID:X-SES-Outgoing;
	bh=pl9YdTHjzstFUBIDQ8J3EXU+mFNbe168ZQZfU2wMuBw=;
	b=NYLJtODMcyLLVlPZ88FlInipOp+UFPoQZPOOjvKHdDMKYmP4YXvoF9DC9zknI90f3rp/
	 CVjqXarwSga64Bh+0ZT+4Px8C5MxtKNy628jfA/rHnXW2jkH8/pCpd86S8XPlzXpLOVaB
	 iZbAIv6xFdz/FNxC0s+73x/NNnBJ91T8sNclggOnO0d2AprvxSTHZP6/+xsnMSwoa0PAH
	 lCStW0NQ+uwH782JvcbJevYwivTK6lpRTPadQpF6aqjt0tYGoXkMdkoxSvW+xN4dF1C3q
	 qI3PMNE4JCzukLQCr8BHdcMfNtG0niALPyrC4tNR32RDFUXkbbKCLt4qhz2DVhLwwgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fqwqf.xyz;
	spf=pass smtp.mailfrom=send.fqwqf.xyz;
	dkim=pass header.d=fqwqf.xyz header.i=@fqwqf.xyz header.a=rsa-sha256 header.s=resend header.b=SKcdGcue;
	dkim=pass header.d=amazonses.com header.i=@amazonses.com header.a=rsa-sha256 header.s=zh4gjftm6etwoq6afzugpky45synznly header.b="Sp4/guqN";
	arc=none smtp.remote-ip=23.251.234.55
Received: from e234-55.smtp-out.ap-northeast-1.amazonses.com (e234-55.smtp-out.ap-northeast-1.amazonses.com [23.251.234.55])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA78A606D810;
	Thu,  5 Nov 2026 19:19:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA78A606D810
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fqwqf.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=send.fqwqf.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=fqwqf.xyz header.i=@fqwqf.xyz header.a=rsa-sha256 header.s=resend header.b=SKcdGcue;
	dkim=pass (1024-bit key, unprotected) header.d=amazonses.com header.i=@amazonses.com header.a=rsa-sha256 header.s=zh4gjftm6etwoq6afzugpky45synznly header.b=Sp4/guqN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple; s=resend;
	d=fqwqf.xyz; t=1793906349;
	h=In-Reply-To:References:From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type;
	bh=3a2TKKu6c488cLrk+vcl0HofWRPkemnN04CQHxiDno0=;
	b=SKcdGcuepwvngqsgSoaGpbShB52xUs5KCnngDi3HlsTevSrUzttAkSwwzxAIn7vC
	knUzOSPTtJ7ctlYUd1HjuOKTLwkbgOWS3iiGoRYUoZO2+LN7B4UXF7sHi037JbgiorU
	iSyLwgG/bcZ76lfKZln5vDReHqw9mKPuBTzKjjI4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=zh4gjftm6etwoq6afzugpky45synznly; d=amazonses.com; t=1793906349;
	h=In-Reply-To:References:From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type:Feedback-ID;
	bh=3a2TKKu6c488cLrk+vcl0HofWRPkemnN04CQHxiDno0=;
	b=Sp4/guqNOezlkOeBBq+FekxGvteZOXi3rbxsYxhhUzY+6zSedYeFdRCjV/e5WFma
	+itVfomaxqBteLNIfh0vWhnkPwpnkvWL4yAmcQU1rifO7xv50udrwBYbM8oM8dBamEN
	yxQdi9YNhWgJ6SPlnt+fjH6XRe7ski2457TXwKrc=
In-Reply-To: <791c7eed-f0c2-47c3-9595-77be72f29771@kernel.org>
References: <791c7eed-f0c2-47c3-9595-77be72f29771@kernel.org>
X-Mailer: git-send-email 2.53.0
From: Jizhou Tong <fqwqf@fqwqf.xyz>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: vkoul@kernel.org, linux-phy@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org
Subject: [RFC PATCH] phy: qcom-mipi-csi2: clamp the programmed settle count
 to six
Message-ID: <010601a1ad2694f9-a9be628a-40db-4074-b0bd-1fce00cdb65f-000000@ap-northeast-1.amazonses.com>
Content-Transfer-Encoding: quoted-printable
Date: Thu, 5 Nov 2026 19:19:09 +0000
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Feedback-ID: :1.ap-northeast-1.6BGMgStFQE7EJYq5syaCRzdneEHVt/+DAaGDrqUmDs9QLO4/SllUBZ3fHvnZ8rcAX/3IjUyTRgi5JFZsWrikFHwlPJqCkqEMlxDFM4JXh+ycxH/J5Tudg5bGdz6h4331g1L1EFsGR8kuYNfGLsrxz4Nym4YXoPcZxeVkrHry4Zx21n8vEVLEjc7s+OCM8PU9:1.ap-northeast-1.DTXDV/V9GPBWozcllKo8innbNB2qs2O/3F8XZSzd9ZM=:AmazonSES
X-SES-Outgoing: 2026.11.05-23.251.234.55

The settle helper returns zero for intervals no greater than the
six-tick hardware offset. lanes_enable() then rejects the configuration.
For slightly larger intervals it can program a count between one and
five. Bryan requested a minimum programmed count of six instead of
rejecting the zero-count case.

Keep the six-tick offset separate from that=
 minimum: first calculate the
rounded interval in ticks, then return six =
when subtracting the offset
would yield less than six. Check before =
subtracting to avoid underflow
for intervals shorter than the offset.

Link: https://lore.kernel.org/all/791c7eed-f0c2-47c3-9595-77be72f29771@kern=
el.org/
Signed-off-by: Jizhou Tong <fqwqf@fqwqf.xyz>
---
Hi Bryan,

This implements the minimum you described in the October 19 reply,
separately from the rounding patch. I have interpreted six as the minimum
programmed register value, after subtracting the existing six-tick offset.
Please confirm that this is the intended hardware policy.

For example, the rounded interval of six ticks at link_freq=3D600000000 Hz
and timer_clk_rate=3D66666666 Hz previously returned zero and failed lane
enable. It now programs six. Intervals of twelve ticks also program six;
thirteen ticks program seven. The offset itself is unchanged.

This is based on the accepted rounding RFC v3 [1]. The ARM64 W=3D1 object
build and 20,571 ASan/UBSan actual-helper cases pass. The previous helper
fails the minimum-count checks. No hardware test of the new floor is
claimed, and it is not installed in my running kernel.

[1] https://lore.kernel.org/all/010601a154d848df-37257f7a-0553-43ed-93c2-4f=
cc5b690d14-000000@ap-northeast-1.amazonses.com/

base-commit: =
d7e7bca7169873b46e857c025c10f3336c1258d8
prerequisite-patch-id: =
1f072b82125ac6272dc2a011688afc6cabb0f99c

 drivers/phy/qualcomm/phy-qcom-mi=
pi-csi2-3ph-dphy.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 =
deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy=
.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
index f07699ba1f..dd70f29669 100644
--- a/drivers/phy/qualcomm/phy-qcom-mip=
i-csi2-3ph-dphy.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
@@ -223,19 +223,20 @@ static u8 phy_qcom_mipi_csi2_settle_cnt_calc(s64 =
link_freq, u32 timer_clk_rate)
 {
 	u32 timer_period_ps;
 	u64 t_hs_settle_ps;
-	u8 settle_cnt;
+	u64 settle_ticks;
=20
 	/* Round the complete 6 * UI term up, avoiding an intermediate truncation=
. */
 	t_hs_settle_ps =3D 85000 + DIV64_U64_ROUND_UP(3 * PSEC_PER_SEC, =
link_freq);
=20
 	timer_period_ps =3D div_u64(PSEC_PER_SEC, =
timer_clk_rate);
=20
-	if (div_u64(t_hs_settle_ps, timer_period_ps) < 6)
-		return 0;
+	settle_ticks =3D DIV_U64_ROUND_UP(t_hs_settle_ps, =
timer_period_ps);
=20
-	settle_cnt =3D DIV_U64_ROUND_UP(t_hs_settle_ps, =
timer_period_ps) - 6;
+	/* The programmed counter has a minimum of six, in =
addition to its offset. */
+	if (settle_ticks < 12)
+		return 6;
=20
-	return settle_cnt;
+	return settle_ticks - 6;
 }
=20
 static void
--=20
2.53.0

