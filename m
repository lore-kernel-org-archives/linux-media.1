Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46ACF3B4EB3
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 11:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792148805; cv=none; b=hbh+duYABrdWlt9vKFK1pUA2YjL50anq8qzcIoeTAbsijgjpU3E29TLGz6bjiM32lKEF7lIb4CF2l6WJ02qn9dS8Di9vVTYWkPu3JqL//knnXx7NG149G380YGT0Hmm6fWCVEpZR3q3ojgbHVfJM3/VH/bTe8ljJ3lgXLgw3PuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792148805; c=relaxed/simple;
	bh=1BP3OU5iinrec32pP5DMCn4fySLDjSuZemQqebqrhKs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EffBhNJOqD1RkVEZze7/W4hvt5qHqH9d4yAnuGcpHf38c5N5N9pB7ZMRn96qPYjk4OvvqV1f/Vsd5lPs42EDRu7QS9uu4PKCoZMm3HNG7dbAf/9M5W8EOU9xDAfscFcwRXvP53Zi1K//+Xbk8ylSihkeCJVSTIacnGiwBCT5X/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ESj09Y43; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ESj09Y43"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso26964515e9.1
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 04:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792148802; x=1792753602; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BhJhQfG6m5IjmjHeVsqFyoc/qVFSsNb+YvIuAxHlx2E=;
        b=ESj09Y437Yd7ChKt64/8190ixvdd1GI7Rpw0NCi4KlLUSQhvg0mNol82R/hjz80H3B
         xGSxSkMo/STmJ68ETvUv4W9RPyJdmrBQ6HgcV0qpIrHh/sxjG3a09VUMQKHy/MM9VZq6
         m6fL35gsxbqFqbVi8IHR+Ip+yT97kUZOB7X1eevgBvfLQ6kr7siDThky7GLHatX9efXw
         rb+cLRdDb1AZu92DOLyeR4jYz4IuVH0wpPwzej/TUEKaMDaHhoqCip7m8+yzetFryDA8
         oTAYxyJchkgmQfopLpiHM//QiTTLThDuuq2OJnAI55PNLljk/j6mw6IL9LnIKLD6cE/w
         tKdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792148802; x=1792753602;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BhJhQfG6m5IjmjHeVsqFyoc/qVFSsNb+YvIuAxHlx2E=;
        b=Cr5u2NmTwkvmnLR4QBp94+ba8Nz7y6Hooc0RniQxIJNzdVwUujAbhZl0y8moHxHFCU
         m9pk3+EW5Dl1sV10gM4xnH4b6FhGnBVjFQyLwoJIYXcmutwvBMJ500fX1Ea1GbDWWPbl
         gtUeK8vcBcyMI7dAZRa8ykTwDxWiYfGtjbtDSaqVuzh8kRWKPlGbJn5bcfxUGMGxWfKr
         nSX+3VTRR58ZZbry+OXxAavBvKtlF8Ef1/lpudFtXchSVicGPKX2vfzjBuvP5S0YINbW
         ljr/FLZMzRGioh9jva6+nExpaR2WfonutZ6eyJPiZPhkxZ62XaODJ6pAtKBMsbZzrco4
         5V+g==
X-Forwarded-Encrypted: i=1; AKwUvBwDzZXYvjaG/wXaSLUQhQ6UnN6fhJXT0JrahnvQ0vnBFWJfjY98hZHM4Dvaa/Q6036F4bOySLkg5jkh+Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYKR7nK4I7eL2bi63mmK0DmRmPsMTWEtWHBvX3aQU50/Ix7tFUPR
	V01S5j54QObNiFjrcE03502vFjkvllo1u7FGtiuSnhPYvSIHW0IG+k4djKWYAgslv+g=
X-Gm-Gg: AYBFou26SuU0VdQawbEyB+HR53by0cWkQyCeK53K7FUvulZxXiEOwLBRIOMpYeUg7xO
	bce9jZbPbjqWNU/N+bwdVREDaXrmjkrfMdrpg3nc1Po2VaI9neLDYOMtDsh1WHge9vBK+2oYXJS
	IiZTYQGGsdh1epwCyuVsizKhCeCNmU19nFKnX788Xhqz2ZLozA5SJP6Vk6QFbsywfMLU8fE7oI+
	U8NIEK1gwgUD4UvinQyxTDNBBMCeAIxRDQrk+rVc/5PjZ3VEGbvgQ6pXmW2P9ljTSa3PFjKuyL8
	u83jGWerz6lK2QlIFnVrjig6SwugesW7sArmHooWChPyjw7pXWPX/ARWXyyGDo74UQaVUJwcmWC
	jz1F/ehDHmccq23VY+BXFDNgL0SzOcuGO+Cf/gHFRxhL9cxhra2xhZOODVMVxkSsHLPjvIbrzIz
	M3hrHibnRLe5mY8snqRn5jhlfzCdzNVHbJhJhHpmMvYmYEHMjps7uvPtfWKQ+gOpH6hQpDF1Rxh
	zKfeop/RTU=
X-Received: by 2002:a05:600c:46cc:b0:4a1:688d:a41c with SMTP id 5b1f17b1804b1-4a18e4c06a8mr423248765e9.25.1792148802433;
        Fri, 16 Oct 2026 04:06:42 -0700 (PDT)
Received: from [192.168.0.167] ([109.78.92.136])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4d4978sm4017925f8f.21.2026.10.16.04.06.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 04:06:41 -0700 (PDT)
Message-ID: <a295568c-1599-45c1-a60b-66fc106a2281@linaro.org>
Date: Fri, 16 Oct 2026 12:06:40 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 2/4] phy: Add MIPI C-PHY configuration helpers
To: geocausa@gmail.com, Vinod Koul <vkoul@kernel.org>,
 David Heidelberg <david@ixit.cz>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
 Suresh Vankadara <svankada@qti.qualcomm.com>, tjose@qti.qualcomm.com,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261016-x1e-cphy-rfc-v2-0-377654253193@gmail.com>
 <FSgHquVCF3k-Ipt8d6Xu8eAn745A_NyIA7d_BvByx3RTufBZXE-NlVL7jHWYixnuNYx8MvrFfT6LUcHtq-BXDA==@protonmail.internalid>
 <20261016-x1e-cphy-rfc-v2-2-377654253193@gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261016-x1e-cphy-rfc-v2-2-377654253193@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/10/2026 11:57, George Neacsu via B4 Relay wrote:
> From: George Neacsu <geocausa@gmail.com>
> 
> A CSI-2 receiver knows the link frequency of its transmitter, and by the
> V4L2 convention a C-PHY link frequency is half the symbol rate on each
> trio. Add helpers so that the receiver and the PHY do not each open-code
> that conversion, as phy_mipi_dphy_get_default_config_for_hsclk() does
> for D-PHY:
> 
> - phy_mipi_cphy_get_default_config_for_link_freq() fills a
>    configuration from a link frequency and a trio count;
> - phy_mipi_cphy_config_validate() checks for a symbol rate and one to
>    three trios;
> - phy_mipi_cphy_link_freq() gives the link frequency of a configuration.
> 
> They are small enough to be inline, so no new Kconfig symbol is needed.
> 
> Suggested-by: Bryan O'Donoghue <bod@kernel.org>
> Suggested-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: George Neacsu <geocausa@gmail.com>
> ---
>   include/linux/phy/phy-mipi-cphy.h | 61 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 61 insertions(+)
> 
> diff --git a/include/linux/phy/phy-mipi-cphy.h b/include/linux/phy/phy-mipi-cphy.h
> index ef6af61de..f6746dcb0 100644
> --- a/include/linux/phy/phy-mipi-cphy.h
> +++ b/include/linux/phy/phy-mipi-cphy.h
> @@ -2,6 +2,10 @@
>   #ifndef __PHY_MIPI_CPHY_H_
>   #define __PHY_MIPI_CPHY_H_
> 
> +#include <linux/errno.h>
> +
> +#define PHY_MIPI_CPHY_MAX_TRIOS		3
> +
>   /**
>    * struct phy_configure_opts_mipi_cphy - MIPI C-PHY configuration set
>    *
> @@ -24,4 +28,61 @@ struct phy_configure_opts_mipi_cphy {
>   	unsigned char		trios;
>   };
> 
> +/**
> + * phy_mipi_cphy_config_validate() - Validate a MIPI C-PHY configuration
> + * @cfg: configuration to check
> + *
> + * Return: 0 if @cfg has a symbol rate and one to three trios, -EINVAL
> + * otherwise.
> + */
> +static inline int
> +phy_mipi_cphy_config_validate(const struct phy_configure_opts_mipi_cphy *cfg)
> +{
> +	if (!cfg->symbol_rate)
> +		return -EINVAL;
> +
> +	if (cfg->trios < 1 || cfg->trios > PHY_MIPI_CPHY_MAX_TRIOS)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +/**
> + * phy_mipi_cphy_get_default_config_for_link_freq() - C-PHY configuration
> + * from a link frequency
> + * @link_freq: link frequency in Hz
> + * @trios: number of active trios
> + * @cfg: configuration to fill
> + *
> + * A C-PHY link frequency is half the symbol rate on each trio, the
> + * convention V4L2 uses for the link frequency of a C-PHY transmitter.
> + *
> + * Return: 0 on success, -EINVAL if the resulting configuration is invalid.
> + */
> +static inline int
> +phy_mipi_cphy_get_default_config_for_link_freq(unsigned long long link_freq,
> +					       unsigned int trios,
> +					       struct phy_configure_opts_mipi_cphy *cfg)
> +{
> +	if (trios > PHY_MIPI_CPHY_MAX_TRIOS)
> +		return -EINVAL;
> +
> +	cfg->symbol_rate = link_freq * 2;
> +	cfg->trios = trios;
> +
> +	return phy_mipi_cphy_config_validate(cfg);
> +}
> +
> +/**
> + * phy_mipi_cphy_link_freq() - Link frequency of a MIPI C-PHY configuration
> + * @cfg: configuration
> + *
> + * Return: the link frequency in Hz, half the symbol rate on each trio.
> + */
> +static inline unsigned long long
> +phy_mipi_cphy_link_freq(const struct phy_configure_opts_mipi_cphy *cfg)
> +{
> +	return cfg->symbol_rate / 2;
> +}
> +
>   #endif /* __PHY_MIPI_CPHY_H_ */
> 
> --
> 2.53.0
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
