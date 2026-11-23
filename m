Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447675;
	b=Oel8J5CFHRyJESgnuDXy32xUDIvxkHgAEES1xhaKAtRvf94j5Y/l6BItKq1LkM3CspjN
	 91Qv6eCkUaTU1LGaQycx8aXVumNfVokhOQfZt6CFUhuTtQUOB/i69mQwQXZA05QyYmzEa
	 DsaJPrY1afm81pb0xb0JJM6iYVo6Y018rpLIAJowR7/ZRnijHl9NBjQtfVKeoKVWWp3Dl
	 Bko69CfL720zkkdRLqGeQww3idzlab2p2A4Uj+buv5xaZPbq6VCE/hAkFj9J3kUq7DaTI
	 7D5M7swITmn6p7+P23TJgfaq1V+Y61kEiD59G5Fy7JMs3MJt4ynO2DcEo2o06EFbpLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447675;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uBAOfdEywnKwLI3Q30a2UJ1axUEupHQCdZ1P51aKI0w=;
	b=3EyC0h9TG1KClAVDhJK2H/g44FZY3+Yc+09d4OGl3oiFk9B+lcQFgpYRj3Y6JFQ0vbIW
	 q/Cf4U4i+4nHWK4Imxtcu+Rq1u8NwqQNo4jLMMe1pU/B4KXQwcy2Y+yI2glEyE16AX9ul
	 aKh2s8r44l07LFEv/RxW5VvcBCoNOZ8WyU4F7CsbkosyHmqNwhrzrZ4uUUoh/QSz27e0h
	 bg27PUxnFO897dTDONOBSNTekbB/fQs/h+JHo5kTJL6sAcLYlL/A9ToUGKR3TOGDWcse5
	 oEIOMXMux4+Jjj3SGJu0+U9s+VB60opgoIZET3lztO+eZs5b11tS2ZapwS8q6mAEgOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cWUb1R2v;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155CA606A327
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 15:27:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 155CA606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cWUb1R2v
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1b3acec6677so4817289c88.1
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 07:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795447674; x=1796052474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uBAOfdEywnKwLI3Q30a2UJ1axUEupHQCdZ1P51aKI0w=;
        b=cWUb1R2vJjz6q1bHmoPN/LqInvTMfkVUHJM4/GfA2TcN29DOBUjjq8PtpXn5jaj5AL
         93lxc+XMTCtIQ+iYvqkvAWdBYKVc7/OGn8+41OgyJowmRjEGLTX8UIqIv1s8UCJfmqYk
         AzomVOu58i73iY/MROCpGxPoHo9igrRfdDeNzrI7OKLGSbfrXrSHUTMziEfZCM9z8r+B
         VBQ1n3AmEHl3IwSJ1PcxhZuO78OiBdcDPoAv+SjwCWtQ/gu8RB9cWNYT75p2l7guU70D
         nCeDlvuXjJyXpdv3FcZFxsnRu6O3lmeDvcfcQmCKaOw/FgBK1982jNY60Awlp/F1GNiH
         cwDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447674; x=1796052474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uBAOfdEywnKwLI3Q30a2UJ1axUEupHQCdZ1P51aKI0w=;
        b=o7ix6NQte2TFbg89DqF3hSiOG+ST1h8ZwTj5e5U8kMlN44OSxQZIdIftFGVSlLhnZE
         6L31+cq53bUo7V8nys/s0/fNTm+/bOGuVmuG3AQH8LHTpj15CZdkCTmDJTLAvhUp7hYn
         LrFeAD/4W584p3tLXt+6VMNkr4cESosa6R+oDyo4hUoDjKCn1hL1ixfyFoBeet1MyAvn
         IDm+HEwGUMxbEhp6qIQ39xG2HqVM9mRwhgtl51FrKB1wD+0nc84f8xXVPdVdFjymGdRR
         DFcxPsjgeEO5IjP9AocY3RYJcnNrZyLaeC0vqKtKrd2CsZpFXAJimVIZ04zYyKLGWNDo
         Ce1A==
X-Forwarded-Encrypted: i=1; AL+hErER+8GQqyLUusy1CNH/2CzIWhNHnXqh8H//0fxPlbYut/PJp7LQJw3CPuyaZo5Oqg1XL/wIuPAq6hFfDw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+eKZpZRDU39mffMs3X52FErvKDI6eYwdddZpgtpnZQnElm0QQd
	AIL/I+j0Ish7zpx7KHy/bToHbZ/R9USGMcjOMz6atGFFhT+tDw3cwjIP
X-Gm-Gg: AZFdTZeHzP3qBTuf9njmCQw2QQteKa84mGvRC6ni/+PK8dtP2RsCp8FpinygfNHSvVy
	1Gu6QZZiKUsRkPO5i3utegvP1xUX/XlNfA9zAZCGfBB/siVhB5/NzzXIf2WC0JjlwWQELhE4ii/
	cEkNkM2FEjOXYProXeHIXnONz7qfLXdeRs08DqAS6ByFHFg9R/PCnM0XzTkfjV3MOmH8n+KQeR7
	pD3ec6ZJJ45vvzN+ALtcFDnDIfJ7Npemic4tc5XX5eAWtZPWWlC0kCu4DhN2toTrZmPrUq7v94c
	W/0f/x/X4TyBgJ7jGllyfnUQ1s0U5e8sM/xTL2zpQOrqCMRRxDOVq5z77ZoYlZlh0kI822a8ilJ
	FsoXJidfmIwprWGBu8/EbjtXj5E6Y/LrYh0rlOrluhiAeqa5aEH/2UMhmn+qA/V6ngnZB260eBJ
	TYxlsX6QnoVffEO262cFx5z5kMqU6r4wpTDVVDxuG0lToVwgvsH1f5qG+Q61TgyZ6sETV6qMPAj
	sRWdbLiLXBPsixKkmg25TMCwRjGRDd6Kpw8uyZ717pMLhklkr6Sgy0bEd2w+HBx88WQ9ZXi6/Y+
	Qenc1MjJRXz5Oc6OwlFNgIsg78ec42gOdRSEpQjpsAirXA==
X-Received: by 2002:a05:7300:de08:b0:382:42a:d3ea with SMTP id 5a478bee46e88-38570258929mr12093640eec.29.1795447674020;
        Mon, 23 Nov 2026 07:27:54 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm46569087eec.5.2026.11.23.07.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:27:53 -0800 (PST)
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
Subject: [PATCH v3 0/7] arm64: dts: qcom: msm8953-xiaomi-tissot: enable front and rear cameras
Date: Mon, 23 Nov 2026 22:27:15 +0700
Message-ID: <20261123152722.168879-1-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123123546.152162-1-hikmahgumelar@gmail.com>
References: <20261123123546.152162-1-hikmahgumelar@gmail.com>
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

Enable both the front (Samsung S5K5E8) and rear (OmniVision OV12A10)
MIPI CSI-2 cameras on Xiaomi Mi A1 (msm8953-xiaomi-tissot).

Changes in v3:
- Add Fixes trailer to clk: qcom: gcc-msm8953 commit.
- Fix $id and $schema URIs and switch MIPI CSI-2 data-lanes to 1-based.
- Replace deprecated pwdn-gpios with powerdown-gpios and model GPIO62 as
  a fixed regulator (vreg_cam_avdd) supplying avdd-supply.
- Drop unneeded <linux/mod_devicetable.h> includes from s5k5e8.c and
  ov12a10.c (suggested by Uwe Kleine-Koenig).
- Fix runtime PM ordering, pm_runtime_get_if_in_use() <= 0 checks, active
  state initialization (.init_state), v4l2_subdev_cleanup(), exposure range
  updates on VBLANK change, test pattern enable bit, and endpoint/clock checks.
- Drop undocumented interconnects from camss@1b00020 and sort nodes/pins.

Changes in v2:
- Rebased onto linux-media/media-committers.git next branch.
- Updated set_fmt and get_selection pad ops signatures for v7.4-rc.
- Added MSM8953 SoC CAMSS node and MCLK pinctrl states to msm8953.dtsi.

Hikmah Gumelar (7):
  clk: qcom: gcc-msm8953: fix csi_phytimer_clk_src 100MHz parent
  media: dt-bindings: media: i2c: add Samsung S5K5E8
  media: i2c: add s5k5e8 image sensor driver
  media: dt-bindings: media: i2c: add OmniVision OV12A10
  media: i2c: add ov12a10 image sensor driver
  arm64: dts: qcom: msm8953: add CAMSS node and MCLK pinctrl states
  arm64: dts: qcom: msm8953-xiaomi-tissot: enable front and rear cameras

 .../bindings/media/i2c/ovti,ov12a10.yaml      | 110 +++
 .../bindings/media/i2c/samsung,s5k5e8.yaml    | 103 +++
 .../boot/dts/qcom/msm8953-xiaomi-tissot.dts   | 119 +++
 arch/arm64/boot/dts/qcom/msm8953.dtsi         | 145 ++++
 drivers/clk/qcom/gcc-msm8953.c                |   2 +-
 drivers/media/i2c/Kconfig                     |  22 +
 drivers/media/i2c/Makefile                    |   2 +
 drivers/media/i2c/ov12a10.c                   | 719 ++++++++++++++++++
 drivers/media/i2c/s5k5e8.c                    | 555 ++++++++++++++
 9 files changed, 1776 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov12a10.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml
 create mode 100644 drivers/media/i2c/ov12a10.c
 create mode 100644 drivers/media/i2c/s5k5e8.c

-- 
2.47.3

