Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795797180;
	b=qTY8eUzPhtXYTMDbIqnDEjXBQxe2tF4CpBFfQqAarnbdkxxEns5HdGAJwRWllGgKhbWe
	 aYu33gdlexvpc1B0S1nt1bor8h2TwdTxb6ahpVcboHPYmYJTVYUWr2u93GadB/S64ckMS
	 imad2Cn6+mgXPr5fc5tjyT1iNYoVoeP39JI+q2/5puZh2TUf2TjK1IehhvHJ/VLuma3z1
	 tKQohQrfCIn7ekcYLmUh1nu/OyeE43nIxVhIyPbtlFs75xmt0rJvkKCKqb2A9oTQDPiQ2
	 jgYMGiZz/3sGkmnioPdb/j7QQIs5XIdUbgFaOka6fa+EG0nT7NJlbzXFSfK8IIH28qg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795797180;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=ji+oVVz/nzpz5puo4DZe7HwzAlM3UJiD3cXKn2jhyog=;
	b=q5u0dXukbN64zr2nbCS3u5BRHYqz16OyPG5ik3UoZPI5zhxjbaISgYwXFnGXWW7opxvX
	 pk/AwWokwgiMv2l1fX6kioXs02N0j0VPgHM6dLNJI6FY4E1RuFu+w1PGjQa+ZHbYeHUmY
	 S78CM4J3zHvIie4Jbop5xPvaoIovoMpbD12fCtCbtKeyWcNkbZcpXrqnQMwRH9I8ooDO+
	 BU0Orzy79rg7LUOO52XfT3RskeJRHM4aGRjATJZ263jqMcSC8XkhqPMd4LABGn2TOQubI
	 UAAKq5D6dUA8/HYIk+C+vaMekq5wCeE7mwZbK+QSA5UaIoh5Gu3tOS/DnQ3kXAedqYg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="R0OV/R8N";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.172
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3851B606A31F
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 16:33:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3851B606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R0OV/R8N
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-93a40a9a01aso1052702185a.0
        for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 08:33:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795797179; cv=none;
        d=google.com; s=arc-20260327;
        b=Z2EXbFpjs/PzlEJB+x9AlRP47srI6MgTnxitygQOWp4Oh1xx28d8IoaIEadUHEN7+2
         ewD8btCDmId+/7xTtN08jMZylnG01Np7u7DHj3dHreYaa/zJi97AnU/ywzQaE7yU5Y7Q
         fuaE7cWwPRxRfoY+sWKnbXYHy4eNqZBbjIvL6beDIo1gfX07DNtqgewLXr1Z00+bx2/S
         LvWpItY5ubej7QhTP3zSPn8kpSO7T3K/0vojNmswEVaJZd6vGZ/odL+VYSKxkeaqoxVb
         uP/R2SbFo8DMa/D6R7cAeEer6DThz8Gq9VXO2xUZJPOMg/lLVPpmHdR0SrqILCLehHVf
         kfHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ji+oVVz/nzpz5puo4DZe7HwzAlM3UJiD3cXKn2jhyog=;
        fh=f++jvQ2JxNcvsUWs02JDIFjhtWHVNC/Hw9dZlLeKbcM=;
        b=H5H5wAV3ow0bOJfMk1pEYaBPwAYUcA+epinSrUOyLoGxtMs8PUpdWWcWtoRc3pxE4t
         JAX1Nyi7HmYooj0Y4QvKvEaWEySaFYWmT8TTT+sed7doEusttK5Kb9OPguoJoP5/QkHb
         UlZHFb/9EcaABUSq4jHpDQ9zJ7G2At6AFHk6/O0srPlwE3FzYaZKhbHfhtqM0YOAFPLU
         UseE2XPslI0AmBsUzUrP3205BQiI3AFutLOykz4rk3NO3xpbwQ+TEDwC5Z0LuVcgE4XN
         ZRJHFgMi9NRnUF5GIOkT3TVbg31KsC9D+B89/V5SJeIZ4y99w/pd/aItyMa4hEhsC0gE
         ET6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795797179; x=1796401979; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ji+oVVz/nzpz5puo4DZe7HwzAlM3UJiD3cXKn2jhyog=;
        b=R0OV/R8N3BVXXKY1j0aTwOiPavF7AId5koBfS3gHaU4jEr5HoP+Tj640rwdSzLgRXH
         CGvg2hqLOF9uvz+3E5CeSvTj3enmbqX+80sdsC35Zd7qOQo+aGoPD10v5P1GRogm6G8t
         SmBwu0rJxJRYkL0DIta9tRVhidpGkA7hnA3xNd4BY/X9OQ4C6SCSxLW+Mjdj89Br4mTx
         WRngpZCi2qvPMoFP3fI+CtwSkMcv4e8jOvO2SlpMmWE2HLkrx5kGzmbg+muJAYWduDSB
         UJoBL0pXIs27FYQQEEXDxE6N5YTsacs8zFatD3SuAWjcsNLfNJ3jCy9LLMzfXNd31Khx
         I4MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795797179; x=1796401979;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ji+oVVz/nzpz5puo4DZe7HwzAlM3UJiD3cXKn2jhyog=;
        b=pegQ6/FUMuWwEwcgC6HbVjmC/KnmgwsRiKxcrt3VRJVsdSLZpYFTAKg8jk+N0AqMny
         bKkDlcgQttBrTq5L/PNPG91FTUdZNHZzJNOIGvRkB96lgbybPrmY4Tejci1N+BotF7PZ
         mmFRdNA39j/dzQbn7ZgD86/dEegYoQ7pp7v95SgaaG7TPMO4jURKcmLA7noGcFp2ILsS
         3qVv5LOPTwF8NSVJTWljFCApJ194fuNCurs0V91Udl/GKKx/hCXWM3eE859tV5ON225g
         BQLFLjAyWuPKQVoNthDvDS7TyoqkfzRdVxQgZCXQaoGQgj80uMOQomUZflBV8EJ77WOv
         85ew==
X-Forwarded-Encrypted: i=1; AL+hErH1OYe+CQd0DJRBhF76FxTAwAN++ymV+3QgwqnnRzf3HpL8nD0Wl3dc9CvYMrdNHFTDTuk8jf+G7uoW+g==@vger.kernel.org
X-Gm-Message-State: APuU4Z9/xyr6GEkJFZmSQbaVB+sktB2inDLCFmlxY57FSfMN1TM/hiQ+
	GEzc8HolKHrMiabZ6mRapS0Thjo8QY7sT4QjmJ34z73KEijeBbwDC7qir12bKnKFD2t219JoGPU
	pTGM82jfM74EXfH8Nr2VfkPCV3e5+aJA=
X-Gm-Gg: AZFdTZdho0ePhtA670O20EunQOoKq8xht7Vpn/ubbuiqLRwg6+YnEko//ujwBL2o76M
	aRlM7ktCBn63YDB2azxNnBFtjdvMizsgeCWc2JZoTik3fqbnYKOLXbL5+1D/tKzB9XpMyZ42+Nl
	WWJVDgJpbB9ygrVbzcNNuylHAXt60aIUVSgsOJn5wpmdDctdgCQR2WN7URF3PRoqFOkyRL/hde9
	wZwp+EVTslAdrUiM/nT81U+Up76Jm6tBX9CQP/0M9Xxpsxweb2hzK5lSUsG/eZnr6a1gJAtpfOs
	PVHAigOm+ns9QSzy193Behjjgl1wNbg8KKifeDhXz/5HyHdr2gRGoIeMFiXwUpCQ/RX4cI4y7f+
	IMAxpDDoeuqvbad3pl8TaEf9nyONxmmOz5FWUydn+AfJMP32kTLuJDdisu+gXF1SLkM4=
X-Received: by 2002:a05:620a:1b82:b0:946:1dc:a276 with SMTP id
 af79cd13be357-949b35ac8d5mr4672679685a.18.1795797179191; Fri, 27 Nov 2026
 08:32:59 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <__OIHsqpwOqb8kxVYcd2PoPvNYDhN8XO6vyXiYMCCK6o3sfyJ1gl1GNdhcGYhdfBf43tQmn6Dt6cWXcSD1uiPA==@protonmail.internalid>
 <20261127134507.125513-1-hikmahgumelar@gmail.com> <012855be-7a95-436f-b0ab-11ae3134ced8@kernel.org>
In-Reply-To: <012855be-7a95-436f-b0ab-11ae3134ced8@kernel.org>
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
Date: Fri, 27 Nov 2026 23:32:48 +0700
X-Gm-Features: Aa3M54rpV9JJE-D1PefPa0XgKPQ9lDOZXhSn9zQqqor1iBHttCk79es3V0AufT8
Message-ID: <CADA=zOPWzK7Rq+CwY0izzjYdXGvTGKdSZMk2OUgN6_7oYV2xng@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] Enable front and rear cameras on Xiaomi Mi A1 (tissot)
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Bryan,

Thanks for the review and the suggestion. Splitting this into separate
series for s5k5e8, ov12a10, and the MSM8953/tissot changes (noting the
dependencies on the sensor series) makes a lot of sense.

For the gcc-msm8953 change, I will drop the board-specific reference and
update the commit message to explain the basis for using P_GPLL0 with a
divider of 8 (including comparison with similar Qualcomm GCC drivers like
gcc-msm8939.c and verification on MSM8953 hardware).

I'll re-spin with these adjustments.

Best regards,
Hikmah


Pada Jum, 27 Nov 2026 pukul 23.14 Bryan O'Donoghue <bod@kernel.org> menulis:
>
> On 27/11/2026 13:45, Hikmah Gumelar wrote:
> > This series enables the front (Samsung S5K5E8) and rear (OmniVision OV12A10)
> > cameras on the Xiaomi Mi A1 (msm8953-xiaomi-tissot), along with the required
> > MSM8953 CAMSS clock fix, sensor DT bindings, V4L2 subdev drivers, and SoC/board
> > devicetree updates.
> >
> > Changes in v5:
> > - Restore missing `select V4L2_CCI_I2C` lines across existing camera sensor
> >    entries in drivers/media/i2c/Kconfig.
> > - Move ov12a10 Kconfig/Makefile entries from the s5k5e8 driver patch into the
> >    ov12a10 driver patch to preserve per-commit bisectability, and add
> >    MAINTAINERS entries for both bindings and drivers.
> > - ov12a10: Call pm_runtime_enable() before registering the async subdev, add
> >    v4l2_subdev_cleanup() in the probe error unwind path, update the active
> >    subdev state and return -EBUSY when streaming in set_fmt, add the 35 ms
> >    post-powerdown delay when reset_gpio is absent, and match the initial
> >    V4L2_CID_EXPOSURE maximum (3372) to the default mode.
> > - msm8953-xiaomi-tissot.dts: Move `vdd_l23-supply` inside the `regulators`
> >    child node under `&rpm_requests`.
> > - Include base-commit metadata via git format-patch --base.
> >
> > Hikmah Gumelar (7):
> >    clk: qcom: gcc-msm8953: fix csi_phytimer_clk_src 100MHz parent
> >    media: dt-bindings: media: i2c: add Samsung S5K5E8
> >    media: i2c: add s5k5e8 image sensor driver
> >    media: dt-bindings: media: i2c: add OmniVision OV12A10
> >    media: i2c: add ov12a10 image sensor driver
> >    arm64: dts: qcom: msm8953: add CAMSS node and MCLK pinctrl states
> >    arm64: dts: qcom: msm8953-xiaomi-tissot: enable front and rear cameras
> I recommend breaking up your patches in three separate series.
>
> 1. s5k5e8
> 2. ov12a10
> 3. SoC depends
>
> with #3 depending on #1 and #2. As is you need people to pick up patches
> individually within a series which is always tougher.
>
> ---
> bod



-- 
Best regards,
Hikmah Gumelar
