Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793446685;
	b=2LlOLvw1byaCJ8pmSmRa5YCg0sMScadpszMlU9bDYHUkOncOrdnSXZ5xwHULnomqZY0/
	 ZGWt2BYukTf/tVwXd49W1HlpjcKM9fnHEgmahp8oKmiCR1Lb1/+KvjrA/j+jvxCqV3iwP
	 ghIeqXsyAPYnfQ+yvgUIFAf/4SJImEeuPJExDA3wsGULuZz+nm1C6DWPOH8+tVgkSSq33
	 Hsjd0E7x48GtSJzOo+jnemprvls86Mil/LE8NvX/oa9A+yiYupbWpxHK6+ZH+cVLiv3vB
	 OwEXym+2afMhpGoesxHwrpIkP9Rh2xvSid4IMv/L30z66la9AyZgAjffCud0MFn9T+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793446685;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=EZkeforLWGSL9gFs2Hk2oOjAINQkGwJqyAvL5Xg56hM=;
	b=AKIpocU/7ApBF3lgjXxE5uX7zZoV+J0+/sOgjD5Qt2xbqFG+ki0ZY606GT50Rp+Cid2N
	 +l0fpOoX8GtKVzKR6L9NxGJ8NtnpmBKTTw7I/QpbBNdIi+zKPKkoG6w+TxaPYFGUAWTEK
	 /Coz5X14eZXXuY0exylQzRYoxr6rTK0wVkH04koPt79QMP8aMWPtsyxqyMzTKHzqllyEW
	 OyESvr+8qsL9XO5dfKZgG9EEcR6UMM66RcQ+TItJn5kKd+/AxKpCr5iV9F7yp16/qK9SC
	 8J1RS+61DweUhmURgLassE/rMY287spzZLH6vLyZ+kfnRK9FMeU2FsqNyG8rIJ9Ls/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=aBsd0zvo;
	arc=none smtp.remote-ip=209.85.167.45
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD9C606A31D
	for <linux-media@vger.kernel.org>; Sat, 31 Oct 2026 11:38:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CD9C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=aBsd0zvo
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5be3ec14bc5so262415e87.1
        for <linux-media@vger.kernel.org>; Sat, 31 Oct 2026 04:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793446683; x=1794051483; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EZkeforLWGSL9gFs2Hk2oOjAINQkGwJqyAvL5Xg56hM=;
        b=aBsd0zvobBPSYId758Zkeq/c4EiAmwziwOn+pRdiyRxeKyypAjUqqulQK/jBI/rxDZ
         aPiDFlNEHRnRFPdMxZ0T+D5/TrspXysPcgQks/pjiE41NtiTklTUXLLjezPWsbTeZ976
         6Z7bVrXbpXY7D5FYAPIAnG+r6CquaTRz+21fdueMzF6Sc0MiPN7qpvyPhr1TL6V1Xx2L
         YklZsbhKZnx3d3Y4nmEodes6oV3dLfZJ7P0e82V2YXifUmWHRQHX2oSFf4Smq1gokaCT
         7f9qXdmyVc2JUgnEvTas55oVmoIkXGhyRq3sBrg6Dds5FxWKmQ6HXmMXrTJb6eWdpFOi
         QVgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793446683; x=1794051483;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EZkeforLWGSL9gFs2Hk2oOjAINQkGwJqyAvL5Xg56hM=;
        b=SsRlxRStnie2F42X1nGsDhcuhO3bQ1/paeeEkOoFwI9ExYjiXEuSoAZTiH7z+1bKwl
         Osgj129ilT25W5rG/GmYOpuXovWA+D43lQJfeC0FkSnCPsr3OeQJUu5Tf4kYP4Bsb8CS
         7FysSD9Y6d/b4t8/bfkkcx59byodnmfZ8HkdojIV6LmVfFVSxlMvutCfnMly6ahUj6+J
         qCjTvkHpUzfIQ0xW9iWl24/TQ3EA0utYEGOv9mV0HrzgEWRNVHee3IDf2x8p2jy2Ge9n
         Hz7OiJofqJ/yWo3DY7hDzDYf/RmPKuvlkvYHAcV9iQrXB3A1avxglmux2jcZOEY4vcBq
         RLfA==
X-Forwarded-Encrypted: i=1; AKwUvBx4wL4r6WlWhaMM7im6NNgnrFIQ+0ew2HZ75vc3GLdYUhQOw1AJ+Tetk4rU9KPsZR3hn3mXldJB3CPy4g==@vger.kernel.org
X-Gm-Message-State: AFq9FYLigVPg7hfbrg5kPl0GrrzDcgD0DrLGN6Awuk8nhJnCEuU/Rsxm
	ATTR6+oWABupmR7H2cojVXx+Y/Hla+gZK9BhM5+Qfd47UmEh0nzlrs7ksYijvn0oxNU=
X-Gm-Gg: AYBFou1G6bcM5IGHZzsz9qX518dCyMCnTFScX3IaVPYaubNYOPaVrdKTLW8gQJkLU1K
	xoDnFUrMElQDXU1oLKVUR61/m2SSw/kL5tDzMCXIz/eefAnP17twcdLk45bsZF4f9AmJg87eOu2
	MEbbxtd770QLJKYt4Rn78tZvyrZOuBfdTWswBtpMIBdJDMJzgLyBJpJhFosMDa7nkrGNTDwpNiD
	hlXf5xgQPrcBLR15/p5mtqFzfYqjv969Ke+HU71d3xo6cL6u3E9Nj3jLGyMwyoc4Ofh9OxwPHZv
	nLKqPl1uU0tRUwogSS4RUS16zeyD4jDAnKGUtucE0FTHBqR0xa0KZyVba7F2sQ/QslZeLed89x6
	CxtwPwZ/w+n+w8t/EIyfUHwCPEZ6mEBz4vGNZ4CUnP3tU6z+rWByClEamSENZistpDMR501/+Mt
	Jhzau/agx21Z+bDvzXQJCphlyhGzxScaht/1BBoTVn4wjvzu0SFT18QbxcCJ4wc1mRWznjg+8cX
	n+qlcuU0nZk0ccmcQyFcWVNVaiOMMRcqFFppQjT5c15ESJJDrn17atHsAcmEim1hNRrauwQsbs0
	Ll2AqsCHIgwO9HzAfN5Km6ctS/iBk57oazJTuqUtgylzlv2iewzIEUazabiu7N+qEhFJkh2yONW
	5ggb17GmzuB9iIczDB31SoVg4OExi
X-Received: by 2002:a05:6512:124c:b0:5be:45f2:ec50 with SMTP id 2adb3069b0e04-5bfd9554a92mr2343622e87.4.1793446683229;
        Sat, 31 Oct 2026 04:38:03 -0700 (PDT)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe1b1ddb3sm416459e87.27.2026.10.31.04.38.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Oct 2026 04:38:02 -0700 (PDT)
Message-ID: <7c7cd421-81de-4c5f-9e37-0bb3b7bc5974@linaro.org>
Date: Sat, 31 Oct 2026 13:38:01 +0200
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
Subject: Re: [PATCH v23 11/15] media: qcom: camss: tpg: Add support for v2.4.0
 TPG
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, jeyaprakash.soundrapandian@oss.qualcomm.com,
 Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
 <20261028-kaanapali-camss-v23-11-95f250b18612@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20261028-kaanapali-camss-v23-11-95f250b18612@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/28/26 17:20, Hangxiang Ma wrote:
> Add support for the TPG found on Kaanapali. This TPG uses hardware
> version 2.4.0, which drives test-enable and reset through the
> TPG_CTRL_CMD register at offset 0x1f4 instead of the TEST_EN bit in
> TPG_CTRL and the TPG_CLEAR register. Its output is routed into the
> CSID 1080 RX through the CSI2 TPG mux, so the CSID selects the TPG as
> the data source when a test pattern is selected.
> 
> Add the TPG resources to the Kaanapali camss resources so that the TPG
> subdevices are created on this SoC.
> 
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---
>   .../media/platform/qcom/camss/camss-csid-1080.c    | 15 ++++++++++++--
>   drivers/media/platform/qcom/camss/camss-tpg-gen1.c | 23 ++++++++++++++++------
>   drivers/media/platform/qcom/camss/camss.c          |  2 ++
>   3 files changed, 32 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-1080.c b/drivers/media/platform/qcom/camss/camss-csid-1080.c
> index 3d90d31201fa..ec56ba85a0fa 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-1080.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-1080.c
> @@ -64,6 +64,8 @@
>   #define		CSI2_RX_CFG0_NUM_ACTIVE_LANES		0
>   #define		CSI2_RX_CFG0_DL0_INPUT_SEL		4
>   #define		CSI2_RX_CFG0_PHY_NUM_SEL		20
> +#define		CSI2_RX_CFG0_TPG_MUX_EN			BIT(27)
> +#define		CSI2_RX_CFG0_TPG_MUX_SEL		GENMASK(29, 28)
>   #define		CSI2_RX_CFG0_PHY_SEL_BASE_IDX		1
>   #define CSID_CSI2_RX_CFG1			0x884
>   #define		CSI2_RX_CFG1_ECC_CORRECTION_EN		BIT(0)
> @@ -148,6 +150,7 @@ static void __csid_reg_update_clear(struct csid_device *csid, int port_id)
>   static void __csid_configure_rx(struct csid_device *csid,
>   				struct csid_phy_config *phy)
>   {
> +	struct camss *camss = csid->camss;
>   	u8 lane_cnt = phy->lane_cnt;
>   	int val;
>   
> @@ -156,8 +159,16 @@ static void __csid_configure_rx(struct csid_device *csid,
>   
>   	val = (lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
>   	val |= phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
> -	val |= (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX)
> -	       << CSI2_RX_CFG0_PHY_NUM_SEL;
> +
> +	if (camss->tpg && csid->tpg_linked &&
> +	    camss->tpg[phy->csiphy_id].testgen.mode != TPG_PAYLOAD_MODE_DISABLED) {
> +		val |= FIELD_PREP(CSI2_RX_CFG0_TPG_MUX_SEL, phy->csiphy_id + 1);
> +		val |= CSI2_RX_CFG0_TPG_MUX_EN;
> +	} else {
> +		val |= (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX)
> +			<< CSI2_RX_CFG0_PHY_NUM_SEL;
> +	}
> +
>   	writel(val, csid->base + CSID_CSI2_RX_CFG0);
>   
>   	val = CSI2_RX_CFG1_ECC_CORRECTION_EN;
> diff --git a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
> index d29de5f93c18..cabbb2638cf3 100644
> --- a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
> +++ b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
> @@ -22,6 +22,7 @@
>   
>   #define TPG_HW_VER_2_0_0                TPG_HW_VER(2, 0, 0)
>   #define TPG_HW_VER_2_1_0                TPG_HW_VER(2, 1, 0)
> +#define TPG_HW_VER_2_4_0                TPG_HW_VER(2, 4, 0)
>   
>   #define TPG_HW_STATUS		0x4
>   
> @@ -33,7 +34,9 @@
>   # define TPG_CTRL_OVERLAP_SHDR_EN	BIT(10)
>   # define TPG_CTRL_NUM_ACTIVE_VC		GENMASK(31, 30)
>   
> -#define TPG_CLEAR		0x1F4
> +#define TPG_CTRL_CMD		0x1F4
> +# define TPG_CTRL_CMD_TEST_EN		BIT(4)
> +# define TPG_CTRL_CMD_HW_RESET		BIT(0)
>   
>   /* TPG VC-based registers */
>   #define TPG_VC_n_GAIN_CFG(n)		(0x60 + (n) * 0x60)
> @@ -164,18 +167,26 @@ static int tpg_stream_on(struct tpg_device *tpg)
>   	}
>   
>   	/* Global TPG control */
> -	val = FIELD_PREP(TPG_CTRL_TEST_EN, 1) |
> -	      FIELD_PREP(TPG_CTRL_NUM_ACTIVE_LANES, lane_cnt - 1) |
> +	val = FIELD_PREP(TPG_CTRL_NUM_ACTIVE_LANES, lane_cnt - 1) |
>   	      FIELD_PREP(TPG_CTRL_NUM_ACTIVE_VC, last_vc);
> -	writel(val, tpg->base + TPG_CTRL);
> +
> +	if (tpg->hw_version < TPG_HW_VER_2_4_0) {
> +		val |= FIELD_PREP(TPG_CTRL_TEST_EN, 1);
> +		writel(val, tpg->base + TPG_CTRL);
> +	} else {
> +		writel(val, tpg->base + TPG_CTRL);
> +		writel(TPG_CTRL_CMD_TEST_EN, tpg->base + TPG_CTRL_CMD);
> +	}
>   
>   	return 0;
>   }
>   
>   static int tpg_reset(struct tpg_device *tpg)
>   {
> -	writel(0, tpg->base + TPG_CTRL);
> -	writel(1, tpg->base + TPG_CLEAR);
> +	if (tpg->hw_version < TPG_HW_VER_2_4_0)
> +		writel(0, tpg->base + TPG_CTRL);
> +
> +	writel(TPG_CTRL_CMD_HW_RESET, tpg->base + TPG_CTRL_CMD);
>   
>   	return 0;
>   }

It is necessary to split this change into two for the next run:

1) the generic TPG subdevice change to support a new hardware interface, equal to

   https://lore.kernel.org/linux-arm-msm/20261031112203.545319-4-vladimir.zapolskiy@linaro.org/

this new interface is for a range of hardware including SM8650 and SM8750,

2) the rest of Kaanapali specific changes from below this comment.

> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 6ff82dd2aeaf..df4b4cf30711 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -5850,11 +5850,13 @@ static const struct camss_resources kaanapali_resources = {
>   	.pd_name = "top",
>   	.pm_clks = { "cpas_fast_ahb", "cpas_ahb", "gcc_axi_hf" },
>   	.csiphy_res = csiphy_res_kaanapali,
> +	.tpg_res = tpg_res_x1e80100,

It is closer to 'tpg_res_8775p', at least the proper name for I/O regions
is expected to be "tpgX" rather than "csitpgX".

>   	.csid_res = csid_res_kaanapali,
>   	.vfe_res = vfe_res_kaanapali,
>   	.icc_res = icc_res_kaanapali,
>   	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
>   	.csiphy_num = ARRAY_SIZE(csiphy_res_kaanapali),
> +	.tpg_num = ARRAY_SIZE(tpg_res_x1e80100),
>   	.csid_num = ARRAY_SIZE(csid_res_kaanapali),
>   	.vfe_num = ARRAY_SIZE(vfe_res_kaanapali),
>   };
> 

-- 
Best wishes,
Vladimir
