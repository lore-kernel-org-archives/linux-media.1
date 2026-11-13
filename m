Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794586741;
	b=vJp0Z6nUff/Dqetze6fo4bpxSxIdXWG9xOa/9UHRp+td0OOO7n43gcB8Hsfwd9k+cfxu
	 x/JKulRPzlnAmXjwHYokpejaxOXojl9z7fkBC8rBL3zbchIM1TySKq4nDwPHIEM9a5t1p
	 /cm9RhYWiy1F/SnDIydn7egp+3iLpMWrkCtkHbpuAFGHo6HBsvhDvJQ00zAKg0OoMCQYk
	 Q7tuknOZpQgWIT/MVi2Pxz2i61gtu1WuyEZL34dQaXJs7QfzQ2EhsTZC0Wqa+UX1JrKFO
	 3lMr0zQEyoQ2y/q1s1sh3WWMClH6cKVdz500KpbSCo1nPnvZiBQTdVxC5g8Docb/HxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794586741;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mQWld2rf0aUSCLxpuKReQRUF3uIzkNsM8ey4gCHu/88=;
	b=KbBjHFGAiARmN3L1bJrZ9Ij/qTSCtOpMYDfhjn26nJre0Y2oMFgQwsh5ioI8y4yZEML0
	 SyRBKE2SPHUSR2ihoX3kLQtnTlCHwuVqI3jSz7B8FyDFUCJU6utaRSFwNn60EP59SE0pm
	 9GIiFZjaXAP4h5INw8/22tmJsDicCRMRZaUoC9mMJ/fQckhUqTnVwiDVb7QWpWjQ9o1o8
	 eoRoij92TA05quSA18RWJoOBoud3Rs4iUePCaoMzFXFXAAisddTNEVBeVXlUxS7nTn8yS
	 YWFYdtkgSg00jJvOHuAuTpUh93ZykCMVj20Rskv9I2yFw5jX4Hmf3qjh8iVLXaodJtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zBoKHbol;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B0760A5BE7
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 16:19:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99B0760A5BE7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zBoKHbol
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c468bd799ecso222214466b.1
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 08:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794586739; x=1795191539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mQWld2rf0aUSCLxpuKReQRUF3uIzkNsM8ey4gCHu/88=;
        b=zBoKHbol8hBa0KV2wud8WvoWYPMHijCP/AHfQ0kMIp/6nPm9ZaoEu2nKj95ohh3y3f
         0BYTtjsu2BUiYwW6SfUG6OIZskQRV2qU5Sk95UAT0pbqgd4Lrp26EzInaCiUioNkUf3/
         h+iDrnMt1l3lqRjsvei3eOHp4NIpRha13RsA28lWMePHnmFRqiTyoNtz5ZiSaVXNOYjX
         IDgi7UnJgGeMGlP0uUBbibrMI57N7dejvOcEN/WNNEaYuWZqag0H9AddQrF+iZk2zkSo
         4W9pu+W3+a2f16KDUBXQ2Ma5P2jC5w7NdtoTqp3ey+qq6U5d9pVlQV2ZYjHYwgOxAoOD
         DwBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794586739; x=1795191539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mQWld2rf0aUSCLxpuKReQRUF3uIzkNsM8ey4gCHu/88=;
        b=piU2gmkH5DZ+S+F9akoHpwCi4KowqNDpJIuUPqGCfJMm/97NCp2QyTasvhujOw/1lR
         atlcDh5+hUt1mQ9ZaX8Kun/+U6HVmaVwlcHaD/OwjHVFUkGVNGnppZAXHNjvX2lvyTY+
         LFrVW0GKzm01XT+1lyV7UUfPkDdE5WZwNADBmoR0J1ergxZ2OhT3+HWr8ud5F2zfB4q3
         p+pbhmDXdqGIq8l6q0TIl+g6tbY5QbXbcUu/mT0DPOdbNBlQlLmLiiYC/ifWMYEfawTp
         fg3IXH+ybBY3nvMu2CLSsG7aF1CsgA9fbAXypTNpDYTVGPetjVFsCh4N+W2+tXAmdjIX
         rA9Q==
X-Gm-Message-State: APuU4Z/qD8v2PVK6bRJvfx0vxw9gmJnML733ydVN+Yw12I5yA6pzd5qt
	/Yht3yDs9fsvl3lGyjS7e3w2KNualLErchLZ7hXEJtOdoUt5EAKZMxdL
X-Gm-Gg: AYBFou3zE/3Z8xS2KKQ+Zdd5frybaIKQNkXiaNEp/xRqk70Jm60Fk0XHFKHa7yxG7hY
	nMd8yu6eI/nV0pgnOCJO4bUMyI0fzEu8xrEPV4eVxU4xW56+yhh4+gzKvgT5gh3+AMQJYP7U6Nu
	SoM7Uies1BG/A5rlhIDM5t8Tmj251bVKBt6vuVp2tE9IX6sEv78aXBxV3C5Fv/JsfhcFlxTltH3
	kQ5BBaIKJWkAFjWT51VWPRN77HOaQ4+FfBaU4Pfh5Zy8wUYQcHgMQXW3w2Ul2051w3f+vM3p54p
	7phGkEH2CSpZ9kSIJcpdbKeLC+yH0RhZp4i1gRCUnAhid5YXJNSS2reyE57in6k92CL5czM0p2J
	GW0utrDbYhuO48xv2OZhFLx9POuNxyDjOAROm2oLdiEXbuK5Gfk5kt82eTG3v+7BkrVOf0oE2Z+
	4gZgurkQqkev4AADHPb1ROTOAr6AZJlJIjrrvCfw6U0SMyYW6qq7lJOYzqlehgB1n9nR39d1APT
	1MCc76wZR9jy6KC38qckTHBMVBqJ5axRkJW3rFh/2tJLwLUrKpAtOO4Iy+C0exzZ0eOROXu9blq
	SZZ9F5JFCSZdo+3MnCb+O1R8wKyrduQQuS+k2GpWf5P3DrPaSgSgMEJPFq1I3a3OikcVwgPZFBG
	vkZ80mJgIyA==
X-Received: by 2002:a17:907:9304:b0:c46:9ee4:8f0 with SMTP id a640c23a62f3a-c50963d470fmr299547666b.10.1794586738923;
        Fri, 13 Nov 2026 08:18:58 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b24b88sm122297266b.16.2026.11.13.08.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:18:58 -0800 (PST)
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
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Cong Nguyen <congnt264@gmail.com>,
	Faisal Mukhtar <mukhtarfaisal03@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Hungyu Lin <dennylin0707@gmail.com>,
	Hao-Qun Huang <alvinhuang0603@gmail.com>,
	Yury Norov <ynorov@nvidia.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v1 10/10] ARM: tegra: Add CSI node for Tegra114
Date: Fri, 13 Nov 2026 18:18:19 +0200
Message-ID: <20261113161819.36847-11-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113161819.36847-1-clamor95@gmail.com>
References: <20261113161819.36847-1-clamor95@gmail.com>
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

