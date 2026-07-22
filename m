Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A1537DEA9
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 02:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784687084; cv=none; b=PVwAlRobJ/8WQuHKQqr7Iom6zeb3VWOyqa5kCw2Y/7+1rkrL6jEYZJPSuyEjMksZZlD4DveHD+yERmZok1MFviLzAq/uY7rF5FdLAQzD6SVJrSWrtG7q0ew2Xuf72+0FxJ3vCDB6xlKic8+ZppUj1LvXyv/8hE4mkAR1kkAraEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784687084; c=relaxed/simple;
	bh=0MbFv3y4ugQY70Igzth164A6rCtPJDF1G05rnvAyVjI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qSPFh8lNJ+gSd3lTUNnub+ByhysJ2Z3QE/PeGCe5oIuN3dNxkqKLJ0QphqaBElj7OXjwXiSGomHfd5r4FSw4AaT/asdGYYSYCTbXJ0F/NvaCKbVJdo1oZPlDjiv+778gxYf6DEIq01s2gwh6d+IzgS3WyVMxYFvwsop6FNHpCdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MYgj+Yb8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y8KqmLSy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MYgj+Yb8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y8KqmLSy"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M1CHre2961475
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 02:24:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CKg5JqR8OppK1FgvxIBw/9RVWER4aPnzs5JhUmn8ESE=; b=MYgj+Yb84Dg9e8Y3
	Qav6D0tuMOsIBkU9d+J011CIIJH+p2Re00Qqym6QzvX4B/ffKChKtkyVJ273cCP7
	SCaDreKFDSMEoev8VGEUd9VBh4EFVTvg07q/iNG6XrFZBNntvRsEIrykdE1NRMwF
	FyAEUpqaDIZYy/gWYr6Th376x/vlaq/OryrxgKVD1gJ2VtNJTU2rXdxO9nSmTSqF
	3wubK7JpoWMxXxaLSFiuNzKl/51QPotNPJl9rD5DC4CczLKGlq4+7IOFP97zgl4L
	6bsPj7RjvqSLo+CFdLs7HPbxKKoSXt+jU7JmrW+pV+qB22E8k/iBEgOX3AbtwV1T
	2XoJ0Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6fsstc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 02:24:42 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb6ef846b33so2620156a12.1
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 19:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784687082; x=1785291882; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CKg5JqR8OppK1FgvxIBw/9RVWER4aPnzs5JhUmn8ESE=;
        b=Y8KqmLSyFBuZo8gnTwm77l/V2SF35fuLuTh2hSdPV8gRz20rbssRGQTSTT6L8Jewyu
         DNxjOguEP0kx6XXxuZQxCZpPWTlWrRo+8E/Vr/yKQNfEh4xLRxYTFflWUHPksdw5bgsJ
         qiOYLiNidgnhXZdvgGg8s67TVgOIro8EO8JXneyj2HdrPgx1/otpJoD4nWbWQnxo/Kmx
         P1VREMUZoQna0fyjs1xdLGD0+0TqiC4Pqko23qM8cCf58X5OsLaGGF6mxor1UjoagqOE
         qmeAsYKYX9ZpJ4E1AKg6yQ53jT/qQNiHddYZmwG4lOdq4/2SD8vP8A2/pqIOZw/Jfuma
         D3+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784687082; x=1785291882;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CKg5JqR8OppK1FgvxIBw/9RVWER4aPnzs5JhUmn8ESE=;
        b=Y/Ngfo3610u5mX7pg2ZSx3vgyIQlu9ALoqrzsSeox94L2/D3/tumWB46VPZFovRWjL
         YXPtIfmjjkkGkef1f3u3l4usSW2SQptHOcZfUv5E0PWTGfj9idM/bIscZQDDuWlmCTvl
         PjHI7+Jq8MZINgtsObaFUnPypPtGlHHvTcSto7YhuyIz1rXggLxU6Kqw4GbK6g61wVyX
         u/Qui0FRVB8Z/7v1wNscmN3AXzv8zHt/Bl9ZdSLZivw18fD3QI4+OgNrl1pyYYVQZ6j3
         IMlWfYT9QMH21IAP0MA6uVkL9LnUxz6edf96rckfZ7n/SciCDARa+3rha67VrvZjQPb5
         zrog==
X-Forwarded-Encrypted: i=1; AHgh+RoQt03tGmdAWItge71tpBfHXVYp7HFLnw6ntXdJt6jMIBDWQ0ODaFut3e7GlQlBOhvjLxnTBq3ojzFcsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8gOz3XoiRp7PCp77m7XKLP+KWfr9uvrGYRl9Pa5ZzW8Wx6qnj
	xgidqt/5J1+72spTANhtiqNUL2cTXmP+18OwVJwVEl2Oat4GHI9bMWp5WHmYxjfRqWI/hNQlMcE
	3JlJJ17nWetr8IBLAYXk5z7SLNGfhItg8gEoKu86OnC0f1vNyU/zyIO+j/7qmV50tfQ+cNYp27G
	7h
X-Gm-Gg: AR+sD12DYHzt1dUI6EEyM8b38ue/9us6LDlt2EOGZ3/n/UhfmgJ8ZwuHckVLWCVBZrw
	UvVdp7emNUIgfpf39fTrCjKTffxlcFz1KqkpXZOajrtZDuElMiD/1Cm0NjaVsLY08vW9v1iMLfT
	tkJs+X7yShHAmS/OpiQEGbKpYYVqzUcC/zYGi87qvAEyeMCVI8EqkfrPBRiScN18L32lca4iORD
	onpMb6+RBrex9NiXa7j53ODAxOnUkXCrI1Kxf7GqRIi61UdDKFr8OdjTrtrc3qZGeldZgjiWpHi
	E3mMklzIfgJIXeUw1oqqb4OxI+RdmwnaPVRt8wPo0zs2ERL3lxI/aINIshVHMMl+JiqXGP22Irv
	AYyQ+riV3D/GNGxeXhGvqWZFahp8=
X-Received: by 2002:a05:6a00:830c:b0:847:950b:b71a with SMTP id d2e1a72fcca58-84e15fb34f4mr1584989b3a.16.1784687081813;
        Tue, 21 Jul 2026 19:24:41 -0700 (PDT)
X-Received: by 2002:a05:6a00:830c:b0:847:950b:b71a with SMTP id d2e1a72fcca58-84e15fb34f4mr1584963b3a.16.1784687081321;
        Tue, 21 Jul 2026 19:24:41 -0700 (PDT)
Received: from [10.233.16.34] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e17578345sm530778b3a.39.2026.07.21.19.24.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 19:24:40 -0700 (PDT)
Message-ID: <2512aab8-fbde-4b95-8619-6c32d60ab500@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 10:24:35 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 4/8] phy: qcom-mipi-csi2: Parametrise the common
 status register offset
To: Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
References: <20260720-kaanapali-camss-v15-0-c0b1c1167c5d@oss.qualcomm.com>
 <20260720-kaanapali-camss-v15-4-c0b1c1167c5d@oss.qualcomm.com>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <20260720-kaanapali-camss-v15-4-c0b1c1167c5d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: B7an_-uFEO0e9CBvwxAIlQWyCAsu4ctI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDAyMCBTYWx0ZWRfX+ltqhe05RIgl
 YeNLJa6tCtZ4xvtokg/31oFBlUh4II1uQhjrqD8pIPL/Dp5HsFy4bTKvxBKsy9NQJDuOcCmq5lY
 e5u0NkYGic0FIytWTeMT81VFKAH+2Dx3gzujXfoSXYLHY5I8zZuaDyskmtB5zgewFrphH6KkkVa
 m2DocyKmS3C+dxdJEecpXWEYmyfWEFit+8IZHJHxycUN7eO8bcB8eaMwnH9p4AwMDHVUOpYIOGV
 0k9d2axwxTGj5sC9snCIpzbVuAtiWsna/n3/727DXTlaL1xf2tngTUINwi8tGBCQoMT9BKK60+k
 SE9dMcdp6nLQqHASTSxerXbcFtE2Zd9Aq5DTJplfwTXEBsDCb1lnltFPsjYr5xrvoOB+6orqs9p
 p7sTljuScyEhx9OfVxK+1TUb8qaTqGbnNvU2MGONOJBF85B8LTYQ8Lhm5L+i7r3cvLcVrsrSWNc
 Nkxf7z1Y9rTp+7Lquag==
X-Authority-Analysis: v=2.4 cv=e/o2j6p/ c=1 sm=1 tr=0 ts=6a6029ea cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8VO9FOUX2GVN--3Z4zYA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: B7an_-uFEO0e9CBvwxAIlQWyCAsu4ctI
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDAyMCBTYWx0ZWRfX0KUdOzrK+pyT
 N8r3+OFD8z0vm4Je8t4DA0S89Yp/CiOWpf+HKF3yGEX943qEDSl1S0N59IyZBhrlkWNYLfqenn0
 NpNZdG2127zxwbuSytJE+5K8K4XdSI0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_01,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220020

On 7/21/2026 12:50 PM, Hangxiang Ma wrote:
> The CSI2 PHY common status registers are not at a fixed offset from the
> common register block across SoCs: x1e80100 uses 0xb0 while other 3PH
> v2.4.0 parts differ.
> 
> Replace the hard-coded 0xb0 in CSIPHY_3PH_CMN_CSI_COMMON_STATUSn() with
> a per-SoC common_status_offset field in struct mipi_csi2phy_device_regs,
> initialising x1e80100 to 0xb0 so behaviour is unchanged. This is a
> no-functional-change preparation for describing other SoC offsets.
> 
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---
>   drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 16 +++++++++++-----
>   drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |  1 +
>   2 files changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
> index 966d79c98f9b..8cd331cfb4b3 100644
> --- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
> @@ -19,7 +19,8 @@
>   #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_COMMON_PWRDN_B	BIT(0)
>   #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_SHOW_REV_ID	BIT(1)
>   #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL10_IRQ_CLEAR_CMD	BIT(0)
> -#define CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(offset, n)	((offset) + 0xb0 + 0x4 * (n))
> +#define CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(offset, common_status_offset, n) \
> +	((offset) + (common_status_offset) + 0x4 * (n))
>   
>   #define CSIPHY_2PH_LN_CSI_2PHASE_CTRL9n(n)		((0x200 * (n)) + 0x24)
>   
> @@ -176,19 +177,23 @@ static void phy_qcom_mipi_csi2_hw_version_read(struct mipi_csi2phy_device *csi2p
>   	       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, 6));
>   
>   	tmp = readl_relaxed(csi2phy->base +
> -			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset, 12));
> +			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset,
> +							      regs->common_status_offset, 12));
>   	csi2phy->hw_version = tmp;
>   
>   	tmp = readl_relaxed(csi2phy->base +
> -			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset, 13));
> +			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset,
> +							      regs->common_status_offset, 13));
>   	csi2phy->hw_version |= (tmp << 8) & 0xFF00;
>   
>   	tmp = readl_relaxed(csi2phy->base +
> -			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset, 14));
> +			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset,
> +							      regs->common_status_offset, 14));
>   	csi2phy->hw_version |= (tmp << 16) & 0xFF0000;
>   
>   	tmp = readl_relaxed(csi2phy->base +
> -			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset, 15));
> +			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset,
> +							      regs->common_status_offset, 15));
>   	csi2phy->hw_version |= (tmp << 24) & 0xFF000000;
>   
>   	dev_dbg_once(csi2phy->dev, "CSIPHY 3PH HW Version = 0x%08x\n", csi2phy->hw_version);
> @@ -375,6 +380,7 @@ const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e = {
>   		.init_seq = lane_regs_x1e80100,
>   		.lane_array_size = ARRAY_SIZE(lane_regs_x1e80100),
>   		.common_regs_offset = 0x1000,
> +		.common_status_offset = 0xb0,
>   	},
>   	.supply_names = (const char **)x1e_supplies,
>   	.num_supplies = ARRAY_SIZE(x1e_supplies),
> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
> index 7e55ae007370..d6366f809e51 100644
> --- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
> @@ -51,6 +51,7 @@ struct mipi_csi2phy_device_regs {
>   	const struct mipi_csi2phy_lane_regs *init_seq;
>   	const int lane_array_size;
>   	const u32 common_regs_offset;
> +	const u32 common_status_offset;
>   };
>   
>   struct mipi_csi2_genpd {
> 
Hi Bryan, could you try to add this change into your PHY driver? This 
macro format has existed in old arch. We once have such discussion on v5 
thread.

https://lore.kernel.org/all/bc6abd24-d56a-4fc0-89e9-8986e8d8b3b7@oss.qualcomm.com/

If not applicable, could I put it in KNP series as a fixing in this 
format? It can save us the effort of merging the re-architected version. 
We experienced a similar issue with the previous architecture, where 
additional fixes were needed to accommodate the new platform 
requirements, leading to considerable time and resource investment. 
Thanks a lot.

Best regards,
Hangxiang
