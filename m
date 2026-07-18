Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581E9383C77
	for <linux-media@vger.kernel.org>; Sat, 18 Jul 2026 08:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784365071; cv=none; b=rncKdytVP/WEFZH7iKLAjXARPjfmbOrb87qhJJLGuTv+uF1wBoSlVnAyMjxfzIXgL+RsfXNwNeURzYPlrO+iZqvYJzDBX8+DYuJhHI/ixGbktBXXBzkPUEzJuLRP3weuSVYDBFvSi5tZKzR/j+753XCO6FmDwqGHhILKgxtyFdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784365071; c=relaxed/simple;
	bh=og04sSBm3wAKBXPeDuda5ze9nmSKybKCjjyV0RwL3LY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ho9S9ohhLVypFF+JJ8zKGjq6LTTJH06KBuGNsA0qtkhcGJ57mbfHbhbXYFCltG0izPPaXbFYAln76KxsrZ251DPWb3jlhBf6MbD8lrb0XF5N0weETnKLaOTvrhPXWdXSTv/9fSvLBg5Ajv9AbP5zlEFmcQbcLFpcNMY8wVz0BrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bxVeuD9C; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bxVeuD9C"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49253e951cdso3708075e9.1
        for <linux-media@vger.kernel.org>; Sat, 18 Jul 2026 01:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784365068; x=1784969868; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IVdUc4K/IhqrOMLTX+JPmZv/Y1bCw+s3TFSm96hNeQA=;
        b=bxVeuD9C27aI0nrUaD6Mf0aKe+hxBj+IDtlseurS5RoXQPNXBMU7B0LuI/uPCc6kVd
         VBjzbUM5oLJwJ43sh2GBhJCqXry9pd99hH1XGxkyHhzAL1xvOEaW//gGtBHgQGLHlG38
         qgaXp4NcQNL58/BXvtmZR0QFRlobkwvDcoIP0S4dTarMGu4YJ31noOcOdm3Zw7PILZgb
         DHBj2QJr3SC9YF+kvuvcQsBSFcsShq50CiYNVskM9SbaJNU3YB9MlO1rvLs99IYguEuP
         VkeGc9fM9h2WdPspMVV8TCRMU18MVRHpciPGhWN7Q0cE4wPV3rygVQbfxRdmCPatz48C
         Cqnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784365068; x=1784969868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IVdUc4K/IhqrOMLTX+JPmZv/Y1bCw+s3TFSm96hNeQA=;
        b=I6JkFOJrwe5aZPFlGTkmRNzvVbPkak+1fJKRe+YJ5JkK7+cTLSMYZ0XfK4PgpGI+zw
         wdgXsDMTdbbaq6t0S3WmhprwItYGfJYyK1TzEVz2RMZtXckzDWwHE9z6sdg9LkSflHyC
         oftol9gCr6QxXxy0Sc82K1IynWlk0k3vgXhTUs0DnBZBaTz+9B5Xaa98ukcTZLl7mk/e
         3DyPYLh1bHUEN/ws8w6BR1cYvLSmcX3NfctkyFbRXMElN1JImBGJHdco6+4LEcN9tgzY
         Noy/RO39nSpf0cZYS/zJF+ViFwn8m3r9gRSyzg12ar0ImJwa+nxqsrGk0k/ypoXlPX9X
         nDHA==
X-Forwarded-Encrypted: i=1; AHgh+RotN80H7zuxzxId2qWmkXjary9ys0DbVADBzB3GZQ1ATICKS/QeLfZKycI2c7mwvnPVCbj5OPYg9/DwCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNziTkODU6iRw0bnC6Fvf1/wE7aKxuxpBu0iVZXRy43vFF7kYq
	HD/1rNFFDbFLej4NIw6cXWAgA1I1lwek5/3hG9MUjGKX1eN8odajzC6X
X-Gm-Gg: AfdE7cl4bSyUCRdVa/1fsBwcC3N3J/tsXBax25XFvnZ/5mIL1ah9Hr+xBgeoivRSYnq
	IXffRrZPo/Ac2cqS7SXslN89+QK4tbUfJlBQGGzM7ePIraZW5IAIlXtq8jqFcCacDr7sVCEKVZL
	EUXfxjMmKDkcsHxwUJZbvJaFJ+G0ESWUQfgZHvIEweScf82pFRB5US+vQdLHN1VPcHABIltJVPp
	tOFI+hZdnrgXNDfjApbnWp8AYas5zZZ/SCTwblZBcWSopgFMxDuz7HN+SeBq5Gkv622rZqpKx6Y
	Hk+OeEU/WkXlznsOR8mZ2L12CSCFSPHMW5jfgEp6Sw/flfkcnoUkjr40cVI0tQW9Ls4uZ05TOhF
	UBZ3BJpHsRm+fbZqjHZRJl4RzDSnBPhuDfgZaExFOJ/4ab3O9fA7Pow3t4hbtuD1P/A7ZNmaVlw
	aOZWatYuY5A+SyyB1ZwmxS1ZO5+HO9J6Tciw7tkrngAoTLwlyYrkpM9atZTniToFt69dyrsbVxn
	NzxPY+DP0XWTh80u821
X-Received: by 2002:a05:600c:350a:b0:493:f13a:3f74 with SMTP id 5b1f17b1804b1-4954a51df12mr39497985e9.5.1784365067516;
        Sat, 18 Jul 2026 01:57:47 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B8D1600206D23E70680CBAA.dsl.pool.telekom.hu. [2001:4c4e:1b8d:1600:206d:23e7:680:cbaa])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954834edc3sm91477455e9.0.2026.07.18.01.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 01:57:47 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Igor Paunovic <royalnet026@gmail.com>
Subject: [PATCH v3 3/4] arm64: dts: rockchip: add #sound-dai-cells to the RK3588 HDMI receiver
Date: Sat, 18 Jul 2026 10:57:27 +0200
Message-ID: <20260718085728.6797-4-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260718085728.6797-1-royalnet026@gmail.com>
References: <20260718085728.6797-1-royalnet026@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Synopsys HDMI RX controller exposes two digital audio interfaces,
one for I2S (0) and one for S/PDIF (1). Add the #sound-dai-cells
property so audio cards can reference them as a codec, as documented
by the snps,dw-hdmi-rx binding.

Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
---
New in v3.

 arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
index a264001..fa100e3 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
@@ -338,6 +338,7 @@
 		reset-names = "axi", "apb", "ref", "biu";
 		rockchip,grf = <&sys_grf>;
 		rockchip,vo1-grf = <&vo1_grf>;
+		#sound-dai-cells = <1>;
 		status = "disabled";
 	};
 
-- 
2.53.0

