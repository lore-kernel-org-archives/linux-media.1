Received: from e234-58.smtp-out.ap-northeast-1.amazonses.com (e234-58.smtp-out.ap-northeast-1.amazonses.com [23.251.234.58])
	(using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C980437845;
	Sat, 10 Oct 2026 09:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.251.234.58
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791624202; cv=none; b=dL28veGCdPPvCbUxPS0K4+Z0jL0DZabMi2SqHpS5BAd8awef5pXkGiTonrVpNzlL2ep9GL5t3DwdGpDiKj6swZ01NCfGIve8yFWUPjs2r7afLoLZmnZ63gx7a8V80ToJnntQ58fMKmlH/sxDZjGp7TxiZ6zgaNKv1gDvgCLD/dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791624202; c=relaxed/simple;
	bh=delSSJoOAFqL+sKNM3FQb+5AQMHdDkVqX01un2hNa8g=;
	h=In-Reply-To:References:From:To:Cc:Subject:Message-ID:Date:
	 MIME-Version:Content-Type; b=aRTlc+YuR+GWH7Yke8iqFXaMdA/7K9mcq1aOfjnShP5lP9tgfw5qjWRF/SCJtMuChDuh0Dvts5S1dR1GmGJ/A/+X7VXmE110QH59FARVNC37qJcnqw+ifWh+yMN2IbGd/ITP9PmR3hPeQWYJYDoobXMHm2/AXAoO08XVBUCO110=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fqwqf.xyz; spf=pass smtp.mailfrom=send.fqwqf.xyz; dkim=pass (1024-bit key) header.d=fqwqf.xyz header.i=@fqwqf.xyz header.b=1FnM/bEJ; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=ko6mhqii; arc=none smtp.client-ip=23.251.234.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fqwqf.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=send.fqwqf.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fqwqf.xyz header.i=@fqwqf.xyz header.b="1FnM/bEJ";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="ko6mhqii"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple; s=resend;
	d=fqwqf.xyz; t=1791624200;
	h=In-Reply-To:References:From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type;
	bh=delSSJoOAFqL+sKNM3FQb+5AQMHdDkVqX01un2hNa8g=;
	b=1FnM/bEJtzJVyqRS3XRX0ifd8/iAnJSVSCQzuKrLpP50oXOM39TDs61SXQ1wcArz
	l/vUg/LTuyxRf1KPt6jTpIi5gSBuuZa22zqvdFHNW5c9QshxguY8IfZjr9rxRlJiHEQ
	WiaiNJjQKGFjKnMUPGV5c/GU+b+ENb9BY5jWiS5s=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=zh4gjftm6etwoq6afzugpky45synznly; d=amazonses.com; t=1791624200;
	h=In-Reply-To:References:From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type:Feedback-ID;
	bh=delSSJoOAFqL+sKNM3FQb+5AQMHdDkVqX01un2hNa8g=;
	b=ko6mhqii+ZshFLCKilIR4Jh0hzjcGt6IKOVeQHKtmnzBlH2bybjYvNsmxS8GJvQG
	wQUklJ99Sst7AoWvdfdSjnInBT/y27E96pLni8rVfAijPaHJuzx0j99Y4AIk/dVB7n5
	IiQvJQjlirScbd+pyt45oCfDu/7DZ0MAGQrsvWok=
In-Reply-To: <20260917-x1e-csi2-phy-v18-2-6515b5255fa9@linaro.org>
References: <20260917-x1e-csi2-phy-v18-2-6515b5255fa9@linaro.org>
X-Mailer: git-send-email 2.53.0
From: fQwQf <fqwqf@fqwqf.xyz>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: vkoul@kernel.org, linux-phy@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org
Subject: [RFC PATCH] phy: qcom-mipi-csi2: round the requested settle
 interval up
Message-ID: <010601a1251fbfb9-9afc4070-5194-4714-86b1-5358791e7770-000000@ap-northeast-1.amazonses.com>
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 09:23:20 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Feedback-ID: :1.ap-northeast-1.6BGMgStFQE7EJYq5syaCRzdneEHVt/+DAaGDrqUmDs9QLO4/SllUBZ3fHvnZ8rcAX/3IjUyTRgi5JFZsWrikFHwlPJqCkqEMlxDFM4JXh+ycxH/J5Tudg5bGdz6h4331g1L1EFsGR8kuYNfGLsrxz4Nym4YXoPcZxeVkrHry4Zx21n8vEVLEjc7s+OCM8PU9:1.ap-northeast-1.DTXDV/V9GPBWozcllKo8innbNB2qs2O/3F8XZSzd9ZM=:AmazonSES
X-SES-Outgoing: 2026.10.10-23.251.234.58

The settling counter represents the requested interval in timer ticks,
with the existing six-tick hardware offset. Truncating the division
programs fewer ticks than requested when the interval is not an exact
multiple of the timer period.

At a 402 MHz link frequency and a 100 MHz =
timer, the existing calculation
requests 92458 ps but programs nine ticks =
(90000 ps). Round up to ten
ticks instead. Preserve the existing =
minimum-counter handling and
hardware offset.

Signed-off-by: Jizhou Tong =
<fqwqf@fqwqf.xyz>
---
Incremental change against media-next at ee2e9bf41d3e=
, which includes
the v18 CSI2 PHY driver. The settle calculation still =
truncates.

Original series:
https://lore.kernel.org/all/20260917-x1e-csi2-=
phy-v18-2-6515b5255fa9@linaro.org/

An extracted-function test checks 7105 =
link/timer combinations. The
previous calculation violates the computed =
lower bound; rounding up
passes those cases. This validates the arithmetic,=
 not the electrical
timing model.

I am sending this as an RFC to confirm =
that rounding up is appropriate
for the hardware counter and its existing =
six-tick offset. This change
has been used in my SL7 camera stack, but I =
have not isolated its effect
on capture reliability from the other camera =
changes.

 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git =
a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c =
b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
index 966d79c98f..ce1de1a689 100644
--- a/drivers/phy/qualcomm/phy-qcom-mip=
i-csi2-3ph-dphy.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
@@ -236,7 +236,8 @@ static u8 phy_qcom_mipi_csi2_settle_cnt_calc(s64 =
link_freq, u32 timer_clk_rate)
 	if ((t_hs_settle_ps / timer_period_ps) < =
6)
 		return 0;
=20
-	settle_cnt =3D t_hs_settle_ps / timer_period_ps - 6;
+	/* Do not round the requested settling interval down. */
+	settle_cnt =3D DIV_ROUND_UP(t_hs_settle_ps, timer_period_ps) - 6;
=20
 	return settle_cnt;
 }
--=20
2.53.0
