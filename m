Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437361;
	b=NUEG6T4S4f0nhyNZlmLbxk8LBbnz+6p+6TN5Lv0cHNxf1sjf7n+UGbBwGMPvuA/rre+o
	 rqFZZun7VdFRNjBCPLpEv2bZyOeQDVOQ/CMEUDQmdUliHPniqiyAHpnuqpvirmy5X7SOx
	 lpz6bQnox59M+jzaj1MaRMyNXrxcXeS7MV+Gu3myJriEef1SxPJ2cCUSnCrJfDqNmZorO
	 FrMpaqaARWQ2vwy8GBqa5LA/zmUN8I6jdtM+gVFi2vX2qt5v9qTda8lOsbKsJ8Vzgmw6u
	 9EAmDns0qHQ68IKR3MEatxFrLgR4kWwXdSE9LlbsUEnEVr/hi1M0O5Yd7vr+rZJ1oqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437361;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ncj4S8gNxyfQfqVipK+ZlxLd+2fZZ7DWNGqNx0Zlc7g=;
	b=GVHuQ2fy7Nsg+uB1IdMY0pCD79LDulYlcEltU+u2AveR4rIk1lJutRBFLFgjCSUrExhY
	 Hv0p+LtVti5IWmuJjm04IDOn8uH1UCHJ5shtG5BzJtRwGfn0k4AhaczTFi6U6iMOJ9o/c
	 H0ol+syfvRkW5lotPDevnmuCDDJE0gZKA3zUVUds2zSDgIz1mLc4iMGdQAngo3iFqgn5N
	 1yBJ81J3RoYBS7f3sb/KZ70cLJJXI/sKhHsB7elHlbkjmgEokH8y2DHirUi8ojaNNES+W
	 1tmPNYZh5j8meKY5So6Ih8kMSXzotFUb0CWL9BAT5FsoUGrkIREi69LYXbzbKwXm33w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QTqnQskK;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23BE3606A330
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 12:36:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23BE3606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QTqnQskK
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-382f4710a17so5494724eec.0
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 04:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795437360; x=1796042160; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ncj4S8gNxyfQfqVipK+ZlxLd+2fZZ7DWNGqNx0Zlc7g=;
        b=QTqnQskKRIE1cgebk3mNS42vnXeE3k4W3M13JDorM8JvXmThQ7ACiYCLcu4VK+bQ9V
         g9layI4Geer0IOQZSMpwe9SmleQDj3GdZ0xBTxfRnNCZcIoDxaN4eMTAAQcEORsQ0/80
         tii9DA5HDOBumdveehsPOCePuj/xeFzr+6lGzKrTexMPx6iaf2QQaouV9oVfECfX4GbR
         tktf5MzOOMFFJmCl5KCqs0BusxJIYl022a8IDjATdmIUAL2jKzvhtbHQmBqgFV+QyZlp
         5QUGCEimTBcZ/hVaYWkKucKZXfSp2wPr67biq8Y4qw8gmMngKzfe9Z6+Nfv+VVPoYlOQ
         cPHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795437360; x=1796042160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ncj4S8gNxyfQfqVipK+ZlxLd+2fZZ7DWNGqNx0Zlc7g=;
        b=t4W8R00FtiI2Ms8Ll2wfMHpCaR1cyaflw/ORmc4bPVxmle5n5ecj0DeNiPnpTTl/DS
         r4QFGJDPR0P3qe77bny9TppIjw+P+YBqCEPokexaxz/xNy6CplJF+tDfSmznm/ggVp8I
         OFyjE0om6QUQ4LUYlXYpVd5zmPb/h0NRVHStwwNowLgENvB7NjRe0cvhH4N9D+BBqSHm
         S2SsWy+Mptrasvfv59mKwbjJx+YwKCYR/jiYXlHWFYZSWsyW36DZgkcFB6V48yFMp2Uy
         zR+YBYVgIOlQq7+/4kUvZOA84ryWQ3KPL+TGMpY0lwK/VkJVqlcB1fLp2w0EI5Lqli+c
         PMYw==
X-Forwarded-Encrypted: i=1; AL+hErEn7il8ezFS7Ls0vdn0xd5yI6yK3QIid0Yh0u1N6LXoxZaFG0tMVV2TZT/avEW0/cZBdDyboVDpGU8/5A==@vger.kernel.org
X-Gm-Message-State: APuU4Z8U88npHH702IADe7FWh6ungx1pw1rTWnhZZaupmdHiQ2B43z3Z
	wlU3EIv+pJe5OPmCjRdmve34XC3XmYfby1dvH45tK1VxGe4/pMHbTjgj
X-Gm-Gg: AZFdTZfjYneP37FQZpdiKNLFWQSb7Q+c0iOa8wIiz2DxzqrKaJei4ka2V6bUu8q1wgD
	H4tbWc+x4mq+HFG+P8hrLUrZi+l0iUcIJUyd1RZ2AdhE4ObIu38AAXeCIw5T2zJ0/i+m7fMTQAv
	q/7+vzzjUbaJXUYxb5clZtHjMtGY2e2X8J9ghAH1iKW+8Q9FY3MPCspry2XUAqo3DZfM2uNvXtT
	4QScLM/PU9soR/8mMAyI3qOzEHPm6WTMpcNrGjQj8w3g+0v9tqs57E04X+IT4TO6KBysg48vGbX
	RXDxd0kHvSnmICVVZjmgZHJD/WWxexu9oOn4EpVtGEF9ZGXasR/LDQZ/5xVs5vo7vQB0AN643j4
	AyIYUb7E2ZdAgSQXXegrEczzQ4g2dMYVrlk54NfHrUK8A35YLC9jflxJldn99j9NaaDxrH5n3J0
	OyvQWEoWhisxXq5vpOA0Emr7PfhSggF2B6cpZbt2mvEBcOATHwdv+RNrcRQTtG5sPnwbmz1XUX9
	wLLNDEwSWMnqSSqAuwiZnsoww97DD8OYreMhzLjqwClSngOqlYVHq6Ti8GtVhicWVOwD+Nb6KfJ
	/cuFSI1SwH+koHc7jYKO7rhWN+fY93TCx2IhAj+PlgNthA==
X-Received: by 2002:a05:7301:7110:b0:383:b90a:3535 with SMTP id 5a478bee46e88-386a0ab67c8mr6531336eec.24.1795437360084;
        Mon, 23 Nov 2026 04:36:00 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm32854353eec.13.2026.11.23.04.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 04:35:59 -0800 (PST)
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
	linux-clk@vger.kernel.org
Subject: [PATCH v2 0/7] arm64: dts: qcom: msm8953-xiaomi-tissot: enable front and rear cameras
Date: Mon, 23 Nov 2026 19:35:39 +0700
Message-ID: <20261123123546.152162-1-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123110805.119610-1-hikmahgumelar@gmail.com>
References: <20261123110805.119610-1-hikmahgumelar@gmail.com>
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

Changes in v2:
- Rebased onto linux-media/media-committers.git next branch.
- Updated set_fmt and get_selection pad ops signatures for v7.4-rc.
- Added the missing MSM8953 SoC CAMSS node and MCLK pinctrl states to
  msm8953.dtsi so the board DTB builds cleanly on upstream.

Hikmah Gumelar (7):
  clk: qcom: gcc-msm8953: fix csi_phytimer_clk_src 100MHz parent
  media: dt-bindings: media: i2c: add Samsung S5K5E8
  media: i2c: add s5k5e8 image sensor driver
  media: dt-bindings: media: i2c: add OmniVision OV12A10
  media: i2c: add ov12a10 image sensor driver
  arm64: dts: qcom: msm8953: add CAMSS node and MCLK pinctrl states
  arm64: dts: qcom: msm8953-xiaomi-tissot: enable front and rear cameras

 .../bindings/media/i2c/ovti,ov12a10.yaml      | 115 +++
 .../bindings/media/i2c/samsung,s5k5e8.yaml    | 103 +++
 .../boot/dts/qcom/msm8953-xiaomi-tissot.dts   | 114 +++
 arch/arm64/boot/dts/qcom/msm8953.dtsi         | 155 ++++
 drivers/clk/qcom/gcc-msm8953.c                |   2 +-
 drivers/media/i2c/Kconfig                     |  18 +
 drivers/media/i2c/Makefile                    |   2 +
 drivers/media/i2c/ov12a10.c                   | 720 ++++++++++++++++++
 drivers/media/i2c/s5k5e8.c                    | 500 ++++++++++++
 9 files changed, 1728 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov12a10.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml
 create mode 100644 drivers/media/i2c/ov12a10.c
 create mode 100644 drivers/media/i2c/s5k5e8.c

-- 
2.47.3

