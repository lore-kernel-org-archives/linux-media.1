Received: from mx08-001d1705.pphosted.com (mx08-001d1705.pphosted.com [185.183.30.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A0E2D8370;
	Tue, 25 Aug 2026 04:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.183.30.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787631618; cv=none; b=I7fRAeVq36Dxx5xyoYbVhh8QuHPhvNKxl8eHYd+uroCHz/Em7tGn3oYyxHTOrVkZFDJOssTfsJb9SHYBoXVrkeZU4sQN4guS7Y/uL+nTVOxajegU6mVti5fHqT+kazqts7A08e3okxg9g4rsqsuJxLNB+DUh22ufUF++TNRu6WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787631618; c=relaxed/simple;
	bh=rJaeg1blBpFXAjXQix/GM1ndpgD4OUn3gqU3Nk+3m2U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HuBd3O3aI804rtV7dl/XCdJpJHRXJbCA1xCksF4UckSAQcapTMLfN2l5hSMYuywMfhFgyaCaxdp+z3svXNF3YxAw1n33W/Rg2JGfSz/Eaf5MDx46t28SFH3zeDOMP9x3PVFR432iIXflhNcajY6kFMNzjF4+tU7MJa75hcaEKmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=pn9st3b2; arc=none smtp.client-ip=185.183.30.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="pn9st3b2"
Received: from pps.filterd (m0209318.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P3Qk4n2287054;
	Tue, 25 Aug 2026 04:19:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=p1; bh=XOd899j
	X1UCqv30mDrBdXEq60vw1irW8OL4rcnCWN3g=; b=pn9st3b2pRSDdaw4MIW+l2n
	UPydgMg4W7X3VPeMuh6JwGIoqPnChih2KnEC8AekmMhgaLGMMtMuLXxi07sDS0ju
	jiZG0IKCTuLQZHAHlRaRE3viN3mUwJDPk7w8ML2F1CGMrdyhB8yUDFMp24cHuywh
	qKdei3yB/lXGNIOMlc6f37MGODDHOssM0r5dDczZozSMCE+FVO0oZMmdMxDpgHS2
	ompSUjfIdMsnu6tUS8pB/SNBBNH/bU9mb5nOGDPEXqNqS9Eq6uTROYhTzUgj7WHR
	9REhtjgacgKGDBgxNInCGZ8Jx+mVIqHkTozro9thrP1Y4/c/0jaGka1bh3geXxA=
	=
Received: from sgppsem01v.sg.gdce.sony.com.sg ([121.100.43.221])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 4g72b5tw51-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Tue, 25 Aug 2026 04:19:52 +0000 (GMT)
Received: from pps.filterd (SGPPSEM01v.sg.gdce.sony.com.sg [127.0.0.1])
	by SGPPSEM01v.sg.gdce.sony.com.sg (8.18.1.11/8.18.1.11) with ESMTP id 67P3j5ZA4034869;
	Tue, 25 Aug 2026 04:19:49 GMT
Received: from sgppsba02v.s.gdce.sony.com.sg ([146.215.113.219])
	by SGPPSEM01v.sg.gdce.sony.com.sg (PPS) with ESMTPS id 4g7ameg2nh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 25 Aug 2026 04:19:49 +0000 (GMT)
Received: from pps.filterd (SGPPSBA02v.s.gdce.sony.com.sg [127.0.0.1])
	by SGPPSBA02v.s.gdce.sony.com.sg (8.18.1.11/8.18.1.11) with ESMTP id 67P2QSMH3555528;
	Tue, 25 Aug 2026 04:19:49 GMT
Received: from [43.3.253.133] ([146.215.113.251])
	by SGPPSBA02v.s.gdce.sony.com.sg (PPS) with ESMTPS id 4g7amfpev0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT);
	Tue, 25 Aug 2026 04:19:49 +0000 (GMT)
Message-ID: <16b096e1-f2de-4f68-a4d2-7d667d8bd13a@sony.com>
Date: Tue, 25 Aug 2026 13:19:46 +0900
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] media: i2c: Add Sony IMX908 image sensor driver
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Jai Luthra <jai.luthra@ideasonboard.com>
Cc: devicetree@vger.kernel.org, hverkuil+cisco@kernel.org,
        laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org,
        mchehab@kernel.org, sakari.ailus@linux.intel.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org,
        kieran.bingham@ideasonboard.com, Ryuichi.Tadano@sony.com,
        Kengo.Hayasaka@sony.com, Tim.Bird@sony.com, Kazumi.A.Sato@sony.com,
        linux-kernel@vger.kernel.org
References: <20260806070934.21764-1-lachlan.michael@sony.com>
 <20260806070934.21764-3-lachlan.michael@sony.com>
 <178608558219.4139729.1786136799159384307@freya> <aoV3zV1jDB2j9b5j@zed>
Content-Language: en-US
From: Lachlan Michael <Lachlan.Michael@sony.com>
Organization: Sony Semiconductor Solutions Corporation
In-Reply-To: <aoV3zV1jDB2j9b5j@zed>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Sony-BusinessRelay-GUID: qA5zvhUViYDiicJ4y4XNYvQ4fvQ0ecwy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_01,2026-08-24_01,2025-10-01_01
X-Sony-EdgeRelay-GUID: _t45N4GbmwdPK_8jm80ppxKKAIjZrLA8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDAzNCBTYWx0ZWRfX5WOiKRYkoI5Z
 CtpxLV5tUxPfOTGjJ75G3PWXa30a1aNMpwBGxkY1WFJBNQRDlbVdJ59jeOFrDiw9uPlWKiK1Boa
 HrPr7DCuqebmzLLcPy8JABssM6aQfn0wuzHw8TI4ZZaPF65eCcBPFhEWYdgFwVP5xSF+h1vs2sj
 SkZp6syASa8v4hd6qU9gORlrAHGgDxXDGnxxGm2tSDzCBzJkPZBjAnDIsYnrWOVzQlsnZQ+rrck
 Za4JMTKxbg1905h29iY2pV05oocCTXyM4fHBP7H6Tlwh0ZUuzmw4DnqgTLCh5MoAwB7GBf1/qNw
 3z+blssg8dRjid5W5uZblBAHAyQ9YMuNA6n5odX7/JyJS91NroUIpXJpnl/fKR+KcAsBrdqhuAG
 omnemoYBGAmJ9WHwldiuv21GuF/vT74+VPXXRcOoQK8Ua2ng316RFxFhfizUgJFz/0R9Mc5My2p
 fgB/Lv/grAUOSKNzO6g==
X-Authority-Analysis: v=2.4 cv=XvXK/1F9 c=1 sm=1 tr=0 ts=6a8d17e9 cx=c_pps
 a=5iEaAFJ3UIynSlflvg1n/g==:117 a=5iEaAFJ3UIynSlflvg1n/g==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KAb5x4SsHD3PzxGk7EmX:22 a=XGr2FpfLDd2dUKU_94WB:22 a=C2Wck1hqlHncK-hOJGIA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: -VanghpVg7v0VSAsOgW_G-U3YrO1h4xU
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDAzNCBTYWx0ZWRfX+ELuhq+8/34v
 Oe1keNvN07A9nMQc7HlekwZGJtAEYklROwtI5fJUG4IIR0MGpidHqtGsWKQ0BhTrJM2253N8Ii6
 5tluI2mG8owvgPzhFAYygPBrqn0CmcsttFqvkcHyIQVX182QYoc0
X-Proofpoint-ORIG-GUID: -VanghpVg7v0VSAsOgW_G-U3YrO1h4xU
X-Sony-Outbound-GUID: -VanghpVg7v0VSAsOgW_G-U3YrO1h4xU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_01,2026-08-24_01,2025-10-01_01

Dear Jacopi,

Thanks for the suggestion and reference.

On 8/19/2026 6:34 PM, Jacopo Mondi wrote:

> [snip]
> 
>> > +static int imx908_init_controls(struct imx908 *imx)
>> > +{
>> > +       struct v4l2_ctrl_handler *hdl = &imx->ctrls.handler;
>> > +       struct v4l2_fwnode_device_properties props;
>> > +       struct v4l2_ctrl *link_freq_ctl;
>> > +       int ret;
>> > +
>> > +       ret = v4l2_ctrl_handler_init(hdl, 11);
>> > +       if (ret)
>> > +               return ret;
>> > +
>> > +       imx->ctrls.pixel_rate = v4l2_ctrl_new_std(hdl, &imx908_ctrl_ops,
>> > +                                                 V4L2_CID_PIXEL_RATE,
>> > +                                                 IMX908_PIXEL_RATE,
>> > +                                                 IMX908_PIXEL_RATE, 1,
>> > +                                                 IMX908_PIXEL_RATE);
>> > +       if (imx->ctrls.pixel_rate)
>> > +               imx->ctrls.pixel_rate->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>>
>> Not needed, PIXEL_RATE is marked as RO by the control framework
>>
>> > +
>> > +       link_freq_ctl = v4l2_ctrl_new_int_menu(hdl, &imx908_ctrl_ops,
>> > +                                              V4L2_CID_LINK_FREQ,
>> > +                                              ARRAY_SIZE(imx908_link_freqs) - 1,
>> > +                                              imx->link_freq_idx,
>> > +                                              imx908_link_freqs);
>> > +
>> > +       if (link_freq_ctl)
>> > +               link_freq_ctl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> 
> Read-only controls should have their control ops set to NULL, so that
> .s_ctrl is never called for them.
> 
> See as an example:
> 892ac5e6cd1f ("media: imx355: Use NULL ctrl_ops for HBLANK as it is a read-only control")
> 

Updated accordingly. Both V4L2_CID_PIXEL_RATE and V4L2_CID_LINK_FREQ are 
now created with NULL control ops, as they are read-only controls and do 
not require s_ctrl() handling.

Regards, Lachlan

