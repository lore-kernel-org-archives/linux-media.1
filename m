Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A9841DECA
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 06:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784616097; cv=none; b=Qt9PGg9VJp/KMubiAIoWjzrIy0t/zDk09muA5t1ZA4bxndeBi8hJXgIs68v6LmHd8jcdle1t+M9qAV1CkoZCHFURWyQm+pEHko5ncYXtZqnG0ppuTP1RoggzeRDXR4Br4QcKivH/2aD8JY+NM14rc5X2/OmE6atX4Pmb2l1u+EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784616097; c=relaxed/simple;
	bh=9Drvmm6eZgZJWLuFZTzhkGMZGn+ydW2PC/MLrOA5jQE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iiCJ2TGTmibPjQt5lR39U+qOQhviwtavV1nQToweFZbytybHaVfCh031mntEoYLhD1TVPGOrtxYWhHGfPUG11tX7ErEdWTwm9MAr0K2PbzoT38TEUTCZgvI8jf7VJKXxC380bLFF+//klJOLrW/S8JNP1mzBkVxsBH5QFULP0WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oTJqU97z; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oTJqU97z"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49253e951cdso6285225e9.1
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 23:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784616094; x=1785220894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ulPEDLH/C//NrEG8Ra6a2W7BH2SJyZZBWy1vtB32mys=;
        b=oTJqU97zLjEeGzs1OmJHVgwmpUnMBs0oH8EnVHnLQBB8iSGOT1IeJDXMOv/rvAmsm9
         AN/LAiCvnKAOuW0mAMqLovfDT37nHrT3YQPBUMKwXHjjQKIWUQ1/Es/lDYjdNU7kIhIz
         k0+NYqgeNs/778scsao7qx4PRVIGM/PfjSocnC1eJ1CfH1sjjaILu3F/1p8ehPyTtEi/
         UjbQcTgD8yL5eTrmJfLTeW/IBB9592EXUda1MgtsxXVtBMYN3zzDIFhf2CGABb0lWvda
         LaZwLztyRXhQhQv9ICv4s2qgXm6ZtX3Cgueb+eLXloUJB4rCrd8zjJOxDXMORQznOKpj
         6wnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784616094; x=1785220894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ulPEDLH/C//NrEG8Ra6a2W7BH2SJyZZBWy1vtB32mys=;
        b=eBaj+o8Mw7ZhSltCpqQVMwwiLnBinVcaUSIFVkg9fTL4uMP7hlX8U1w1AWqgEwW2G+
         n2vLFou3KquVzOxxBtG1QC8Qjhl/v34o7zOe6lN/AkbFgcnOgQDynxxuLFfMqiozA9NZ
         T0ir7OoUgwomxgoHWLGe6sXMho5Bn2sQr+pMVPCqQJs+pyn1umbPfRVFgPZftxVGR/la
         tHIAQNXtAjHy4spNZQc7fnSLmP/izu8VvZDE0/eFb0PlZf/EyDvT/lfGl5hV4OFb4BPe
         LdfRZBJBXUaec7xF/CCXgGVBjhDvoWzMCY+YX52qMFqrcFmYccU1WpDRbmFEOnj22KJ0
         jenw==
X-Forwarded-Encrypted: i=1; AHgh+RrNAm77ZJ+4OZ8QmJct7m1Oi+m7WZnzUoMw8s5A2IKYqNxS4Xhv+Jl23bi28nCpUwdL7eILsZyXbCFVEw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJdH7ARyF+AmsB1FJJg7oTayyPfwNylJzEzbswK94XKT4JL5ok
	WSZ4//2iwqmr8n5ODndLvfS4s7m4AA3KALEXdj96nwkPK3pRj12rIkez
X-Gm-Gg: AfdE7ck0uQwfXQ288N/uNCgy+EiuZfpNsbk+wrtR10a1GVdfBQifGt7uXhzTZffxSBA
	ng0LGIh9Zz6M2JAfynBaLFhfxXvvQYM1KQ8jmGkoa1UiCQ3Akro1zmMCyIAdkQibOjEtmrzMCx8
	2jmFMK4Xynvf+VxQbwsHJnEJglyXQiG1srNmQUEIK2yvCeEB2H++FF8bH2gFHQNHjfuLYVkKfqB
	accrJhpLkPoYfksLdGMtDgvHgE4QF/ZMjinEvvNS8LmOdW+FXWL3Xcm3yaPhU7jijz9hhbCnOQd
	Y8x3BtR79qTU1/8QoLae+4hyY0YL+jW3y+6ljEMXkPnF0VzTbxc45tbBoRonGkf/NKU1VgUZ9Y+
	VAn/5d7oepMUbch9p10dJ5+kK20/cggs0pcKr0kiOp1ir9j4LeT04qY8RIPTyocCFkqTLeiISkv
	VecISmPNg9Z3Zf7UqbiKunRucP7zHQrtRRM2WCDB/EJ8/JhfKipOUkS2xaFR8IfeUrDPgQPC08z
	1O6oiXkYYc=
X-Received: by 2002:a05:600c:1911:b0:495:59af:7a5e with SMTP id 5b1f17b1804b1-4956598fb80mr11601215e9.5.1784616093905;
        Mon, 20 Jul 2026 23:41:33 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B88AD00DA0BF9DB4519DBD6.dsl.pool.telekom.hu. [2001:4c4e:1b88:ad00:da0b:f9db:4519:dbd6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63ed1911sm38837951f8f.22.2026.07.20.23.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 23:41:33 -0700 (PDT)
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
Subject: [PATCH v4 4/4] arm64: dts: rockchip: enable HDMI RX audio capture on Orange Pi 5 Plus
Date: Tue, 21 Jul 2026 08:41:15 +0200
Message-ID: <20260721064115.64809-5-royalnet026@gmail.com>
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

Enable the shared HDMI RX sound card and the i2s7_8ch interface it
uses. Together with the audio capture support in the snps_hdmirx
driver this exposes a capture-only ALSA card fed by the HDMI input.

Tested on the Orange Pi 5 Plus with multiple HDMI sources: capture
follows the source sample rate and stays in sync via the FIFO-level
clock tracking in the driver.

Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
---
Changes in v4:
- only enable the shared hdmi_receiver_sound card and i2s7_8ch, now
  that the card definition lives in rk3588-extra.dtsi (Sebastian
  Reichel)

New in v3.
 arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
index 9950d11..9f9a303 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
@@ -171,6 +171,10 @@
 	status = "okay";
 };
 
+&hdmi_receiver_sound {
+	status = "okay";
+};
+
 &hdptxphy0 {
 	status = "okay";
 };
@@ -247,6 +251,10 @@
 	status = "okay";
 };
 
+&i2s7_8ch {
+	status = "okay";
+};
+
 &led_blue_gpio {
 	gpios = <&gpio3 RK_PA6 GPIO_ACTIVE_HIGH>;
 	status = "okay";
-- 
2.53.0

