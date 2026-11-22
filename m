Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795354557;
	b=ahOHSKn8w4hwPDEuCy8p0+caQzThtXUAwW+e5V/2/NVCE8bhgVIL4i0I006PO2rixTwN
	 IanuxGLN73R+A4SOClt64A/v1bhglATSAdsbwH3TI6K3nFte4eVVv767a+myw/H7jNVOg
	 vz7amNWWlhz4aJcbsiE9EicS8jBvXh57eG1jLqWX2wsSz6CydFnujCM3YjP0NnwBSYFlr
	 d82R0WhidRm5KIvzhblXb5haY4WdCgqH8rVl0k/KVNxWZvL3FFDF008vVtQiRbqiQ7bbx
	 itPyW+5T0FBf8wx3+A0Bh/y6QwzJrJucOB8Vr9n7h+nS+Xza89P37HlcZcDfn2czJ4Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795354557;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=GkyIOJHzCCH//eHnejlx8mtkNc6HFI8DMMDm3rsKxVc=;
	b=UEqxzwv0tczpHXOajZDYQxoc/37xtC8g7M3ZiiC4dZIQOd7S6bwL7IZmYHmhRjHq+bb2
	 /llofc8NiwRXM+AzoGVVEa9/7tkc5+Uob0RfvYUMoe1wsUQq3dVrq1vzvTbamwrY4cMzE
	 NS7fQfb3EByRHxt8LHT4/a6cOJLKB/sEyJqF0bey4tLLucVc3Kq2L6/0FZhiHLUCAF0Ns
	 xFnWp42qd/PyuUaft1xs96Dolusm7bx6Z6QitWsdj+/nvYQIZYMgZcrwDyfvM9Ogc+Dua
	 NadKLrN17l4x4JXNd8JvP0WTIoz0v2ApnD6ikoDxiIrMJTFbBvs/+hX+o+gAPBXjcbw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D7+KQhxU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1FFE606A32A;
	Sun, 22 Nov 2026 13:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D7+KQhxU
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795354557;
	b=f02f1wpxdWUc8KbkcL6/6uBJQX8C0q1NSujkvzBKd4nFU2UxomcZR3PzA8jp97S9TD68
	 r3QxjKdJ6jCBseHfbSWmrl90eg4oDL3S8zCGBOp6obtyBah0wa00HFxKnLgQrvyLy9k3h
	 IlWCfvprQC6Y2k4q6qeji4t6Hn0xMMEwLxi0H286u5p8uqsr7THYuAliqYCuk3HJjrIAX
	 jfzwRiZ/VOofMjY80IQZ3nOOMgfQ8f4FJxK5p30E2HVc8m0Vw0jvFmgd2cBIaHl6Cy4Dc
	 J1U36GJaqRV9bvwqy9qcKXx+m6HnyD8IBEpqBUHXHf4FhDNST9ntZajSvANngNPHnVw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795354557;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=GkyIOJHzCCH//eHnejlx8mtkNc6HFI8DMMDm3rsKxVc=;
	b=kMqgJhwtNXk51w57ZOi5I7TFPAEIfz+AFADvSWVodqp2SsSe488ejqFMyXft5kZizx5A
	 MJ2T7z8c081pe+hxXNJS2nYQo8oqTetxE6WLw+6nAuDX9PB9Vj6y2G3wBrFuwTF5lCV/W
	 cA28Vlrc15Qrl+m5DG/ch5x7WzwIJKkKjZq4TX/HHhYL5oZ0EZYyszGtIBuLjhy9iwDiv
	 kFc8kDUW5kgT21BrkrRT699LTNksVocw1+xWmI12wVhJwBIoL/CjC4KaR12rLnba0ODwa
	 WmUzevWxdW0bTHBFN4efvcOan3nG39v50HWIcd6VxfUEEoTRnk0asbwRJ5AShaO2dzw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DD8661F000EB;
	Sun, 22 Nov 2026 13:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795354557;
	bh=GkyIOJHzCCH//eHnejlx8mtkNc6HFI8DMMDm3rsKxVc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=D7+KQhxUhwJupW7YJ9jxf7WV/MZk0PnQvul6WHAbD196dJq3ALSGAxfwIac/g0Mqx
	 9v6tiRl6tu3uNqNSBDjO5Nhqq22xw/XOFAePBE7dkXPpUZjZBNjpTkVMMcvVRRytnY
	 GYX2eOxYYfLiEYo/aa7GsrIAdSHI/Kc1/rlAajzp9YHb9GsIGoduA7HyOz/eyo2sDB
	 KLDXysdXX8CqKtlZKTz08oN1ZTGE7OlqOTd2Ru+j5cSN1A7KD1B1R/62myhKN1XGVz
	 JRo4Dl4Wye5eT1st9EfWv8lGvKjR24U1YeYtoFsTsJErDu3RoRUB1qQfyR+wPyJVLW
	 q5Zh+nJWRT56g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 6A9544C0A9;
	Sun, 22 Nov 2026 13:35:51 +0000 (UTC)
From: Robert Ijtsma via B4 Relay <devnull+robertijtsma.gmail.com@kernel.org>
Date: Sun, 22 Nov 2026 14:35:50 +0100
Subject: [PATCH 2/5] media: qcom: camss: csid-gen2: fix RDI enable bit
 manipulation
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
Message-Id: <20261122-camss-fixes-v1-2-9df4deb87ea2@gmail.com>
References: <20261122-camss-fixes-v1-0-9df4deb87ea2@gmail.com>
In-Reply-To: <20261122-camss-fixes-v1-0-9df4deb87ea2@gmail.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Robert Ijtsma <robertijtsma@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795354550; l=1306;
 i=robertijtsma@gmail.com; s=20261122; h=from:subject:message-id;
 bh=zM0Uu42Ddbem/8g+LtmsRQWe2AGrOjZvPkoLX5fxwxQ=;
 b=+HONEA34kOJw6KxpCU5Ac6z9m4aEkiH03Dyb7k/gaOCrt5fENaZZKDV0hXwqrK4jGpfSf6bv2
 MvcaqqgraciArJTx3CB3YO7Ac36Bj1izsNrxbJ87yLxptFY6sQtECyw
X-Developer-Key: i=robertijtsma@gmail.com; a=ed25519;
 pk=qiDyKVqFicxFIR5sB5m+p9SWPKL2/+mMoiQnUx0C9P0=
X-Endpoint-Received: by B4 Relay for robertijtsma@gmail.com/20261122 with
 auth_id=1604
X-Original-From: Robert Ijtsma <robertijtsma@gmail.com>
Reply-To: robertijtsma@gmail.com
Content-Transfer-Encoding: 7bit

From: Robert Ijtsma <robertijtsma@gmail.com>

In __csid_configure_rdi_stream(), shifting the u8 parameter `enable`
(promoted to signed int) left by RDI_CFG0_ENABLE (31) shifts into the
sign bit, and bitwise ORing never explicitly clears the enable bit when
`enable` is zero.

Use BIT(RDI_CFG0_ENABLE) to explicitly set or clear the bit depending
on `enable`, matching camss-csid-680.c.

Fixes: 729fc005c8e2 ("media: qcom: camss: Split testgen, RDI and RX for CSID 170")
Signed-off-by: Robert Ijtsma <robertijtsma@gmail.com>
---
 drivers/media/platform/qcom/camss/camss-csid-gen2.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
index eadcb2f..804c8fe 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
@@ -318,7 +318,10 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
 	writel_relaxed(val, csid->base + CSID_RDI_CTRL(port));
 
 	val = readl_relaxed(csid->base + CSID_RDI_CFG0(port));
-	val |=  enable << RDI_CFG0_ENABLE;
+	if (enable)
+		val |= BIT(RDI_CFG0_ENABLE);
+	else
+		val &= ~BIT(RDI_CFG0_ENABLE);
 	writel_relaxed(val, csid->base + CSID_RDI_CFG0(port));
 }
 

-- 
2.56.0


