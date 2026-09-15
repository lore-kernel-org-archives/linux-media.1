Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34DDB4A99D6
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 12:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789475289; cv=none; b=GQQt5c1OW2jj8G68efNVWvuggvHKLe+ERoiyfo6Mr4WbmmF7hr5LZiF0pwj/tlFUlpKgiAn9jrkWJno4i8qXMM7P8w8ka/k4RtSIdcH2jtdEmgKSFGCavqxvW60FUThu7HtG3q21i2xyepV74+Fwgf9hFg4GV//6QlFoOyWbA/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789475289; c=relaxed/simple;
	bh=ts6YghVyA/zyzel5doEzGL1L/0VfbhJhUqB26M/V22k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PPCZFA+PkKDuoDotNpcggjcoPEAf93vXC6dk9aH8c9Of8z1IVNEKmJdRfZofXn0MQg1G6GnHRFZ8A1Ndv2kCg3bfpEB1FNiZBrPf5tcfF8b+SuFt+0oK3AJFqLZtapFK/YfJcA4P4pX6ReT9m7X2Qgs0jxtovp8Uuy5SSqdzblQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=geaQb5T6; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="geaQb5T6"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350f89so1631252f8f.3
        for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 05:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789475285; x=1790080085; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fGVlAiXSUMIP2F6e2acD3g4t6CrjKoFWSLsHsqDHE4o=;
        b=geaQb5T6dK1pxNal0kk5kbZPfJq6M9TPkFg24RvWdLVxJ/zDsO87/G5wga1nAZsn2o
         vOC3YoQEN1kKB742rnFBCIrsN0Iy2dO7gnFz4wbAha0U1MfjN7WYzNhCc4U9JWb4G/lH
         pkN+TJ4+OIcaOpLMj7sTCVFjIgw6HxqGdpbDTfIYDLQ2/9I982jpZVNlFjsPlGpQ1soy
         9s7sdUbzosILfFEUGSy0rvFhcBwx3nwUrk/ewmkrE67UU4s1Z2+ycnPBwtNHgaSRjCta
         tJjKspS1CPRWWRkwJLc+kaWyDEPIng19qhTsnSy2bpIMHLefIliNA+FquJI9Ub8qFBqk
         voTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789475285; x=1790080085;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fGVlAiXSUMIP2F6e2acD3g4t6CrjKoFWSLsHsqDHE4o=;
        b=uxWrtJuVW5Ow6QjlT8mSKDMszLDz9/gskLhef3AM4vCua2cRi4id/PPWQ15SpS1iRA
         ALvqx+y2pCDVwtS7Vj5boDuzjhFJ0j4JFWS8PKaz0MkzXvbHLZLvm0kOF8GQT948IClT
         ceMZxl6GU8CxV2HMhqJbgH5vAzX9GBWzJn3YUcA3FnTpkAOR7Bx+6a9O7+VQGmRgpW4F
         8bazQC0kzmIp3p+9B0NijEien0YyHhKF2y+/jwvQzKhDd4N66AuVC+O4zuLJziCV1Gmb
         LpwLnjUUWDUR0ndVmrz92Vt+eTaq3PpumHKWOzq6dVW1dC/xlLFqmHcaoObFh/00pFLP
         xSVQ==
X-Gm-Message-State: AFuF++kOc+jlM1eJEvXjAypmdxXQxBionMc9Q9j5TwWK/YVWQdxC1H+B
	tv0gM2vqfOaUn6I0bUxVEZwO/cmlDKyuaD2I6XS5mF4LnrH04OTYXJv/
X-Gm-Gg: AYBFou1YrvdaFSoo19AbrRK5L2HqoKAczECCuPxaGbLg/MF81NcPtBBxJpf83lBL52w
	0F6TKREu8ohHmqKi5H7Ul879BONBRVB+AV2DEFtfWmB9NO4h8ymGHbG8L69K5+hUgwXjo3wO82J
	7zC39pJYjYMNdi4v/Ru3jfqUzk5lqXnsyMlf+4rCB8B3e7kKWPsVDU6JunC6q5PO9BA0YFwdb1c
	ehBwkkVU71tuOj9xwqo+ERc9L4Lo9b8zz9mqaQ+YXOf/8x3O7Kw7cPjvBp7JcIg+h2S8lOSEkck
	yR3nAVpE0Gw3KdvgMdfIkdpjnGgjvm/t+3/mwYRZmTUe+wIV/v8jhjdfxS5Vl6PiH/ZMt45rxv1
	/owPXyGO0y83Sy9mCUTdz/z+nkx4jcNbOytT1jpsTkccRK4kVvnUHTFgu0r1srcBAwgWvmSEWXz
	/jbVXkbIiyJTeARks8cB5FNumOgXlEsAnkIHDg1WDHVxok0J0pbNr+vDtePB26j9yzbOJqTV6c1
	Wh9IRe9sHRMXIjSbq8qB97dJ9C6RheoupZl1IfIQoi0TpYwyyDEIMiOnjbM6kJDLJs=
X-Received: by 2002:a05:600c:4f87:b0:49d:93c:d903 with SMTP id 5b1f17b1804b1-49e7a66ac24mr76568825e9.20.1789475284877;
        Tue, 15 Sep 2026 05:28:04 -0700 (PDT)
Received: from [127.0.1.1] (2a01cb0007c59900d73f8285c1e647ab.ipv6.abo.wanadoo.fr. [2a01:cb00:7c5:9900:d73f:8285:c1e6:47ab])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d6bf4desm83105075e9.15.2026.09.15.05.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:28:04 -0700 (PDT)
From: Amin Gattout <amin.gattout@gmail.com>
Date: Tue, 15 Sep 2026 14:27:58 +0200
Subject: [PATCH 3/3] arm64: dts: rockchip: add vicap node to rk3576
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-vicap-rk3576-v1-3-d3f5eb58a0b5@gmail.com>
References: <20260915-vicap-rk3576-v1-0-d3f5eb58a0b5@gmail.com>
In-Reply-To: <20260915-vicap-rk3576-v1-0-d3f5eb58a0b5@gmail.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Amin Gattout <amin.gattout@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789475280; l=3278;
 i=amin.gattout@gmail.com; s=20260818; h=from:subject:message-id;
 bh=ts6YghVyA/zyzel5doEzGL1L/0VfbhJhUqB26M/V22k=;
 b=0fgklDILhS6+qpSp5w+qn6nL6tcjMbDA8a1JI/kKqs5AIOzSjV0gLt0i/KY3bs2HtZsfvqwtT
 u37tMDJ/EqVClUfq89iDRaOQ1FHFpJdy2qmzB5sbxVb9dE217e1xVcs
X-Developer-Key: i=amin.gattout@gmail.com; a=ed25519;
 pk=MSIqDPkCOkwtyP8Fns1m+KFU9SgqoDl2mpLe18vL+hQ=

Add the device tree node for the Video Capture (VICAP) unit of the
RK3576 and its IOMMU, and connect the VICAP to the two MIPI CSI-2
receivers that are usable with the MIPI D-PHYs in full mode.

Signed-off-by: Amin Gattout <amin.gattout@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 83 ++++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index cbf8b70cc15a..0c46accf5657 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -1323,6 +1323,81 @@ vdec_mmu: iommu@27b00800 {
 			rockchip,disable-mmu-reset;
 			#iommu-cells = <0>;
 		};
+		vicap: video-capture@27c10000 {
+			compatible = "rockchip,rk3576-vicap";
+			reg = <0x0 0x27c10000 0x0 0x800>;
+			interrupts = <GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cru ACLK_VICAP>, <&cru HCLK_VICAP>,
+				 <&cru DCLK_VICAP>,
+				 <&cru CLK_VICAP_I0CLK>, <&cru CLK_VICAP_I1CLK>,
+				 <&cru CLK_VICAP_I2CLK>, <&cru CLK_VICAP_I3CLK>,
+				 <&cru CLK_VICAP_I4CLK>;
+			clock-names = "aclk", "hclk", "dclk",
+				      "iclk", "iclk1", "iclk2", "iclk3", "iclk4";
+			iommus = <&vicap_mmu>;
+			power-domains = <&power RK3576_PD_VI>;
+			resets = <&cru SRST_A_VICAP>, <&cru SRST_H_VICAP>,
+				 <&cru SRST_D_VICAP>,
+				 <&cru SRST_VICAP_I0CLK>, <&cru SRST_VICAP_I1CLK>,
+				 <&cru SRST_VICAP_I2CLK>, <&cru SRST_VICAP_I3CLK>,
+				 <&cru SRST_VICAP_I4CLK>;
+			reset-names = "arst", "hrst", "drst",
+				      "irst0", "irst1", "irst2", "irst3", "irst4";
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				vicap_dvp: port@0 {
+					reg = <0x0>;
+				};
+
+				vicap_mipi0: port@1 {
+					reg = <0x1>;
+				};
+
+				vicap_mipi1: port@2 {
+					reg = <0x2>;
+
+					vicap_mipi1_input: endpoint {
+						remote-endpoint = <&csi1_output>;
+					};
+				};
+
+				vicap_mipi2: port@3 {
+					reg = <0x3>;
+				};
+
+				vicap_mipi3: port@4 {
+					reg = <0x4>;
+
+					vicap_mipi3_input: endpoint {
+						remote-endpoint = <&csi3_output>;
+					};
+				};
+
+				vicap_mipi4: port@5 {
+					reg = <0x5>;
+				};
+
+				vicap_toisp0: port@10 {
+					reg = <0x10>;
+				};
+			};
+		};
+
+		vicap_mmu: iommu@27c10800 {
+			compatible = "rockchip,rk3576-iommu", "rockchip,rk3568-iommu";
+			reg = <0x0 0x27c10800 0x0 0x100>;
+			interrupts = <GIC_SPI 319 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cru ACLK_VICAP>, <&cru HCLK_VICAP>;
+			clock-names = "aclk", "iface";
+			power-domains = <&power RK3576_PD_VI>;
+			rockchip,disable-mmu-reset;
+			#iommu-cells = <0>;
+			status = "disabled";
+		};
 
 		csi1: csi@27c90000 {
 			compatible = "rockchip,rk3576-mipi-csi2", "rockchip,rk3568-mipi-csi2";
@@ -1346,6 +1421,10 @@ csi1_in: port@0 {
 
 				csi1_out: port@1 {
 					reg = <1>;
+
+					csi1_output: endpoint {
+						remote-endpoint = <&vicap_mipi1_input>;
+					};
 				};
 			};
 		};
@@ -1372,6 +1451,10 @@ csi3_in: port@0 {
 
 				csi3_out: port@1 {
 					reg = <1>;
+
+					csi3_output: endpoint {
+						remote-endpoint = <&vicap_mipi3_input>;
+					};
 				};
 			};
 		};

-- 
2.43.0

