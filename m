Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FFE3EE1FD
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 10:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792146206; cv=none; b=U78DdKiPnJiCqaO/C81QRvFWEcEOic7yRDykDNu5CJoskMsNFDIwACeGDqLyt5mT4VGLb4F3Puq9miAy0SpbpI4R4dntyV3yuKpQ25kPYLbyHlxV6ZN25x4WVnF81XchE1edJ0Wf99yQfU5r66E+o4BCbgzlNq1SNdBdTb1nGqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792146206; c=relaxed/simple;
	bh=15buIIlNf3tgl0wvLkAgj0F4i2nMOLnscTsFnzSbnZw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nXuR/VdbbK5S10SWmSInRCAXn/apoL0kWh2POJsNkyPo44BvBhtLv29k+K6Ph7zF73GxmJEisUdXAR7CtCW0ENpnwHVr44NB78mrEB/THrV3Yi2P7D/9yl5VyjL1ISq0OjQ0lVPOpWOhzhVylG1NLdKDowNzbzxIoFMFr9Z6Hu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iTAPLbf4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L6gVEI8s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iTAPLbf4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L6gVEI8s"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GAAL212403284
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 10:23:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7YMYqr5YkntzBuDOrRU61JXyj28J8EWH3XY6p0V0KLo=; b=iTAPLbf4zvMMBO6p
	QF7MVRMWCvwobnLfD0y35EGsEnP2Etj3GWwYkTiwnhXTgd0pd8VrVbSFy1CWrCU+
	76VQG0cTsTN3fukYv+CkalOGxpuq2iDN2cQVsGozk6zWalGoDw6qiT4ww6GhO2kE
	8ygNtQoB7AGsExjUmAIqQNF8iIZtMvleevbeRSoWulF2DfvNNW19rZx3X8a0BIXY
	ggjAJVg2jWO2DIcErJ2HyTMaCbrI4H2e5azf4tR64YPFOLbumTj7iEiVxuJr8V+x
	FsnIVm5Bl1+CUuY1rNpLxy5NkDiDpCLZOxFmOlUJ9c4cPT8HI90OyX7p2NyuRjxT
	KroB4w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb19m3yu4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 10:23:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ea6b66e53so98913285a.2
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 03:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792146204; x=1792751004; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7YMYqr5YkntzBuDOrRU61JXyj28J8EWH3XY6p0V0KLo=;
        b=L6gVEI8smBHPa4xNFYvTSzpI3keevnsZnYdER5Uaky92A79MpTb1y7Y9xSqFaCSIqr
         VaBWCryp1/TFq5eni9d82wflQtSVoyfWgXmhmccQJg6LYVB9pv5SLH1veZcQQuRmW9Ky
         Yc10jCfDy3u7LJm1HrvHEZMFCyQ4Tvp3VJwJQ6uvNAvIUbsJXzQKop4BJ8+O6oewoTaE
         ouyl5rFqQPpXT2Y8m2grAoF0hETxFlR73l4wi/T3cwhY+Fa375vNv4P/mDbYzzuHTPqz
         74xgJQn5Teelj9PwAvqrEzUzqOl/fQydc18Sa49TIMiDHWT/9OL706KiFoQYwgFYIXsB
         wvhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792146204; x=1792751004;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7YMYqr5YkntzBuDOrRU61JXyj28J8EWH3XY6p0V0KLo=;
        b=CqHv2xkk0hhRSL/NNlqrPCE9a+Ept24+yn/ZJpfSj0u3GN/tRl/ldWNTB4ciGzrDx7
         f93YQGNtXnuFLdFADQwmBeW7AAsaiWR/6X9J/UpyzO/X6kb4+lDtJkiCA534H4yHsczf
         oLjpYHTStMmU1rHv1/bjrKkIVbjCRi0z5VgAt1Gfvhoeo8GXXPFABMET8QE7L1yPqYC/
         EtcQYGI6Rp8hzh+V2BCNTDrXKrJntuoWNDFHujK/BpVy1v/LPXjAh9PdVqVL8fF58tgN
         ggunkF/nVk2Wq2HUq1gu8XRiRXMn1IdpeiZmzcTw6X9n+KLGXzmT/TvWIyQGxU1LYydu
         mWsQ==
X-Forwarded-Encrypted: i=1; AKwUvBzyHfFUpubtmUXSqBNbHk+TbMetwVYydIIqchzuAochiEIlrQc2/5bBpCo9p4hgTJjtEUvdv8vD+30hvA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKqvSP1Oy+I41h/5+AcGFbQ3c4r31wP/TxrWpm8sykR4T6+1z7g
	Zb/zTFA/3qqSLQWs7Wb3jUjC/2hrnmyjmXpd7likQdi4LIH0YXRZJF1FpbolxshQRahnoj7OjI8
	87V7eJ/+cwdNO9aaaNoQBTvl2kA5iqnyQkjS4AqOH1Lt/5/+ZgtP2op2pt0VJ+PWznQ==
X-Gm-Gg: AYBFou3s26In6pnY/iYb9MGWMpTFGZDvrjnRLpzWuy8bZZE7sOjuN59VOatBhp5DoDP
	TKzGMg1MEJCr2drLrDmvYJIpn71egfsQI/jCLfqTqCeYTWCjVleWQS4Rv5fqO/7RcoX93RusfpA
	syGBdyxA399DjF/bQbTslgGBuEUT9PfqhQMJb0HxQrZeR6qzLiXRlL46C+yHbT8HN8LPts28Hrt
	mkDnus+bRvGmYaimOVkRMLXc6brYEFE6dGMeVY2ba/fWRxe9HRbn9xhVh3zbmBhwEDZubOOiFFt
	pA8/+KJvjqYqYUDJ2EOfW8DSrNYejn0r4TiSDS3hkKkPjOQ76USpRJlffLM14XziHQds+/v+LL7
	XvPCaltFXcEaWgDSQMxQn9Q==
X-Received: by 2002:a05:620a:458f:b0:93c:61e0:81ff with SMTP id af79cd13be357-93ebd0a3722mr4305581985a.1.1792146203568;
        Fri, 16 Oct 2026 03:23:23 -0700 (PDT)
X-Received: by 2002:a05:620a:458f:b0:93c:61e0:81ff with SMTP id af79cd13be357-93ebd0a3722mr4305577485a.1.1792146202905;
        Fri, 16 Oct 2026 03:23:22 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1335d3sm772135a12.3.2026.10.16.03.23.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 03:23:22 -0700 (PDT)
Message-ID: <1bccb6a2-3ec3-4790-90ee-18912d4a8336@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 12:23:19 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/4] phy: qcom-mipi-csi2: Add C-PHY support for
 X1E80100
To: geocausa@gmail.com, Bryan O'Donoghue <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261015-x1e-cphy-rfc-v1-0-1f3fa9af940a@gmail.com>
 <20261015-x1e-cphy-rfc-v1-2-1f3fa9af940a@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015-x1e-cphy-rfc-v1-2-1f3fa9af940a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aLdlOr9m c=1 sm=1 tr=0 ts=6ad1fb1c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=O3v3i-bjyAfycMMqM-EA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: SZnYLnIPUcZqDxBx9Hpdr7E1OMgXxe9d
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA0MSBTYWx0ZWRfX+yajRJIlNWEm
 ZgeiohByE2ohsnXhuI4mPUs1+0VEZFJa4SrWYGT/e7X7L45V/uQ/9Qeoh0k4O85s//ctM2rRQQR
 kUG9P4+iQfzTvVwmpCnXr80orfp2dVg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA0MSBTYWx0ZWRfX0mF/HhUhIr7V
 xF9gTD/1yZ+kw4M+VTaze0s1Dw841SlkYauntb1cYX5RsuaA01lLxX/YPG7hxxTCf3uqCf4P6//
 iIFVXC63Yn/v1H5QrhHF+LPm2+E0gnXj2SmupW4tx0p1qH2dAxBccUEqR9CnPoruXqAftc0rYm1
 YT0vrsQeri4NxYIG8F7jxT5OPnXdl4UAJ0LGADqyYsOgqxkY5+xu1EzBzaxGoYUzlue3cqYgvtD
 plbCpgJmsg9Vet4GruXjKVKZbuON4Idg/SqBXDbU67kaSNGVFgmKKXeHB+VkMroxUfNbIUR+lFG
 svL7z2VS7vwAm52iQ+laoHUAaPId+4ySsET7L+xv9Bjy6F1W4IzzQf62jDLGQ1uVsItpSC4Hyw2
 CAlU5Sb9qqLtrTF3ZVRJYOifmq3+rA27hPp2LxpVyA0ZZD/4lsgfoi1DYKSu7FZyMtHteFxfTop
 JP4kalEam5MA4UHwBvQ==
X-Proofpoint-GUID: SZnYLnIPUcZqDxBx9Hpdr7E1OMgXxe9d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160041

On 10/16/26 12:20 AM, George Neacsu via B4 Relay wrote:
> From: George Neacsu <geocausa@gmail.com>
> 
> The CSI2 PHY schema already allows bus-type C-PHY, but the driver
> rejects it. Accept it on SoCs that provide a C-PHY sequence: up to three
> trios and no lane polarities, and set_mode() has to ask for the mode the
> endpoint describes. In C-PHY mode, configure() takes the symbol rate.
> lanes_enable() powers up the trios on the odd CTRL5 bits and writes the
> C-PHY sequence, which carries its own timing, so no settle count is

[...]


> +/*
> + * 4nm 3PH v2.1.2 C-PHY, 2.5 Gsps, from Qualcomm's GPL-2.0 camera driver
> + * (cam_csiphy_2_1_2_hwreg.h: csiphy_3ph_v2_1_2_reg[], datarate_212_2p5Gsps[]
> + * and the 3PH reset-exit write), one trio block per lane triplet.
> + */
> +static const struct
> +mipi_csi2phy_lane_regs lane_regs_x1e80100_cphy[] = {

Let's rename the struct to make this comment redundant.

FWIW 3ph === CPHY, 2ph === DPHY, so we can drop that. Maybe
just lane_regs_v2_1_2_cphy[]?

Konrad


