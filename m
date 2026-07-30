Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C7843302F
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 13:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785417358; cv=none; b=Uvxkmxt60ZQWCRuVdEtjmiMNIBWp5RIKYiWeZ2etTAtaU0vPlOdQeidorquBL7J26dEntyR4S/JlIpIJfZewpU+W3mfipUxFVYCWhGPIYNHwakYZbhEAtXaT3NdhPwfsPpaTrWJl6nOwm06QltUtvMHJ5OQImfnIEwT3DnZ7Gug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785417358; c=relaxed/simple;
	bh=0Gay+noS6i9xPynkESz97KDMVs372rcQgMKKEzCCMis=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kjm3WPT53Hnq5vi7QwzMQHIojPBkAm/0lCGa6AwSTiIjl35J0os329uJ3etv6LlglRG3zsc0Hk+7dwGTPIYcpQTs8mgm57nZHurWjgyhOFr2nNIplGeIe75nzZhKZ2OUC4rrFv8mdGRdgr+e1yBNF/jYIzw2olkMt+j261Wt7VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H7+JR+Wa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HxE8VSr3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H7+JR+Wa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HxE8VSr3"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UDDU9u922209
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 13:15:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TV/AlNePEDc1yVWzYXaWBBGXjMpgsekdNRwQeZJstU4=; b=H7+JR+WalzLgxJTU
	dflmv7r2rCk7iDtUG88n5PpgLqp0cRtMaaIzlvF0UYzQRWUtsGL+iFBaNtIMIvex
	yr1ZcuOzJDFyGIN3R2YeX+IOQUwE7jjKoIEyzq9k98aJsqsl3zjixxVUIM3CcEym
	ZNGUIrJ9e+1/74VdKHaeD81aqPMcyGyRwZR+vdIJtZhRTDLcYP1fuAwni2p9r0n9
	spOpBKGkX/PZQ5PwYflz5pYOxvU1g8I27WrSVpMAg9yGWSviElnxzkpzHlVjVpUi
	bT0pBxlpEmruz1RlTb+50rBlFG9MxSsn4jiO6kTC8LbVfOQ8OWzSLM5bAV+HaKDL
	zB+d8A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr6qn85s3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 13:15:54 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bec738909so17889241cf.1
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 06:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785417353; x=1786022153; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TV/AlNePEDc1yVWzYXaWBBGXjMpgsekdNRwQeZJstU4=;
        b=HxE8VSr3t1zxVWJkjc1oR8ZVEt1iV2I7yHOF7GoEAAF4EdUIvD4Z8Yawt+Bk186NFe
         UX1mdyzo2FbXm+b8AkgyAIZ44gH6MWtkArkFadUsRcBI+4JDtBvLAnnSqBqn/PYRRNz+
         jOT9KtTH9pdfd+2u7fcLOmFUaDnegsZ7N1gajU7kEMItHKMJVLWZx1lh5g1t+mYWyang
         HFLRbjParEazfPbCQCkWtCI+NTuFuCayLtzsadZInzV3svMEx9chviUYmaRD3NqILtXD
         2SSxeX6pwACtRX8J1YXGxTk4ORhaoNE1gxltvmVDdlOEgJjzOFHYySnVydRkryl2qXsR
         w64g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785417353; x=1786022153;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TV/AlNePEDc1yVWzYXaWBBGXjMpgsekdNRwQeZJstU4=;
        b=k/yCoShJcz1J4LGycFB9LqQ6aH3jL2F292N8S9L6tqLYZDFWkLgO6Xj22BRGKxqi0l
         dzn/1lelblx6nEEQEwv/SKo8HtcjC9v5v51363AjKQ4enm43hXyOuhCscu1WYs2i6f2P
         mzLePbSNM5zoDBAIZH4vwEVh8gQAjKF+0/7Dw75ImwxjaxkKUeREKWTM+5SHF0GC0Qjs
         5cvvkxRhZ+Dxh/6KegkRUu/MoSaXY9Eq6R2DStHMyicg40GRE6K9LR3fgYylyndXOnsv
         RSmxEXkvV2cpBJ31GWjYKwbIM4zmFx82WL02VGESLfgSPuvzeittTtPW8QJhYdnGjyoK
         pIbA==
X-Forwarded-Encrypted: i=1; AHgh+RpXHF6bnpA+oZNOrthJHTKJdjuJpLA+4/st47gWdW353X9wsud6sDkl5G31tV8eEkhjgF71WLylUEmJIw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxM+sMybb5w2Bjn+VQMiDdkmPAPYABPN94FWVNnV4keu/IxLjbx
	5QMKkTegIA59U226G8TUDJ8NiYTK2wQr43OR3389T6JlDLV1vF5EBG/DxtaKL6iDih1gp5F/n/K
	xG9WhvOhb+UOb6pu8rcU/BSpUjQMLzlH7dYQNdN8V7iIL1b46i+1Q2Pmx4obm5lz19Q==
X-Gm-Gg: AR+sD12z+x45kRVdFTQPnpqCLe5POzhcphqADSg8MK4aYA/XbFuffQ08AwVe5o9vRgA
	PJhWTVe4UNaeFOyZtSF/8wraKjbez4ZNlcwTzkzr5rBwQ+3ERLw/tEH5z2cgU2xVUkewI8q57gN
	DFcEdmEwMAiB9QdNBUKGStyIiRLH+OBOkiBtN4L49QdQQmWvQuhqoZvzrH25YE221FPN4TFuMHy
	3RNIxLwWydfHSCMPvgh550NUzOlAgglQoinxu3NLlfc0YCH1LMM1V2Yd6Z1XluRjuBRmbqvQvnA
	sV4TXwNnFm5I7YsfKVvYijxtt5waeaKiaHB/M/7zLkV3uwdPCYeyBmBjTGF/iqEyH/gHOMi6RYT
	QZPQCg+lT2QDUzopicbHyB1LKe5ibD5gtqrrtLN5wo3eUpsZarttekrg7aPo9DzqBXYQMIad2
X-Received: by 2002:ac8:5fca:0:b0:51c:ae7:fa1d with SMTP id d75a77b69052e-52b38378859mr28113501cf.5.1785417353283;
        Thu, 30 Jul 2026 06:15:53 -0700 (PDT)
X-Received: by 2002:ac8:5fca:0:b0:51c:ae7:fa1d with SMTP id d75a77b69052e-52b38378859mr28112291cf.5.1785417352129;
        Thu, 30 Jul 2026 06:15:52 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a07cb79672sm665133a12.13.2026.07.30.06.15.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 06:15:50 -0700 (PDT)
Message-ID: <c6b42741-00fe-4907-a624-ade8c1ac7e0f@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 16:15:47 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] media: qcom: camss: Add V4L2 meta format for CAMSS
 ISP parameters
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-hardening@vger.kernel.org, devicetree@vger.kernel.org
References: <20260724-camss-isp-ope-v5-0-e70ad4fa39ce@oss.qualcomm.com>
 <20260724-camss-isp-ope-v5-1-e70ad4fa39ce@oss.qualcomm.com>
 <e50e3859-0343-4795-a564-757ac58f6cbe@oss.qualcomm.com>
 <CAFEp6-157JZogPG6vHLUjYiAJ-fwWcVX_xSMTUY=1R6+kat25w@mail.gmail.com>
 <31a77684-221e-452e-85a5-873b0cbbc118@kernel.org>
 <CAFEp6-1jt_q2YZv17mxWTwKbxipNoh3F0RPqhLwhdH-ffcCcvg@mail.gmail.com>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <CAFEp6-1jt_q2YZv17mxWTwKbxipNoh3F0RPqhLwhdH-ffcCcvg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEwMCBTYWx0ZWRfXxQqUBdyJz/oY
 knolFCPiwscdAdUHGD3zLnYNtOEY9+p+WOpxSO/sMKLU0jWB7KmgayYl9nktRHf9LA9b0lWK4uw
 8IkPvBuezwRW5RsYhxwsdgpMI/wdRU3b55ID1rcS3NASYJX0vmXrMSV1gg3Ss53kPRVtRmHjwyg
 sWNs0uxcurwrV3AvJLILMfR4+uHgOoR0tDfBVaehqGkMdAtUgZfe2jyoc6ID2k6PUbbK2a18FXC
 GuK90UyDXivUiZTSS/wFGLKlgg5s8bxOFLNgV5kkrS4FruMqYzJqrfNHtcbPVGQ2OCUjFhU/vYF
 7Me8WkoQF3GVbmvZE1vYZmQOyWwklYk69aKJt1zNF0+3PsGF39f/HrU5saFZ20c4WKr+Ox14jw5
 BeMYk4FRhkBOtwvEntErzZ0PnDBTZm83cbx5y0yrx8F86jNt2HIdJGgS4vU/CnTI4RpcivB24gR
 pC0qDESTFFXGZw3PhLA==
X-Proofpoint-GUID: XEfMyjL7gzPL5iNGg0bR6NHBaknTNkYn
X-Authority-Analysis: v=2.4 cv=H/jrBeYi c=1 sm=1 tr=0 ts=6a6b4e8a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=MmO552b29xJCP9fHLIEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEwMCBTYWx0ZWRfXwOKply/7YOIp
 oiRo6mCmlpKrwH7KoZt7laaZnpMpbtehs/0olhcyW5cVsuBvASzm2aTaO9CLtdIOhPUMyS46JW0
 Z4Chn23dYp6jZ9TEvGhZGTxkjsYRK7Q=
X-Proofpoint-ORIG-GUID: XEfMyjL7gzPL5iNGg0bR6NHBaknTNkYn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300100

On 7/30/2026 3:34 PM, Loic Poulain wrote:
> On Thu, Jul 30, 2026 at 1:57 PM Bryan O'Donoghue <bod@kernel.org> wrote:
>>
>> On 30/07/2026 12:44, Loic Poulain wrote:
>>> On Wed, Jul 29, 2026 at 8:28 PM Gjorgji Rosikopulos (Consultant)
>>> <gjorgji.rosikopulos@oss.qualcomm.com> wrote:
>>>>
>>>> Hi Loic,
>>>>
>>>> On 7/24/2026 3:42 PM, Loic Poulain wrote:
>>>>> Add a V4L2 meta format code (V4L2_META_FMT_QCOM_ISP_PARAMS) for the
>>>>> Qualcomm CAMSS ISP parameter buffer. This format is used by the params
>>>>> video node exposed by CAMSS offline ISP drivers (e.g. OPE) to carry
>>>>> ISP tuning data such as white balance, color correction and chroma
>>>>> enhancement settings.
>>>>>
>>>>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>>>>> ---
>>>>>   drivers/media/v4l2-core/v4l2-ioctl.c | 1 +
>>>>>   include/uapi/linux/videodev2.h       | 3 +++
>>>>>   2 files changed, 4 insertions(+)
>>>>>
>>>>> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
>>>>> index 98512ea4cc5b9d725e1851af2ed38df85bb4fa8c..7b6e9a9a514f037190d55d59409dd6cc97522943 100644
>>>>> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
>>>>> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
>>>>> @@ -1471,6 +1471,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>>>>>        case V4L2_META_FMT_C3ISP_STATS:         descr = "Amlogic C3 ISP Statistics"; break;
>>>>>        case V4L2_META_FMT_MALI_C55_PARAMS:     descr = "ARM Mali-C55 ISP Parameters"; break;
>>>>>        case V4L2_META_FMT_MALI_C55_STATS:      descr = "ARM Mali-C55 ISP 3A Statistics"; break;
>>>>> +     case V4L2_META_FMT_QCOM_ISP_PARAMS:     descr = "Qualcomm CAMSS ISP Parameters"; break;
>>>>>        case V4L2_PIX_FMT_NV12_8L128:   descr = "NV12 (8x128 Linear)"; break;
>>>>>        case V4L2_PIX_FMT_NV12M_8L128:  descr = "NV12M (8x128 Linear)"; break;
>>>>>        case V4L2_PIX_FMT_NV12_10BE_8L128:      descr = "10-bit NV12 (8x128 Linear, BE)"; break;
>>>>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
>>>>> index add08188f06890182a5c399a223c1ab0a546cae1..011026194a20cde22a374e6fb2570cbc6bced230 100644
>>>>> --- a/include/uapi/linux/videodev2.h
>>>>> +++ b/include/uapi/linux/videodev2.h
>>>>> @@ -888,6 +888,9 @@ struct v4l2_pix_format {
>>>>>   #define V4L2_META_FMT_MALI_C55_PARAMS        v4l2_fourcc('C', '5', '5', 'P') /* ARM Mali-C55 Parameters */
>>>>>   #define V4L2_META_FMT_MALI_C55_STATS v4l2_fourcc('C', '5', '5', 'S') /* ARM Mali-C55 3A Statistics */
>>>>>
>>>>> +/* Vendor specific - used for Qualcomm CAMSS offline ISP */
>>>>
>>>> It seems that this is generic format for ISP parameters, can we update the comment and remove offline. The proposal:
>>>> /* Vendor specific - used for Qualcomm CAMSS ISP */
>>>
>>> Sure.
>>> Loic
>>
>> Since these are not the full list and as I understand them not the full
>> structures for OPE - qcom restricting the full formats ? - I'd request
>> to move these to an OPE specific header.
> 
> Yes, I think the params struct can be OPE-specific and defined in an
> OPE-specific header. However, could we keep the enum in a generic
> header so that we only have a single enum definition? We could then
> extend it later with OPE-specific or non-OPE-specific parameters as
> needed.

The format V4L2_META_FMT_QCOM_ISP_PARAMS will be common (based on its name) across all ISP versions.
This will make it confusing for userspace to know which header to use for a given ISP version.
It would be better to have at least some protection in place to reject param types that aren't supported by a specific version.
I think the simpler approach is to keep these as generic Qcom-specific params for now,
and only split them out if we actually end up with the same blocks using different parameters across versions.
But for sure that can be done latter when new params and ISP's are introduced. It was just an proposal.

~Gjorgji


> 
> Regards,
> Loic

