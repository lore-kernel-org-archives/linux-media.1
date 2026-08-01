Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540E73BF665;
	Sat,  1 Aug 2026 18:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785607488; cv=none; b=j+z9QFC0+u2uMi5EvvpzI/SVSwYbvGL+1sURMvr7N10xyqyAKq8Sq4RU6Z4v6xIVExSEUfg7+KnGDQ7DWDPZwFvp9+/f94v+zJO21CIGvBBGWBYrfjYaajOn5BobX5fGoP7qsGhmbUNyKFTS9MOUWuPerTDzh+c2ss2bVMs7O2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785607488; c=relaxed/simple;
	bh=BfoFX60Qx01m4/UOXTvTxd2FirhLL3jbI1C44Bh7zqY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aJM1r5Uruc4G18GJrzJpFfqF4acFBPKoqrlg6L1CULBaLDviONaiKps0OOG28/68BqR8x8xMu05wZgFxo+2u2YzOapC+O2FEvWPlBb2jWVK5q8ohOTm+0s/5Fwxlod5SH6Y+5tbnYgfAJVRtupz2L5sgL403zbRyTiu+WZM77bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=g2deCyvE; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=wNVgJIeu; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="g2deCyvE";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="wNVgJIeu"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1785607464; bh=a/f8ONbP8/WK2EZdLjqtom0
	Pm761KvYTIQqYlLvgUoo=; b=g2deCyvE9cVVY1FRPDqcbRJpQDzKPQ/3pnql7peQY7MZTec/d0
	xsNf145bqc5ij9EuBFUm5G85/csd3KPje8roIoYLJAwZajYejlATFj6OwxyPeKz+LwPHSMG5KMs
	UmhXeYkkUns/3SsVp7GRMDDzXEY+H8fSCTH+LHP6Gr5hPUIT4C7yPYEhvtS5haeChgrDEsqJNxJ
	7Ojm4AKEpkDkSu2kUbeZdrn2oRecyDFTKqwGJuyCJeqyVUhJWlY/6JlNV4HK2WKbvdr6hCxHG4r
	G4Mn1z6gdPXNf6Kb/bDGGDBSmsy/yizQynopCq6Az7e8eY411T6pGV0UlpCj46qM5CQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1785607464; bh=a/f8ONbP8/WK2EZdLjqtom0
	Pm761KvYTIQqYlLvgUoo=; b=wNVgJIeuvHl6xKoO55/36xch1fnRitOf5mT3C+gnDlSdjwesRY
	wBEdsyMhknsgVxdRJX56eXeO+fdecE/6ImBA==;
From: Danila Tikhonov <danila@mainlining.org>
Date: Sat, 01 Aug 2026 21:04:16 +0300
Subject: [PATCH RFT 3/3] arm64: dts: qcom: sm7325-nothing-spacewar: Add UW
 camera actuator
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260801-dw9800w-clean-v1-3-38978de67963@mainlining.org>
References: <20260801-dw9800w-clean-v1-0-38978de67963@mainlining.org>
In-Reply-To: <20260801-dw9800w-clean-v1-0-38978de67963@mainlining.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Eugene Lepshy <fekz115@gmail.com>, 
 Vasiliy Doylov <neko@altlinux.org>, Achill Gilgenast <achill@achill.org>, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Danila Tikhonov <danila@mainlining.org>
X-Mailer: b4 0.15.2

Add a node for the Dongwoon DW9800W actuator, used for focus of the
ultra-wide camera sensor.

Signed-off-by: Danila Tikhonov <danila@mainlining.org>
---
 arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts b/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
index fb8074580110..37047beee8db 100644
--- a/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
+++ b/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
@@ -877,7 +877,13 @@ &cci1 {
 };
 
 &cci1_i2c0 {
-	/* actuator (For Ultra Wide sensor) @ 0xc */
+	camu_dw9800w: actuator@c {
+		compatible = "dongwoon,dw9800w";
+		reg = <0x0c>;
+		vdd-supply = <&vreg_camu_vaf_1p8>;
+
+		dongwoon,vcm-prescale = <122>;
+	};
 
 	camu_s5kjn1: camera@2d {
 		compatible = "samsung,s5kjn1";
@@ -898,6 +904,8 @@ camu_s5kjn1: camera@2d {
 		orientation = <1>; /* Rear facing */
 		rotation = <90>;
 
+		lens-focus = <&camu_dw9800w>;
+
 		port {
 			camera_s5kjn1_ep: endpoint {
 				data-lanes = <1 2 3 4>;

-- 
2.55.0

