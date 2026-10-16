Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC053955EF
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 10:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792145188; cv=none; b=L24lFK63kjjsRor7Ziezo5sl4kESdgOWh+Jmng95USWDsjATzSvMGS6TJogix1AqptoMSgpJ6LCgFBz6sVjUPpM+aGZwSiKK7xffP9SeoYgCBaAWveb7RK5TYsmKoriZA9Xz3POeCxppy0vTmHOFvAD/QY5hwNEboejcH4ifPZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792145188; c=relaxed/simple;
	bh=HDb6dEAlQfqZ6w+pZ27i4VhJh9De9UuXiV4QYl9+3Es=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lzbcnF/iqxFOqIZQBMk6IUGuywoPKC5IpkhLWm2J5ST/Gt3oRDkmhKc8pwkS7Rt8LvJaclpLuC0u2iq3RaCFB9F3wRZII9qkAFpkLhZeVrlsuZn9Ch//+8x6JyUYDLHV54FEMZtMc3rNPnL/nC1ifwMn14FraUgj1g1RzWKEHQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BkE1d+lk; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BkE1d+lk"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-486e70f2457so1166947f8f.2
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 03:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792145184; x=1792749984; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kZIV8SpDryJCkEdmLv3viRxRvmm/nGJEMBGvh6BKJRw=;
        b=BkE1d+lkOibyPPHKbYu/5LrI+PtWmFW1AKMnN+2+MCphdNXLUaU8P40SJRDLrVB1KL
         fJjrtvB4K+WVH/gqkuOqcsJU/thpSJhGO4FVFY9gglVmAD8Io9lBcfSgmvemZqfsnApx
         +CbBsf18hP0ctq5IhlRU0nXbp/7gbZ+eYLfvJblsG/8DeCuvhps0Z3TXtBfg/tvXjYli
         Yto8Xrb/0Ro7RUZhQpaQP7vkPfMa9dnI42YmAw/6aVwhy9cjNiKL8nFfVAgqnu4lRVgF
         3wWa4RXAGQI3TAbJXJaMwmuqCiiskCKzGnhpqTrzkvv7M7yyXzjQh0ik5h+r78XmmORD
         71og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792145184; x=1792749984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kZIV8SpDryJCkEdmLv3viRxRvmm/nGJEMBGvh6BKJRw=;
        b=1r7HXxlJMwmtEDFs9zAAr537sN7LIybNiZ9gEsfRPg/c8CK4CSLnL2qh7A7Pb+fajf
         q1GgfL2sBHAHQm/cuitmJmrUz6L5Eza7i31ZX5fHoVad58UfyJCD1YdmFL1o9GTlTqXJ
         iZa3aQ3N1UD55uWxgbZ2TbmB3+/m1eKwEMBFfBRhKdB38LfUYV/GKVQC3X+ovdoCdc4b
         +OOtL/s/dDgK4ybEUO3FCboEl1ofmWmlUBStmTN0Bu7x/SLpOMtwnZxmDleI5/Q8vYUR
         yyPJGl90eqVG0+hcAuZwo5M9VjeZCtAgXBMN46VnHmFVLCzIdTpnQFoT/e9IGxvp9Mb3
         1qPw==
X-Forwarded-Encrypted: i=1; AKwUvBx58XQ6PUXSnidw61NxmdGcLVaxEEIZlY775RpNwQ9hlFC78RvtXsI/iJk36NICVICxV/2bQvcgMFX2rg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLbAgPKAenW/R6ihS1dOki7JQ2+m8ja4IciMa6kEfRnlDToDjc0
	liXQoLfqNrr9bqfZjSBFHdC6YzHOYSDIf5gNxZZViNJdTAGEnKtOTzym
X-Gm-Gg: AYBFou3hWtyaqD7LFWUjMo1zUUuMdehMRVzjwaDG064orXKRBEtwUbbOTWmoJeydYLo
	c9NcPMq8t9IeiL+pBBVvvZIS1j/ik4PWZko/ZDep+u32ZoZCprzxyDp4n3CQTR0QYCO8FpqIWEG
	outb7PcMCH9d9aCskHFB1zRKC/bsuUdcBWDNQ481SgSc2OQQf5Ue5y+9fdUclLD69lDQUnajtzI
	wwfeEHIeLGtxUpA4tS1Qh3kszr60YoPX7YHZQIybQr1Xebj8/rN5Tg/5CSct7d3kabKBlqPE5G4
	3wpTh03NLClp/laEUpLkslO/NpydaU8o0oJqwa4yy3OLOb2sGPtNCEK/wXwnczwS1x5jAsHAlGc
	AZKU5F9MA+jnzfdGeQBVOalspOppgeWFtxiU0kYN9gDhR11iRDC0U2wLDdxk7fsNUCfTtR+dSBz
	ViLAI8n4Ovv4ZLoPKE+QPiP1psSE38kDnjkSAYx7aPg+dhyNik1IAzIBzXRaX0IAQKlVtAJfV/K
	Wp54uuRBcWDP86v62Vg+afKGjGbbk3jXxv6RWdukCh/QSKxz61G6Glv/ZlVNE5SVX91+XYewbRp
	B+qWEWI=
X-Received: by 2002:a05:600c:8208:b0:4a0:1b14:d00c with SMTP id 5b1f17b1804b1-4a18e446f55mr452412475e9.3.1792145183665;
        Fri, 16 Oct 2026 03:06:23 -0700 (PDT)
Received: from SP11X1e.cable.virginm.net (cpc99340-croy26-2-0-cust244.19-2.cable.virginm.net. [80.193.62.245])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8de7230sm45403835e9.14.2026.10.16.03.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 03:06:23 -0700 (PDT)
From: George Neacsu <geocausa@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	David Heidelberg <david@ixit.cz>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-phy@lists.infradead.org,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 2/4] phy: qcom-mipi-csi2: Add C-PHY support for X1E80100
Date: Fri, 16 Oct 2026 11:06:21 +0100
Message-ID: <20261016100621.427612-1-geocausa@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <7aed254e-18c5-481b-a77f-576944fff1d4@kernel.org>
References: <20261015-x1e-cphy-rfc-v1-0-1f3fa9af940a@gmail.com> <20261015-x1e-cphy-rfc-v1-2-1f3fa9af940a@gmail.com> <7aed254e-18c5-481b-a77f-576944fff1d4@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Bryan,

Thanks for the reviews, and thanks to Loic as well.

The series is on next-20261015. There, phy-qcom-mipi-csi2-3ph-dphy.c is
blob 966d79c98, the same as on the media-committers next branch, so I
think your tree has a different revision of the CSI2 PHY driver. 3/4 and
4/4 also sit on top of David's "C-PHY configuration on Qualcomm
platforms" v9 [1], for phy_sel and the C-PHY link frequency, which is not
in -next yet.

Which base would you like v2 on? If your branch is public I will rebase
onto it. Otherwise I will use -next plus David's series and spell the
dependency out in the cover letter.

For v2 I have:

- 1/4: lanes -> trios, and a PHY-layer helper for the C-PHY symbol rate,
  the analogue of phy_mipi_dphy_get_default_config_for_hsclk()
- 2/4: dphy_/cphy_ naming for the init sequences, if/else instead of the
  ternaries, the D-PHY and C-PHY lane setup split into helpers instead of
  the goto, and the helper in configure()
- 3/4: FIELD_PREP() with a mask for the PHY type select
- 4/4: the helper, and an enum phy_mode variable passed straight to
  phy_set_mode()

[1] https://lore.kernel.org/all/20260617-qcom-cphy-v9-0-83da8a8e4e44@ixit.cz/

Thanks,
George
