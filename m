Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FE62D1F7B
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 08:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784621505; cv=none; b=B9i9MqKLxyWS+K0XXUe+6kqXmOBHvHyGfgUZE3/yBXeuHoDtnZYQvECblpWWTvDyneiYxkLbLAyjf5pTuh77TptHV+ixZVvnqcpBml3dcRYvxsLOesKoPXnQIOITaHoStv4W8ZG5sVAvhRqz1Rsp+JBbqN+cp07gmA2dVUM0hbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784621505; c=relaxed/simple;
	bh=Ji6hFGQvBj2zF7FE7vbkIkExGu/cONKSyGaXjsPWo6Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IR7CSGtdPZ16LhPuVjifYpxuaEDL02D9s0+1fwtuNkvqge5CXNrlSIR922TWxTxqMzwXAL7K9Arf6NirWLZVe0PsCUe9X9uXjZqsCTYAGn481ok5jai+f8tGDL7oLUCxKo5N7CzIAOMEL5kpt+jjqqRc18x0XB2YOKn+gezv5Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b/zlQRLO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h/qFnKyc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b/zlQRLO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h/qFnKyc"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L6Jx8B933315
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 08:11:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cBqUUB9b9W14Exf/ItpHRFEySzEIgcyc3Upy0OSEqCM=; b=b/zlQRLOLRxZmV/O
	xm+DGgaHr0GZRPln36reUSZxtvYSMgLCH30n/Rd32nLU31No5GX0sRlQAz32xUBj
	qatPBMZWDzQ6r4rTHsByxN2gEIWTkYsFnoD5UTmF6gCflSvZwW2yxJ6h1ZsC6rk1
	jUq1k5Hn0kA+KiKk9extp0FVgplRplLutIFhYtgs3/Z1hXfgRSzKnuj5yc1RR0mN
	6cjm/hjXsRorjZ9s3AmMyKYGsAjB2LksieLGITWYXgqyY/Caohju9KtsgQ+MtVXf
	lwAbnUFtC/2HPy8pz1BzNs5lz/iQ3I5d0SAM4nXhzRvtCGuQ90FR4PuyyKq6JqKV
	RHC+xQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqv5u4ew-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 08:11:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e5110c89eso239813785a.3
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 01:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784621503; x=1785226303; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cBqUUB9b9W14Exf/ItpHRFEySzEIgcyc3Upy0OSEqCM=;
        b=h/qFnKycI85hasL+7mQYlwxg11trUKhb8jWDTTVPLZpg2mPlLPno39uv6uexVusKR1
         xN88BuMZP1/r8ZwHcTIvmap/v7VWKdMBDqb+aH5NUHmLIqrVmQICdLdLAkiW01XBNh9V
         qLZKW40Jsr71ut2quN1EbYd4X0J4osod01PN+W930+DsmilVecvT8xM/IPC8itYuXlv+
         UVgqvdgEEOKdyoxnQdVtJHg7PRuQQkBevS6WO2mvyozUVZI7Zeo63GvTKZRPbcxUfxS4
         bJ6BlOdh0fIMh1v0elQhoQyK9H1ZVnVVW+27WSZ3csUfl2sHO1lsz08i1nBBIKGlPK0k
         S9KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784621503; x=1785226303;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cBqUUB9b9W14Exf/ItpHRFEySzEIgcyc3Upy0OSEqCM=;
        b=bJuEp2f6V7MWv95EQjq3haFO2jnNFtg1es8HYUThxOxCiEBECz1jafLg+HXinpao4c
         0Uw3fp1zi8nTp2gGBAKWfuwp9zs21E/8U8kzgNu9daQxXZi69oV2MbqKVpiJhXHvoOcc
         f2InLoaUhyCUxGCoAT/K/L1AlIJ4bTXYFALPoLpJIQYxwg7J+xHix4pFsEvQzTR1cWhq
         HvO0bzYm+tj4VjUkEgLmeESeLcOKy2uEozqochsYmtGUxQTT5i1CqSpqcYkFYLKCI9Ck
         CskWbUmXkGMpKWaABfV8Eggq8vsNjZ2GEwzfBGlu1F7VNQZLHHcYB2V4IViT0bLAEw02
         lYYQ==
X-Forwarded-Encrypted: i=1; AHgh+RqnEJiKViXJalhDfwPdqSxjlzxcap2GnVzja/A4QPMppjHloBzPsfyra27qn68FQ/dEJln7UeUMszvGxw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn0RihRNEhHYs0fJJiytmldzMkv20Q7yjyJW7p85UuGdrLMVOS
	yOeiN0+I/77FvhQTX3MJ6rQzC5ntxxPOJKkb1JmCyLNny9DcmRONNPkfdpeQXbMKUIl7REG3qz4
	c++L7J8oNpdlMm5pKYH20RPFtc9YzRB1NLKCOCnq4zQz51Q6gHdRVFZDTAUEo9Mq8vg==
X-Gm-Gg: AfdE7ckLsRZ0W0gFFxK2sDxy+nhXlEL9JEvzCrbf/beP2Kw5WBxikwzbHrSA+m+ALHO
	Pe7oER+ywuETc0U5+lunRk/TDPOGxShtkdlMIQfFNoJBjlDzoYuB0havk1WYXLPPwVHupdnz0Hc
	09/X5bKj5iVwd8Nu238LaAvkpIWg1QrFv05Dm1YLxkiXp8lhKdqpbyZDQxHwTBDv1pdf9dany58
	WgVfau+Vqp0NRBpAqNuusMnaGuHhogP9skeNm2Ls9UHNJjkDO8TpnwUIzmicNBYs7Kp7htXRTcj
	r0FwDKKOV2+3DK2fzbOLXExmTYrtAPLePqcqJik7xIq0zp6po4T094yoMrctt2ho+UU9ZUnWi1y
	32PXG6dLNpgGPhY+GZF0VfvNi
X-Received: by 2002:a05:620a:1986:b0:926:e8e6:3c28 with SMTP id af79cd13be357-930b4329f29mr1587145485a.7.1784621502934;
        Tue, 21 Jul 2026 01:11:42 -0700 (PDT)
X-Received: by 2002:a05:620a:1986:b0:926:e8e6:3c28 with SMTP id af79cd13be357-930b4329f29mr1587143685a.7.1784621502534;
        Tue, 21 Jul 2026 01:11:42 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1712a5fa23sm556382066b.39.2026.07.21.01.11.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 01:11:41 -0700 (PDT)
Message-ID: <d96f928b-76b9-424c-905e-500b459dc8d6@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 10:11:38 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] media: qcom: camss: Report hardware version via media
 controller
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260717-camss-version-v1-0-7ed71fea95e8@oss.qualcomm.com>
 <20260717-camss-version-v1-4-7ed71fea95e8@oss.qualcomm.com>
 <f0cd0e8c-3782-404f-ba75-8e339ee678eb@oss.qualcomm.com>
 <CAFEp6-3m0LesW_QUEPc=wLbBOMXo+YXSSw=5YpZgg3P5wsz3qg@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAFEp6-3m0LesW_QUEPc=wLbBOMXo+YXSSw=5YpZgg3P5wsz3qg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: y9DI1jMYuHPScBQVWJqDpTgZoK7F_CSh
X-Proofpoint-ORIG-GUID: y9DI1jMYuHPScBQVWJqDpTgZoK7F_CSh
X-Authority-Analysis: v=2.4 cv=e+U2j6p/ c=1 sm=1 tr=0 ts=6a5f29bf cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=dNYAEBq0_u_y8s8JZjsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA4NSBTYWx0ZWRfXyAXXFIQkbv0t
 phaF6Q1XurBrB+hJRk/st2xrT2/wZxittVmN1It6BED47FRI2bHsopXC/hA4jWD0oP8nC/eamXK
 4EeHhC8CWllDR0knU5ML6x0w9QdctOQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA4NSBTYWx0ZWRfX2kVv2KtNUdZZ
 kJY6NxNf7ht2k+tLqc3c7r4g6ftteySytO1xCMf6mpwoXFffVIcRAbHMuluylFCFcojD5bhFQfm
 RfwcRZ4XMU4aVrM+tXZOWkN44OKPN3CPYfvIpO8xB6hcVx0daqDoq+fE7CJIMnkYp/j9Bnq2Yze
 D2zdlu8PON62GjqffoLOST0eytBAFC112ORhodP0gs4Ve+agfWWI1RPzoeco8NR0RUuClVefxOT
 XeJlVVhwGOUwATHiySQN6W4gl0MLPGMGi8qnpo4Rzf6QR+WAcHblqQMYSDgRncgYMPxVhayKfEZ
 uUbQ4DoKrek3jErygnXUDzBrQ8CevN87oMSKlVyr+5YIFD+y2zm5hvQeZWRisHXjCL6C64LHHZD
 J86tJOoj0KPw1DAesNdhZOh/IM1q5Vvo31j+HTXn2WfmaPUQqyk9C7q3k2AlLGvX1v1Wta2rnT5
 Jgyb0vNhxl+8fgTS2Eg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210085

On 7/21/26 9:55 AM, Loic Poulain wrote:
> On Mon, Jul 20, 2026 at 11:12 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 7/17/26 4:20 PM, Loic Poulain wrote:
>>> Populate media_dev.hw_revision with the top-level CAMSS hardware version
>>> so that user space can query the exact hardware variant through the media
>>> controller (e.g. via media-ctl or MEDIA_IOC_DEVICE_INFO). This can help
>>> identify the platform variant and adapt behaviour accordingly, for example
>>> allowing libcamera to apply quirks or enable features that cannot be
>>> discovered through standard V4L2 or media-controller APIs.
>>
>> [...]
>>
>>> +static void camss_read_version(struct camss *camss)
>>> +{
>>> +     u32 hw_version;
>>> +
>>> +     if (!camss->top_base || !camss->res->pm_clks[0])
>>> +             return;
>>> +
>>> +     if (pm_runtime_resume_and_get(camss->dev))
>>> +             return;
>>> +
>>> +     hw_version = readl_relaxed(camss->top_base + CAMSS_HW_VERSION);
>>> +
>>> +     pm_runtime_put_sync(camss->dev);
>>
>> I think non-sync is fine here
> 
> Using asynchronous PM may result in the runtime suspend ("work") never
> being executed if the probe function fails later (read version called
> from probe). From my understanding, a subsequent pm_runtime_disable()
> in the error path would cancel the pending suspend request, leaving
> the runtime PM state in a non-symmetrical (unbalanced) state.

Got it

Konrad
