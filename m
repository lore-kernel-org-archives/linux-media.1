Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781E61A3160
	for <linux-media@vger.kernel.org>; Tue, 11 Aug 2026 12:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786451865; cv=none; b=tmQs6hzEzxIyvXjSjzzjvW8nXZeCUbUowQu9QuW5YPs7dtbtxc+mt3YKkuUtU7eU4fOXd+8UmSXkYappMY5QdmTJSf5XVtrdKfdsFHvtrIjXg+8x3DnhbPoctzAGCridIeMenySNzEnbzKJxf+3PNmfg7kaccEbY1ZHCdZqkL2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786451865; c=relaxed/simple;
	bh=HKmGI+SB/G35qzdy6opgsXokSMpao3fbI1mnVLiBl0g=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=LQK0BDy+7g86cHRUInN2uY3eJVnUIZrMLAFoF29lKItXv0EUslSw2Ej8h9/npeR9DlbAyW05IUvlXOxrf4tsuVA5fpvUJz+lOobU558Zp+I5XFp8lGcXMNRBEUtZNjNnGGa+Camit/Njz7fv+u6St8eE83tqL9MmqYqNrsVNKWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QSHUUxeb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hbZU3zrW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QSHUUxeb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hbZU3zrW"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BCQxEU618209
	for <linux-media@vger.kernel.org>; Tue, 11 Aug 2026 12:37:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MTzuTTCy2TgtY7IDruYUew8TM/mjPuHb/N9lLfL5FCo=; b=QSHUUxebHr0FLNr5
	EkvlpdUVZANG21pz6rkVAy8P1C7LZkDkuWWGHSgkw/dRw/sdpTf0f3mMDOzCQzJP
	goV7N3W/Hhz7gc6GlUl8XsI4tJpIXWHTXHJ6TjNDKJHmsSUz2AOSwqVcA+YlJn2Q
	FQkyi/N8n5n0oZnfAQ8iNPNCW1U/of4fVQVhtdAGjZXI7zmRkS66NL9O4NZiVp+l
	4keH5hGTjwx+dmJjJrM56m2grj80GL9Dd1EICEQ3jwolsnd9zOe9oGdznS4Jjwjb
	6B2dib0ql/hP3fxIB2kUj3BPg3GZR7uI20aljT297dN6Rlz/Y0OKNXDE2EqZig5H
	9U843A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g01q10fbk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 11 Aug 2026 12:37:40 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c0408254aso12768881cf.0
        for <linux-media@vger.kernel.org>; Tue, 11 Aug 2026 05:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786451860; x=1787056660; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MTzuTTCy2TgtY7IDruYUew8TM/mjPuHb/N9lLfL5FCo=;
        b=hbZU3zrWpxqM5c1zC91plJpnjabKhtPht7g0bpb9x6yLUcM0vs3yH7pqkiuUS06ikS
         YeO/C9F20zqghBSNq5FXU1SBl4TCiAABre9utR/C/DfNAg2gS9EsXkk+Om1pTRSGltG3
         JajN892SukZlxAQDleRC9WElSdHxm66xjo2dtsTo+xXOHHNEPxsxValAdcZyfO+GuEWC
         d7pRHQOHoCBq9D0E0So5/z7+IHwtYWpTWUAPGXB6vM5UtHmBEewDYkCIMmp0uG3V3yGl
         YW8zENjt4wOA7HAfJKstXRAkRSf8O3SKz/cfO0QK7HEHlagX4bKTLzgpmnYLuW+P+NK1
         PO0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786451860; x=1787056660;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MTzuTTCy2TgtY7IDruYUew8TM/mjPuHb/N9lLfL5FCo=;
        b=rRXkv+orjXTv7jhh2szb0ccCzyhGdwR53+aunF8v8AyzCS/ceMTyaFXv9yRPI31740
         LvBd9CdOj1v2Bx2h0IAq6XniLFsiZcfClVNzC1pV79oMTSV6MSLhtRRIo+6L1dc2VDZ8
         WX1KaIhAaT62tpBxEJJwn8v+rHMHtWAfe4qYOt8nQ4OJA7tloW9iqWyDPmewu6VV6Y3B
         8/7/QSMzkgAuSyiE2QTGmv/0244PlEu7jHRXwVYumbX4mIrLNekvNWB65/tG4F0QjVOj
         6FzCED1f6Sz8rHmdgB9wY4H450QPkQ7UvZBAqgfy59c5JjnDc85+bHyLHhGXSk9DcLRt
         WYTw==
X-Forwarded-Encrypted: i=1; AHgh+RoP1DCnPTBOh+NXJLjX5ozYOEuqttAx408cB1ffbeXHmOEZqZSksdcFb+JB05mKCWQv+oifOFu8+IARsg==@vger.kernel.org
X-Gm-Message-State: AOJu0YywnP4Qft4Hnbi9td8Y1Qgf+t+mMxVJsie9rlviBJxOrfhc+7eb
	Pf/YpfJIqKVEO3qXYJopQX1hKc1Bh2n+5+7wIrZeVsTuh3HaYPX9PsDxAP+zXwggRcqkUfs31Qh
	GBbPY2NBCoGKzPfdEq3s6V0G9kR8AR+l6LGTGsnZtrlfbXubbZyrM5y2fkjZ8epBDmg==
X-Gm-Gg: AR+sD11YVF5OqXtmRVCzdPe4mLl1JLtBEeuncNjJ/qvldED5/NTLD11mTR6oQXB9pqA
	Uzqcsnyg/v0qCy2sHex50JxgbDZSVrX0VcXEGEk2vOlTSckHlP16mKCVDYl3/M4o2V5H30Ngq8s
	oHjuN0oQh7WsB/LNOLSxS2HolCZ+wjFmPiXpHsE/+Ry+qCeu9sGc941fRkKCk0PBX7OoFJQ7Eko
	xAFKdi0/R5t3HlUAmNbvkIa85xvKUBvuWC/tJGVxoGA/Z6Xhkxo3AbkXGw0AGq06tssB1h7VPW3
	xWCZuJQ3PNyxU+LbbULmTZYLvrCmw8U89TaFPvSVzeXt3uBeoqNV9w8JW6YkMsaU6a9WXsSSJyw
	L4+baexU9NlRrFUfMyOpqCEOKc5Smr6w8AOPULgm1NgSaEWWIOdKja80Im37dF2OB7a3IVEGz4U
	275vP83gRA5xikrXvhEAmayEW0WgQooXr49FmdcK6u2iYMRmX2HA4EO0qyFjXrHkc/54Q=
X-Received: by 2002:a05:622a:17c7:b0:517:c65c:4987 with SMTP id d75a77b69052e-52d597ca686mr21776281cf.22.1786451859641;
        Tue, 11 Aug 2026 05:37:39 -0700 (PDT)
X-Received: by 2002:a05:622a:17c7:b0:517:c65c:4987 with SMTP id d75a77b69052e-52d597ca686mr21775581cf.22.1786451859088;
        Tue, 11 Aug 2026 05:37:39 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c20e439863dsm45134766b.62.2026.08.11.05.37.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 05:37:38 -0700 (PDT)
Message-ID: <3906a8af-4111-46c4-83d9-b49dd68d86f8@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 14:37:37 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: [PATCH v4] media: ov5640: select the MIPI lane mode from the
 endpoint lane count
To: =?UTF-8?B?5qWK5pm65oiQ?= <jason98166@gmail.com>
Cc: Steve Longerbeam <slongerbeam@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20260811-ov5640-1lane-v1-v4-1-c4a05d4c1b32@gmail.com>
 <b70b5fac-a39c-443c-bb9c-6f45d9826ad5@oss.qualcomm.com>
 <CAPwA33LtG6UQUXbR8pVO4G4poy9WrbGvoym7VUdH6OrVLJs+9Q@mail.gmail.com>
Content-Language: en-US, nl
In-Reply-To: <CAPwA33LtG6UQUXbR8pVO4G4poy9WrbGvoym7VUdH6OrVLJs+9Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ZeuF4UyGWa6M_qnDmHCwejjoZnWozliM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDEwNSBTYWx0ZWRfX1i3ASpMtJfTB
 UBPWqO7NJFPWF9QEP3+bbaPuWjROzkwC/JQJaI9k03N0mw7AedmDkjhUd+lxoSmXddVs8ZyJoFe
 Xu+GKqw9/gGh7MudNdGpQdF5s5slZwkhc3lQkHeSez4qvTwZK1FAXkOQCg5mZ0/Fr9fOzPpgcep
 Q8pOcS+AEa4IIBA+wWxms8RKBpFEGkqiEIMgxCsYUj0ybL815nd6muEwLfGZyVxlsQmy8QlgBPD
 uJjGp9FzvTqSb612vDmMPlqDK/zebYpQ6bTfqCPHT39cnA0emwZgDy4KoZPsUdaCTucXfxDTwEQ
 gIn6yyH6XhBgLzJ8CeHvuKa0t6ttrihc0d0ae6c/9UVseMjeN/sEVE/nK3nfgthSIZz5KBrBLw2
 gZOzP/pP/UEiEnnuSm1PnHeqs6tWtPNT9KjM+kmgARP0dxqcKjTDkcMYYciVbOlkJte72QETEqP
 Jl4ZOt8Eyi6RobbUhnA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDEwNSBTYWx0ZWRfX5so02XrBKVSl
 RHrI7ihesywXPmx46SAEqypZzJ+KufhTRckB5gbzfaSr9XCixedHh32WRHzI/hqMG2l8imV+kqG
 B4BSG1ClUW14p2cH72/DsckNga3Dilo=
X-Proofpoint-ORIG-GUID: ZeuF4UyGWa6M_qnDmHCwejjoZnWozliM
X-Authority-Analysis: v=2.4 cv=brt8wkai c=1 sm=1 tr=0 ts=6a7b1794 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=ntLgfJ__oLFVdQhLdBYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_02,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110105

Hi Jason,

On 11-Aug-26 14:32, 楊智成 wrote:
> Hi Hans,
> 
> Sorry about the name mix-up. I'll make sure to credit this to Hans de
> Goede in the next version.
> 
>> Sorry that I missed this previously, but should this not also
>> write the correct lane-count right away, rather then waiting
>> with fixing the line-count for 1 lane configs till we hit
> 
>> ov5640_set_stream_mipi() ?
> 
> I intentionally kept the fix to the streaming path. The value written
> during power-up is overwritten when streaming starts, before any frames
> are produced, so it should not affect the actual stream. I also wanted
> to keep the Fixes: patch as minimal as possible to make backporting
> easier.
> 
> Would you prefer me to extend the patch to program the correct lane
> count during power-up as well?

Yes please, since the FIXME comment was present in both places it
seems consistent to me to also actually fix the issue in both places.

Regards,

Hans






> <johannes.goede@oss.qualcomm.com> 於 2026年8月11日週二 下午7:10寫道：
>>
>> Hi,
>>
>> On 11-Aug-26 11:17, Jason Yang via B4 Relay wrote:
>>> From: Jason Yang <jason98166@gmail.com>
>>>
>>> ov5640_set_stream_mipi() always programs IO_MIPI_CTRL00 with 0x45,
>>> which selects the two data lane mode: the number of data lanes
>>> described in the devicetree endpoint only feeds the sensor's clock
>>> tree computations, so a module wired with one data lane starts
>>> streaming in two lane mode and the receiver never assembles a
>>> frame.
>>>
>>> Take the lane mode from the endpoint instead. The field encodes
>>> the lane count directly - 001 for one lane, 010 for two - per the
>>> current sensor manual (version 2.33). The 2.03 manual documented
>>> 000/001 for one/two lanes; OmniVision corrected the table in
>>> version 2.1, which is why the long-standing comment here found 001
>>> unusable for two lanes and validated 010 instead.
>>>
>>> The power-up path also programs a two data lane mode, but that
>>> value is overwritten when streaming starts, so it is left alone.
>>>
>>> Tested with a single data lane module on an i.MX8MP board
>>> (imx-mipi-csis receiver), where the unpatched value produces no
>>> frames at all, and on an RK3588 board.
>>>
>>> Fixes: 19a81c1426c1 ("[media] add Omnivision OV5640 sensor driver")
>>> Cc: stable@vger.kernel.org
>>> Signed-off-by: Jason Yang <jason98166@gmail.com>
>>> Assisted-by: Claude:claude-opus-5
>>> ---
>>> Changes in v4:
>>> - Keep the lane count programmed also while the interface is
>>>   disabled, toggling only the enable bits (Hans Verkuil); with one
>>>   data lane the disable value becomes 0x20 instead of 0x40.
>>> - Link to v3: https://lore.kernel.org/r/20260811-ov5640-1lane-v1-v3-1-ae476eaf5024@gmail.com
>>>
>>> Changes in v3:
>>> - Inline the lane count in the write instead of going through a
>>>   local variable (Sakari Ailus).
>>> - Link to v2: https://lore.kernel.org/r/20260811-ov5640-1lane-v1-v2-1-65205ae86feb@gmail.com
>>>
>>> Changes in v2:
>>> - Compute the register value from the lane count in the single
>>>   write instead of branching on it (Sakari Ailus), with the count
>>>   in a local variable to stay within 80 columns; the programmed
>>>   values are unchanged, 0x25 for one lane and 0x45 for two.
>>> - Request a normal stable backport rather than opting out of
>>>   AUTOSEL (Sakari Ailus).
>>> - Drop the quotes around the function name in the reference from
>>>   ov5640_set_power_mipi() (Sakari Ailus).
>>> - Link to v1: https://lore.kernel.org/r/20260811-ov5640-1lane-v1-v1-1-79699457ce13@gmail.com
>>> ---
>>>  drivers/media/i2c/ov5640.c | 18 ++++++------------
>>>  1 file changed, 6 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
>>> index 8deb5f5501fa..a99e4edb6a75 100644
>>> --- a/drivers/media/i2c/ov5640.c
>>> +++ b/drivers/media/i2c/ov5640.c
>>> @@ -1831,22 +1831,16 @@ static int ov5640_set_stream_mipi(struct ov5640_dev *sensor, bool on)
>>>       /*
>>>        * Enable/disable the MIPI interface
>>>        *
>>> -      * 0x300e = on ? 0x45 : 0x40
>>> -      *
>>> -      * FIXME: the sensor manual (version 2.03) reports
>>> -      * [7:5] = 000  : 1 data lane mode
>>> -      * [7:5] = 001  : 2 data lanes mode
>>> -      * But this settings do not work, while the following ones
>>> -      * have been validated for 2 data lanes mode.
>>> -      *
>>> -      * [7:5] = 010  : 2 data lanes mode
>>> +      * [7:5]        : data lane count, 001 for one lane and 010 for two,
>>> +      *                per version 2.33 of the sensor manual
>>>        * [4] = 0      : Power up MIPI HS Tx
>>>        * [3] = 0      : Power up MIPI LS Rx
>>>        * [2] = 1/0    : MIPI interface enable/disable
>>>        * [1:0] = 01/00: FIXME: 'debug'
>>>        */
>>>       ret = ov5640_write_reg(sensor, OV5640_REG_IO_MIPI_CTRL00,
>>> -                            on ? 0x45 : 0x40);
>>> +                            sensor->ep.bus.mipi_csi2.num_data_lanes << 5 |
>>> +                            (on ? 0x05 : 0x0));
>>>       if (ret)
>>>               return ret;
>>>
>>> @@ -2535,8 +2529,8 @@ static int ov5640_set_power_mipi(struct ov5640_dev *sensor, bool on)
>>>        * Power up MIPI HS Tx and LS Rx; 2 data lanes mode
>>>        *
>>>        * 0x300e = 0x40
>>> -      * [7:5] = 010  : 2 data lanes mode (see FIXME note in
>>> -      *                "ov5640_set_stream_mipi()")
>>> +      * [7:5] = 010  : 2 data lanes mode (see the note in
>>> +      *                ov5640_set_stream_mipi())
>>>        * [4] = 0      : Power up MIPI HS Tx
>>>        * [3] = 0      : Power up MIPI LS Rx
>>>        * [2] = 1      : MIPI interface enabled
>>
>> Sorry that I missed this previously, but should this not also
>> write the correct lane-count right away, rather then waiting
>> with fixing the line-count for 1 lane configs till we hit
>> ov5640_set_stream_mipi() ?
>>
>> Regards,
>>
>> Hans
>>
>>

