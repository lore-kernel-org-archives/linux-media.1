Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214D53FF1D0
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 22:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784585122; cv=none; b=Q2R9kjXczg24d8A5K+t3OGGjLKx1PlQdstF1ov0+BJH5emPKTqyyXYwY2Xg0vQGBBJEqV1EbyESvCpQqC0RzW32nZUZnNsXNW5r9qAXVsgp8KaAR03H8PNR04CaUxN7ixHG+dXcFeaQF87zpeROPbadeqk6yPUUUc1MC0MXONdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784585122; c=relaxed/simple;
	bh=XRWvWhKhLL0c0EJZwYELJdJ/V3BC1zTAWN1dfZmrmvo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CJbeVD7nUbOcRdwvjZYc1XSqjcE6/K4480Xtmcf89MU6Y5Y97doBZ2X0YoLd279t7oFJXVOV2dlQE2i+JG+OlRAYssrsC1vnly6Dt7EerQ5XiiKq9lmohT53LRoFHvdYgR33FdS+MspvI28VKKgjINOplzax9xPfDiWQSndKAHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z9T2Dkda; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C/2tvj86; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z9T2Dkda";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C/2tvj86"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KJTOes3283615
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 22:05:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	08HJyJ0GZxpjzqmTLB/wj4bOsoqhkuWOhe+LMHc6q+E=; b=Z9T2Dkda1IXy2mJ9
	HpzTDxU27K4sZbKzhUHFetgD3vJU2oJxSbWYfe1XQaomX7paffzu2JNetLaLWc5K
	TgoaIsOh979mjC/8eq2RUJEuwYmcxx57vbZWINZXZuC8AdksRJHrUZB/cP3ObjDl
	bp4z3YgBHFKOyLtJ6MzhMWfqTkJRLBYM4+SwrQKMpNIkSeudOFbmPmKj/UOItYr8
	Rf8vH6zIT4yD1vcP9AhK+iLL6V6DvEgRWWAVd5q+dHnMuRbzNYoRUUjr4ZGeDpH4
	iMzvhjWnzhNKVAdTfj75dYAEozo8FZIsOhvmTnOzGjIuD5UYtssmItpBeUxhyEy0
	FNNm/Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhh5y368g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 22:05:20 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-381abcccbf4so6808242a91.3
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 15:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784585119; x=1785189919; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=08HJyJ0GZxpjzqmTLB/wj4bOsoqhkuWOhe+LMHc6q+E=;
        b=C/2tvj86rVMETbAxko4wyQEEodYop3e6EXlUO5pS0yF+LQeADlTMih5YDS+I5L9wrP
         hykSVYI8kfKu/mRsMdpmbZWukeqt15mygL+T6UYFzsZhD3BaAxh4Hvd0MqyAGVir1uYR
         DxRLZe3iH+w0FwlCThzzJ2iryhgGjgU1IM2kGWCa3qK9YzH+2mIwbX7jNJPSoClRFSWd
         tdtiUjZ0su+94XRO7gkxqCgoDUV5gD0Jl/aVMiz9cWyFCIPU68zSZJrOM42JGti1BWMz
         JnF2z7++PUGfAc0bbX4KrrWN+ONNfRvvw6xD2h7Eqh/jT7ojXm3h+e+Ywcdn9Bqa8Vfa
         xiUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784585119; x=1785189919;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=08HJyJ0GZxpjzqmTLB/wj4bOsoqhkuWOhe+LMHc6q+E=;
        b=ahWjyuJ5PS5KLCcOyd3LG4bCH2Orz2iRJBpJDd6TZFVkiN6uK9d/7YRYBLo4vYFK6R
         RadeR2lLN/bcdu3EJtNpm0vrC2teJyufv2BteCU8fNgdkeazk0wII3ioJAZik8pYEqzF
         LwE+gyH8M4XrzHGkq+wcwNoMv94IYsqXXOKyWcSwCpmDhgKa4W4H1GhQB11s3p9cMPae
         JIeU4BNuGJWMuOAEqh/1FYlqnofcZXmyMD11HNMI2ZFH0udpW1ykx2grW1zlqnp4HlfR
         1FQa8e3rDBgC6qDYseTy7Qx+KZLi2pQa/+H2J0xmOzVQmiLZmDzGY/WOhrkMKBuI2KDG
         JFeA==
X-Gm-Message-State: AOJu0Yw2MNCNmdswslWWn2C7Il/rXRTmARU+X7x6X5dQ/zUjynE1hK/5
	dLipgs3mjvxzeGcRgRfVZ+/OkP9sWVl/yv3O33Bqdh8PUqnFmFN6iI93iL0UbxJ1Zyq3pSLyqMj
	A+LuUSovJdhqyA8RPYA2WFewGMcZ+2eW0XavyoEK31pb8soxN0QN3Qo5UiVBwX9WkhQ==
X-Gm-Gg: AfdE7cl/pr0kLfKC8WCYvXKixk8AqD2nhCZgmI9oFYphTNn3IuqHm9VLHbg2QrtueMg
	CIkH94GR84VLo2s/vOBCbKvM5FBUj1xsVaZL5xFrpDM+0tHYaZ/zZ8flYSYJTzbtlhUCfk6R1iJ
	m2ZLhSW3DTxhauQkfQXSycpTT6tllIyd3k0N8BqOp7z7aNTsAW/MMgTu1yHVgOQt361/xbWYGXX
	xoqsCFjSKltgjaBjg2H/JxXSvbyszH71XnMohtlQ1/tOOyIHdEvEGWKTqeHM8wDQ/GXR7wW22/4
	OhJbUvXoAxjGyc15MZpOOZp3zDSzTopBkW5sIKF0KQJdCvxZ+gjjlZ2cC2pEcgc7b1IxQykywzB
	Jf6CHmRZDCdbPFoShN7pKPeRcnIfFSVJlBEbma720A/0RvILFObBMbd5adw==
X-Received: by 2002:a05:6300:95:b0:3c3:9df0:2d66 with SMTP id adf61e73a8af0-3c3ad7a323emr17386319637.6.1784585119500;
        Mon, 20 Jul 2026 15:05:19 -0700 (PDT)
X-Received: by 2002:a05:6300:95:b0:3c3:9df0:2d66 with SMTP id adf61e73a8af0-3c3ad7a323emr17386270637.6.1784585118920;
        Mon, 20 Jul 2026 15:05:18 -0700 (PDT)
Received: from [10.71.181.181] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429ff04absm37342978eec.8.2026.07.20.15.05.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 15:05:18 -0700 (PDT)
Message-ID: <d19dbe9a-6515-4f67-a1b8-4b0a9bd43b25@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 15:05:17 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] media: qcom: camss: Program CSIPHY common control
 registers
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, jigarkumar.zala@oss.qualcomm.com,
        gjorgji.rosikopulos@oss.qualcomm.com, hariramp@quicinc.com
References: <20260717231331.1229693-1-anusha.nandi@oss.qualcomm.com>
 <20260717231331.1229693-2-anusha.nandi@oss.qualcomm.com>
 <CAFEp6-2epusvgnSthNRBvOq0vONk3hu7v6tq6SF-HjnSWgpstw@mail.gmail.com>
 <530a9493-24c7-4812-8ada-591c7b63b651@oss.qualcomm.com>
 <286a1fc6-bd58-4ade-b183-e53776ba7a09@linaro.org>
Content-Language: en-US
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
In-Reply-To: <286a1fc6-bd58-4ade-b183-e53776ba7a09@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDIzOSBTYWx0ZWRfX2M39bINQm2n/
 juikwlwVi5dTunfjBvJvGJOdnfyMMkCLR2QwLuKq29oGERyHWT0OszvZC0ATwUK9WWs5AzoCOHp
 5J5PRFco8CUnDqxu1rbn86uxiRVLQN8=
X-Proofpoint-GUID: PU8Hz-k3QUd23-WpabW3UMfs4iZRgvk_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDIzOSBTYWx0ZWRfX5pRewOKnIGPr
 d1fFJmkSGHUAnIO8KigEHhyJ4AHReoX9++YEAguk7R+SMzR+4VNkBwLmkVzhXeRLOz4R5g0cPNW
 RZ8YSzIHqpfkDpuo5NeObakAHfK98GbB3B2WmMZQo+RXtjuQoqHeiKx81x6pMuFCvGr0N0COJh5
 8LC2BGMSVPbO89zknI9zjptrIZAXpwBV8zl/dwqlBEI0EpxXA5jZHKr8hyeLoHyMIAQzmKGWfwo
 TU3UbDTrkkqAa9YbYLY2/9QP6M/BN01TJ1NkkLAukwH+93b1f4BUfhNDR20qdrEBE9fRawhzIb+
 Cg6D40+LuZYNd/nMjjNmVbohRmOoNodHmNk851UjxmExasf0Ax2JzBFwnl7AJRgGwIjF0C1Ti7T
 ZFWxx7KU6I6EZBl3NlkG1QJp/BgAsEhGOP83Xyg0H/1aHLunfx1Qx0tP+26WW0SBm3vjbGcdg26
 hQoceNIIalTLb+txUpA==
X-Proofpoint-ORIG-GUID: PU8Hz-k3QUd23-WpabW3UMfs4iZRgvk_
X-Authority-Analysis: v=2.4 cv=f/x4wuyM c=1 sm=1 tr=0 ts=6a5e9ba0 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=5T8G_QvBM0rgUmogAq8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_05,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200239

On 7/20/2026 1:06 PM, Bryan O'Donoghue wrote:
> On 20/07/2026 20:38, Anusha Arun Nandi wrote:
>>> I don't really like this big camss-version switch case with magic,
>>> which also introduces more magic values. Maybe we should have a
>>> different version of csiphy_lanes_enable, based on the phy compatible
>>> or revision.
>>>
>> Thank you for the feedback! We agree with your suggestion and will
>> refactor this to use a version-specific implementation of
>> csiphy_lanes_enable, based on the PHY compatible or revision, in the
>> upcoming patchset.
> 
> Hmm.
> 
> Please don't do that. Instead work with David to get CPHY support into
> the dedicated driver - including whatever additional work is required -
> perhaps nothing more than reusing the existing dphy_opts structure for
> cphy purposes.
> 
> Proceeding in the direction elucidated above would mean inclusion of
> four CPHYs into the exiting infrastructure - that's not "stopgap" that's
> established precedent.
> 
> A big no from me I'm afraid.
> 
> There's a real upstream gap to be addresses for CPHY. Let's address it
> not work-around it in a specific way for our platform.
> 
> I'd expect to see some kind of subset of
> 
> 
> include/linux/phy/phy-mipi-cphy.h
> struct phy_configure_opts_mipi_cphy
> 
> or perhaps we can reuse/abuse struct phy_configure_opts_mipi_dphy - for
> example could it be changed into a generic structure to contain both
> cphy and dphy data - with an appropriate name change ?
> 
> My feeling is a phy_configure_opts_mipi_cphy structure is required but,
> perhaps both cphy and dphy can exist in one structure or in a union of
> structs.
> 
> TBD
> 
> deckard@sagittarius-a: /home/deckard/Development/qualcomm/qlt-kernel
> git:(arm64-laptops-v7.2-rc1-camss-v6-ife-bringup) ✗
> ➜   grep dphy include/* -r
> include/drm/bridge/dw_mipi_dsi.h:struct dw_mipi_dsi_dphy_timing {
> include/drm/bridge/dw_mipi_dsi.h:             struct
> dw_mipi_dsi_dphy_timing *timing);
> include/linux/phy/phy.h:#include <linux/phy/phy-mipi-dphy.h>
> include/linux/phy/phy.h: * @mipi_dphy:    Configuration set applicable
> for phys supporting
> include/linux/phy/phy.h:    struct phy_configure_opts_mipi_dphy   
> mipi_dphy;
> include/linux/phy/phy-mipi-dphy.h: * struct phy_configure_opts_mipi_dphy
> - MIPI D-PHY configuration set
> include/linux/phy/phy-mipi-dphy.h:struct phy_configure_opts_mipi_dphy {
> include/linux/phy/phy-mipi-dphy.h:int
> phy_mipi_dphy_get_default_config(unsigned long pixel_clock,
> include/linux/phy/phy-mipi-dphy.h:                    struct
> phy_configure_opts_mipi_dphy *cfg);
> include/linux/phy/phy-mipi-dphy.h:int
> phy_mipi_dphy_get_default_config_for_hsclk(unsigned long long hs_clk_rate,
> include/linux/phy/phy-mipi-dphy.h:                          struct
> phy_configure_opts_mipi_dphy *cfg);
> include/linux/phy/phy-mipi-dphy.h:int
> phy_mipi_dphy_config_validate(struct phy_configure_opts_mipi_dphy *cfg);
> include/linux/platform_data/media/mmp-camera.h:enum dphy3_algo {
> include/linux/platform_data/media/mmp-camera.h:    int dphy[3];        /
> * DPHY: CSI2_DPHY3, CSI2_DPHY5, CSI2_DPHY6 */
> include/linux/platform_data/media/mmp-camera.h:    enum dphy3_algo
> dphy3_algo;    /* algos for calculate CSI2_DPHY3 */
> include/media/ipu-bridge.h:    u32 dphylinkenfuses;
> deckard@sagittarius-a: /home/deckard/Development/qualcomm/qlt-kernel
> git:(arm64-laptops-v7.2-rc1-camss-v6-ife-bringup) ✗
> ➜   grep cphy include/* -r
> include/media/v4l2-mediabus.h: * enum
> v4l2_mbus_csi2_cphy_line_orders_type - CSI-2 C-PHY line order
> include/media/v4l2-mediabus.h:enum v4l2_mbus_csi2_cphy_line_orders_type {
> include/media/v4l2-mediabus.h:    enum
> v4l2_mbus_csi2_cphy_line_orders_type
> line_orders[V4L2_MBUS_CSI2_MAX_DATA_LANES];
> 
> deckard@sagittarius-a: /home/deckard/Development/qualcomm/qlt-kernel
> git:(arm64-laptops-v7.2-rc1-camss-v6-ife-bringup) ✗
> ➜
> 
> But to be 100% - I'm fully against burying inline CPHY code into CAMSS.
> 
> The long term objective of cleaning things up and reducing technical
> debt can't be realised by - adding more technical debt.
> 
> And I'll reiterate the right-thing-to-do (tm) is to expand the kernel's
> understanding/definition of PHYs to encompass CPHY for the benefit of
> users and the entire community - instead of a qcom-specific hack.
> 
> ---
> bod

We understand your concern here. We will work with David to integrate
C-PHY support into the dedicated driver infrastructure, and explore the
appropriate path for a phy_configure_opts_mipi_cphy structure — whether
as a standalone header or as an extension of the existing
phy_configure_opts_mipi_dphy structure. Thank you for the detailed feedback.

