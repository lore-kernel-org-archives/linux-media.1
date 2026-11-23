Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795477445;
	b=K4j0vT9sH52S/1JnOOC5y7eIDRoG9drn+/Xeg5P483kAjvACVtHTCq48I7orcd0R07lo
	 SHtW9HucgWEzX2UzPx0cupJLzbKC+f5xBB05s/Ws3/+FsmwSf8DnB8qxrDSjDh3xh6Hxc
	 mFct2tGteDMx6cEa6ngJPzOifYHVHoLH9ZQxS6rowUlzVfK5NEm0E/Yj+vY/AddUg9QRS
	 yrSVi94IzYFZca7G/96rMH5JCCBH1XcC/vXFR4/dtAj5O6KduVBrg60xaDMKSIhBZlNHi
	 y3yxYj5Pn5PaitbbZW7eIs9Mcej410lazA3rhBl0bDhUEf91wMMdimuyKUSYCNy81wA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795477445;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=HHOtQOLrqffEZO2n3RPRwt4a2P8AeWEldyZiiYJkQQ4=;
	b=jvuIiosHBKgdjuMUtGrLh4lFFHOJRabwv75ZQJXZgVjFRHXCGYTpNTHzHiqjN05UqJW/
	 ZK47465+kZXsoErxs9+SO4jRNqcuePNO3LjynPY92ok7suynoBptYfcyI8dtIOHHAYL7B
	 D76XtnpyQh7W106eEIf1DlzzZV7CrZdp+EqGrISKbVP6nedfX1Jqvj3oTzFhOcVLXTvP/
	 zczZzghVjDNieDEn3pyINIDQ++jPMIRHgynau3PFqLFin/qDhn3qtVleaZ1ua/q57JyXj
	 0pTfdnsVSDh3Kjo8/MHABBhPi4W1NHgskcaVoiNYDalUYeN7dMDnfGYCywUi3jwlDqw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZmyF+mfY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7435606A333;
	Mon, 23 Nov 2026 23:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZmyF+mfY
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795477445;
	b=zDOivVx6R+MSAK+DSHxGm8UqsR46Do4fY65/ki1bO2ewb5MTCdj7wcUrxEV2OjOI5t2k
	 P1VTq0+KLSDdyAV5SghTdtAQqAA1SPh3rPG+aJREMhKN7IeYohd5+t02tkdDF37ryGRdz
	 Uy/FPpKrIw3ipq/yoD/UbisIa6ovDCou3ZhJootyDxXODLne28MdeXcRTMomNIXalhqI1
	 5gVFcIbDNeQBEIlmJKE+Cej30fGxCYFwIspDJMnQnuro2Yf4onL1TsU6qP4UXYfYAu4Lc
	 xcXFPgkD8QK9YmFbONeJmu1grBaT2QfsvHlmPxWLK0I5ckxNwdgZ8jxjD6hQw05xxUQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795477445;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=HHOtQOLrqffEZO2n3RPRwt4a2P8AeWEldyZiiYJkQQ4=;
	b=c5YxHU6K+dpLY/FXpdHPje39/WAdraY5f4Navuw37y+rOPXoZb0/AKVWwf+6Ck8iPaUL
	 hvMQhrkteAj5H6Y0h20MPQyD+Q8W7kOPr/iVsnaWHH/ubDL4QNTjaeJxylv5NvgCq4s5u
	 qHJeDe1g7F3ha0qf27uyM3XuJl83C4x50dGzJ6iWQnGgmIfk1GkkjFscREU6CmwFg7Z2d
	 r7rWAjj64OI6xNwUfy8DlvJi1c14iEM4Y4rnqZtrX6Mf6gBJYv9bvsYbBMHcvPJVNP9yZ
	 6q6/w0CK92nQWB0END4jCPEUSP3cnLRni04f3KqfJZE+HglM8qn7uW8/HRGfQDH4G/g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1F2C91F000D1;
	Mon, 23 Nov 2026 23:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795477445;
	bh=HHOtQOLrqffEZO2n3RPRwt4a2P8AeWEldyZiiYJkQQ4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ZmyF+mfYjlVkkrY14Uayvzwmdzy+Xg6s8L3Gf2uiJPH+uRQ3mhhqpKO/RkfI533Wf
	 beGHM3eOslOYRz8EE7TUGCD4zDvVqBKWzD4lFVmhzwiqeJS/dJ/5/y/1TDzRaodIpO
	 N4hwFQreyI4tIsKnJLswfoTsls2oDGV4csyZT2atHnyQlm4RIRZMqzfNAsHoPU0ALj
	 i8CkZ6YFyuty6SUyKhn5WnUTHF06jIAVrsFFajZGrIpq/WSJ/JYE1xolxa0tBMbxRe
	 bcf/3x6a2Sb92ptp6CewFSynGu5nRjsxmTUmsnxf+duok1EbMMwkQ0F6MUDmJjp04L
	 dg/4BS983UfgA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 9DF024C7DA;
	Mon, 23 Nov 2026 23:43:55 +0000 (UTC)
From: Robert Ijtsma via B4 Relay <devnull+robertijtsma.gmail.com@kernel.org>
Date: Tue, 24 Nov 2026 00:43:54 +0100
Subject: [PATCH v2 2/5] media: qcom: camss: csid-gen2: fix RDI enable bit
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
Message-Id: <20261124-camss-fixes-v2-2-231a5523cd59@gmail.com>
References: <20261124-camss-fixes-v2-0-231a5523cd59@gmail.com>
In-Reply-To: <20261124-camss-fixes-v2-0-231a5523cd59@gmail.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Robert Ijtsma <robertijtsma@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795477434; l=1833;
 i=robertijtsma@gmail.com; s=20261122; h=from:subject:message-id;
 bh=HdZ/kiLTYzmyYGEK8RNIy5DJBdKNKjogTSj8Z7rvO+E=;
 b=XkhckD3zoYg0tAT2Fys1PjQHYuZl06bniTUNdElDPtVTPPlmj1vPebSjh7BGfLM+RIAQihJ14
 ILvIxh/YcUaAlbBxGjweAGrkgWmEPFpwIsEvSqJaV/InRyW/ybpzuRH
X-Developer-Key: i=robertijtsma@gmail.com; a=ed25519;
 pk=qiDyKVqFicxFIR5sB5m+p9SWPKL2/+mMoiQnUx0C9P0=
X-Endpoint-Received: by B4 Relay for robertijtsma@gmail.com/20261122 with
 auth_id=1604
X-Original-From: Robert Ijtsma <robertijtsma@gmail.com>
Reply-To: robertijtsma@gmail.com
Content-Transfer-Encoding: 7bit

From: Robert Ijtsma <robertijtsma@gmail.com>

In __csid_configure_rdi_stream(), bitwise ORing `enable << RDI_CFG0_ENABLE`
into `val` never clears the enable bit when `enable` is zero.

Change `enable` to bool and explicitly set or clear BIT(RDI_CFG0_ENABLE)
depending on `enable`, matching camss-csid-680.c.

Fixes: 729fc005c8e2 ("media: qcom: camss: Split testgen, RDI and RX for CSID 170")
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Robert Ijtsma <robertijtsma@gmail.com>
---
 drivers/media/platform/qcom/camss/camss-csid-gen2.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
index eadcb2f..57ccfeb 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
@@ -253,7 +253,8 @@ static void __csid_configure_testgen(struct csid_device *csid, u8 enable, u8 por
 	writel_relaxed(val, csid->base + CSID_TPG_CTRL);
 }
 
-static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8 port, u8 vc)
+static void __csid_configure_rdi_stream(struct csid_device *csid, bool enable,
+					u8 port, u8 vc)
 {
 	/* Source pads matching RDI channels on hardware. Pad 1 -> RDI0, Pad 2 -> RDI1, etc. */
 	struct v4l2_mbus_framefmt *input_format = &csid->fmt[MSM_CSID_PAD_FIRST_SRC + port];
@@ -318,7 +319,10 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
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


