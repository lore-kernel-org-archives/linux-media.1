Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E56D3AE704
	for <linux-media@vger.kernel.org>; Sat,  3 Oct 2026 11:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791025823; cv=pass; b=Dg4yuVvsXiKvO53dW0Kwb2S+/unR+MoPKmYKDT6+nLbM6WK/PrOL+7OQl94sVCVBweYbX0G5InvzOGSY8N8TVFE038EOa3MTxdeaJmXrs61oH0OmPpdXwCRghKgX5ETdu5DD3p7p5v0fglhOXrWpjdsVTGvd8vXfNH69/ixA3Hc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791025823; c=relaxed/simple;
	bh=/TyCH2CXZvLBL1T153w5Rwq/pPzcUlb0eHwPAnKYBro=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VVG4hJ/QvjkmA1DjIFm1M101QIjTJcR96/XRBAA7EgxE3LqTIQ0KWQiPmLbuVzYqiOon7JDt7reQOkr4ZlIAUdOVNRYF7aWMLyUReELOVjfcpfahaOcXSyL3e/9EBwWfi4Za3zlFbfmazlAOYsmibQCflgbWVV+6QxOZrW8qncA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B+q4x8k/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Un6V/ug0; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B+q4x8k/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Un6V/ug0"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 693Au8lF4072347
	for <linux-media@vger.kernel.org>; Sat, 3 Oct 2026 11:10:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=85+1ADe93PSs2eP7hA3ohcdP
	8kQhajfqUw+b9HPdrdc=; b=B+q4x8k/s39Tqf7JKVELof+A8TI5U3NFV+a55qVV
	/LJzDuS6jn0PZcKafDCat3RUAC6bPV2Tou3BUqWORGDhDLf9IBWi2sri89HGRS4Z
	OMTMbCPNrvdZyUBMp3/dCZYxIjU8WORChaWWoolZqu7ypYvAGjxT5asd7JXqIcLu
	KEpGoSVPpMzu/00Rt9m3fmj5jd+V+F64PrLNVpzm1iLvYHJOIvP3ioD2DMToc72H
	6Dns/BhLGupledWcCItOKkJ1KImA5L1i7/ud3I8kTuOppWuW7GBAxSbL3LRp9oJM
	ojBkewKjgw5dfI+koALUfyIRnHchRh8z/gaJnWwWr9ni1Q==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2t06rq29-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 03 Oct 2026 11:10:18 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7b206156cc6so305375137.1
        for <linux-media@vger.kernel.org>; Sat, 03 Oct 2026 04:10:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791025818; cv=none;
        d=google.com; s=arc-20260327;
        b=RgbqEfWC9zMSNLAjVoZGKupaE2O0XuYApD2a3gQ5u5R3pzODAtdLUrR5lfERcJlkNK
         2n8jaN6vzZO3aXEQAhU1KQ9LGUOcQasO0/y/MUyJdO5LGWm6b+mdxHe2LvJG3iw8Y13Y
         lsfaCgznJTv0AXl8gJo8qFyVriJAGG2XAXBFS6oevrIl8yaZIzv95fL8AfMK91BPJXP/
         JuZD1vgougsB1ynulf6nFH/9ZdeRkxCEsTPltLgjXtqh8ULBhzrPE5GfXAJhBkFbpiyE
         wAxeXTrL+UUZzNjCSGx/ZMnQ5lz1sFfDPmZJ3ZlF717ANUslHdikZX91/v79UsRflMbr
         6c4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=85+1ADe93PSs2eP7hA3ohcdP8kQhajfqUw+b9HPdrdc=;
        fh=9iFpgdWpIEM2eapGgMDrRxkeVb+SpipInv/o2XfDpAU=;
        b=ZK5j1i4mhFxVE66EA6XFArRWr3fC7w0SMPrdmksQhdOYMWOHtSsFz9ZV2AqJIj3fY9
         XadBUC6KQLcdkVIY8C1qQlWb3T/Z+zJNtSqW4zBw6IcF1GeNH4AoCaAByu6cU6Qb5Sjo
         bnb7UOAHqo+zHtcIUziIFJmE+tD9Xh6CPV8jb59ZrInXWXIU4irevVKA8zgmHfbEFD0x
         4joe2wcReYlhg9eC9DjzfNpGtQeCNhScaWISquQnS+JZObPXQ2RbtXMsAleJx8RxnW0q
         +KHtYujMiKPRK25CaMYZUH+3V7248aOHJ3L7x5HoL5lGrc01DTYpDvbkuVdegZBI3+zo
         j+WA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791025818; x=1791630618; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=85+1ADe93PSs2eP7hA3ohcdP8kQhajfqUw+b9HPdrdc=;
        b=Un6V/ug0xwA44d3D3wJdE5Agb8PHhJwkcIV3Pp+U0lCqt7cmbki4G2IbiOA2LOz2+U
         LIqxoGtHmJrzNVEX7+qNkqpDwAqx8HACbLKaT+z8M7VenmonpCiVPRthLl2X6DD1CAxZ
         UVmRzXX8QC2JDobqQNXcDMLF1fSR+6Yo8nV6yJ9xVFee064IJVwXVb9WFQrzdEkUt0wt
         jxYWVQ3RsnDgauWMDjAwDlKXHe833iNIfCUB94ttLXW3U4sd5IzVng03Dvp78z3gDeV3
         /jUpyN3c09RNM+SE0ss0yZKktkWqH6tuofoOVYjrHuh1r3b7U1cfgnc9dN6vN2XnQQKw
         i0wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791025818; x=1791630618;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=85+1ADe93PSs2eP7hA3ohcdP8kQhajfqUw+b9HPdrdc=;
        b=VNQJfXipGdCOVqtatk85B40heEKESiV82y9zrMn0IkO2nrGTbpfy9bjbc9YT6wZVuG
         YY/kBfyY5KwYL3aoWuUtAnpuKJb6ZyLjKQDlpjfKVAZxYQ9viHHXzkc0bzTUHL/mFpzW
         Kidl9iix+eABBdXmjnYCNUWuSgZEYPv3RyHRfkMjDMVxq8Gfana2qjAd74BY7cy4i9e6
         3NtGMYUXkKk9iLS98jLrhXtNZLls96W5fq8x0W1y8PnmD2kNCZopyIbTzPzVuemI5NZu
         tGBWLo2zUTzlY/u4xTlYYr1dUbqx7fg5iv7JYOxxknfINnGgocRpJ/+k4fRSTlvU3v3e
         uHmQ==
X-Forwarded-Encrypted: i=1; AKwUvBz6rj7AYZJ+8Wplw6HbJ0m+oS3IekSKawjF44bXqIqGsoo+R6uZObT/xMeFx05oGcdbbRhSYBSAItz8Dw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLTLgybtHb+A+G/DMTnbHAWtHUwWzLV7xwku9suj816WdTKUVfJ
	zikOSOsRN55K51aE7s90+YXiAYXfE+xs8kI5YKTzpDBRPRmNkzo3iD75tA9zkKmeb7tmDHbPkmN
	pGEujfk2hcXEU7eNnjkEg8+vMT+Np1R4Y3smDRD6LIx7h6n9s/aw9kuMYJmUobKETsIImmtqdg+
	rA54XbhynbZ18TUWxwAFBc3Sr2EMYIGDvVRR/L/eDI
X-Gm-Gg: AYBFou0nWpLEbvZs9oBBqhWXQ+GNUKHorrhWFil77Pzqbjc2JrjVMg9ITcGzdaD+jPE
	jpW6566yr4Y/X4GLgoW4yfuEIbCfThoSvcKjVxPYeDn0Okx0TAJgQmN0N+u/Uw+QpMYRMuPZpCe
	OxLXFt2AKFesGT6vcjnT4Y6ozb1s5lYkhnjTbW0QpjFocJSjzIiZvD2wD6jRLzmZolIh4Ul7tO6
	vUG4DByE7bwhq9ewg==
X-Received: by 2002:a05:6102:1490:b0:7b3:72ec:95c9 with SMTP id ada2fe7eead31-7c0f1ade126mr1808339137.5.1791025817630;
        Sat, 03 Oct 2026 04:10:17 -0700 (PDT)
X-Received: by 2002:a05:6102:1490:b0:7b3:72ec:95c9 with SMTP id
 ada2fe7eead31-7c0f1ade126mr1808325137.5.1791025817163; Sat, 03 Oct 2026
 04:10:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003-kaanapali-camss-v18-0-87ba4ebe0db1@oss.qualcomm.com>
 <20261003-kaanapali-camss-v18-4-87ba4ebe0db1@oss.qualcomm.com> <022c47c3-54b1-43a4-9161-1d0acb13b736@linaro.org>
In-Reply-To: <022c47c3-54b1-43a4-9161-1d0acb13b736@linaro.org>
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sat, 3 Oct 2026 19:10:06 +0800
X-Gm-Features: AclHuK-_DZZ5UAanpheGEwtkxas3xxOMP-L2JQ6TTe_v9IAzR_FdXx_rGiRb1rM
Message-ID: <CACbMrhr1srrcz-c3w1VgzHjdCEiG+6zRGZpjm9qMO3dt09YbPw@mail.gmail.com>
Subject: Re: [PATCH v18 04/11] phy: qcom-mipi-csi2: Parametrise the common
 status register offset
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        "Bryan O'Donoghue" <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=cf5HPXDM c=1 sm=1 tr=0 ts=6ac0e29a cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=gaIY05ubZypsO8VhkkgA:9
 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: wjhGt1-yzjSSbaOQH9pZlIpBhBVluJVL
X-Proofpoint-GUID: wjhGt1-yzjSSbaOQH9pZlIpBhBVluJVL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDA0NCBTYWx0ZWRfXxClQJXMiZ91u
 vA9SjM8NIu9cXyslNRv638A2HvY+ZtPh45sEEygAqEcVcSwqS8/jigmLr7JUwY3XACWEVh0Uz4m
 3yHnpPsQUxBDm7E4OzY/9YSfYNoQfxU1IIMeBXt+6Mat2nNSVCgGBnJN+aYktegZLId+wz1MAy2
 O+rkCiXBK8Lu3x1rbBkiUcrNoN6flKaVM2+ZRYVBHiZ4h/3FSk3NQCrM7sBAmS9EpMC1W3Q2iO1
 p5AIfV4hWFu5LJc18fiwwmVY6YoEUCCm18iaUuBrIibRcgPiFE0HQuSyKFp6CkvjbSi03zIrloK
 JoeMjqrOEa/q/ELhbRfMeppavpAgcOBzcVeUcUryJ9WXYnKyXB332Vrolwbij+SN34vSUtIWymK
 9hit8tae5lGjTg4JyBzHik8+tAfo7cmz8P+lZkLxOSFdUo8pZ/G36WAd9uIOe1EK8hWoR8vD9An
 Euzx6ApT9IwvUPfZxLg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDA0NCBTYWx0ZWRfX8XpR6b/xi4lU
 q30Ct+0DlRuvXytUAbneu/qhEj2baTLKQE+3J3ibHy3E6cS4qhitn7mcaeoesSf4QsqAC+WufRu
 VqfAhhL17tIMciLVQwEU3gX1NlHRmUU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-03_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610030044

On 10/3/2026 5:08 PM, Bryan O'Donoghue wrote:
> On 03/10/2026 10:02, Hangxiang Ma wrote:
>> The CSI2 PHY common status registers are not at a fixed offset from the
>> common register block across SoCs: x1e80100 uses 0xb0 while other 3PH
>> v2.4.0 parts differ.
>>
>> Replace the hard-coded 0xb0 in CSIPHY_3PH_CMN_CSI_COMMON_STATUSn() with
>> a per-SoC common_status_offset field in struct mipi_csi2phy_device_regs,
>> initialising x1e80100 to 0xb0 so behaviour is unchanged. This is a
>> no-functional-change preparation for describing other SoC offsets.
>>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> ---
>>   drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 16 ++++++++++
>> +-----
>>   drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |  1 +
>>   2 files changed, 12 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/
>> drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
>> index 966d79c98f9b..8cd331cfb4b3 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
>> @@ -19,7 +19,8 @@
>>   #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_COMMON_PWRDN_B    BIT(0)
>>   #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_SHOW_REV_ID    BIT(1)
>>   #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL10_IRQ_CLEAR_CMD    BIT(0)
>> -#define CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(offset, n)    ((offset) +
>> 0xb0 + 0x4 * (n))
>> +#define CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(offset,
>> common_status_offset, n) \
>> +    ((offset) + (common_status_offset) + 0x4 * (n))
>>   #define CSIPHY_2PH_LN_CSI_2PHASE_CTRL9n(n)        ((0x200 * (n)) +
>> 0x24)
>> @@ -176,19 +177,23 @@ static void
>> phy_qcom_mipi_csi2_hw_version_read(struct mipi_csi2phy_device *csi2p
>>              CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset,
>> 6));
>>       tmp = readl_relaxed(csi2phy->base +
>> -                CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs-
>> >common_regs_offset, 12));
>> +                CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs-
>> >common_regs_offset,
>> +                                  regs->common_status_offset, 12));
>>       csi2phy->hw_version = tmp;
>>       tmp = readl_relaxed(csi2phy->base +
>> -                CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs-
>> >common_regs_offset, 13));
>> +                CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs-
>> >common_regs_offset,
>> +                                  regs->common_status_offset, 13));
>>       csi2phy->hw_version |= (tmp << 8) & 0xFF00;
>>       tmp = readl_relaxed(csi2phy->base +
>> -                CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs-
>> >common_regs_offset, 14));
>> +                CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs-
>> >common_regs_offset,
>> +                                  regs->common_status_offset, 14));
>>       csi2phy->hw_version |= (tmp << 16) & 0xFF0000;
>>       tmp = readl_relaxed(csi2phy->base +
>> -                CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs-
>> >common_regs_offset, 15));
>> +                CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs-
>> >common_regs_offset,
>> +                                  regs->common_status_offset, 15));
>>       csi2phy->hw_version |= (tmp << 24) & 0xFF000000;
>>       dev_dbg_once(csi2phy->dev, "CSIPHY 3PH HW Version = 0x%08x\n",
>> csi2phy->hw_version);
>> @@ -375,6 +380,7 @@ const struct mipi_csi2phy_soc_cfg
>> mipi_csi2_dphy_4nm_x1e = {
>>           .init_seq = lane_regs_x1e80100,
>>           .lane_array_size = ARRAY_SIZE(lane_regs_x1e80100),
>>           .common_regs_offset = 0x1000,
>> +        .common_status_offset = 0xb0,
>>       },
>>       .supply_names = (const char **)x1e_supplies,
>>       .num_supplies = ARRAY_SIZE(x1e_supplies),
>> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h b/drivers/phy/
>> qualcomm/phy-qcom-mipi-csi2.h
>> index 7e55ae007370..d6366f809e51 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
>> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
>> @@ -51,6 +51,7 @@ struct mipi_csi2phy_device_regs {
>>       const struct mipi_csi2phy_lane_regs *init_seq;
>>       const int lane_array_size;
>>       const u32 common_regs_offset;
>> +    const u32 common_status_offset;
>>   };
>>   struct mipi_csi2_genpd {
>>
>
> Aren't you using the CSIPHY driver in drivers/phy now ?
>
> So if phy stuff has to change then that change needs to go into drivers/phy
>
> ---
> bod

Since v15 the series has been based on the new CSI-2 re-architecture,
and this change is a prerequisite for the subsequent patches. The main
reason for keeping this in the Kaanapali series is to avoid introducing
an extra dependency and keep the series self-contained, which should
help with mergeability.

If you'd prefer this to go through the PHY tree, I'm happy to split it out.

Best Regards,
Hangxiang
