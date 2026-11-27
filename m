Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795811199;
	b=KL+5UdteCxRy6cpiQY0hWbHzOQfHKW8WlKb1+ckfpM6j0+Pcd6c01L4U8Pd1EDxUXB1w
	 pIv5FTGfLPRPknYnM+x555LvNEtj+BCiCRtrYYfsbGQ/BWPCHaYJ9/o1CDacb7tQ/RkU3
	 B8e6iT2ikqHSCffah55/XjMFlw/DTl9pBlp8X25Ldfj0WPcEGMgWIlhQYEgmaVTiTrdRC
	 CQza13PvP7Zu/2Y1OQBOaROpqQ7k04WChoBnLABmYXSu+CK/Fa4iNqj2eJO1AIPMsognr
	 m0IBVduhgrj0U5g8oZM3X1BPLshjjSRkSp+o85Vj5Hj8HvcihjYKrQcGA2eLwqWjosA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795811199;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ly8M7WDe9raewO79Xxx2tl2wk76vWEwlI68RasMjz+k=;
	b=ZWe44hOKiLb2d5Mx6E0NWNut0F95ITnN+EG1XSfbEzquSlZDLu2nP5yWrqHyNsVE5xet
	 BU9fIKNt1PUOfU4NJrKIIe/r8M8Oas9Ke43xj+N7VpRX6Vs2rlpMR3A3pR+gQE0pVDxL1
	 1WBam/DclS3v0PzAzwG3OKi3ktkJwUlx0h9WLGUnzZROa88MmF3citekeF9jKOSEqLgoM
	 g6IaH2ZzDXJ8+uEqYAL21h+2E8cfq9lMzP9eNpAVgd/PAKl//tN9sQSuTmL3W47PGEyHW
	 bKYLh1Ssqv4PxvG4/kQACcWnejloH1zuMP8LKHJtJNlFcflX5RV0JCpawBTjnPUWdPw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RHOlVkFf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6043606A334;
	Fri, 27 Nov 2026 20:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RHOlVkFf
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795811199;
	b=h2Q4Ls+v2WTmT9JVFS0cToCJCo1vJeU4O8BDmo95fcD8GAe2+Einr1MyYCn4Op/uHDd8
	 UHq4gGyNxN+pkQAJ1uj9FO3Q5WUj/HEAWwPkYV8oIis9IGnjTbTWfolP0aEL2hadJ67Bc
	 sdl1sVO2DzgZrKZS+AnDh5DHspB9lkFEOsRJpbcycK+BP9AC9in7xjzvUoHcCMkxzHo2Q
	 bwEzwk0jZCHz6w4d+yRIgf6YUqfR1fLr4FMcqZZZwPgw04fDa4d4k5v/V700t1tPTHfc9
	 lDqeDrtrULBg7z0TJ0hTVHZQyd/3R/XGEK9JTwK5KaH+HDLxoMdKDlV+7QUufV2W1dg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795811199;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ly8M7WDe9raewO79Xxx2tl2wk76vWEwlI68RasMjz+k=;
	b=E/r2rKV0Vj/rFTMLhUPk2+fpGnNZ+A1MD1KjVghiuL8vxa1cPqDH4XqhYJzp7eb+bvzb
	 Uiuk3q5tE/8hZabczcZilmmIJV96eZEQEW21HtHqoAlt3F4o43Hs0hTWsS2WL0UQcqDss
	 mHcQXL8BEyOgtEnBjGgMszkc00ERXg1Kwy4AYxQfTACSGE4+W/OEDdGEDtKbNcuOdLqu9
	 8W/oMkkxcuaL1HZTPb/y7X3kN4jx7T3OZyhFGalj7kT1FnFBe1qrKyvlZXQ/KgVPw3EFJ
	 k/G6sHLiKQkrGmC1fHADbLh2g5HOHzbK9QERkBDbyzRFvJvhnwo65MyfmdQNDlX1Iyg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D34081F000C1;
	Fri, 27 Nov 2026 20:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795811199;
	bh=ly8M7WDe9raewO79Xxx2tl2wk76vWEwlI68RasMjz+k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=RHOlVkFfIIMcCikRZcWYVoqMR4DOsYmp6Z4Ku52IWYIUXuHUdgjjtti6Traev3jKY
	 m2vmRKXuI0Oxa6UhM+ORDLoqqQeCAeqGE5VHyUkvwDF0CX0MP972c+IJHFHsk8+Zsp
	 uG7SlWk6ahVSe+NPy++9+aG+TazbpM7Oll2ultvYdnwbiRGw3Rp6KyJt+YqgHLKQpD
	 goJqDsAnLvYQMfapUQ7RSQ3oG6DuvXXJN3bUnIksPKVeM50w47yB3wxRavmEf5STas
	 VZObVnJq66vfdpucx5D+eZyyJ1wELTmF7LBzq80LdVJNR4CobfuQ4DibV8k06eEAlq
	 xrWLdJTojw6QQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 6444E4DDA9;
	Fri, 27 Nov 2026 20:26:24 +0000 (UTC)
From: Robert Ijtsma via B4 Relay <devnull+robertijtsma.gmail.com@kernel.org>
Date: Fri, 27 Nov 2026 21:26:25 +0100
Subject: [PATCH 2/5] media: qcom: camss: vfe: match numbered vfe_liteN
 clock names
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
Message-Id: <20261127-camss-titan17x-fixes-v1-2-541ab39e5889@gmail.com>
References: <20261127-camss-titan17x-fixes-v1-0-541ab39e5889@gmail.com>
In-Reply-To: <20261127-camss-titan17x-fixes-v1-0-541ab39e5889@gmail.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Andrey Konovalov <andrey.konovalov@linaro.org>, 
 Atanas Filipov <atanas.filipov@oss.qualcomm.com>, 
 Milen Mitkov <quic_mmitkov@quicinc.com>, 
 Gjorgji Rosikopulos <quic_grosikop@quicinc.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Robert Ijtsma <robertijtsma@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795811183; l=3348;
 i=robertijtsma@gmail.com; s=20261122; h=from:subject:message-id;
 bh=IGn2MissXaSamQTI986UKKW4wZmXGmc2R/DeWGFygtc=;
 b=JHiBPBmLyW/0sWrdZMUJc4q27EwzjTnxUfMkzGF5dLp8nZigPhOm0vLYYqCk7WGj90Rj5r/Kq
 AGs0TLVgfz8AeqqKJxz3fcyvxEmMoZJf0HtUYzjZz5y0gKv2Pzfa5d9
X-Developer-Key: i=robertijtsma@gmail.com; a=ed25519;
 pk=qiDyKVqFicxFIR5sB5m+p9SWPKL2/+mMoiQnUx0C9P0=
X-Endpoint-Received: by B4 Relay for robertijtsma@gmail.com/20261122 with
 auth_id=1604
X-Original-From: Robert Ijtsma <robertijtsma@gmail.com>
Reply-To: robertijtsma@gmail.com
Content-Transfer-Encoding: 7bit

From: Robert Ijtsma <robertijtsma@gmail.com>

On SoCs where VFE-Lite entries follow full VFE entries in vfe_res[]
(such as SC8280XP), vfe->id starts after the full VFEs while the
device clocks are named "vfe_lite0", "vfe_lite1", etc. Constructing
"vfe_lite%d" from vfe->id fails to match those clocks, causing
vfe_set_clock_rates() and vfe_check_clock_rates() to skip scaling
VFE-Lite core clocks.

Match any "vfe_lite<N>" clock name when vfe_is_lite(vfe) (without
matching auxiliary clocks like "vfe_lite_ahb") in
vfe_match_core_clock_name(), and reuse it from vfe_match_clock_names().

Fixes: 546e9ba08625 ("media: qcom: camss: clamp VFE clock rates to the highest level")
Signed-off-by: Robert Ijtsma <robertijtsma@gmail.com>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 44 ++++++++++++++-------------
 1 file changed, 23 insertions(+), 21 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 0d80e6f12274cbbb3c8f551a573fab2d482309ee..b5a8196c9145163dfa3ee1af549a4684901e2fa7 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -886,37 +886,39 @@ int vfe_pm_domain_on(struct vfe_device *vfe)
 	return 0;
 }
 
-static int vfe_match_clock_names(struct vfe_device *vfe,
-				 struct camss_clock *clock)
+static bool vfe_match_core_clock_name(struct vfe_device *vfe,
+				      struct camss_clock *clock)
 {
 	char vfe_name[7]; /* vfeXXX\0 */
-	char vfe_lite_name[12]; /* vfe_liteXXX\0 */
-	char vfe_areg_name[12]; /* vfeXXX_areg\0 */
+	unsigned int lite_idx;
 
 	snprintf(vfe_name, sizeof(vfe_name), "vfe%d", vfe->id);
-	snprintf(vfe_lite_name, sizeof(vfe_lite_name), "vfe_lite%d", vfe->id);
-	snprintf(vfe_areg_name, sizeof(vfe_areg_name), "vfe%d_areg", vfe->id);
 
-	return (!strcmp(clock->name, vfe_name) ||
-		!strcmp(clock->name, vfe_lite_name) ||
-		!strcmp(clock->name, vfe_areg_name) ||
-		!strcmp(clock->name, "vfe_lite") ||
-		!strcmp(clock->name, "camnoc_axi") ||
-		!strcmp(clock->name, "camnoc_rt_axi"));
+	if (!strcmp(clock->name, vfe_name) || !strcmp(clock->name, "vfe_lite"))
+		return true;
+
+	/*
+	 * VFE-Lite instances follow full VFEs in vfe_res[], so vfe->id does
+	 * not necessarily match the 0-based "vfe_liteN" clock suffix.
+	 */
+	if (vfe_is_lite(vfe) && !strncmp(clock->name, "vfe_lite", 8) &&
+	    !kstrtouint(clock->name + 8, 10, &lite_idx))
+		return true;
+
+	return false;
 }
 
-static bool vfe_match_core_clock_name(struct vfe_device *vfe,
-				      struct camss_clock *clock)
+static int vfe_match_clock_names(struct vfe_device *vfe,
+				 struct camss_clock *clock)
 {
-	char vfe_name[7]; /* vfeXXX\0 */
-	char vfe_lite_name[12]; /* vfe_liteXXX\0 */
+	char vfe_areg_name[12]; /* vfeXXX_areg\0 */
 
-	snprintf(vfe_name, sizeof(vfe_name), "vfe%d", vfe->id);
-	snprintf(vfe_lite_name, sizeof(vfe_lite_name), "vfe_lite%d", vfe->id);
+	snprintf(vfe_areg_name, sizeof(vfe_areg_name), "vfe%d_areg", vfe->id);
 
-	return (!strcmp(clock->name, vfe_name) ||
-		!strcmp(clock->name, vfe_lite_name) ||
-		!strcmp(clock->name, "vfe_lite"));
+	return (vfe_match_core_clock_name(vfe, clock) ||
+		!strcmp(clock->name, vfe_areg_name) ||
+		!strcmp(clock->name, "camnoc_axi") ||
+		!strcmp(clock->name, "camnoc_rt_axi"));
 }
 
 /*

-- 
2.47.3


