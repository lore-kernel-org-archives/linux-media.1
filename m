Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5B63EB0E5
	for <linux-media@vger.kernel.org>; Wed,  5 Aug 2026 09:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785921958; cv=none; b=A9nzZl5eic3yc97Ma7fNK09g/4OCPZqVAsSngUbMVLpHrZOfe0uOS6MUz1+R+hOr13UxPBYE/4YwkfrXQOAAcRGNpsyMpxf+g0cVaSzZ7xwiREnqFV4iPnrFeblafitur7q5j47/GA/SNumQilFsTMIdyXnXSqljToFBVrc4xrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785921958; c=relaxed/simple;
	bh=2NwZzpybEGpqABX8oI+T7CowolrWBdADRnQKLxaF244=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=COs7WR6VnI8LvXl3zci7lZOiOgl+xM8E9AB0c1AB09wsvKFfustIS1IuhGrNS0brIcLtynFHeiYuL0mmRFHWxqnWFoKa/tO83JSGqpH5MPK4A7CWZSaeKYr2y+Ue8BgBx7+RHWYkIfFsh4JauneeS3e9jbg0RpqnJPxkZyq0SPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=by5G2Gx6; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="by5G2Gx6"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-472326ca506so502108f8f.2
        for <linux-media@vger.kernel.org>; Wed, 05 Aug 2026 02:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785921954; x=1786526754; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8k2s2VnaAHk68oU/LZH7jtw6dj5ASex+T2rhuCCV/P4=;
        b=by5G2Gx62CZCKggTwwPH86eGNhIpGhUDFVAtweCFMhDeH5QCOqvOnegwS1ulpfVB0W
         IT6CXZXJbjYbFB69zOJjhNnCI7ScdZ6q7EeoFguft0+tMKTN/6Wl3esQgoHoL65RLID9
         f+DiMmtDKnHo5vKawfe2SpNCkiQWLTiGfA0jNN/sPVmrvaUqmObgHTCyZRH6xzvxwg59
         hUVtc1DzFH8jRhoh+YSetns3LRoaBu7vi8qaJMWO0FtPeQBYi7P5kmjeM51AcJIJ6p4h
         kBJZsulcmaytrG2jL4XnRqri24USb+NmM5aojsfRUxyJFCHZENOiSTR2en1w4UB3z9xP
         U+nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785921954; x=1786526754;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8k2s2VnaAHk68oU/LZH7jtw6dj5ASex+T2rhuCCV/P4=;
        b=ri7qTRBIgnbn9bALGVRqW6/V8j3mBKv2D+u4hbnz92D4P9thsTCws8FxSvqqg5JyfB
         3z2VFvG8RTB1aJLGhWd9GGaZ2P8OHoKgrXtOxqQUyYIQQ4mmk3jznSsib7s7je2UyJOV
         oluWRjF20GayQfoxqHT6lipfu1TKWwtu4g2IMpxOvBEko4jZ2VZbHIA1zJM7HLqDdt/J
         rxGGOE/86WRP7WbsXCYSi0u37TBsnaHcxjn2gKN+PDa8UT3CqSbzpkZa0NIjTDDLpG7H
         W3EriNHqSaGMRbLWIz4+xrsSdjjGB71uFh0LfBtO6lDFAwzYYa3Vqo8qS88jrbGHAwAv
         qLjg==
X-Forwarded-Encrypted: i=1; AHgh+Rrgdu+iAWwAlnx5N43M6tRUf9nFDJ/nvCUB2OjKtt2WyfD8A2ddvQmEJozqDamEajmDIbfarI0fC+DAlQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzub7FrxuRwpFIEvZy5PbbP2f/I4RexsfeDMbUbyHuLjezCP0Ap
	maC9WuILvULf+YQaQCu/BG8Hbu+pF92IiSpqpe3zOzHpZBGPGGt2NDZO7gcruTXoeGE=
X-Gm-Gg: AR+sD10NrI1AWP0El00B67E9e1I6JL9tlXBAh74N3I5dwX59uAIpp347SQ8K/IRf2bD
	0iQDQFE9HMNmzFDN9w9XoSynOch5XdEWYLh+faAY4Baz0d+mqrtiziPUoRmkZRjDzRnyqQnWlbb
	xqpw+ruFt7Jc4Xcjs8zOJyWRkWw5KxcfRR4xZ1JpeQVgprZk90UrMb1WJvyz5vv24ORwGcZklDH
	7mPiNmW8BIQP021330858GjHLEb2KPkE4JRjXtD59k0fNlET6QsPARqPu4IB8XorPTOqegT4UJq
	DzDKXajOXZP3yEjy2T4ifzmBo3pPKB4OOHbfOkZmcsi4gGwnLQi4lC2d7h4sMS8xZBOTdosawub
	VE+GxC0sMpLs2OM5MUthnfR9PUuzrn97Yv/4Qg4OsxKmLcMSEOn+nB/VEoJtZTxSV4/KE6O4O9t
	ez05bTZhcG+TSuAOWKw10PC4P8akqErNiqzlSu8yMX7x9aC5X6kvN9vtJYQqP/4YNAzIhYHVqNE
	p10MDRNztyzXRNWBlKI8oRMx3BfkbO8nRmeaq12zmqlptPBXZvVjgE=
X-Received: by 2002:a05:600c:8b35:b0:499:4d4b:be2b with SMTP id 5b1f17b1804b1-4994e7d2bb5mr52122365e9.16.1785921953693;
        Wed, 05 Aug 2026 02:25:53 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:b524:aa27:5120:b778? ([2a01:e0a:106d:1080:b524:aa27:5120:b778])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4994dfcc6acsm68421745e9.3.2026.08.05.02.25.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 02:25:53 -0700 (PDT)
Message-ID: <5231dd3d-18f4-461c-985d-64a7720d62c9@linaro.org>
Date: Wed, 5 Aug 2026 11:25:52 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v15 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260730-x1e-csi2-phy-v15-0-f284131de1fa@linaro.org>
 <20260730-x1e-csi2-phy-v15-2-f284131de1fa@linaro.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20260730-x1e-csi2-phy-v15-2-f284131de1fa@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/30/26 14:02, Bryan O'Donoghue wrote:
> Add a new MIPI CSI2 driver in DPHY mode initially. The entire set of
> existing CAMSS CSI PHY init sequences are imported in order to save time
> and effort in later patches.
> 
> The following devices are supported in this drop:
> "qcom,x1e80100-csi2-phy"
> 
> In-line with other PHY drivers the process node is included in the name.
> Data-lane and clock lane positioning and polarity selection via newly
> amended struct phy_configure_opts_mipi_dphy{} is supported.
> 
> The Qualcomm 3PH class of PHYs can do both DPHY and CPHY mode. For now only
> DPHY is supported.
> 
> In porting some of the logic over from camss-csiphy*.c to here its also
> possible to rationalise some of the code.
> 
> In particular use of regulator_bulk and clk_bulk as well as dropping the
> seemingly useless and unused interrupt handler.
> 
> The PHY sequences and a lot of the logic that goes with them are well
> proven in CAMSS and mature so the main thing to watch out for here is how
> to get the right sequencing of regulators, clocks and register-writes.
> 
> The register init sequence table is imported verbatim from the existing
> CAMSS csiphy driver. A follow-up series will rework the table to extract
> the repetitive per-lane pattern into a loop.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   MAINTAINERS                                        |  10 +
>   drivers/phy/qualcomm/Kconfig                       |  15 +
>   drivers/phy/qualcomm/Makefile                      |   5 +
>   drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 385 +++++++++++++++++
>   drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     | 460 +++++++++++++++++++++
>   drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |  97 +++++
>   6 files changed, 972 insertions(+)
> 

<snip>

> +
> +	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> +	if (!IS_ERR(phy_provider))
> +		dev_dbg(dev, "Registered MIPI CSI2 PHY device\n");


Small nit, since the bindings doesn't specify the phy-cells, the xlate here
is useless since only used by of_phy_get()

I would suggest passing NULL or a dummy function returning ERR_PTR(-ENODEV)


> +
> +	return PTR_ERR_OR_ZERO(phy_provider);
> +}
> +
> +static const struct of_device_id phy_qcom_mipi_csi2_of_match_table[] = {
> +	{ .compatible	= "qcom,x1e80100-csi2-phy", .data = &mipi_csi2_dphy_4nm_x1e },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, phy_qcom_mipi_csi2_of_match_table);
> +
> +static struct platform_driver phy_qcom_mipi_csi2_driver = {
> +	.probe		= phy_qcom_mipi_csi2_probe,
> +	.driver = {
> +		.name	= "qcom-mipi-csi2-phy",
> +		.of_match_table = phy_qcom_mipi_csi2_of_match_table,
> +	},
> +};
> +
> +module_platform_driver(phy_qcom_mipi_csi2_driver);
> +
> +MODULE_DESCRIPTION("Qualcomm MIPI CSI2 PHY driver");
> +MODULE_AUTHOR("Bryan O'Donoghue <bod@kernel.org>");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
> new file mode 100644
> index 0000000000000..7e55ae0073704
> --- /dev/null
> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
> @@ -0,0 +1,97 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + *
> + * Qualcomm MIPI CSI2 CPHY/DPHY driver
> + *
> + * Copyright (C) 2025 Linaro Ltd.
> + */
> +#ifndef __PHY_QCOM_MIPI_CSI2_H__
> +#define __PHY_QCOM_MIPI_CSI2_H__
> +
> +#include <linux/phy/phy.h>
> +
> +#define CSI2_MAX_DATA_LANES	4
> +#define CSI2_DEFAULT_CLK_LANE	7

As discussed offline, I don't think the clock lane is as index 7, but is the bit to enable the
dedicated (unnumbered) clock lane as the register define suggests:

 > +#define CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE	BIT(7)

So the question occurs on how to define the clock-lanes with the "combo/split mode"
where a specific data lane is transformed as clock lane, we would need to describe
this clock lane but what would be the index of the dedicated clock lane we pass into clock-lanes ?

So perhaps you should remove support of clock-lane entirely for now and just use the dedicated lock lane,
and define this when implementing the "combo/split mode" support.

Neil

> +
> +struct mipi_csi2phy_lane {
> +	u8 pos;
> +	u8 pol;
> +};
> +
> +struct mipi_csi2phy_lanes_cfg {
> +	struct mipi_csi2phy_lane data[CSI2_MAX_DATA_LANES];
> +	struct mipi_csi2phy_lane clk;
> +};
> +
> +struct mipi_csi2phy_stream_cfg {
> +	s64 link_freq;
> +	u8 num_data_lanes;
> +	struct mipi_csi2phy_lanes_cfg lane_cfg;
> +};
> +
> +struct mipi_csi2phy_device;
> +
> +struct mipi_csi2phy_hw_ops {
> +	void (*hw_version_read)(struct mipi_csi2phy_device *csi2phy_dev);
> +	void (*reset)(struct mipi_csi2phy_device *csi2phy_dev);
> +	int (*lanes_enable)(struct mipi_csi2phy_device *csi2phy_dev,
> +			    struct mipi_csi2phy_stream_cfg *cfg);
> +	void (*lanes_disable)(struct mipi_csi2phy_device *csi2phy_dev,
> +			      struct mipi_csi2phy_stream_cfg *cfg);
> +};
> +
> +struct mipi_csi2phy_lane_regs {
> +	const s32 reg_addr;
> +	const s32 reg_data;
> +	const u32 delay_us;
> +	const u32 param_type;
> +};
> +
> +struct mipi_csi2phy_device_regs {
> +	const struct mipi_csi2phy_lane_regs *init_seq;
> +	const int lane_array_size;
> +	const u32 common_regs_offset;
> +};
> +
> +struct mipi_csi2_genpd {
> +	const char *name;
> +	bool scaled;
> +};
> +
> +struct mipi_csi2phy_soc_cfg {
> +	const struct mipi_csi2phy_hw_ops *ops;
> +	const struct mipi_csi2phy_device_regs reg_info;
> +
> +	const char ** const supply_names;
> +	const unsigned int num_supplies;
> +
> +	const char ** const clk_names;
> +	const unsigned int num_clk;
> +
> +	const struct mipi_csi2_genpd *genpds;
> +	const unsigned int num_genpds;
> +};
> +
> +struct mipi_csi2phy_device {
> +	struct device *dev;
> +	u8 phy_mode;
> +
> +	struct phy *phy;
> +	void __iomem *base;
> +
> +	struct clk_bulk_data *clks;
> +	struct clk *timer_clk;
> +	u32 timer_clk_rate;
> +
> +	struct regulator_bulk_data *supplies;
> +	struct dev_pm_domain_list *pd_list;
> +
> +	const struct mipi_csi2phy_soc_cfg *soc_cfg;
> +	struct mipi_csi2phy_stream_cfg stream_cfg;
> +
> +	u32 hw_version;
> +};
> +
> +extern const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e;
> +
> +#endif /* __PHY_QCOM_MIPI_CSI2_H__ */
> 

