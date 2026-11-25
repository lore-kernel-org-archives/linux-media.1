Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795606001;
	b=nVl4BX9HyllmV43/W/RkiJMBZNs8L+yh0h085iqmuESHccU0ebXpCzYSPCaQYbuNj5hn
	 +GzVO/8yY0WUHt61WlRhhCMHDV7o8bRwmhHUAXrgc83lh+nPaX8xJ6Qrxu3VmjmbVRa0h
	 1QX4GY8b3gUGppjrH2LEaoeD2gbTUoHroaK2QAzzS/wMpvgXFB2u/fSz2a1fb8LXhJ4XF
	 sgIkceN0hcG5InByuoeli2jaMg2kGOupcY/5QJEIaUSBkRyScwMcn7tgQ0EaX5d7261Ow
	 KtKqQg6rhqyQtn4GTOKwyZO426PIjPv6wjuWGZgFUdRfWTN3YP+894ZawirPMy8ZgeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795606001;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mQWld2rf0aUSCLxpuKReQRUF3uIzkNsM8ey4gCHu/88=;
	b=rnOATAL2L1LY1UpLmfXie+JohFiCAGq0tHdW+6Y5ipSqmoS3QkH4m7fGcjmJ86n4Ge45
	 56d3cwm77F4D0o8ANo2WLVlGuyLpYDEHnqAHjgHPbYe4M4iD6+8yJ3VnyMTzCBEFRzKV0
	 0gLAk+frDCp6lJRBye/x6y4LvRnnCJ4s2BcGED+oXQIkz9UOYRpOKHLpWQNcALk2oz/5j
	 Lur3CIPzRtA57X9A3HCvtuWetDWjl4R+fRq3GAmk2nkveCFhHXfB0DX1LHjLgisVdPabo
	 08gcXeRVoZmAPgY8zWmj3+jCZgRtIFtfLi0V91JtV+hw4G7PMJEpwAH4B83r1AP/NFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TlDfi6Fz;
	arc=none smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A10D60A383F
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 11:26:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A10D60A383F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TlDfi6Fz
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b4bd3d98bfso7167757a12.1
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 03:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795605999; x=1796210799; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mQWld2rf0aUSCLxpuKReQRUF3uIzkNsM8ey4gCHu/88=;
        b=TlDfi6FzLVQEOp+ixHcB5vNlbsGUZwa4mcaeOkjd0jh97u/dAQPOd+fuIXap9g6xTE
         AwLzQC2AQVty73GXcw/9igtE6XHnnlMq9jJ4lgp+wwa99Tl5lQn/dXuLJ84uHaT/PFST
         Egd2SPXKhqhF7vOSWOPQ+XEVOyF7I9XoxILp+628qqpwvs1XkoL/LGvq+wQbbkVdtOVt
         38te5+rV7/JDiIkqpzLnigVcVLJsMttZn858RdW7lL2aBk9ZtNMwRkW3WNUdKbwaF1Lm
         +tOC+jz/q1dgHHIfaPAr4ZUYHn7ha59kQ3smCkNx7N0u1KROSCXcFhJ6IJsGV3QxTAlj
         CXog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795605999; x=1796210799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mQWld2rf0aUSCLxpuKReQRUF3uIzkNsM8ey4gCHu/88=;
        b=BBZi1gsIXHUU/sNNK1fEhr0YtNqEP9DRUGeojEeaby09xkC7h0j9UnK177PBAb3xBx
         48ZAhGOupNB5YCpzlNeqQ1BevvQRBR1QdFEi02pR8Obr0GkgxAg5kvUtDZE/X1LF3mOH
         XPLCkhfu2310QgIXLSG9+6fkjJmuN/6MHwrkAMMHCABuVc3u77F8bu2F2VWwGRPlyzcF
         PlIqicEoIxX0HpHrT9iLCa1wUPjrwvQHgP4W/oyslj9NkgGC36/EvWtQF6+f/n06ByTt
         Wa9dzn8gIRm16AUV/7EvxCTwn7g2563xr5vQudabK5AqAoXV00pt91Su/FIAjr9qo32I
         SSPQ==
X-Gm-Message-State: APuU4Z9eXDYOR8TfpqniKkk0jKMkk4n1AmyecQpmJUmDXTdUpEblRniW
	TSrL4jc/QebeQi7bPz4q7AhPo4Te+sx1VV8Gj4WA5cnI7cwVNu6DkQ8O
X-Gm-Gg: AZFdTZdN7sCjEskx+asaDkEndIqZm4aDo+SUH0WO8Xea9JtT+qbYZGDcaAvmNl05zT+
	N5aB9VZxf8zSsT+/8mACMifrS8S0RLjFK/Asm0xP6y5WWaUXCCsNuPzk9f5gI/zlzJJjtzXcLHz
	0i8ioegLQoCZhAwhJgzs4MFDieE+ys8PCMxDgZ14jdeDYSZzJxm13Lxc7Mjndev3ETamocSONvH
	gTNMKHutszeIVI9MqYPzaTu3CqEav8kRsc1OYW/CUj5u7vWOyrIaD3Z3KLxjTUhP1X49c/xF6Ir
	HbGXHt5usbYET4dccb7rOcvucxUnPiGRsyK+MQhttoz+D13CAsCxxZ6FAn8Q0TP778swR9x4W9u
	nSuJn7g3dd35ZZGbMFDvinCjHOIx/QlPTHkNRmGWuLvffui9h8lgptS6x5BI6IU5c81xCunFenF
	HYuMQhJldjdSrmQ7nzG82qiLP3qQ1henQwJgGylzS+h9yYToK5d7z9/F7uoNezYHXd5Ew0OH3qI
	nT8mIcXwkd/T4BFAWGdjvKm2yhGpej9I/vUvB4k0yqugac4wvpILI3jcK5DuwkHiXlwXLreFvhw
	aiy2GBbd6pObh2WkVW+yK/wpZclldVkYj1xH1tjBFcFuF+3U1ckXCC0i7q4w9q9ZeSHmUt8H+Yq
	7RMCjvrqDmg==
X-Received: by 2002:a05:6402:4009:b0:6b9:c43e:19df with SMTP id 4fb4d7f45d1cf-6ba37ed9a8bmr12269161a12.41.1795605998897;
        Wed, 25 Nov 2026 03:26:38 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6bb1b93a8efsm1202907a12.7.2026.11.25.03.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:26:38 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 7/7] ARM: tegra: Add CSI node for Tegra114
Date: Wed, 25 Nov 2026 13:26:13 +0200
Message-ID: <20261125112613.237333-8-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125112613.237333-1-clamor95@gmail.com>
References: <20261125112613.237333-1-clamor95@gmail.com>
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

Add CSI node to Tegra114 device tree.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra114.dtsi | 34 +++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra114.dtsi b/arch/arm/boot/dts/nvidia/tegra114.dtsi
index f2766c11ee6c3..61120658f0687 100644
--- a/arch/arm/boot/dts/nvidia/tegra114.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra114.dtsi
@@ -53,7 +53,7 @@ host1x@50000000 {
 
 		vi@54080000 {
 			compatible = "nvidia,tegra114-vi";
-			reg = <0x54080000 0x00040000>;
+			reg = <0x54080000 0x00000800>;
 			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&tegra_car TEGRA114_CLK_VI>;
 			resets = <&tegra_car 20>;
@@ -64,6 +64,38 @@ vi@54080000 {
 			iommus = <&mc TEGRA_SWGROUP_VI>;
 
 			status = "disabled";
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			ranges = <0x0 0x54080000 0x4000>;
+
+			csi@800 {
+				compatible = "nvidia,tegra114-csi";
+				reg = <0x800 0x200>;
+				clocks = <&tegra_car TEGRA114_CLK_CSI>,
+					 <&tegra_car TEGRA114_CLK_CSIA_PAD>,
+					 <&tegra_car TEGRA114_CLK_CSIB_PAD>,
+					 <&tegra_car TEGRA114_CLK_CILAB>,
+					 <&tegra_car TEGRA114_CLK_CILCD>,
+					 <&tegra_car TEGRA114_CLK_CILE>;
+				clock-names = "csi", "csia-pad", "csib-pad",
+					      "cilab", "cilcd", "cile";
+				power-domains = <&pd_venc>;
+
+				assigned-clocks = <&tegra_car TEGRA114_CLK_CILAB>,
+						  <&tegra_car TEGRA114_CLK_CILCD>,
+						  <&tegra_car TEGRA114_CLK_CILE>;
+				assigned-clock-parents = <&tegra_car TEGRA114_CLK_PLL_P>,
+							 <&tegra_car TEGRA114_CLK_PLL_P>,
+							 <&tegra_car TEGRA114_CLK_PLL_P>;
+				assigned-clock-rates = <102000000>, <102000000>, <102000000>;
+
+				status = "disabled";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
 		};
 
 		epp@540c0000 {
-- 
2.53.0

