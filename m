Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6F03431E7;
	Thu,  9 Jul 2026 03:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783567855; cv=none; b=rWJtO55w9JiLNYGKj8rhUmadxjOtzamT04QXxy071E+8meGoCJDk9XJ8TOu3+P/meD5AMOm0T3joa63cW+aucVMUnQE9uNRxiaT5usDMMR97hal5iDPZFTa7oneatsJ96fMTZVj5cA03Brmqr8WyFpUZDdiqKKJo2DMFHZpeckY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783567855; c=relaxed/simple;
	bh=vebU/IOSL4arCI7BNVBZ9A6pu8AqsIlGnYCcT/LYqyw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gyMlTqttWTsMydyoG4a+sWO6o9ViQ/KKGwwIjsgmJez1OIRCAjASh/J3L2UNjUkRkRlhkZidZRiWj8i5qNztFMxBwUHTwAGhGo3D2pT32OeryO+qGeB8I/lrUHS9VKqO8TztzLZSBXEZnBFars/qdEOnFC+3Hfmx6CWQ6cl08OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FNih6mKO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FNih6mKO"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 24259C2BCB9;
	Thu,  9 Jul 2026 03:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783567855;
	bh=vebU/IOSL4arCI7BNVBZ9A6pu8AqsIlGnYCcT/LYqyw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=FNih6mKOnim7IzfeF9w40FWC2YVy7YFGbqdwFNaB89oTloaCZv176GZ2oMSDZ7HgR
	 iOld8xZpY7mldKeMCSPszmSylJo43ViIX3KqoBixhbzxTBoSpr0AXucqw4ICK3hndq
	 Br3AKj+pEtcpCYk3TKaBsMxOz6UP1TOfQ3ne5/PPNfXB01gVid/tnqoT7B3uRKSvxB
	 6joXb2aPi4TxzSazc5FhAODmBlZx4Kkp5bB5nxgSHb/iVPx3Xf5DFTYsV6YwZQw56R
	 LNDmNd93+OimwxedSS3rgH5vZoCAfbwbcfKwXs4YBPQyZATBxvW1VpxvQx1eE1+YSQ
	 5jECuMexr6d2Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 079F5C44506;
	Thu,  9 Jul 2026 03:30:55 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Thu, 09 Jul 2026 03:30:52 +0000
Subject: [PATCH v2 2/2] arm64: dts: amlogic: a9: Add IR controller support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-a9-ir-v2-2-42c21d7a6ffc@amlogic.com>
References: <20260709-a9-ir-v2-0-42c21d7a6ffc@amlogic.com>
In-Reply-To: <20260709-a9-ir-v2-0-42c21d7a6ffc@amlogic.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783567853; l=2027;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=33MzL3Cv7uhjfti4gs/DqpQ4WXJtnpUBkHN5kst4OOM=;
 b=8SnUZjwxz3vAI+j4FX/PVcpN9cL+yAwjXwLL0gpEZn0ZorSBb+bG2CooNlUssjFmYrLhfscJx
 AEqPwtaNpmrAD2TsJBGMMgTWEItCxlcP6aIuRyMiUIGo1OVCVERRVWe
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add the IR controller node for the Amlogic A9 SoC and describe the
corresponding remote input pin configuration.

Enable the IR controller on the Amlogic A9 A311Y3 BY401 board with the
proper pinctrl setting.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-a9-a311y3-by401.dts |  6 ++++++
 arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi             | 14 ++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a9-a311y3-by401.dts b/arch/arm64/boot/dts/amlogic/amlogic-a9-a311y3-by401.dts
index a6b380ca47a5..389c9de3dc3c 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-a9-a311y3-by401.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a9-a311y3-by401.dts
@@ -38,3 +38,9 @@ secmon_reserved: secmon@5000000 {
 &uart_b {
 	status = "okay";
 };
+
+&ir {
+	status = "okay";
+	pinctrl-0 = <&remote_input_ao_pins>;
+	pinctrl-names = "default";
+};
diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi
index b0e0fadeed82..aa89b31bfe30 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi
@@ -241,6 +241,13 @@ test_n: gpio@c0 {
 					#gpio-cells = <2>;
 					gpio-ranges = <&aobus_pinctrl 0 (AMLOGIC_GPIO_TEST_N<<8) 1>;
 				};
+
+				func-ir-in {
+						remote_input_ao_pins: group-remote-input-ao-pins {
+						pinmux = <AML_PINMUX(AMLOGIC_GPIO_D, 5, 1)>;
+						bias-disable;
+					};
+				};
 			};
 
 			gpio_ao_intc: interrupt-controller@4080 {
@@ -254,6 +261,13 @@ gpio_ao_intc: interrupt-controller@4080 {
 					394 395 396 397 398 399 400 401 402 403>;
 			};
 
+			ir: ir@14080 {
+				compatible = "amlogic,a9-ir", "amlogic,meson-s4-ir";
+				reg = <0x0 0x14080 0x0 0x30>;
+				interrupts = <GIC_SPI 413 IRQ_TYPE_EDGE_RISING>;
+				status = "disabled";
+			};
+
 			uart_b: serial@1e000 {
 				compatible = "amlogic,a9-uart",
 					     "amlogic,meson-s4-uart";

-- 
2.52.0


