Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B593E4504
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 11:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784805040; cv=none; b=Q6UYkkyA2cIWwjLR8HLzNM9xv39ByGxlPB8R9lY/x1kD6ML9h0SkicIMleN14sniOgicOIZTxDMsPrCmkQC+j4TpuZWHbvcdaehxaheHqdjJbtLcIDF3gShEHaHYPqkxaBAJ2fcoZ7L3ziYSOYi4DM51YkDZSbeDq8CRz0E+uHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784805040; c=relaxed/simple;
	bh=9dYHq0r+hgyoOtWxWdV6iDo9y1LV/Cw6bTYJapIczDE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=PRVvPtRIhd9Gp0muBwekuSrZlmNgpP9pmfc3D4hmdG3aKcUNG2NkodxOJMGTU7bTACu3f46x4PZQyLvQ+bGioS/nsp9K2nqasNFZ0AknbMmlRZuho91kiub67uO64TgzedOpWSGNuhR/KYqKiKLwRmnigWBWI2o9TH9IMfCMEAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GDLeQ8qO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c2PezOYe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GDLeQ8qO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c2PezOYe"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8r0X43389526
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 11:10:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HZbAXQbl4Vd93GPtaUI+1QxSb0J/+QOCdBFCMSIyehk=; b=GDLeQ8qOs88b7JmZ
	7RvAO8cCVU+XGdLJ7sTSD0Btd5NO/f4acECss9wiOy6mHlLhxpjAinCHIj1uSXDF
	XzEwAKRqyn2dSbtsz5mQBADwWtgbOoTlPjmdtdkHMiL1GeJUI0wJqHgLyb69raUO
	U3fiF5Soc0Jb2r+zrijvp6oHs4PP4UcFkXZJKwLe01UFkID/F1w4ggDV+4ZBg6j/
	saXVplFtzLusq3SgYEA215fuUuzd0FSYNHd3XaQsN5I6hbuO8LoSg+ZV4GROFt3c
	t3TWoo6zYYXzKgvA8faGNdpFGOoNIZio1A5/xf7i+xCwYuVZqbXCWKwCUU5/jHDk
	USDlgA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk275ksad-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 11:10:37 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1eb52e1fso11817441cf.0
        for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 04:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784805037; x=1785409837; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HZbAXQbl4Vd93GPtaUI+1QxSb0J/+QOCdBFCMSIyehk=;
        b=c2PezOYe0FpxcAyJd0XGgQaf8z1gb4CHm2tajDlAqVjYB8ZEqNWiYvuSNQ2pm+/o70
         o2EZ5dJInyQcoZzOZvCToBjK41sNO5cglLu7OKR6P5tk1JSKji0uT7rEHA20kS56piLl
         a0tY4aEsMe+utbQ3zpZXx+JteW6dENYpWlospUFCIzUc7aZMpcMdILQqdO/C8J0lcLSB
         FUeqbIKN/PEza7j7eHKg8rOJNBwVaRUakLy8eYQUL/yhA4oQ00ACdIOKBk3E0eSfjfs4
         M2CeG68OJ6EFzRViPAjo4G5RfnDBYgjKv/Yk3bLLhXzjkyQ8D8E9OiWL6k+7C8g/Qs9S
         muLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784805037; x=1785409837;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HZbAXQbl4Vd93GPtaUI+1QxSb0J/+QOCdBFCMSIyehk=;
        b=Qv6aA1sZaGvGLiEFvSAqmyyUfr0ajpKSfOvGFmlVvVrc+Cy82KOp8sO0vL0+7ihjxi
         b26BHGjpkxMNTORFkeXfCbErWcR5UT4jZxuE/+db6picmF/fQA0AjjjdXAc8tVnfk7Ck
         4mAeXUKSbP9sX9N704BzWM3jkf4exanQZSilWChx9OP1SsvdvDprwzre/MbAuNuwlhmk
         nthCnXJ7M0++pjLUs8qIh3bKjKXzlkOHp5kJQTRzsV2nXRoQAnjCkMK/FeK1lYfjT27J
         DL1n2LjjSeC1ipC7Ub3UDFN8o+XGXlsCaLosm789wfGlBh6vqTFBEARcbq362OHtRzXx
         YtkA==
X-Gm-Message-State: AOJu0YzUyJtnFFSOhrXnRlPj9KTcznl57nO8qifRX3O2RzqEYeqQyEgm
	zHkkb+l6ACtP9zzrOaDzRI9Yh3V1i+94kcIcwOLLY7qEjNTLaRLygkLO/FdX94BSn1iw5nx7rUb
	T7wHpqsg/ckx+U0SbTR5muYE6wbb9aenTR3VY5EpA2SsIOPRDgOzXfyU9mI/DAoFivQ==
X-Gm-Gg: AR+sD12YpZOCZifjtlj0QFz+MXAbGqag7uErN41cmr7TVa3Wn+WTswr/HZQtiGhyfWm
	6vdTAc/OfUqc6temBB3fXN1pPJiQDFNUF+OpF2+ixy+dTRbqrPYJM8u1me3nxVbFtimLjVbF7NV
	7Gd8uhwmrAd0SKcEWUmSVDKfIMrrZPex6z939Hh2qG7zFbYO0BeDq//towNrQAbQS/9KbBCt7Re
	nyXwWj7mmnUrAi6JmIEGXOt4swGIfsIMO8mNO5IrjwuYwDznI9SI497eyrCYp5xgPYJEUNG41oP
	KY4wBZ6I4s5dJQmEGjAa6XEGKscG+aR3KqPvQQOzGq8QyszAV840qwmxPjElXNbaoET2YAcP60G
	p4yrLG74Rdgf8dgf9itUhA0d422IOuCY8jz/NJojUBfBLw3vC7aopGvjRpXkrWxL330htjEuNBa
	hQfCU58DHKrFA0kmvR+Jfkzgh6DJYNPk4cE4RPoFD/ZQws1FTqyBI1xYkf9S0XHJDRqns=
X-Received: by 2002:ac8:5714:0:b0:51c:9ab2:dfd2 with SMTP id d75a77b69052e-5283de386a6mr21717531cf.33.1784805036861;
        Thu, 23 Jul 2026 04:10:36 -0700 (PDT)
X-Received: by 2002:ac8:5714:0:b0:51c:9ab2:dfd2 with SMTP id d75a77b69052e-5283de386a6mr21717201cf.33.1784805036302;
        Thu, 23 Jul 2026 04:10:36 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69f34f1b87esm1924051a12.16.2026.07.23.04.10.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 04:10:35 -0700 (PDT)
Message-ID: <6de56f24-bef1-476f-91a5-5efb8ac2a0bb@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 13:10:34 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH 1/3] media: qcom: camss: Add "gcc_axi_hf" to 8775p VFE
 lite clock lists
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260722163658.409872-1-johannes.goede@oss.qualcomm.com>
 <3f1492e5-2c79-4084-bc5d-adfca230506f@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <3f1492e5-2c79-4084-bc5d-adfca230506f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Q53iJY2a c=1 sm=1 tr=0 ts=6a61f6ae cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=cFjk3PDMhnmkfAMTDuwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEwOSBTYWx0ZWRfX0hQ2zZGNPx+g
 svIvIdYvewaJPJGDTrM+XD9YwZCN8DxKS1HRQtmMzYqNuBTAwDTYxp8pOEwil4ugVEy7nwsOigX
 oQNUkV9Jyvhz+1ZrUqgpHi7CFnXpJ7g=
X-Proofpoint-GUID: oGLIiRZh_xtecuzeY5WkNupCL43zBQVB
X-Proofpoint-ORIG-GUID: oGLIiRZh_xtecuzeY5WkNupCL43zBQVB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEwOSBTYWx0ZWRfXyRIgOhtw6oYI
 An9sqprXlkJrXoso92n+LLPGujHQjsX0sYOeqxxBJWNNvMRYnd3L1MSSmvYEwMzPiDd6L+L6Ww6
 d6tEc2TaQeb676HFGYfieaa7rFsfi5AfR3SSKRsr7NWUm/lBKxYKrLINIozKPVuPRv+fzWkdIsW
 aW7DCQeRFaWgxtJrqS6g5D/jugOvZqpGrDEyQ87COQYUmbva42Y7Ft5CxQXUZ2vAFSEobbgEw5/
 fFR0mZ2HioKk3bgM4FLbY3yT4iQx97s4k/7DqPyV1+RGWoJBXmYgzWjzgXulKvzRNpNKlX8/QXL
 pu6SPmI+xXWnT6GfrrARhVpbllahI7K7lkkatp2evKrfIYAVjJEHn2kiKjBLURjM7s991/fwJr4
 ii4iU+NKEnDbwc4A35nMrTjZKzCt+CQkL2Xqk4HqVEr1/+Dq2qWZRjXa8tSF/Sv81zCPn2V7dfr
 mJL/dA2MOZbOPJXO9hw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230109

Hi,

On 23-Jul-26 04:31, Wenmeng Liu wrote:
> 
> Hi Hans,
> 
> On 7/23/2026 12:36 AM, Hans de Goede wrote:
>> The "gcc_axi_hf" clock is correctly listed in the clock list of the
>> 8775p 2 main VFE-s, but it is missing from all the VFE-lite clock lists,
>> causing these to not work on platforms where the firmware allows turning
>> off "gcc_axi_hf".
>>
>> Add the missing "gcc_axi_hf" to fix the VFE-lite blocks not working on
>> these platforms.
>>
>> Suggested-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/camss/camss.c | 20 ++++++++++----------
>>   1 file changed, 10 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
>> index 2123f6388e3d..3efbf2fb4472 100644
>> --- a/drivers/media/platform/qcom/camss/camss.c
>> +++ b/drivers/media/platform/qcom/camss/camss.c
>> @@ -4037,8 +4037,8 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
>>       /* VFE2 (lite) */
>>       {
>>           .regulators = {},
>> -        .clock = { "cpas_ahb", "cpas_vfe_lite", "vfe_lite_ahb",
>> -               "vfe_lite_csid", "vfe_lite_cphy_rx",
>> +        .clock = { "cpas_ahb", "gcc_axi_hf", "cpas_vfe_lite",
>> +               "vfe_lite_ahb", "vfe_lite_csid", "vfe_lite_cphy_rx",
>>                  "vfe_lite", "camnoc_axi"},
>>           .clock_rate = {
>>               { 0 },
> 
> Please also update clock_rate accordingly. Inserting gcc_axi_hf
> in the middle of the clock list without a matching clock_rate entry
> will shift all subsequent clock-to-rate mappings.

Thank you, good catch. I've fixed this in the v2 series which I've just
send out.

Regards,

Hans

