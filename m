Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8171A419FD4
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 06:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784616096; cv=none; b=VFi+05M6JY/YiJjlG7WUJ92kjNN2PyNZbyT15FETjPnTpmaVfK0pparosRlBLFZ4/pIesVF+zG0pHVTiXNB3Y5F0RyU2yu/FiPkcrdnDUuTIpW+wUIZfSDwZlE7xU5z0OxllHfpfWwNUye6YY+PeBBjo2LHEsPJD0a8Rb6rVrOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784616096; c=relaxed/simple;
	bh=YA4t/FQ4Wsu7AcE6Lw32+kLJsSTSk39Et8195aKjZpo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nRiQ7Zg0claTTg7XMInyDq9/KEiURgKsXAmNuwfC9BojPRY9wV4k0bfYymI7b7WDp+8qp9OCt0sUb0QFq6KqFggRwXW6IvRggnZWiUUdZ2gB90vLxvbbrvmIjG6Q012cfVA/NuutrrRJAqD20ka3LCNzPflB/xMfQldyvQSgxE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fMB+JZvH; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fMB+JZvH"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490d6730461so11236745e9.3
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 23:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784616093; x=1785220893; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gxBcoaYqqWn7DDfCE+l3ErfQKRET5iv1Y4ILak6MpwQ=;
        b=fMB+JZvHQlmDCFJsuDxpEZovCxbEogIqc6CLwtb/zwyg1IwLktD099wczHkODxeeaL
         YyFMJ8sFnotIguDqz4KimdSEPpVG4/10SW4x6Wd4R9nLxoUQwORcMx4FkGTYc6i32DXB
         siK3YUluyKNrYQl3gMLJzsUwz3pX7Hjs/YSq4Kt+vrW8hpdKYpMgh5dZMZjdffDMWNja
         JP0KBOBHjyqIWIJoMcF94sLanW959hvRHQUJKuhyUfnR8Xir1wYIzKjZcchn/SIMN/Pe
         X6xAtDr4vIEto6v6T7PC+m2Gmp/oqhN/RylmnNQ+1W98w6OaqzzgH1bew909q4b2eEft
         LC+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784616093; x=1785220893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gxBcoaYqqWn7DDfCE+l3ErfQKRET5iv1Y4ILak6MpwQ=;
        b=FnkWNDwb4NP/2A1wtKPr/26EXc55JwdM2GEdCbTfZdA+vdpsDmc4v6hrUfvil+B2Uy
         icnMLZOoAzgolZWy9+pJq3ACeqoec2oMvxVxWXuMllnymaae/xvE/o/SgmyR8TDl525p
         elWtBoYgeVISBmOJZPZczZ4u2pMWv3r9+U7+t4fkexGTwjT3jprofitexwUua0bsGRqG
         0z6RcSU66InYDwPCRI0DuasAAwfOFaK25lLvDzTeRYqGmyOkaWh5DmQyggAXD4jkgmb5
         ZB5XhZW/SgJmYjs/7b/4KjCbmTf+ghfwAPea6DiTigMV9ZApBExspM17cHKk95hv5wc+
         xb7w==
X-Forwarded-Encrypted: i=1; AHgh+RrZSgZJUvziTui9tXPIecJI6E7aLszr40gOxSzS/PejwrEUQZu93gnFMmVXDm8ZnvwrnCg/hk4K8W2Aww==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/hqZ9aTihRHpGLHSJFozDT5qRBgtpVI3oj8Vmv5uz0IjCU7sd
	hKjB9OOiemkQCawnOqst1eVnYcKKtAjbFbtU9ZJDTNdtGsmliq7g7qE4
X-Gm-Gg: AfdE7cmfDz71lKUZ5aC3BMzK4v7hEZCbFAvQcY4uxrV1bRjHWxNlNlRCJt0IfAJhgRv
	unKzXe9QdzV284WwaIRjd/OKgdjVJIy6fyru8iCWjklS/avUuJSNcVSfY4J8+vm+QjvXIoxOuAa
	vFW8Tsxg8Gm9GxTWKJNoGVkiKm55Kzh6wbV+cMUJU2HdVNakMUfRxbVhTRmoS00tTxVm8BS4lfe
	sWcCfND22nQSSRvRBO+CZvarv8ehRmbgNFNe7F7h5l57xbXECy5j3H2OOBwnNdBeCe3Jzvt2WNz
	KJ3m0+YBXl2rF4X6yEpiv193nQczo/dxpaK0Y3uQq1IiFUIt7ua+F/COrhzUrDcnL6gata3X8Y1
	DGzZZGFM573LevgW+TgdCgEwf4rBkhYmuhWsz8odKSZtNJY9KYGuhcKEftIDejLWnfAlHQBMujd
	TH2GD3g6Je/bl/O5fHtmb2PyqxN6lNuV1fm4kwy0N5AbagjIsrRS8EwQ8yMgTfRA0zRk6bLQomE
	VNIcBsoBM8=
X-Received: by 2002:a05:600c:4584:b0:495:6713:9a62 with SMTP id 5b1f17b1804b1-49567139f63mr6189235e9.1.1784616092535;
        Mon, 20 Jul 2026 23:41:32 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B88AD00DA0BF9DB4519DBD6.dsl.pool.telekom.hu. [2001:4c4e:1b88:ad00:da0b:f9db:4519:dbd6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63ed1911sm38837951f8f.22.2026.07.20.23.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 23:41:32 -0700 (PDT)
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
Subject: [PATCH v4 3/4] arm64: dts: rockchip: add HDMI RX audio on RK3588
Date: Tue, 21 Jul 2026 08:41:14 +0200
Message-ID: <20260721064115.64809-4-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260721064115.64809-1-royalnet026@gmail.com>
References: <20260721064115.64809-1-royalnet026@gmail.com>
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

Add a shared simple-audio-card routing the receiver I2S DAI to
i2s7_8ch, the receive-only I2S interface dedicated to HDMI RX, with
the receiver as bitclock and frame master. The card is named
"RK3588 HDMI-IN", which is what users see in alsamixer and what ALSA
UCM matches on. It mirrors the existing HDMI TX sound cards in this
file and is disabled by default, since not every RK3588 board routes
HDMI RX audio; boards that do only need to flip its status.

Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
---
Changes in v4 (both suggested by Sebastian Reichel):
- define the whole sound card here as a shared, disabled-by-default
  node mirroring the HDMI TX cards, instead of per board
- name the card "RK3588 HDMI-IN": the name is user-visible in
  alsamixer and matched by ALSA UCM

New in v3 (as "add #sound-dai-cells to the RK3588 HDMI receiver").
 arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
index a264001..e0dce15 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
@@ -23,6 +23,23 @@
 		};
 	};
 
+	hdmi_receiver_sound: hdmi-receiver-sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,format = "i2s";
+		simple-audio-card,name = "RK3588 HDMI-IN";
+		simple-audio-card,bitclock-master = <&hdmiin_codec>;
+		simple-audio-card,frame-master = <&hdmiin_codec>;
+		status = "disabled";
+
+		hdmiin_codec: simple-audio-card,codec {
+			sound-dai = <&hdmi_receiver 0>;
+		};
+
+		simple-audio-card,cpu {
+			sound-dai = <&i2s7_8ch>;
+		};
+	};
+
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -338,6 +355,7 @@
 		reset-names = "axi", "apb", "ref", "biu";
 		rockchip,grf = <&sys_grf>;
 		rockchip,vo1-grf = <&vo1_grf>;
+		#sound-dai-cells = <1>;
 		status = "disabled";
 	};
 
-- 
2.53.0

