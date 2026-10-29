Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793285507;
	b=BsBg0N3z1FagSfFMowul5JsELbNRzDTtwCf5rEO2FpyrjZIToDzIJAd5aXuegGuATEL3
	 ZpYk93BjW9cP+Jql8+AZAA2LOl9+CDq9hZxcVibLBulZbgZL2xDhUZkctagOEbLEFMp6j
	 y4dE3mYkujJig4S+D3KIplt29D693Yna+Z28R9bySvNjPeDxUxSJpgmhceMpgAHq4ZarC
	 1lyTBvTBLSPd8JWmeFVOhMotDKTSwyPFsoHH64ydlVUR+Eezmd7IBagrOlRq3OelTOD/k
	 EU2uGsp7DhwC2oKkN/plVuByhSTPh2Uph0c3SmLSjQCRao5C8qSyyxrWCiphc0y/j9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793285507;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0srwOxBC0w75+XzAU+j2O9cViAS+CJV45HbLV2IBRY4=;
	b=bHOtWCF51LIQpGIluDZEPZ0vulffyLAisXez76j8Mfhdl74jjlLWm3L/CbL8T3Xc1t3C
	 tNtH15vpmXnI6uPX6nuQumKIStVx6SuTTdcL071b9MoTrDmMi/c4A/WMVEFSu2Lev/3pb
	 Fcfm792wyJ0+NEVQc7QRUmqaC7vlRGAxuhxBwC6sUwmoaGHfbPvRB9vPi5x3QwWq621yF
	 KGJTnuOEbmBCJ7Et1Av+NqiS4yj8taHY3D/Aq0/7oAKZXP586p9DfwePJgEEkH3VHVlwR
	 cmtBaaJizgZm0uC7SMwnsI3WRo1zRwaBTqNyQdTUd4ZEaSSDc4EUs51Mdky/SYL6clA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a9ITikiB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MXxQaxL0;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58928606A31E
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 14:51:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58928606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a9ITikiB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MXxQaxL0
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TCeTAM611186
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 14:51:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0srwOxBC0w75+XzAU+j2O9cViAS+CJV45HbLV2IBRY4=; b=a9ITikiBPCjkPmwp
	eBm/Fw+cyDD/KDj3Q8dQlAutk8xEuuQsSGJN3ft6Jh1MHKAa+hlsSEMf7fL9f9kj
	VAC4o/gIe+bO9YDAQcYnFprmcmZFGpWNZ0VlkRfmYWWXrDlBo94fWtiGWoTRkhFB
	G95+01nw3bDXWwL20I4qmDaI/asN5BPs3NXgKlNXsML+u2e8DK1d9nQajzaTzQQE
	rv1pM0zWyATn9uRG3lEk9tcZ0rNPjJy+jA/d3xThojaGxNMNR6fk8zE1ebpTW8DD
	gOdqyJs8DaJNmMC21vZc7GpDvMAcL+3cGr8nSve2oLfqDF54PcZ08CeNW2jyHaAc
	5+/gVg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hktmpb69f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 14:51:46 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7bf634a101fso1827996137.3
        for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 07:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793285505; x=1793890305; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0srwOxBC0w75+XzAU+j2O9cViAS+CJV45HbLV2IBRY4=;
        b=MXxQaxL0Y4lVTuCZlsadMEiN1Zaf/Y4n3QUO/h560Ya5VHuHFQfaOJLKoJcwNut7e4
         168vyu0OoBsMTCfhoWZIELTJS70Oum5/CUHTezdjAufG2pEG7nIrKAsxI3cWZkKVJHOw
         z1Eve+drCckDKGTc5C8v1QPVGnAiEmp8PZXNDbRlmfRFIr8WEJboZwdBc9U7D+Etz4e4
         Ox4p/DuRkmBtYeHx3Pb8G9l05RkLiO+4NQ8sUSrSJ4nhYpgONSHLS27OM70OKBqwXSD+
         emlf4zLR2bMHIIfVijS3v6vDpzC28MoBOo2qrq7czl0QGdtouEXe7Z/vaMbn54FQi3ha
         F4iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793285505; x=1793890305;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0srwOxBC0w75+XzAU+j2O9cViAS+CJV45HbLV2IBRY4=;
        b=lD3RzLOjXj2TajlLd/PEdyQ/LZQ6YXR7W36TbNQtcyS6xqUy6OQjirVcZjKlBAg+ZM
         meOvhlCOPbyXndOpRvnDda2N2TlMZa8fHjNsSQ5ZSNL6FxL3nrU5y5j+tq2i3IWNx4pa
         ibEDTWpeW57wSL4te6+gq0Uun7Odm9VnhlrTjJRcrMmfsK28t4rbkaHTR/4FDHczXLG5
         KpekNCT7w5luV4LI7IvLkUib56hR9BfTD50+8LeGmtjBKZk//+tDN/oJgEWxhpOHNAL5
         cfpoDsSFEJ5G13sf3QrNzUd/+uNkA5u2pHW5eQk4vhBu6w9nxCFfkODsMal9TDkRm9Se
         D6Eg==
X-Gm-Message-State: AFq9FYJsqgTG3vPOcudHJi54KoVEWaqkSSzIxZuGMLlvV+PalyTNnNeL
	pq84RJnh01NuR5u6gfr8WfiZouddFLTs5wHL2uk+u4eNc58kjpC9VHWBrKwIOBP2inIAf+cLBMB
	j8Zk5TOU/HYiObovI4t0qtO3iIf4llP9mcjfXRlbeZqqVF7CHrxalt2c4yBptovHAEA==
X-Gm-Gg: AYBFou00+853I0UHulfVaJTOOLDgZXSNMZWMk66l43QJIrwYR1v4tJ3Bm/7Jw9+pMKu
	dGd5skI2IroECigG95aqazIUR28ecHh+YY5lVKcJd4zqfolcLIzvjqEwPhsJJmcRZFQfsrCf7Dn
	wibucfYfmwi30WqquUAybeTPVvJsiOmhEDd8LmB5Vv17DEeld26JbLuxznyQLhuHQmYzzcUJqjd
	xIwSThb0ZbA+PYooJE3/rJfRhSlYZobzy4uaV6BtgkH1afhYvXVmrI1hx8qOLvwMjpPqMMG6NRo
	oiKsBaOBUa7lpIQZ7y9XW/LM4MWdlde0R2b2HkV5clzPEqd0RPcTKqbskZIDN63/TfsA64IY+Fh
	ooR4nwztHrNJCT5lZ+60YWlJWXnBLNP4R7cyiPJEJKLfYiniwZBJ4WHX+CGxVUwkIMjHsnBtW6p
	5zlgBUA1SStpYB
X-Received: by 2002:a05:6102:83d9:b0:7cb:70ed:ff90 with SMTP id ada2fe7eead31-7d03a5bdfd6mr2411692137.26.1793285505294;
        Thu, 29 Oct 2026 07:51:45 -0700 (PDT)
X-Received: by 2002:a05:6102:83d9:b0:7cb:70ed:ff90 with SMTP id ada2fe7eead31-7d03a5bdfd6mr2411677137.26.1793285504808;
        Thu, 29 Oct 2026 07:51:44 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd3c32sm36256864f8f.47.2026.10.29.07.51.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 07:51:44 -0700 (PDT)
Message-ID: <a3aba02c-03fc-4386-952b-d53fccd65465@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 16:51:42 +0200
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
Subject: Re: [PATCH 00/14] Add SOF/EOF sequence logic
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
References: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org>
 <05313835-c868-45b1-b246-f98cfb8a1d6a@oss.qualcomm.com>
 <22d2cfcd-045d-48dd-bbde-c1ac2d958737@linaro.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <22d2cfcd-045d-48dd-bbde-c1ac2d958737@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA1OCBTYWx0ZWRfX5AhBQTC5TBO5
 Y11/ZfS85675I1nZx1zvv6WeMiTIED88YD35pT6MmW/ZJZXAGOXBd4I3BI+jQ4oR3UKaG2eW2HM
 drLTIcXrYDr+RCDBK7QbrdRtkhY1W/5a+NSVo2dQX/IxUCBOb8mwodUAWzusqv0M86SZux8swRY
 BUq7IG4gST7ZKRqV2x6oMIJOO8ZD0G0bG4MRI5rz7MuUwZKDkh2rOYjrLGim3ZWO+OH+sRLANUC
 vwIu1kBOi0lxu2lE7ekfNLCd5EWp2Ie3E+HQTjdJSK6U2Qh+i/3wB7CXds6JYgsfSZbbLE93RX+
 j7AcYEgupZWIXXDFTafpCS+kwvcORsOUvf+5vKhVsWfADcWrpXH/QQ8bHuiYKfbqHe4SPQNcmDq
 sf5zJ6ioZrm6+px2+PSqp1EWGSaJkPqlAiDHRpZri43jbqs5Uvi3qDquUSgxl+wPtCRCV5OsOcm
 TerdMif/CSJfnt1AwNQ==
X-Authority-Analysis: v=2.4 cv=crYOAF4i c=1 sm=1 tr=0 ts=6ae35d82 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=o5BTqMlMTsaSvJmBCIYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA1OCBTYWx0ZWRfX+SIeIcErTeiL
 5rtluH3Tuql7DAw4RaFQjdhq4hdt+XNahZok/NQ+TPgGX9QJbWlKIX1526KCjX9dRiLMKsbkJv9
 q1cdChi81n/a1iuEL+wNwABpT352+4c=
X-Proofpoint-GUID: RIvyea3p7T2HVW9WQcIMLjXDV63w4Ynl
X-Proofpoint-ORIG-GUID: RIvyea3p7T2HVW9WQcIMLjXDV63w4Ynl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290058



On 10/29/2026 4:44 PM, Bryan O'Donoghue wrote:
> On 29/10/2026 13:28, Gjorgji Rosikopulos (Consultant) wrote:
>> Hi Bryan,
>>
>> On 10/29/2026 11:55 AM,bryan.odonoghue@linaro.org wrote:
>>> This series enables SOF AND EOF event tracking making use of both events.
>>> Whilst the code is actually very simple the functionality we want to build
>>> off of that simple code is not.
>>>
>>> - SOF
>>>    Serves two functions. Firstly. Informing user-space of CSID SOF events.
>>>    Standard Linux V4L2_EVENT_FRAME_SYNC is trigger from this event.
>>>    User-space wants to capture this trigger because it allows user-space to
>>>    better align the time a frame begins to events elsewhere such as IMU
>>>    event timestamps.
>>>
>>>    That functionality is directly applicable in this series.
>>>
>>>    However we will also build on the SOF event in later patches to allow us
>>>    to begin programming of shadow-registers for the next camera frame.
>>>
>>>    When the EOF event happens, we switch from one shadow bank to the next.
>>>    This is only possible if you have the SOF event.
>>>
>>>    So SOF serves the immediate purpose of timestamp alignment in user-space
>>>    as well as the 'evil plan' to trigger off of it programming camera
>>>    parameters for the next frame.
>>>
>>> - EOF
>>>    EOF even on its own is useful because it allows us to increment
>>>    vb.sequence for each frame as per the spec not just when we have
>>>    buffer-data.
>>>
>> It is great to finally have V4L2_EVENT_FRAME_SYNC support in CAMSS. 🙂
>>
>> I would like to share my opinion on tagging vb.sequence at EOF.
>>
>> The EOF event is received from the CSID decoder when the EOF short packet
>> is decoded. In contrast, buffer completion is reported when the write
>> master has finished writing the corresponding buffer.
>>
>> Because the processing pipeline includes buffering and line buffers,
>> buf_done on the pixel path may be received after the EOF.
>> Conversely, when cropping is enabled on an output, buf_done may be
>> received before EOF.
>>
>> That is why using EOF to assign the buffer sequence may result in inconsistent
>> sequence numbers across buffers.
>>
>> I would propose:
>>
>> SOF
>> Increment the frame sequence and generate the V4L2_EVENT_FRAME_SYNC event
>> for userspace.
>>
>> REG_UPDATE
>> Once REG_UPDATE occurs, we have a guarantee that the configuration for the
>> new frame has been latched. At this point, we can iterate over all active
>> buffers being processed and assign them the current sequence number.
>> The bus-write active-status register indicates which address is currently being
>> processed by the bus-write engine and could also be used to detect frame skips,
>> if necessary.
>>
>> BUSWR_DONE
>> Complete the corresponding buffer as usual. Optionally, we can verify whether its
>> sequence has already been updated. If it has not, we can determine how the buffer
>> should be handled.
>>
>> This approach ties the buffer sequence to the point at which the frame configuration
>> is latched, rather than to the arrival of EOF, which may not be ordered consistently
>> with buffer completion.
> 
> Come to think of it, I'm not entirely sure an EOF or reg-update 
> additional variable is required.
> 
> SOF.seq should do.
> 
> - Reading SOF.seq @ crop is fine because the SOF.seq always preceds
> - Reading SOF.seq @ buf_done is fine ditto
> - Reading SOF.seq for params return stamping is correct
> - Reading SOF.seq for stats frame correlation is also correct
> 
> We want the EOF signal but we don't need a second seqno to accompany. 
> And with one source of seq truth we don't need to change the point at 
> which we latch since pre-frame-drop SOF < everythign else.

I agree. REG_UPDATE is only necessary if we decide to use the bus-write active-status
register to determine which buffer is currently being processed. This can give real guarantee
that we are not missing something on heavily loaded systems when irq-s were disabled for some time,
in that case sequence may not be in sync anyway...

~Gjorgji
