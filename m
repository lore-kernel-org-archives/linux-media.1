Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795749810;
	b=gHCBbbSt59F7Ht+CyV7MU3dLr83duEWkByFBk1oJkVg1zB7esn9HHD7N+B1rnzYCD7a8
	 GD7aqhbhIXw7Z411cnGzQLJ/stiwN5r+RU+s/GuS3aNkO+4grd1TFI9aw4OEHgTM2E5gM
	 0nwTPbvbgd//0w+haLiO595eVf/ZAgSzKg4+lQhvRsDuSShuYTmbc8FUSDCV/XEEFbvpH
	 +aLcX132fGFI3G9vGvh5qfRcakEDUIEwI9l+2k0220X4kytR3LGd1Pr9GMEdtR04i7IzG
	 wVDMYCvy5jgQxdLrbhhTQ+GJa6CBtdv/ntls8yyaG+huEzB4ZBR7n9lDzQK0YX9TyZQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795749810;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=RLS/jgeLOKWzdwCj4pd6cH1OV040FEIUeXWjXTT8HNQ=;
	b=vWr1u7YZt5ewV+sG37DIHqBsOQ3agAmFQ+n+Jhqw/rxqdNrM8LQniK96e8UWQYZQYjvd
	 m2DovqBxY9NmbApqQ+JeYqgpEHQfHwx8juetJP5Ga3TXkm/TuYFSguUnsh514ezRcnIAF
	 RvNx1UR8akgonpn3GT6YbbFcG2kXCBOhdoXxm/k6HBkQZuvjfwHVVfdu0+m3yQoLlkpmu
	 Ot1XYusBuLDCeW4BCxYnzdVnmiT4VCuBQsoyskEXQIYhqGpcB5jrhITMSqt0+UXO3nx1z
	 2ZtNuL+5fagMYJXM1U07xl+GMZWEklyTAgdsLFdEW/MGkUfDg3g0iyHefiU2M2drH0w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RaIZhvpo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5FD606A326;
	Fri, 27 Nov 2026 03:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RaIZhvpo
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795749810;
	b=PM4iAOxr3PBfe4Jff0F2/T8JEu8AUxAYQwBBwSppzCq75TCeQ90CRwDrAp/qLyX7gxRP
	 Noi9lrX9+9WzmUk/7WV9NWsBIUgQldLnW2qi/SV7w7QwJ3X2HMCwVi3QgLHOj/k1cXHY/
	 qTQmgWrtha3mqLtt0cVroTUGP8SwNX9nVveJ1y9N7TucaAPt98+IKFkSU7l4nV7IdPjNR
	 wUIdK88ntxCXkGrFZdjtMYfnUQojRtPYpKBrOUkvAxi259yPZsmV8u3aJ83+5hdc82cxP
	 SrRXJtR7RouyRifEJDEldenTZLv/vyu1HjKsgz0LsxdNkyswUSZEJkNeiLUaIyPEi+Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795749810;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=RLS/jgeLOKWzdwCj4pd6cH1OV040FEIUeXWjXTT8HNQ=;
	b=r2OzJwrIjHZuEgiJP4RmJ4vuv+07myvRSxHPZcIdkByVbmHAlW1ui3ifa9KDRMdlca9P
	 /FH6Dj4lgHPwTRHvGe51ddeitqazYf5n650Hq/KvdC5u2xvrq02gvQxTadQf9hhAY1EVC
	 hktoxlA4XQiiR8AYuTA1HxTMq+MilDZYGnTWX7aeXvIuFt2BfRxQutZuZFtThW6DMfp+V
	 ibe23LwixD0OK4Pj8eIsWPPbrnrKc4GrkzlXKTtF4eQovw6bCXY9+Iq7U69KHLSyXYEKC
	 AlR0+HITHGpKU+30l2cyKNMzWbFc8RJ7qtv+jDYaRGYbPlvh7ZeEi93UzyeKD3AqD2A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BFBA01F00897;
	Fri, 27 Nov 2026 03:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795749810;
	bh=RLS/jgeLOKWzdwCj4pd6cH1OV040FEIUeXWjXTT8HNQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=RaIZhvpoTxdW8irFDXO3oJ1TfONAc4Rb1Q7oUOWiH+GxoI9AFzR/1uBoplThrH1H+
	 77Ry1J0HClx+2uXqtDbqkMxRh641xH8KNtKp0jyobx9vtsuE9NY3NLDY9821NwabaQ
	 MINZZhz+3dsemjfgZVeMjalGC9fArIhvZ8COjWj/JyW/Xy0WTnksiGc36/pcS6I7Zc
	 teOmB3HBWluUwVnzBjqPhOk3QU6St9iw6G1YkQdSwnQg37Igs7fmrkjyNyqJo5635Z
	 aJREe1KJJMyi+KZh9MOdOgjvJf5gpAc69f1qDhmdlswd3CKfBMEtd0jpoKrxtC18k5
	 wGPNjBMwXAsVw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 496154B539;
	Fri, 27 Nov 2026 03:23:22 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Fri, 27 Nov 2026 03:21:55 +0000
Subject: [PATCH v4 2/2] arm64: dts: amlogic: a9: Add IR controller support
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
Message-Id: <20261127-a9-ir-v4-2-820209515755@amlogic.com>
References: <20261127-a9-ir-v4-0-820209515755@amlogic.com>
In-Reply-To: <20261127-a9-ir-v4-0-820209515755@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795749801; l=2083;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=uVqKmngtre8D85X97L1agM7jjiKqs/7e0xWwzs/gfjw=;
 b=+K2T/dxU12IDjRPhCyp4FqTfeEDcnFtAUxerdexWmDb4MIDSeHGdG2izoVSN4EDXDT5OIQRmP
 vFABSKbAIfNCQvN6hqw7jZUo02idScACEfSeXklb/qrz4tZsbMBBEpj
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com
Content-Transfer-Encoding: 7bit

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add the IR controller node for the Amlogic A9 SoC and describe the
corresponding remote input pin configuration.

Enable the IR controller on the Amlogic A9 A311Y3 BY401 board with the
proper pinctrl setting.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
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
index 91f4cf319b0d..b1766ea57c2a 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi
@@ -246,6 +246,13 @@ test_n: gpio@c0 {
 					#gpio-cells = <2>;
 					gpio-ranges = <&aobus_pinctrl 0 (AMLOGIC_GPIO_TEST_N<<8) 1>;
 				};
+
+				func-ir-in {
+					remote_input_ao_pins: group-remote-input-ao-pins {
+						pinmux = <AML_PINMUX(AMLOGIC_GPIO_D, 5, 1)>;
+						bias-disable;
+					};
+				};
 			};
 
 			gpio_ao_intc: interrupt-controller@4080 {
@@ -259,6 +266,13 @@ gpio_ao_intc: interrupt-controller@4080 {
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


