Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2773A7D91;
	Mon,  6 Jul 2026 02:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783305810; cv=none; b=u4bVvr1hMFVH2B7+hrodBNkoxvpvimSjl8rRges6IIBR9UVz4WNy4a7YYfKf6EzPttlCILa9DYedWKdbt4IbrO77Ybz+1oki3TnYYkRBYfAnNB5Dvwcr8s52rNTT1p/ZZ/MbqaldkxndraolpnBt005QV0q6cIq1pfuDYaEGXlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783305810; c=relaxed/simple;
	bh=BP3Iyfs6C5UPNFRIIV/0n+AQzmZGr/qNrx/ZTsVwliI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fxqf2Rjpwai8Z8fctxBYwUDmgW8li1vF3s4fHFCpDva5Om8pFuq32mYENcylMDdxNCT/NwygaLy2QM4J3TbKgXgkZ+vNLKE0pSYLjRPAtJTHUKZMYm5kFVDM6orLQu3ObO7tZwAkw25VmunO3M2a4hbeJgMQMl10F9CuwVw8b58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TW4c/3oh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TW4c/3oh"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A2E06C2BCB8;
	Mon,  6 Jul 2026 02:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783305810;
	bh=BP3Iyfs6C5UPNFRIIV/0n+AQzmZGr/qNrx/ZTsVwliI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=TW4c/3ohfU5NQEsuq/Ly/Vhkk0eX7+9PB2+7YgYVopVq/23pRYgb3Q/q7gBYIdb8Y
	 3b/4tKHONRt4Ru0mUv+f1QFGUk5DOWUUHiZkQeW0E5UN57BKO3njSgMQhgBPCoQ7WU
	 XUoK9iOVk9uXHYWmBalGJ0fI/9yDUjQwGTG9sHqHokdHt58aHKFuwEPUnHyflYONpg
	 ribWNmYZy6KJq2YBvOFBI07ScjThZFM3LgUM+PU4nq+WixT3euLkeAOMiONe8/6Gt7
	 6/0ustOxEykTUwj3XBM/JF512sY34it630JMJFhH/3ZtqBHv638i0E1PK2CWD7ixFL
	 jya+PeX+xpyGQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83D75C44501;
	Mon,  6 Jul 2026 02:43:30 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Mon, 06 Jul 2026 02:43:28 +0000
Subject: [PATCH 2/2] arm64: dts: amlogic: a9: Add IR controller support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-a9-ir-v1-2-4f082ca8aaf1@amlogic.com>
References: <20260706-a9-ir-v1-0-4f082ca8aaf1@amlogic.com>
In-Reply-To: <20260706-a9-ir-v1-0-4f082ca8aaf1@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783305808; l=1999;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=zFrCQ/4LL7v8cXwBeBaMK1lFT/U3mMj2TYJXY49GEuE=;
 b=rFxorohK+9RKciBUQ5U2kSjVGHirLUr10V6m8Y0NbHAsF/lOl8FTZriVfx0+1BNsI7fxPqsMj
 q0YwkUEM0A6AKT3DPhAqeHIY8Ka6J7IRoQjUG/USTxdaDKIIUZP5Dlh
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
index a6b380ca47a5..044d1e8e086c 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-a9-a311y3-by401.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a9-a311y3-by401.dts
@@ -38,3 +38,9 @@ secmon_reserved: secmon@5000000 {
 &uart_b {
 	status = "okay";
 };
+
+&ir {
+	status = "okay";
+	pinctrl-0 = <&remote_pins>;
+	pinctrl-names = "default";
+};
diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi
index b0e0fadeed82..72d1cc88c9e6 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi
@@ -241,6 +241,13 @@ test_n: gpio@c0 {
 					#gpio-cells = <2>;
 					gpio-ranges = <&aobus_pinctrl 0 (AMLOGIC_GPIO_TEST_N<<8) 1>;
 				};
+
+				func-ir-in {
+					remote_pins: group-remote-pins {
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


