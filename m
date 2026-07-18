Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97DBE282F00
	for <linux-media@vger.kernel.org>; Sat, 18 Jul 2026 02:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784342737; cv=none; b=Swgg9Xtfkyc0TE5pPbimV3f0rpD6oWUcQxuj0Y1YgZACnoB4gS92fLDDj+MgpFeC65Ck2MCmTDHNvSD/nkpYY9azFOQwONzZjIJeugMBiNK2qqdhI7zCCJGFpamHkFNjS+THhj4yfaJe/kTv/aBMgWIGuLAvxmUcvl4ZB89H3i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784342737; c=relaxed/simple;
	bh=EzqyYmBPaZIxfSvNj9HW+FHirJDDeOZGcrGA2ymSfWw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iTnjaRqXmySuedgNq4AwAAitXj8X/hdFfXHBHRvnywxlbuOGkKQEf+W8Ezapityobs6XgJ/YV39tYJ0nuj5LhozWEcJl+49se9nu4KnBSOB1YqORAIAMt8Wz3IfTAuSL7np/Ku0s6Rr/b53RyzBLPrvmRwknP777f+13b5klklE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OB/kWNVs; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OB/kWNVs"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso19889495e9.0
        for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 19:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784342732; x=1784947532; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VkJMM3uGJvAjbd6BrzjAmq3zIo30sUU7oRO1KxdmACY=;
        b=OB/kWNVs7We4RlwNG0MaEaRzTKgIEKyqndFenr6dXvODFIoWTpmuxACNjCn0/XtIK0
         tDl5PinggC5jH8ZI8d6jRX/ZIADkFOvh93UxDzPjlYE/NXkwuf9niCorYTFsA6vUtGdc
         UzEjYd8FV4tY9IKabKPhEX8TrAKtMm6HddqUhzybivMsW9o8r9pyjDX03ClxTR9LqnvL
         Lkt2rU08izFDjf42yvtVkqZDQuSb1/BjcuWXc358s2JaHiJtCP202XmfzbQS2JcdeEKa
         3DvAwGvmUJAOW9xHT6fXy/VMq9orbbM4aboAAojLxFxZgkIKhXHw7CAf2ZCQMyH5HTJW
         SBTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784342732; x=1784947532;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VkJMM3uGJvAjbd6BrzjAmq3zIo30sUU7oRO1KxdmACY=;
        b=OFg4/RKTs0o//ZweMVX/ZAg7UAJcGZz0DToU5/5ZCOicWj2uxWpqX7XDCicFYZ6IB9
         CF4+BKTinnGPn0PRyBz8e08tyMN07w02oTKEilc6P+dVfAP5fDhfE0jGWNV7Zko/TAj6
         Hnad0fT3nnUePCbm1qgQ6Ves/Ks+SnpsTGBy43ssJGDtT+s2mFgBGVx3kRPifzhEwDDS
         u2ex1QGC926/6rEZRda8jmgEdbfJa97eLfeTKeheQZ3g0C2ZNZqpTNK5Bzg67S9QBR4r
         vi+nOIeHGii+rAHRnCwxmD3t0F/NK/DWcTHojVJDau+c3MSotvVjdffsf2lQXCKEQuAJ
         Y8Ug==
X-Forwarded-Encrypted: i=1; AHgh+RpDSJRbJ6206nwE74D2Cv6cYu5FAejSpR7JUIKLYUxAoW5Ffa61kYhYqT05bGQKoAXybmSXc3de6qxQoA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/AmO8K7NWua8ON8kvlXr5UhGQAkig+yKDFqppvA4JjZnnMPsR
	3UXhyyz7m8T45wztMcIUAi8GIlWD/AwhvMCucY5VfNKDbZbFXrcm92Icc50q1aLItIY=
X-Gm-Gg: AfdE7ckFGidtr5knBRyUjDwa18PPsocx2s5iW4xXb90+Mm52sKGKm9Cwh3Iaffnp95c
	/gl6ISyEOmLc3wECV7G+/ryvucvFpP8/ubCNumQiTNx69EH84MYVII+TyKjQOrE3MufpsOsjNEE
	qol5qT5kKgWJoEjzFZM31RaRYrr2wKBSGHQVvjNq2G49YPmVBQ1X3h4SyY+TTrLpVAbFSDQdlhy
	6C+DFdFoXfzqj8KyzNyObmMsx3YZRtLZ/b/4DAB8cwzngfXNM35lJb1rK096v+9UzZxf3WWrDgR
	V+GpM0WH2m3HGb9Biy0KOuo/APcBJcgfiHPg4R65RCT9bVqrFB9oO2lagZMzIWyddmUj6+/VCOx
	4P1a1uMtfQ+Ne2KNlivnK2E0GOLIzViC8Eq7pViUZ0jn30D/J28RgVXgpgErkftFA/ovLoLc4a3
	qNv2wZuudWTt/Y
X-Received: by 2002:a05:600c:6a0c:b0:493:a5d0:d1a1 with SMTP id 5b1f17b1804b1-4954a40bd0fmr41829915e9.31.1784342732154;
        Fri, 17 Jul 2026 19:45:32 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.77.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63eddd27sm8614952f8f.28.2026.07.17.19.45.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 19:45:30 -0700 (PDT)
Message-ID: <61d91ac1-636f-4b0e-b3c2-d51207cbd8bb@linaro.org>
Date: Sat, 18 Jul 2026 03:45:29 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] media: qcom: camss: Add C-PHY support for sa8775p,
 sa8300 and sm8250
To: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>,
 linux-media@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 jigarkumar.zala@oss.qualcomm.com, gjorgji.rosikopulos@oss.qualcomm.com
References: <20260717231331.1229693-1-anusha.nandi@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20260717231331.1229693-1-anusha.nandi@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/07/2026 00:13, Anusha Arun Nandi wrote:
> This series extends the Qualcomm CAMSS (Camera Subsystem) C-PHY support to
> the Gen3 platforms, adding C-PHY mode configuration for sa8775p
> (CAMSS_8775P) and sa8300 (CAMSS_8300), along with a dynamic, data-rate
> specific C-PHY register programming mechanism.
> 
> It builds on David Heidelberg's C-PHY enablement work for Qualcomm
> platforms:
> 
>    - Program the common control registers and prepare the CSID RX path
>      to select between C-PHY and D-PHY for Gen3.
>    - Add the sa8775p C-PHY 3ph lane register table and wire it up for
>      sa8775p and sa8300.
>    - Introduce a data-rate selection mechanism so the C-PHY PHY register
>      overrides vary with the negotiated link (symbol) data rate, with
>      tables for sa8775p/8300 (1.5/1.7/2.5/3.5/4.5 GSpS) and sm8250
>      (2.5/3.5/4.5 GSpS).
>    - Validate that the local (CSIPHY) and remote (sensor) endpoint
>      bus-types agree, catching C-PHY/D-PHY mismatches early at probe.
> 
> Rebased on David Heidelberg's C-PHY series (v9):
>    https://lore.kernel.org/all/20260617-qcom-cphy-v9-0-83da8a8e4e44@ixit.cz/
> 
> Tested on sm8250, sa8775p and sa8300, on top of the v4 revision of that series:
>    https://lore.kernel.org/all/20260301-qcom-cphy-v4-0-e53316d2cc65@ixit.cz/
> 
> Anusha Arun Nandi (3):
>    media: qcom: camss: Add sa8300 C-PHY 3ph lane config
>    media: qcom: camss: Dynamic data-rate specific C-PHY register settings
>    media: qcom: camss: validate local/remote endpoint bus-type
> 
> Jigarkumar Zala (3):
>    media: qcom: camss: Program CSIPHY common control registers
>    media: qcom: camss: Prepare CSID for C-PHY support in gen3
>    media: qcom: camss: Add sa8775p C-PHY 3ph lane config
> 
>   .../platform/qcom/camss/camss-csid-gen3.c     |   2 +
>   .../qcom/camss/camss-csiphy-3ph-1-0.c         | 394 +++++++++++++++++-
>   .../media/platform/qcom/camss/camss-csiphy.h  |   6 +
>   drivers/media/platform/qcom/camss/camss.c     |  28 +-
>   4 files changed, 420 insertions(+), 10 deletions(-)
> ---
> base-commit: 0e35b9b6ec0ffcc5e23cbdec09f5c622ad532b53
> change-id: 20251109-qcom-cphy-bb8cbda1c644
> 
> Best regards,

This is great work, thank you.

That said, I think CPHY embedded in CAMSS is the wrong architectural 
direction.

I was thinking we could add in David's CPHY stuff as a holding position 
and also because its at v9 BUT if that means adding three more SoCs 
ontop of that... that won't fly.

I understand its a priority for you to get this stuff upstream but, I 
think this _shouldn't_ be done at the expense of adding up more and more 
technical debt.

CPHY as a monolith in CAMSS is technical debt and adding it in to the 
existing CAMSS as monolith is just a shortcut around a problem - that we 
haven't merged the CSIPHY rewrite yet.

CPHY should land in the new driver.

Aside from anything else - upstream Linux needs CPHY definitions that 
make sense for the community.

inspiron14p-linux:linux (arm64-laptops-v7.2-rc2-camss-v9*) $ grep dphy 
include/linux/phy* -r
include/linux/phy/phy.h:#include <linux/phy/phy-mipi-dphy.h>
include/linux/phy/phy.h: * @mipi_dphy:	Configuration set applicable for 
phys supporting
include/linux/phy/phy.h:	struct phy_configure_opts_mipi_dphy	mipi_dphy;
include/linux/phy/phy-mipi-dphy.h: * struct phy_configure_opts_mipi_dphy 
- MIPI D-PHY configuration set
include/linux/phy/phy-mipi-dphy.h:struct phy_configure_opts_mipi_dphy {
include/linux/phy/phy-mipi-dphy.h:int 
phy_mipi_dphy_get_default_config(unsigned long pixel_clock,
include/linux/phy/phy-mipi-dphy.h:				    struct 
phy_configure_opts_mipi_dphy *cfg);
include/linux/phy/phy-mipi-dphy.h:int 
phy_mipi_dphy_get_default_config_for_hsclk(unsigned long long hs_clk_rate,
include/linux/phy/phy-mipi-dphy.h:					      struct 
phy_configure_opts_mipi_dphy *cfg);
include/linux/phy/phy-mipi-dphy.h:int 
phy_mipi_dphy_config_validate(struct phy_configure_opts_mipi_dphy *cfg);
inspiron14p-linux:linux (arm64-laptops-v7.2-rc2-camss-v9*) $ grep cphy 
include/linux/phy* -r

Lets do _that_ work even if it takes a few cycles. Great to see qcom 
engaging with CPHY - IMO if we do it right in the qcom stack it will 
establish a good base for others to follow.

I'll go ahead and ask David nicely to rework his stuff into this new 
driver. Very nicely, we like him.

https://lore.kernel.org/all/220260718-x1e-csi2-phy-v10-0-5720a7888953@linaro.org

---
bod
