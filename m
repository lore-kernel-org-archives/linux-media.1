Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447724;
	b=p7ud8UFbcezaTAbfU1ixKLcUJAaH1xP6YYnBwHtfdm2JMukILJtAKjTkTT0v2DUpnQ4L
	 qg8wMj6HZosVVT/TKb8YQGUnne8ZL0RYhaTr6GCiBFKdrst3WMRg01c2xCTs2k6/aRP6p
	 feTm7ohZAUDtHOFu4wzOd3LqeW4BFd44E4jrFmzD/lICGavsEDn4OPkWF0n+KhrvSTaHT
	 WutYwZ5dQDF8fIZDfeqcugGRdzX6zyhUf389Nqm2KlKIy7pcgxMA0tE4aSQv8oiXMJd6U
	 yGNg3qdk/gLNH9Hrc8Q21oP18l3nbIevlDwMj1MM1RDl4gGObARtDtoxBat8IU/Fyvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447724;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5DQ4nUiYeunRFOSY9YE+opZLL40y/jePvd4SaAvI8c0=;
	b=Qq9HnQPXcZabhAOJV1oUzSidv0AxZnr7Iels3Kv9XBe+K9UfLeKqVI0r5E2EkG8TGk37
	 FqV+pbhoUquydZZFHIf9ayJXl9rbv94lk114Xf/gUS8Lg0ae3vlzEJDi7yjPKcSU4DiLX
	 M/0sEqXg+5cIUtmayqp5T0zTyExzWhIg0sOkpy8GYiejnsi328bQ2qIdKuhXOk85skJ/a
	 bBpmesz3VWj0XeEK590etGpxlRjGHmmw8bdeuppXuoD4NRK5AREwuri3BzD1HBacDOsoJ
	 nkaPOj+dBM9dwCL92fs71OizgOqANSbnW4txobCPme25jsykg49KlUqDoR33gO2Fw+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=anfmZC5V;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30AA606A33C
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 15:28:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B30AA606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=anfmZC5V
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-386ab9ab619so2517217eec.1
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 07:28:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795447723; x=1796052523; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5DQ4nUiYeunRFOSY9YE+opZLL40y/jePvd4SaAvI8c0=;
        b=anfmZC5VLhD4VBfDaPjGHgAcEImV4TaGeS1aBn4RpFdLo1qnz02JcKS1L5OyWTncNY
         3OQstA5KZmrpRSCmyy5YYdRxM5Pf+w4Vyq9gFYi/WD/kyA2f2vWC9sO1LyYDUzcfv2Ru
         TmBL0aMKk+Fj4WizI8LMbngiINE5VbZOCPJV2hXEQ3CbHVjm0g322WVpF5yyAllj72iy
         +PHw9p0nKMwUiMQflCRRLrQJbCBQRtQp1l8dPyij3m1T0zyrpRFZiKXSlMcaw02gXS6d
         YHt1tqroIZRQ8QoAZL/sU1AP/0SzPce8VGPWDQ2t0wCzUgWBd2/o2K8K6fmWY0jtom03
         zlVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447723; x=1796052523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5DQ4nUiYeunRFOSY9YE+opZLL40y/jePvd4SaAvI8c0=;
        b=viYgXwS0pSN+ZVDzFfVgEum7JuQAKhHa8k4cSOhreVxd+qpay9Hvr4QulXG25SnKi0
         8xfoh/sHWBVPf6sVstIGqpl2tx/oFSPH6mTfM8c2GDuHEuE0/tsCG48B45UuwX4IXkRi
         1o2/+RhmsbAIAkS4MwMU0wdjPNL5q4SqS1xtogXdLqHzZHBuUXSxGJgFnH/nCjS3z5R3
         gCSlHMMLO/WieDoYju2MAQWUp1Rm1UTEBmHMzpjubhytge+ecPSjB9Cc7PMN0y2ByoMF
         vidrQ7SJ6o4y1LHhQUk5QAjiqzcqgRYCKR20g5Kqbud2sZr3RZ0aVXeHpha+/sx+5XD3
         GimA==
X-Forwarded-Encrypted: i=1; AL+hErFhm3/A6R4+wnHGY090UKU/bkDUpYQAZ+Gc4hzNJZxgybRn3HN8XxMOAkz/lj2kYIDNfHtlo3fDX0LDxw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8lcPuixnpzjTy1R81G8Lw7O3lQ+K5Nd3A9ULLpM3AqP6bOT0kZ
	YR0LCK8RVSigvGYLqSq/bnA8Za+al6U7EOzmPftv8yJ96JETZ55h5FAn
X-Gm-Gg: AZFdTZcSCVvxXwEfJ91KLNa3eFhPCkr11N0+YM3VZdAlQqz962EGPsX7/NWu215e1eh
	iLZZxa3jdIxXxYGxONMxjg48ksLGlhLnifFmeXBkedjqo0UyoWI9p0xPkgutfqtNXN/9RxOmTah
	5tUPUXWkpP6zaqvlRMBw3fiuSFxWmrqXi/UGqUVRo/W5Mrg1JBwTAi8VyMU68TmwDjdL6KB2Son
	3mWzks/Dz7JTSMmUzUFad2PR+x9TRZmqOrtmj5yFTv2xRhcctXYdfol+6m6ZkG7QY8W2a6103u1
	PpWBE9BIM3OhKihzj/CwetEAobsBjKQgXwcks4TZtJuMTn8Cbya/tMFVoF81FQQ8SJ780qI6MX5
	/qu9032P6fccc8Ebq4zLb7WBCOsNlGTVrGzRVas0RqvMrMOIm8TrrM8NUp3PdalTxfoQLlTauI1
	jBWfD7kY5dVv8u8wjsaprEvx7FVxm8HlKi8ETfhSO4md6fYanCo+oBYZ80X9CGR/qCLAFalEsgp
	33mRK1RkwwlvdA+dHO95Pq3K8FJQ4srOCkkQxWDqEXwnHK/lCbPc85VtCz3Ydu9ypbpuY646R3E
	DNoT7gH64oiveueCjnEXFb+NXvtfuUhg0MwMcfJCmGcmzg==
X-Received: by 2002:a05:7301:6908:b0:382:f0d4:1e77 with SMTP id 5a478bee46e88-38571219f03mr12415282eec.36.1795447722735;
        Mon, 23 Nov 2026 07:28:42 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm46569087eec.5.2026.11.23.07.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:28:42 -0800 (PST)
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hikmah Gumelar <hikmahgumelar@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Subject: [PATCH v3 6/7] arm64: dts: qcom: msm8953: add CAMSS node and MCLK pinctrl states
Date: Mon, 23 Nov 2026 22:27:21 +0700
Message-ID: <20261123152722.168879-7-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123152722.168879-1-hikmahgumelar@gmail.com>
References: <20261123123546.152162-1-hikmahgumelar@gmail.com>
 <20261123152722.168879-1-hikmahgumelar@gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the camera subsystem (CAMSS) node and MCLK0/1/2 pin control states to the Qualcomm MSM8953 SoC Devicetree.

Signed-off-by: Hikmah Gumelar <hikmahgumelar@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8953.dtsi | 145 ++++++++++++++++++++++++++
 1 file changed, 145 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8953.dtsi b/arch/arm64/boot/dts/qcom/msm8953.dtsi
index 753167c3f861..396472ba8f28 100644
--- a/arch/arm64/boot/dts/qcom/msm8953.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8953.dtsi
@@ -753,6 +753,27 @@ i2c_6_sleep: i2c-6-sleep-state {
 				bias-disable;
 			};
 
+			camss_mclk0_default: camss-mclk0-default-state {
+				pins = "gpio26";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			camss_mclk1_default: camss-mclk1-default-state {
+				pins = "gpio27";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			camss_mclk2_default: camss-mclk2-default-state {
+				pins = "gpio28";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci0_default: cci0-default-state {
 				pins = "gpio29", "gpio30";
 				function = "cci_i2c";
@@ -1214,6 +1235,130 @@ mdss_dsi1_phy: phy@1a96400 {
 			};
 		};
 
+		camss: camss@1b00020 {
+			compatible = "qcom,msm8953-camss";
+
+			reg = <0x1b00020 0x10>,
+			      <0x1b30000 0x100>,
+			      <0x1b30400 0x100>,
+			      <0x1b30800 0x100>,
+			      <0x1b34000 0x1000>,
+			      <0x1b00030 0x4>,
+			      <0x1b35000 0x1000>,
+			      <0x1b00038 0x4>,
+			      <0x1b36000 0x1000>,
+			      <0x1b00040 0x4>,
+			      <0x1b31000 0x500>,
+			      <0x1b10000 0x1000>,
+			      <0x1b14000 0x1000>;
+			reg-names = "csi_clk_mux",
+				    "csid0",
+				    "csid1",
+				    "csid2",
+				    "csiphy0",
+				    "csiphy0_clk_mux",
+				    "csiphy1",
+				    "csiphy1_clk_mux",
+				    "csiphy2",
+				    "csiphy2_clk_mux",
+				    "ispif",
+				    "vfe0",
+				    "vfe1";
+
+			clocks = <&gcc GCC_CAMSS_AHB_CLK>,
+				 <&gcc GCC_CAMSS_CSI0_CLK>,
+				 <&gcc GCC_CAMSS_CSI0_AHB_CLK>,
+				 <&gcc GCC_CAMSS_CSI0PHY_CLK>,
+				 <&gcc GCC_CAMSS_CSI0PIX_CLK>,
+				 <&gcc GCC_CAMSS_CSI0RDI_CLK>,
+				 <&gcc GCC_CAMSS_CSI1_CLK>,
+				 <&gcc GCC_CAMSS_CSI1_AHB_CLK>,
+				 <&gcc GCC_CAMSS_CSI1PHY_CLK>,
+				 <&gcc GCC_CAMSS_CSI1PIX_CLK>,
+				 <&gcc GCC_CAMSS_CSI1RDI_CLK>,
+				 <&gcc GCC_CAMSS_CSI2_CLK>,
+				 <&gcc GCC_CAMSS_CSI2_AHB_CLK>,
+				 <&gcc GCC_CAMSS_CSI2PHY_CLK>,
+				 <&gcc GCC_CAMSS_CSI2PIX_CLK>,
+				 <&gcc GCC_CAMSS_CSI2RDI_CLK>,
+				 <&gcc GCC_CAMSS_CSI_VFE0_CLK>,
+				 <&gcc GCC_CAMSS_CSI_VFE1_CLK>,
+				 <&gcc GCC_CAMSS_CSI0PHYTIMER_CLK>,
+				 <&gcc GCC_CAMSS_CSI1PHYTIMER_CLK>,
+				 <&gcc GCC_CAMSS_CSI2PHYTIMER_CLK>,
+				 <&gcc GCC_CAMSS_ISPIF_AHB_CLK>,
+				 <&gcc GCC_CAMSS_MICRO_AHB_CLK>,
+				 <&gcc GCC_CAMSS_TOP_AHB_CLK>,
+				 <&gcc GCC_CAMSS_VFE0_CLK>,
+				 <&gcc GCC_CAMSS_VFE0_AHB_CLK>,
+				 <&gcc GCC_CAMSS_VFE0_AXI_CLK>,
+				 <&gcc GCC_CAMSS_VFE1_CLK>,
+				 <&gcc GCC_CAMSS_VFE1_AHB_CLK>,
+				 <&gcc GCC_CAMSS_VFE1_AXI_CLK>;
+			clock-names = "ahb",
+				      "csi0",
+				      "csi0_ahb",
+				      "csi0_phy",
+				      "csi0_pix",
+				      "csi0_rdi",
+				      "csi1",
+				      "csi1_ahb",
+				      "csi1_phy",
+				      "csi1_pix",
+				      "csi1_rdi",
+				      "csi2",
+				      "csi2_ahb",
+				      "csi2_phy",
+				      "csi2_pix",
+				      "csi2_rdi",
+				      "csi_vfe0",
+				      "csi_vfe1",
+				      "csiphy0_timer",
+				      "csiphy1_timer",
+				      "csiphy2_timer",
+				      "ispif_ahb",
+				      "micro_ahb",
+				      "top_ahb",
+				      "vfe0",
+				      "vfe0_ahb",
+				      "vfe0_axi",
+				      "vfe1",
+				      "vfe1_ahb",
+				      "vfe1_axi";
+
+			interrupts = <GIC_SPI 51 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 52 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 153 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 78 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 79 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 315 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 55 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 57 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 29 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "csid0",
+					  "csid1",
+					  "csid2",
+					  "csiphy0",
+					  "csiphy1",
+					  "csiphy2",
+					  "ispif",
+					  "vfe0",
+					  "vfe1";
+
+			iommus = <&apps_iommu 0x14>;
+
+			power-domains = <&gcc VFE0_GDSC>,
+					<&gcc VFE1_GDSC>;
+			power-domain-names = "vfe0", "vfe1";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		cci: cci@1b0c000 {
 			compatible = "qcom,msm8953-cci";
 			reg = <0x1b0c000 0x4000>;
-- 
2.47.3

