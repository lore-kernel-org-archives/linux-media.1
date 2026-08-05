Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F396D485519
	for <linux-media@vger.kernel.org>; Wed,  5 Aug 2026 16:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785947838; cv=none; b=rs8fxd42VDwUkKypO0zpT1hXBe17Fn2SGnpoferz2IBEDB8iZwTIilrPI7viQRethTfAMbBlBJqN6DlvJKGkVvZ+uzChxblBUZ0K1eGmKMCnh3ptEgiX2Lg2E4Qc+lqCC2nIgQO5jwU4VbU8ohpKjx6KuPn2NfCC2rH+5MflOWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785947838; c=relaxed/simple;
	bh=6ZWoRV8QIp3lQ09WONZyrSwbDUglgkINZgHm+j373O4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EoqoX7uVF1KuGkZiB8JGtIBVqRBOUUGkZ/swVnqxGZTVn2X/gLx5ll7jEp4vscSB2IrC05y1aPtEOXlksJv+09fHUi4hXpTMufMPwVgbWgtJmKcN2eR2kmD5kJ7AatLTzJV8UQ7vMLhdMI11s/Su5Z5o1CATKwKY+Wqe2oR+v8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BLbleggS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=REx5y17F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BLbleggS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="REx5y17F"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675FVKOR3356536
	for <linux-media@vger.kernel.org>; Wed, 5 Aug 2026 16:37:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xQDX1yfy43QiYgvUwPZaOxEOVnZnft0zasFNojOrKOo=; b=BLbleggSibq9byjl
	shKrY/dewnAGTEAzROO+BNpj6cVAT5AgjpnXnAV87+m5Im/vBPHNXvnP0qPwE6Pf
	VlWYElkKPJhfVaWnyl/Fk+7pblCMhrzLP9M+OMdTWNvdvPVCrxQkamcp81sxZGbB
	hXPoJoyJigAoQ8pHEXVOo+3nNC3K/F5jC1jcfsEANtpl1vgm2BBumPmSNKCXcPfi
	g5PVupc+AjIMpMbIax7glYFTXS7/jZuRyGkQ7sUXHN4BFNWR1bwYCfZ8hzrNer3z
	mQNU5m34bIpVmW+nJNALK/9d36VgTSOhQHvU3Z34auXAM1mtsOkBRM7ELxEAGmrI
	NgbY8w==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv2r61vub-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 05 Aug 2026 16:37:14 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7e6b5741bbcso238546a34.1
        for <linux-media@vger.kernel.org>; Wed, 05 Aug 2026 09:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785947834; x=1786552634; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xQDX1yfy43QiYgvUwPZaOxEOVnZnft0zasFNojOrKOo=;
        b=REx5y17FW9tniCeGQI8UcinGRysu4kxI/G8q07P6ommPOfK46OAtMaYMAn1wfd7Hhi
         7x0MUmyIfUoOy0WZzYGMca5Wo+yTEmJlRhBoxKuDFiykeYYWFRPbrfts0X+FjAlkdnN2
         KFckmW3+WQzEs41ngG/nAqU4ZfSByKlFn3iIRkhmvcxbye1TYuewa+ya4IoRLyN5t9yL
         YpXpsFvAu5reNjaAGEdTo6WjJ3DdnHYTizBO7WfBhdWw68obzjOd4VuJ7lGiNMq4CmKp
         EeflR/ZeIrMVHAm/K4bQblBtL5bE4GHLIIAXYPABkMeLEV3FrES7G9DNKNWupmgBAWts
         87RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785947834; x=1786552634;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xQDX1yfy43QiYgvUwPZaOxEOVnZnft0zasFNojOrKOo=;
        b=UapX7LJrVwdfkFzmsOMeqZPWMcZPqI2HTX8ghZp5WSoLmf70LUFsTKYQzixZA1dEyQ
         P3qNDlgmEAa/o5iHHMMIFzWW3lU3zkNoNf8PGVb1+/Xz827ZGroMSYd59IIpBJuL9jNF
         IeNGu55N8mZmHaJpnVhW5eQthBRK64ZLwpQHrHut1Ftk64xguTEgqEIu+UpJ+I4qttqE
         u6Ad9H8659Op8JMZrNNShx7ksxMmyoozKjXRZSLipoeigdsmyBY2Gf1MwXQV9Voa9Oiw
         pbYie5CerJzdGENYIFElLyJNw0TJypyY9wpctLqmgJy2iW26FmiIWk/TCl5tel2O9D9n
         HbZQ==
X-Gm-Message-State: AOJu0Yx78iSiv4ScqnaFIyKrd6ZSIJM8pQ/CE3wvm1pd2QBi6JC0s0eV
	NLefuyMUhRuSJ6qCuyCSDnAdlNaLAXLB/yZ/3k03Z9Ht5/KRc17R0MiTkP21oqx0HEaZggVweeR
	eKIra7+Ajln2lKH7rHci0CceyNpBYphqjMpY6efnjniIBntYi3RbIlD/g7CvOOgQQ6Q==
X-Gm-Gg: AR+sD11TkbAOE2TCvNkYZ5OH3eZRjPi/umE1a01cg1R4MdAEmAfVXvZ76hKRpEIwnNT
	vD66bOX9aPolx1a+CEU31YQr29CMQlgUL5XUW36ukTws7db3PDIuVwRITZ9gyL8amHLOwVEcMwx
	GCn0icn2rkWavfInKqdnhtQ3sRMykkNEHPGHMPW8eMzFzn5/77vYFKLemPyEDxAEl3qd+B6ydtH
	p16U593xIRMJ2cWJ5N9QUW3nyGNbdPufdF2bhoe9BKs/HyrkjHmIYDncRNmmqqHaiTOy7ns7/fK
	jBwCoZJBT+M76yB96Azf24s09jGbzrKFxTJzMIXDliwqKj08Osua7SsaPaI1UEPgoZgL8q+7ZMh
	ae89dIQly0hQSM8oimnxe7TT+0o1AgUkWZ1ArZT42+329WNDFTRo5Q1vle2Qc0w==
X-Received: by 2002:a05:6830:3489:b0:7e9:c6fd:c36e with SMTP id 46e09a7af769-7f1e5ea9deemr3063876a34.3.1785947833516;
        Wed, 05 Aug 2026 09:37:13 -0700 (PDT)
X-Received: by 2002:a05:6830:3489:b0:7e9:c6fd:c36e with SMTP id 46e09a7af769-7f1e5ea9deemr3063845a34.3.1785947832936;
        Wed, 05 Aug 2026 09:37:12 -0700 (PDT)
Received: from [10.110.6.162] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f1df5a4f9bsm3081690a34.23.2026.08.05.09.37.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 09:37:12 -0700 (PDT)
Message-ID: <320d38b1-1ef4-4f5e-91af-cad1cec59cd0@oss.qualcomm.com>
Date: Wed, 5 Aug 2026 09:37:11 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] media: uapi: Introduce new control for video
 encoder ROI
To: Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20260804-enc_roi_enable-v3-0-e03b622a2d48@oss.qualcomm.com>
 <WoOjVIWC4XK-emqOnxnAfbETbnFi-sNNFh6ctmUDJOokI9GD4YAx8pVjdB-ygch4T0tcEeH6pVha-Ep_OaPysw==@protonmail.internalid>
 <20260804-enc_roi_enable-v3-1-e03b622a2d48@oss.qualcomm.com>
 <c590fac2-5c41-4b34-88af-fb00e83b8575@kernel.org>
Content-Language: en-US
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
In-Reply-To: <c590fac2-5c41-4b34-88af-fb00e83b8575@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=WrIb99fv c=1 sm=1 tr=0 ts=6a7366ba cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=OAOW8-Q4FRGSJhXIPGkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-GUID: CFwY9DGhwCrW76DWDfd3kmx-tVJ50mAN
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDEzNSBTYWx0ZWRfXxXh3TghwKEvl
 zaSeOw616JBycI7JrIqXGeANjQxPIaxWX/7pZab2zxSbqLs+ykfPaF8QE1wocXqQq20fPcrsCJ3
 oxbv1JXOZBqjxf0Zxgy5BmwdBzXC4eY=
X-Proofpoint-ORIG-GUID: CFwY9DGhwCrW76DWDfd3kmx-tVJ50mAN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDEzNSBTYWx0ZWRfXzqZ/XLfdHFSF
 dd9eI6z8H9LjigXHejnYic9tYEfOwekyP3MlsJ1P8UP/iELczxPLtiFBY+jeYj91jygDG5GAGd7
 yRiHVUh3twrOj9MglEfg55tc+nOwXTowdqnSesy8eUup3pWwGx+yqkyrD+hqQh7t+KK387iYZSg
 tHHS20sWSvjg3UlTfRq7IhqqDeQ4tfg4TRTK9O9dJ4jOhC7Z7pjM/wV2cvHI7G+tiNP6mb2MC9A
 EPsB4wUt4mgotEKFzRSvN0g4kOYHLLJODtFVhGciSOJUG5Q8cJNEtXbO5wyg+zrooGvHW3Om12i
 262bkUcUoiCKdvRCbRYu+9IjrXYrPgB1uD20Qown0YBYEgcjpO1eHgVRJjomQQl2T+1v8mryASU
 PXn1laPcydvYaki0VYV8yM1HUxC+2HuOb4zbndKJqAqyLdcFFysQ4a0mmTD1rcFggqbSH1969wD
 pWWhRGDv41nGi+WOWUA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_05,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050135


On 8/4/2026 8:49 PM, Bryan O'Donoghue wrote:
> On 04/08/2026 21:05, Deepa Guthyappa Madivalara wrote:
>> Add custom control, V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP for
>> video encoder Region of Interest to allow applications to specify
>> different quality levels for specific regions in video frames. Define
>> V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE to retrieve supported MB size based on
>> codec from the hardware encoder and set the corresponding ROI MB 
>> delta_qp
>> map that adjusts quantization relative to the frame QP's base value.
>>
>> This enables use cases like prioritizing quality for faces in video
>> conferencing or important objects in surveillance footage while reducing
>> bitrate for less critical areas.
>>
>> Signed-off-by: Deepa Guthyappa Madivalara 
>> <deepa.madivalara@oss.qualcomm.com>
>> ---
>>   .../userspace-api/media/v4l/ext-ctrls-codec.rst       | 19 
>> +++++++++++++++++++
>>   .../media/v4l/videodev2.h.rst.exceptions              |  1 +
>>   .../userspace-api/media/v4l/vidioc-g-ext-ctrls.rst    |  4 ++++
>>   .../userspace-api/media/v4l/vidioc-queryctrl.rst      |  6 ++++++
>>   include/media/v4l2-ctrls.h                            |  1 +
>>   include/uapi/linux/v4l2-controls.h                    |  2 ++
>>   include/uapi/linux/videodev2.h                        |  3 +++
>>   7 files changed, 36 insertions(+)
>>
>> diff --git 
>> a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst 
>> b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> index 
>> ab865a1a6ba929f1725ce2ab0fd3aeee4a69329a..0f8179de8f742253a5152231592fb8b4355298f7 
>> 100644
>> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> @@ -1674,6 +1674,25 @@ enum 
>> v4l2_mpeg_video_h264_hierarchical_coding_type -
>>       Codecs need to always use the specified range, rather then a HW 
>> custom range.
>>       Applicable to encoders
>>
>> +``V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP (__s8)``
>> +    This custom control is used to set ROI MB map delta_Qp for whole 
>> frame.
>
> "a whole frame" or "the whole frame"
>
Will update to "the whole frame in v4"
>> +    The frame is divided into a grid of MB Size by MB Size pixels 
>> (MB Size is
>> +    obtained from querying ``V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE``). 
>> Each block
>> +    is configured with delta_Qp in raster order. The valid range for 
>> delta_Qp
>> +    is encoder dependent.
>> +    Applicable to encoders.
>> +
>> +``V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE`` (integer)
>> +    A read-only control that reports the MB Size used for the ROI 
>> delta_QP map.
>> +    The supported MB Size depends on the encoder codec.
>> +    Only square macroblocks are supported. The value returned 
>> represents the
>
> macro-blocks ?
I will use MBs to keep it consistent. (in v4)
>
>> +    width and height of each block in pixels. The ROI delta_QP map 
>> provided
>> +    through the ROI control must use the MB Size reported by this 
>> control.
>> +    The number of entries in the ROI delta_QP array is determined by 
>> the
>> +    frame dimensions and the reported MB Size. For example, for a 
>> QCIF frame
>> +    (176x144) if reported MB Size is 16, the delta_QP array must 
>> contain
>> +    99 entries (176 x 144 / 16 x 16).
>> +
>>   .. raw:: latex
>>
>>       \normalsize
>> diff --git 
>> a/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions 
>> b/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
>> index 
>> 6182b4e2d2ee002c0d3562e1cc3bc2fd9c4286d6..b036ed3ec2f0744175cad1cbc4e73fe828e0c955 
>> 100644
>> --- a/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
>> +++ b/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
>> @@ -141,6 +141,7 @@ replace symbol V4L2_CTRL_TYPE_STRING 
>> :c:type:`V4L.v4l2_ctrl_type`
>>   replace symbol V4L2_CTRL_TYPE_U16 :c:type:`V4L.v4l2_ctrl_type`
>>   replace symbol V4L2_CTRL_TYPE_U32 :c:type:`V4L.v4l2_ctrl_type`
>>   replace symbol V4L2_CTRL_TYPE_U8 :c:type:`V4L.v4l2_ctrl_type`
>> +replace symbol V4L2_CTRL_TYPE_S8 :c:type:`V4L.v4l2_ctrl_type`
>>   replace symbol V4L2_CTRL_TYPE_MPEG2_SEQUENCE 
>> :c:type:`V4L.v4l2_ctrl_type`
>>   replace symbol V4L2_CTRL_TYPE_MPEG2_PICTURE 
>> :c:type:`V4L.v4l2_ctrl_type`
>>   replace symbol V4L2_CTRL_TYPE_MPEG2_QUANTISATION 
>> :c:type:`V4L.v4l2_ctrl_type`
>> diff --git 
>> a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst 
>> b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
>> index 
>> d78328152b7552f8f0d30a9e2f7c104bfd4b70d3..fe5f8992389c32d8f35f432229ef2f734002644e 
>> 100644
>> --- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
>> +++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
>> @@ -188,6 +188,10 @@ still cause this situation.
>>         - ``p_u32``
>>         - A pointer to a matrix control of unsigned 32-bit values. 
>> Valid if
>>       this control is of type ``V4L2_CTRL_TYPE_U32``.
>> +    * - __s8 *
>> +      - ``p_s8``
>> +      - A pointer to a matrix control of signed 8-bit values. Valid if
>> +    this control is of type ``V4L2_CTRL_TYPE_S8``.
>>       * - __s32 *
>>         - ``p_s32``
>>         - A pointer to a matrix control of signed 32-bit values. 
>> Valid if
>> diff --git 
>> a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst 
>> b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
>> index 
>> 82c8b52e771ce9301491b3f752e501a8fe7e2434..57e1652ae72e0324742142446acf32a16b94941c 
>> 100644
>> --- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
>> +++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
>> @@ -425,6 +425,12 @@ See also the examples in :ref:`control`.
>>         - any
>>         - An unsigned 32-bit valued control ranging from minimum to 
>> maximum
>>       inclusive. The step value indicates the increment between values.
>> +    * - ``V4L2_CTRL_TYPE_S8``
>> +      - any
>> +      - any
>> +      - any
>> +      - A signed 8-bit valued control ranging from minimum to maximum
>> +    inclusive. The step value indicates the increment between values.
>>       * - ``V4L2_CTRL_TYPE_MPEG2_QUANTISATION``
>>         - n/a
>>         - n/a
>> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
>> index 
>> 327976b14d50b73a631e4d2ed95d9f4d146c45ab..a1806ddbc797efa52e83cd3f685ef70d5b5483d2 
>> 100644
>> --- a/include/media/v4l2-ctrls.h
>> +++ b/include/media/v4l2-ctrls.h
>> @@ -64,6 +64,7 @@ union v4l2_ctrl_ptr {
>>       s32 *p_s32;
>>       s64 *p_s64;
>>       u8 *p_u8;
>> +    s8 *p_s8;
>>       u16 *p_u16;
>>       u32 *p_u32;
>>       char *p_char;
>> diff --git a/include/uapi/linux/v4l2-controls.h 
>> b/include/uapi/linux/v4l2-controls.h
>> index 
>> affec0ab4781507be761cb791ff737460acf9cb7..00a2c48630bd198faa9a2b833a9aa346d8357555 
>> 100644
>> --- a/include/uapi/linux/v4l2-controls.h
>> +++ b/include/uapi/linux/v4l2-controls.h
>> @@ -920,6 +920,8 @@ enum v4l2_mpeg_video_av1_level {
>>   };
>>
>>   #define V4L2_CID_MPEG_VIDEO_AVERAGE_QP  (V4L2_CID_CODEC_BASE + 657)
>> +#define V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP (V4L2_CID_CODEC_BASE + 658)
>> +#define V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE  (V4L2_CID_CODEC_BASE + 659)
>>
>>   /*  MPEG-class control IDs specific to the CX2341x driver as 
>> defined by V4L2 */
>>   #define V4L2_CID_CODEC_CX2341X_BASE (V4L2_CTRL_CLASS_CODEC | 0x1000)
>> diff --git a/include/uapi/linux/videodev2.h 
>> b/include/uapi/linux/videodev2.h
>> index 
>> 5373dba640fae3d19247ab1c74ba336e05dc0fe0..3ed343f8c81e0c9240d5a7e5b2dfe365a529fb6c 
>> 100644
>> --- a/include/uapi/linux/videodev2.h
>> +++ b/include/uapi/linux/videodev2.h
>> @@ -1884,6 +1884,7 @@ struct v4l2_ext_control {
>>           __s64 value64;
>>           char __user *string;
>>           __u8 __user *p_u8;
>> +        __s8 __user *p_s8;
>>           __u16 __user *p_u16;
>>           __u32 __user *p_u32;
>>           __s32 __user *p_s32;
>> @@ -1961,6 +1962,7 @@ enum v4l2_ctrl_type {
>>       V4L2_CTRL_TYPE_U8         = 0x0100,
>>       V4L2_CTRL_TYPE_U16         = 0x0101,
>>       V4L2_CTRL_TYPE_U32         = 0x0102,
>> +    V4L2_CTRL_TYPE_S8         = 0x0103,
>>       V4L2_CTRL_TYPE_AREA          = 0x0106,
>>       V4L2_CTRL_TYPE_RECT         = 0x0107,
>>
>> @@ -1997,6 +1999,7 @@ enum v4l2_ctrl_type {
>>       V4L2_CTRL_TYPE_AV1_TILE_GROUP_ENTRY = 0x281,
>>       V4L2_CTRL_TYPE_AV1_FRAME        = 0x282,
>>       V4L2_CTRL_TYPE_AV1_FILM_GRAIN        = 0x283,
>> +
>
> stray \n
>
sorry, will fix this in v4
>>   };
>>
>>   /*  Used in the VIDIOC_QUERYCTRL ioctl for querying controls */
>>
>> -- 
>> 2.34.1
>>
>
