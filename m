Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873FC3A6418;
	Fri, 24 Jul 2026 07:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784876709; cv=none; b=taUP2Ixlmj96/nCgLxf7RpXIxiS64i6W5WKW6fWTDMgU83KR6otflFgyPVWH8KDC2jwdDv3uw8uyyQ0i7lbm0DakZk5y3g0uM2bFvyOGlviqjTaJ7jTCbWUg1np8vGTrf2Wv3l8wN3zEcVxsRIsiw37bQluXjif9JyikJB4ZYrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784876709; c=relaxed/simple;
	bh=Dvkr+uEhnVeHQbkd2qjDl5C7zix0sF4Yy1/nuWyIBSk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uO+n6j8dpEvKUVXA1fFrU8cw97g9o/45qwQOv6p5G29EesPuHj2UZpOqigfTkQyhL3j/9XLP1+qDnKA7071/3AklbtqIyZ7AJNaQLcc32/wAIaePSptu5vG7C3qgeOGyZ45xy8eX2KM5Tlx7JrKQ7SgrP44jmQJPE+iPMvbZVgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qupc5YkQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qupc5YkQ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 313F3C2BCFC;
	Fri, 24 Jul 2026 07:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784876709;
	bh=Dvkr+uEhnVeHQbkd2qjDl5C7zix0sF4Yy1/nuWyIBSk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Qupc5YkQL+yRX5jYJxZTrEQNnxeBsXElXcAKC6L6etBdlxxp8h2b9hTx5pbWxIS8w
	 q6Wrg1A234rO7JQo4NvAeTJZdnU0EJj5Lpjq1aFgTUqWuGh23YLIhbP9O/VsqZF6Sj
	 ct66VaLhVvZDqBMYzIU0J1PmQ6/f9a/0bCbTzuQQ03ol4qMfVpaEJa8yAJRGv0g6y/
	 NjnwsTFmRpJnMlDq8ZY7gkQY9PTtx80WC0PE0hiJGwA0FUabR7GkUS/9TVmQX9jId5
	 XLNFHX6JhF7IDsCUvV1QQTV5lYoH6OINCnDYqiINOFZDUzM9pMdWi4pQjy+Q+eYtf/
	 U8XCspOqNug0w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C5A3C53209;
	Fri, 24 Jul 2026 07:05:09 +0000 (UTC)
From: Zhentao Guo via B4 Relay <devnull+zhentao.guo.amlogic.com@kernel.org>
Date: Fri, 24 Jul 2026 15:04:55 +0800
Subject: [PATCH v6 5/6] arm64: dts: amlogic: Add video decoder driver
 support for S4 SOCs
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-b4-s4-vdec-upstream-v6-5-6072a7ee7428@amlogic.com>
References: <20260724-b4-s4-vdec-upstream-v6-0-6072a7ee7428@amlogic.com>
In-Reply-To: <20260724-b4-s4-vdec-upstream-v6-0-6072a7ee7428@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, Zhentao Guo <zhentao.guo@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784876706; l=1761;
 i=zhentao.guo@amlogic.com; s=20251024; h=from:subject:message-id;
 bh=heUARX7B2nDJwzsPVfHcLo1flwPNThmBb50f2yWVTd0=;
 b=UewVk8O/ZOSo/t1J3MgXi2igEsiSygKLsJsMRYAIcVO8FJFBxb2xvwv5D+cSCkNCSuTDJAGnn
 xoUHo5mTjPtCtHbtscNi2djvc6gTrFkA5Fi0geI7M0lJJljRDY+Vnxw
X-Developer-Key: i=zhentao.guo@amlogic.com; a=ed25519;
 pk=5yfDKrjreXwcAoEUsdtWafy6YN500upXp/CgtnXjLVU=
X-Endpoint-Received: by B4 Relay for zhentao.guo@amlogic.com/20251024 with
 auth_id=555
X-Original-From: Zhentao Guo <zhentao.guo@amlogic.com>
Reply-To: zhentao.guo@amlogic.com

From: Zhentao Guo <zhentao.guo@amlogic.com>

Add vdec node to enable Amlogic V4L2 stateless video decoder
support.

Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 34 +++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index 2a6fbd530836..04fa52b357a2 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -96,6 +96,11 @@ saradc: adc@fe026000 {
 		status = "disabled";
 	};
 
+	optee {
+		compatible = "linaro,optee-tz";
+		method = "smc";
+	};
+
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <2>;
@@ -907,5 +912,34 @@ emmc: mmc@fe08c000 {
 			assigned-clocks = <&clkc_periphs CLKID_SD_EMMC_C>;
 			assigned-clock-rates = <24000000>;
 		};
+
+		canvas: video-lut@fe036048 {
+			compatible = "amlogic,canvas";
+			reg = <0x0 0xfe036048 0x0 0x14>;
+		};
+
+		video-codec@fe320000 {
+			compatible = "amlogic,s4-vdec";
+			reg = <0x0 0xfe320000 0x0 0x10000>,
+			      <0x0 0xfe036000 0x0 0x20>;
+			amlogic,canvas = <&canvas>;
+			reg-names = "dos",
+				    "dmc";
+			interrupts = <GIC_SPI 91 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 92 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 93 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&clkc_periphs CLKID_DOS>,
+				 <&clkc_periphs CLKID_VDEC_SEL>,
+				 <&clkc_periphs CLKID_HEVCF_SEL>;
+			clock-names = "dos",
+				      "vdec",
+				      "hevcf";
+			power-domains = <&pwrc PWRC_S4_DOS_VDEC_ID>,
+					<&pwrc PWRC_S4_DOS_HEVC_ID>;
+			power-domain-names = "vdec",
+					     "hvdec";
+			resets = <&reset RESET_DOS>;
+			secure-monitor = <&sm>;
+		};
 	};
 };

-- 
2.42.0


