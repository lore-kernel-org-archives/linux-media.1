Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D29471D1C
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 09:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792142027; cv=none; b=cXYxKyXhd2pNFxcegdPgX7THgFn90sIGQYuXeR4cFlJS3yy9gdYGYI/Tkz1IfaZphv4JW/YerS8kD1q+42L8Pps2+a4KYY22vzs99LyX0dCvEPsZvRuvtlLCI3mxKSUT93XlzeGjL73+qPbEk20Oc4hFuy3eGB8bGJCmgbpwJxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792142027; c=relaxed/simple;
	bh=jnFEmGSygWYGhG5T2Ju2KliwYaheLg8Z/WkaH0FAMYk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u8CIuHVMxhfPC/5Zfh/yxIKz5IPZEDvbh+iu/J/OGEE2T7GnkpMZEn2rrw2qR2nGPweICAhhRH43sSwd1n7quawq+ovOvM0hexHBysLTmdtGpbFFqGO0ElVGlog/qIzE9uEniy0JgZU/MuCfdmqCq9czQ72f54cj3LNFRKVYNrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jlsb6Lkg; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jlsb6Lkg"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e011d370dso219924f8f.0
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 02:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792142024; x=1792746824; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1yIHWFqFvTEQhLbqkq1xydFjXcFxrGagw9+5Eh0/eio=;
        b=jlsb6LkgAbzqqThm4dlhM4Zm2ktocAXWRcOkkXOXFkd9Cy8hya8rk3Cd+HMTSynYMU
         1z049QVtsPBJ35s/BakG3hRLCKgnoMHDd4tkq7ICMRwLb3AflumpKi+ZMkD461NHGWV0
         9p0ilEOAd/kXFGLudYBHosw1Ayqg7cvVOQUV+ZiZjwTj8we6v88oP9HDyBxj6mu2+WB2
         fr6WyaBNwLym/kjZr1VgM7q+OyMl39ORzJnXe2zfHQQaz/RFt8eclHyd87MkRKaWvBY7
         IivTqhYdvQuL3QuhKHM0xkLiBZqe2GQwFyK0atJzloD2g3ZlyC2E+hYO/GcGxWMfQ9oi
         VA6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792142024; x=1792746824;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1yIHWFqFvTEQhLbqkq1xydFjXcFxrGagw9+5Eh0/eio=;
        b=Jnl5mk17htEVyuuQGsHEfOd9f3oIGvjHh4UrREfpmkTtzX6+55KeGR/vmKQ5QLLX64
         Lzt9uvviBsaCTqqqLNjyA1nVUYMcXhltKYjj3c/MheBzirorcPf5ybGlMF+yK44yywOO
         9Y3h5suMoX+n4Q5H6X1F7SubIQeq6JVdMbmqxqf6IAbmSkSzk2+ye/oe+wQvV5TjkEgm
         JzLa2XVRdUcuQPaLIB25W7SoonldvosuQQdTSyKM5Pnhb27POe2B5+12/CyzkLlp/PXL
         TOVVXVUn8S7KchnCZUSrHrLMAWiEOe4ZMLxV3yFJU6nZ5iWMHBocOVeTp+AimjucTSWK
         5uCw==
X-Forwarded-Encrypted: i=1; AKwUvBz4l1FvseyY7zY+UO3lFOSMMsCBAL6jrmRUisc1f1BOWo6+x9THVpGxFT6Gvpi7Hzjqka2jaM8wULKUBw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJbgM3dM3eZrWXi8W20a/2o6KK9aWXG1yDVXbOIAkW7FU2CMSxD
	PO/FyY75iGyrAKtDduIgcjQ5QlRP5jcnEYnYzKydbGFs9K9Z/vDKRkfIra5u9MgYrhY=
X-Gm-Gg: AYBFou1qwMVjaxRqTRU0/WtD/tYFGFGPeZZSVu2HmSlGxHw+gXHDy6it2tRJWCG/NNC
	zZ3Vc+e6cmMJ+pRfgzA0BvWuKsjftWKFp7gCC+ir11QgpQOTUOmkKAqoTc9J8Qi28p4ovQKUQHL
	UGwunmcaISSmRogBQdYtSPhjZ0ZqU6bTuCOZZ86ginMw9Plg557B7+o/thJBS79RCywjicvibIR
	u+oUT8l+tUhqcvRS5bV7M+u7h3EMJ/xZrybp8Fn1reb+ZRUlIwJ3GE7svQ+2UzfiK8LTMyZvkcZ
	yStPZV7FWn0vSp6xWUyXWfYLAJb457HpZ7iZMFB4wspC4XojWi2HozGw9Tz08uJpQDab5PJkoBf
	dnWnq9whW+pSuN/AxwNlSKNUGEQE9lRW5zd6DBipoMQMMvgbwnTn9EWCWye0GwBto40OD7cmy7g
	M+/nvKfP7x1EoTaHdPgeOff9Xng/H8uBeZn1hJD0NNohVg801GLeVVSbJXJB9XTw0vb6mHiYjSg
	yM9xqpJ9oo=
X-Received: by 2002:a05:6000:60b:b0:487:b28:c82a with SMTP id ffacd0b85a97d-48dbace40damr43712737f8f.47.1792142024343;
        Fri, 16 Oct 2026 02:13:44 -0700 (PDT)
Received: from [192.168.0.167] ([109.78.92.136])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f5177sm3626767f8f.30.2026.10.16.02.13.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 02:13:43 -0700 (PDT)
Message-ID: <7e5d951a-6e50-4dc7-b9fa-79146ad7c773@linaro.org>
Date: Fri, 16 Oct 2026 10:13:41 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/4] phy: Add MIPI C-PHY mode and configuration
 options
To: geocausa@gmail.com, Vinod Koul <vkoul@kernel.org>,
 David Heidelberg <david@ixit.cz>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261015-x1e-cphy-rfc-v1-0-1f3fa9af940a@gmail.com>
 <PoiQ1yKIrL603-Vkg8cV-j80USThOheuNuXcG_ZhEPuSRP-KLZBYJoj9ormog-3yCjbGRt0kKRXOGrahJOpNMQ==@protonmail.internalid>
 <20261015-x1e-cphy-rfc-v1-1-1f3fa9af940a@gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261015-x1e-cphy-rfc-v1-1-1f3fa9af940a@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/10/2026 23:20, George Neacsu via B4 Relay wrote:
> From: George Neacsu <geocausa@gmail.com>
> 
> The generic PHY framework has a mode and configuration options for MIPI
> D-PHY but none for C-PHY, so a CSI-2 receiver has no way to ask a PHY
> that does both for C-PHY. Add PHY_MODE_MIPI_CPHY and struct
> phy_configure_opts_mipi_cphy. The options are the two values a receiver
> knows: the symbol rate on each trio and the number of trios.
> 
> The first user is the Qualcomm CSI2 PHY, whose X1E80100 instances carry
> the C-PHY front camera of the Surface Pro 11.
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: George Neacsu <geocausa@gmail.com>
> ---
>   include/linux/phy/phy-mipi-cphy.h | 27 +++++++++++++++++++++++++++
>   include/linux/phy/phy.h           |  5 +++++
>   2 files changed, 32 insertions(+)
> 
> diff --git a/include/linux/phy/phy-mipi-cphy.h b/include/linux/phy/phy-mipi-cphy.h
> new file mode 100644
> index 000000000..e3f0a8257
> --- /dev/null
> +++ b/include/linux/phy/phy-mipi-cphy.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __PHY_MIPI_CPHY_H_
> +#define __PHY_MIPI_CPHY_H_
> +
> +/**
> + * struct phy_configure_opts_mipi_cphy - MIPI C-PHY configuration set
> + *
> + * This structure is used to represent the configuration state of a
> + * MIPI C-PHY phy.
> + */
> +struct phy_configure_opts_mipi_cphy {
> +	/**
> +	 * @symbol_rate:
> +	 *
> +	 * Symbol rate on each trio, in symbols per second.
> +	 */
> +	unsigned long		symbol_rate;
> +
> +	/**
> +	 * @lanes:
> +	 *
> +	 * Number of active trios.
> +	 */
> +	unsigned char		lanes;
> +};
> +
> +#endif /* __PHY_MIPI_CPHY_H_ */
> diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
> index c480d6cb4..f12337834 100644
> --- a/include/linux/phy/phy.h
> +++ b/include/linux/phy/phy.h
> @@ -19,6 +19,7 @@
>   #include <linux/phy/phy-dp.h>
>   #include <linux/phy/phy-hdmi.h>
>   #include <linux/phy/phy-lvds.h>
> +#include <linux/phy/phy-mipi-cphy.h>
>   #include <linux/phy/phy-mipi-dphy.h>
>   #include <linux/phy/phy-thunderbolt.h>
> 
> @@ -42,6 +43,7 @@ enum phy_mode {
>   	PHY_MODE_PCIE,
>   	PHY_MODE_ETHERNET,
>   	PHY_MODE_MIPI_DPHY,
> +	PHY_MODE_MIPI_CPHY,
>   	PHY_MODE_SATA,
>   	PHY_MODE_LVDS,
>   	PHY_MODE_DP,
> @@ -69,6 +71,8 @@ union phy_notify {
>    *
>    * @mipi_dphy:	Configuration set applicable for phys supporting
>    *		the MIPI_DPHY phy mode.
> + * @mipi_cphy:	Configuration set applicable for phys supporting
> + *		the MIPI_CPHY phy mode.
>    * @dp:		Configuration set applicable for phys supporting
>    *		the DisplayPort protocol.
>    * @lvds:	Configuration set applicable for phys supporting
> @@ -78,6 +82,7 @@ union phy_notify {
>    */
>   union phy_configure_opts {
>   	struct phy_configure_opts_mipi_dphy	mipi_dphy;
> +	struct phy_configure_opts_mipi_cphy	mipi_cphy;
>   	struct phy_configure_opts_dp		dp;
>   	struct phy_configure_opts_lvds		lvds;
>   	struct phy_configure_opts_hdmi		hdmi;
> 
> --
> 2.53.0

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
