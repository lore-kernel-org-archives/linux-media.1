Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794354981;
	b=0tuJ7NMWnGZxHG7WGSqxcDmdrGpU2Bh26aZ7GZic3wzHGICI9qONjF65lvOdRoavi2eP
	 XkY6ph2GVsouUqnbX6clYPAU5ZqB+HL6vZ8FdWNThlFIFOxKHkwoEpxzpDwQKhTa/wvv9
	 6LJup9oNoU6i5B/w9MCw2bSlRko9jI33ojbo1iG1dL+Lgjc5ctQkdfBhxuRYoCZmMW1wl
	 vIZsptCIAO2nbGR0ZtOYkkrmCDFvEkon2kr8gxG2ln8rZWlASBksaUgQH3AyKpxnmg0X6
	 c/HQplt5yph0U0ZM4Hk+lAq1gpG0I11JsAVivaOLGOK6W+L2VfF/3jUptegh/f1DBDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794354981;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=TbgkfmRSlQR0RSZaLLsWqAT5L9ZTG2kkyMrzBfuV6Vk=;
	b=zAnpTIZhdQP01NuN5sR5uqm9s1RNFmYV3VRL2zkz2XDRilVCU8PnaEjw4hVgHdYsQhtj
	 X7Zdcz2j+P/glU85YEDfkIYs1bocOjiDNDFTEvI0bOel5M6GFbc3y4MzCXfcA0Jel95WG
	 9pfYgTD9fUMBE77cJXxoX39pj6cNQ66E4uTaQENmatFlRLohLs1w7a43P6PvQ5QxALWtJ
	 H/4oRqNQagSv3XBNCZnGO86Gij3Qs6OhNqAAAMshYaoYILg3bygVHSPCdR5J+7k3ACpeX
	 BLgkMFEmqtrmne1W9d8TQgnXytKxIQDGkTVG7auQgiUEzc6ZZ83nfX6J4Zl57rbksJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=andrewgigena.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.224.43
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C849606A31C
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 23:56:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C849606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=andrewgigena.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-679aeeddc6bso3344120d50.2
        for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 15:56:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794354980; x=1794959780;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TbgkfmRSlQR0RSZaLLsWqAT5L9ZTG2kkyMrzBfuV6Vk=;
        b=kAxF9674waPQ1eIAA8u75SiVEERcdpcc4dWXHVDtyhUF9AvKxFvUs5g/t4JeEiKWKZ
         52DO3Hz8htvRpCTtMipeIthUFqGDyk0jBPlM2leY6MTknE3bWSnpZdBGjvyJcZy+o0yl
         DXdZAq9G6IPSx4mAhMktztRvP8if6ZLUQM0ZL2WOD7O5FpyeNDifAxkL7i+nS/PWEzTI
         pimimTwC8+/dsNglFngXfgc21Cm3WrDZhIMyDtuhoggsGqS1PiKjp2N3/+ov48oD1OSE
         aqTxciQGNmintDplbkQ9UwfbERetwez0TZuPNmA+WTv2hnCoedAHF0+JkmcWmkSFrnYt
         0HJQ==
X-Forwarded-Encrypted: i=1; AL+hErFon6hXGKmLCubEWpf/ox1pCmZnaGh5dnf1I9klROXeVVXDpcf5b+A2pmgTbdQvGaMFcoz/8VTRPv8Siw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8pvOIsip9YeqDbi9v2Ni93+hVPlSHp2+NMRUSOqBvRBS/FS5vr
	867T1rvdMCB2MbNPx83px8vV+jFKxrdJk9nO32urzcOHaw+VrUjZXFXy
X-Gm-Gg: AYBFou2RZXt3LYoZwEoQYz13hUlieJhYZT2T4BSsN7qWsZgSZ1GUYLCtoeaT2FfSz6j
	bLV9ZYtZukL5Xhv2DjwvkeWvbco+8lj2tv1ox9DZgkuG0pwEToN8priK2pxhbbQfIXt4x6x1oHD
	3CIpHszT42SPXIr+/ER+cxl7wL+3dHWMK7DtwTu9F8wvYEJ0p6mrSRSGlCtl6f/WizE6RyR7iVN
	wsaT0rmdQmQITtF2/AbVSxdPPS3h57LtTJKcBoa/f+3VbimIdzVeUVwMOPir43x139EJ2BNA1ty
	oO4i/GuwX0r00pCaZIl2HnAsqdOgW+sZxHcPem7XKAgyMT7ETT27gzwowCejtoFJlc9ixBbSMds
	THR7hlwDhdE0US79ZB9nlw9KXDaH73mZHDd0dvsMMNRNbLP3lq4kuTaX1rv9BSTW3mnjxGAoRhO
	Gp+5GOcqf3KzjGiM6WR70zMZfMr9GS3cApWF/AchyCWhAxILxPya2EiPS8SH9KXxcQbT1vahJzP
	g02go9UFuYoFB8WORd1JrQfOtbP3rHvTUj41EXSN25EuJCZiMfxWIblnAjQu6nG32EixCBRADyw
	M3iDepY2NBbMKz+WLwBVooU/zIGLjVqeDEDww9s1Mx8vuNw9kBCzYCo7gaRSXFzZP8IjWw7R
X-Received: by 2002:a53:ec04:0:b0:679:4176:47e4 with SMTP id 956f58d0204a3-67c6811a961mr389098d50.99.1794354980450;
        Tue, 10 Nov 2026 15:56:20 -0800 (PST)
Received: from ?IPV6:2800:a4:806:ef00:2f77:7097:372d:6d14? ([2800:a4:806:ef00:2f77:7097:372d:6d14])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c58a294ffsm3158931d50.23.2026.11.10.15.56.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 15:56:19 -0800 (PST)
Message-ID: <fb65a7d2-5656-4659-bd96-17fc5bea2b84@andrewgigena.dev>
Date: Tue, 10 Nov 2026 23:56:13 +0000
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/7] phy: qcom-mipi-csi2: Add SM8150 CSI2 DPHY support
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org
References: <20261106-sm8150-v7.4-rc1-camss-v3-0-0103e8a0bbcd@andrewgigena.dev>
 <C4VI5PNThYmwD0VGOO9DvvHRRydBUz2k5DOLjkianYgYaz4G3-El6cDpnQh2siR4mMwjeiL4_Yp2xEAYeJDJ2Q==@protonmail.internalid>
 <20261106-sm8150-v7.4-rc1-camss-v3-6-0103e8a0bbcd@andrewgigena.dev>
 <88407f72-0c6e-4e46-b97b-7031c237dac7@kernel.org>
 <83c6281f-1887-4481-8c63-957b4bc856b9@linaro.org>
Content-Language: en-US
From: Andrew Gigena <mail@andrewgigena.dev>
In-Reply-To: <83c6281f-1887-4481-8c63-957b4bc856b9@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Bryan,

> What you could do to unblock your series and not have a dependency on
> another series is cherry-pick the necessary patch.
>
> https://patchwork.linuxtv.org/project/linux-media/patch/20261102213936.1251316-1-anusha.nandi@oss.qualcomm.com/

I took Anusha's approach and dropped the dev_pm_domain_detach() hack.
Single power-domain SoCs now use dev_pm_domain_attach(dev, 0) and the
loops check for a NULL pd_list. I folded it into the PHY patch with
Co-developed-by and Signed-off-by for Anusha, so the series has no
dependency on another series.

On your other points:

> Is there really no AHB clock to be listed here ? Seems again suspect.

There is no separate AHB clock. The "core" clock is cam_cc_csiphyN_clk,
whose parent is cam_cc_cphy_rx_clk_src at 400 MHz, and the second clock
is the CSI PHY timer.

> These are not the correct names

Renamed to vdda-0p9 and vdda-1p2 in the binding, the driver and the DTS.

> But why ?

The SM8150 timer RCG only has 19.2 MHz and 300 MHz. link_freq / 4 rounds
down to 19.2 MHz and the settle count comes out zero, so the rate is
pinned to 300 MHz through timer_rate_hz.

Best regards,
Andrew
