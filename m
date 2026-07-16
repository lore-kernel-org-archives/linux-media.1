Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F027D27AC48
	for <linux-media@vger.kernel.org>; Thu, 16 Jul 2026 22:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784239271; cv=none; b=nTRVnRBtiwwBx9G5KDpNY4bTd+hN61t7opWWHdPVKyXQCIW0wASIo4TSViFVDs/HV2jmRZaekVMSTtvOk6HyaIus00H23ncsxpYbc96JFBnb9HGyDffRhND1jVmX+M3wGV6bnzv8eR3I+slF9X1WRhQdIsaiLVQnGjYVNFbrZto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784239271; c=relaxed/simple;
	bh=Htej3Xx7DNPwYy0Nm/Suo9yKDyFQV7K53QXamAwWscA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MOXj66VSyqFQ69e04jc1uv9yfgsmiz9lLtdyad3X3PSRPjldxoSZoXfifq2hyjfxQISCf87jYJj/g10ZDcm6v2EfbpJQCBh/i6eTW8/i7xc9TKxtvWcVBvNSNwPc6782N8NJBDsQqXfIpNhUT8wveeptYGg9RWfwrMFsVnBjiJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VNaYwzZ8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cFYm4SGc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VNaYwzZ8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cFYm4SGc"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GJoNRY681531
	for <linux-media@vger.kernel.org>; Thu, 16 Jul 2026 22:01:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wFJt/DA5CXB5lleKb//dQbUgpTVSoeRE1ykegkgw4Gg=; b=VNaYwzZ8rfkXYX5Y
	zJaaTUIL8cpXjFkvrA5alyN+7eAJlzW8TVfzfikd4jzJtNCwchw1aOO2Lq3eSZBi
	svOKSch2Bhj8s7k3InVckxd4jbVkgfyrmRKq0AR9RQ08pDwycZGrV2YHcT9zHPse
	IAYG+txl8ohTbygKTny9fcKxaGW1/TwLDvHs0YBU1YtRlgj/IEy2vdbJunbAqRW8
	xXb/fqRhf5oOIMVj6PkPCUtPnbWpTscAiXXPvng2+oUYD3iMpV0j+MZc3ELE9KtV
	SqmepXncdJYLT33yXij4e3R7fgkQzxMOEozF94+OjQibnNbRgcC3COctG1xW4wpA
	mW+stA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff3u6gwp3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 16 Jul 2026 22:01:09 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-37f5ea6097cso763341a91.3
        for <linux-media@vger.kernel.org>; Thu, 16 Jul 2026 15:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784239269; x=1784844069; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wFJt/DA5CXB5lleKb//dQbUgpTVSoeRE1ykegkgw4Gg=;
        b=cFYm4SGc8QIakkA6UDUJ8leIl6XuvikTTdZpYDudQL6X8MlKD3yWvo94bzeszCLvrb
         vgo+mDgKA2MnIfhmsIOmPS/A7e+gvOmktjHb85fxL2UB7L+/Tl6XYyUOTtvz6erY1bnL
         V+yr6xAPAcmbfVY3Me/iJmTaTwrZxwjf+KcueabXg7+wRIAep6T8ApkRvuACcEfhMhBK
         d3f/fmKvVGXo0TzE6md9zq44nGFNZ5zzaxyb959w3eLK6QvMxuOA51nTvWW3U2Ps6EOX
         WssgHvbyzy4/OYgiQsI8SQJhGRXBz+FSTZgg5AVNz0ou38v4Y1IeoOARIIGpc++mb4hC
         aVdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784239269; x=1784844069;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wFJt/DA5CXB5lleKb//dQbUgpTVSoeRE1ykegkgw4Gg=;
        b=ZH9nhPrKtWYwEUaVUDyfbD/d+F34uzpycqXi9XyaF0YPfsC9JsHi8VCUnt7fv2VQho
         vTsIblw3/NyOezJegvPQv0noA6runwAmiea5o2UOgB3j/RIMH+uwn3NcBYR9IXeFa9t6
         L74u1e0lCnT5rNdSQGJiFRQe5g6kXt0C8BFu+H57FMsxhF2bVPHLWjBz2XgLfNVpeoEH
         OEroFufsbvfCpPSnm7sT9VtzQcoz2bjTeZQzVAGCUJct26OIJANJ6l+OqzLe10solb8k
         nqZAu/RO3QWN9UKHPNYmleKcvXL+8+hJ7XjJmidQ8dachdXNjOpv93w75Td6PldDRtaN
         AoQQ==
X-Gm-Message-State: AOJu0YxPknhQZzDqmV8SYGvknvvBFMpE347WigB7L1Kj9qtKO3yXcLKj
	Cgh09YB2t8B0kXO4/9gw7YjrIBvSWH4IyD0ieXr73MTYvyxkvsdjMmGQ/OFwGSipovo5PZLkNWq
	hRcijI6w1Eflf72OneZSaR5VtLM44S5eEAlr2eGuG8/MFWRQ/PM5YxEKrgnocYodGi+sfgaPcBA
	==
X-Gm-Gg: AfdE7cmzPGqtUWgvoVWgKp+N4hgzdWDk9GMCEd+W6NKEl0BOSv92vtMJguMDwgCxgyo
	j5WtP2tFuAJZvllsPvg4OFOE3td11PA0AYOgwp/RCMrbCEyxrrKlf1dFhqkwvKxEMN8DA8Qgami
	PBdlWxdyJ6xfTVkerjC7q/3iDGHxLx9RhX5TN267yBN6oSLXFu/9KTAuiFmfM4xUJSn/0BTTSQ6
	SJWslYZWLsFtbDh5cyF45+VGaiD5SRfeLd5q1rn3TYD0g6RXjBsa7nOHKyOMFl6j66hSSh5Rl8S
	fOFPhGVk99GNfaq5C3AAHT/mEUcY4RFM/akNOnplGfwFv9XH9AM4rfcS6k6lb8/I2AA4421q+k2
	jP7NBJJboKmbUpebfdATJ6fS1Cx6xhPJ3f4A2SSotweYdDdlajCSgUGFlZVM7Z04=
X-Received: by 2002:a17:90b:33c8:b0:36a:5438:cff4 with SMTP id 98e67ed59e1d1-38dc77b63d6mr16584302a91.6.1784239268285;
        Thu, 16 Jul 2026 15:01:08 -0700 (PDT)
X-Received: by 2002:a17:90b:33c8:b0:36a:5438:cff4 with SMTP id 98e67ed59e1d1-38dc77b63d6mr16584267a91.6.1784239267751;
        Thu, 16 Jul 2026 15:01:07 -0700 (PDT)
Received: from [10.110.18.204] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e4fd3e9sm14438645eec.1.2026.07.16.15.01.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 15:01:07 -0700 (PDT)
Message-ID: <ef9c2ff6-f99b-4f3e-9f55-aa5177e22483@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 15:01:06 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] media: uapi: Introduce new control for video
 encoder ROI
To: Hans Verkuil <hverkuil+cisco@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20260714-enc_roi_enable-v2-0-63683f9dbcef@oss.qualcomm.com>
 <20260714-enc_roi_enable-v2-1-63683f9dbcef@oss.qualcomm.com>
 <fb72164e-ae4f-4ee0-9030-bb1d21ee7ce9@kernel.org>
Content-Language: en-US
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
In-Reply-To: <fb72164e-ae4f-4ee0-9030-bb1d21ee7ce9@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDIyNCBTYWx0ZWRfXwApdOsLkIMw0
 j06rNF8vqMipsjmvcyYMq4WA6WHxJuqFDMKLSvUNdu0EUdduY3d49Q0s02yHEtKCNfXW+ZrDqAG
 A0JJ1Qxh3OEkrIbJxhe7xQ1Vr07g0nQtXaOXPFv5yWrpxuD+3PeWVcBBK6KRDf+95AFnkyLEB5N
 jd7uBMXLMqSvN71IiyPKxTgd8RcjtJqiyeo5PMmM4ZlOStt0go87rFAOyTK2k+EtE0o3Um/cBcg
 cBcIu7eOHxfJ375VhbYcKxH6Kvk8OyA32aZVzBIup5IYE/sG2NpWWsDrttvSChTIlERXAD+w16N
 d6TDuAGLAOo2hVpuGq3F4fqiPlxvw+COUE1kS4hjGC21b/ZVyGuZ+T/fonI4wKdr9ugwnKdNMk9
 iP0BBZSZAiELnItTBMS6l/DLiwByv1dmXpjTFk281pI6Av1Dw5Q+LhKIIRQVpiFXt+RL2PvsfSy
 B9kFcmyk2psjjTECgnQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDIyNCBTYWx0ZWRfX1VwCzqTx/OW3
 Trlf5WtVWWgrQVUIAvWWFwFavAeevH7AcJWB+E+KpyGeXIk0T01Hb0X3PSinrMS/4/hTB44pY+1
 v2usrBNMurxCS7nhiturINu2ZYPH4CU=
X-Authority-Analysis: v=2.4 cv=DYMnbPtW c=1 sm=1 tr=0 ts=6a5954a5 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=yzY3fhObFLS17SNu1TAA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: RL1XKaalX9Ofo8LWZgFx9ygit3CuKqcH
X-Proofpoint-ORIG-GUID: RL1XKaalX9Ofo8LWZgFx9ygit3CuKqcH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_07,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160224


On 7/15/2026 1:25 AM, Hans Verkuil wrote:
> On 14/07/2026 21:00, Deepa Guthyappa Madivalara wrote:
>> Add custom control, V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP for
>> video encoder Region of Interest to allow applications to specify
>> different quality levels for specific regions in video frames. Define
>> V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE to retrieve supported MB size based on
>> codec from the hardware encoder and set the corresponding ROI MB delta_qp
>> map that adjusts quantization relative to the frame QP's base value.
>>
>> This enables use cases like prioritizing quality for faces in video
>> conferencing or important objects in surveillance footage while reducing
>> bitrate for less critical areas.
>>
>> Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
>> ---
>>   Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst  | 14 ++++++++++++++
>>   .../userspace-api/media/v4l/videodev2.h.rst.exceptions     |  1 +
>>   .../userspace-api/media/v4l/vidioc-g-ext-ctrls.rst         |  4 ++++
>>   Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst |  6 ++++++
>>   include/media/v4l2-ctrls.h                                 |  1 +
>>   include/uapi/linux/v4l2-controls.h                         |  2 ++
>>   include/uapi/linux/videodev2.h                             |  3 +++
>>   7 files changed, 31 insertions(+)
>>
>> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> index ab865a1a6ba929f1725ce2ab0fd3aeee4a69329a..1995e7335fb29611151c61561df577f2bdac7a48 100644
>> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> @@ -1674,6 +1674,20 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
>>       Codecs need to always use the specified range, rather then a HW custom range.
>>       Applicable to encoders
>>   
>> +``V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP (integer)``
> integer -> __s8

sorry, will update this in v3.

>> +    This custom control is used to set ROI MB map delta_Qp for whole frame.
> Why is this a 'custom' control? This looks like a standard control to me.
> Or do you perhaps mean that the value is HW dependent?

The array size is dependent on the max resolution reported by the hardware,
hence its defined as custom control with a dynamic array as input.

>> +    The frame is divided into grid with MB Size returned from querying
> The frame is divided into a grid of MB Size by MB Size pixels (MB Size is
> obtained from querying ``V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE``).
More clear, thanks, will update this in v3.
>> +    V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE. Each block is configured with delta_Qp
>> +    in raster order. The valid range for delta_Qp is encoder dependent.
>> +    Applicable to encoders.
>> +
>> +``V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE (integer)``
>> +    This read-only control returns the MB Size for ROI MB delta_Qp map.
>> +    Its valid range depends on encoder supported codec format.
>> +    Example: For H.264, 16 is returned for 16x16 MB size.
>> +    For HEVC, 32 is returned for 32x32 MB size.
>> +    Depending on the size returned, delta_Qp Map is set to the encoder.
> Sorry, it's not clear what you mean with that last sentence.
>
> Is it possible to have codecs with non-square macroblocks? E.g. 32x16?
>
> Regards,
>
> 	Hans
No, only square Mbs are supported. If supported MBSize is returned as 16 
for a
Qcif, the expected delta_Qp array size is 99(176x144/16x16).
I will update the documentation in v3.
>> +
>>   .. raw:: latex
>>   
>>       \normalsize
>> diff --git a/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
>> index 6182b4e2d2ee002c0d3562e1cc3bc2fd9c4286d6..b036ed3ec2f0744175cad1cbc4e73fe828e0c955 100644
>> --- a/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
>> +++ b/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
>> @@ -141,6 +141,7 @@ replace symbol V4L2_CTRL_TYPE_STRING :c:type:`V4L.v4l2_ctrl_type`
>>   replace symbol V4L2_CTRL_TYPE_U16 :c:type:`V4L.v4l2_ctrl_type`
>>   replace symbol V4L2_CTRL_TYPE_U32 :c:type:`V4L.v4l2_ctrl_type`
>>   replace symbol V4L2_CTRL_TYPE_U8 :c:type:`V4L.v4l2_ctrl_type`
>> +replace symbol V4L2_CTRL_TYPE_S8 :c:type:`V4L.v4l2_ctrl_type`
>>   replace symbol V4L2_CTRL_TYPE_MPEG2_SEQUENCE :c:type:`V4L.v4l2_ctrl_type`
>>   replace symbol V4L2_CTRL_TYPE_MPEG2_PICTURE :c:type:`V4L.v4l2_ctrl_type`
>>   replace symbol V4L2_CTRL_TYPE_MPEG2_QUANTISATION :c:type:`V4L.v4l2_ctrl_type`
>> diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
>> index b8698b85bd808979fc590715125f689880e5a30e..8d5eec357509700c9a582b98c14843bb5e483be0 100644
>> --- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
>> +++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
>> @@ -185,6 +185,10 @@ still cause this situation.
>>         - ``p_u32``
>>         - A pointer to a matrix control of unsigned 32-bit values. Valid if
>>   	this control is of type ``V4L2_CTRL_TYPE_U32``.
>> +    * - __s8 *
>> +      - ``p_s8``
>> +      - A pointer to a matrix control of signed 8-bit values. Valid if
>> +	this control is of type ``V4L2_CTRL_TYPE_S8``.
>>       * - __s32 *
>>         - ``p_s32``
>>         - A pointer to a matrix control of signed 32-bit values. Valid if
>> diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
>> index 82c8b52e771ce9301491b3f752e501a8fe7e2434..57e1652ae72e0324742142446acf32a16b94941c 100644
>> --- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
>> +++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
>> @@ -425,6 +425,12 @@ See also the examples in :ref:`control`.
>>         - any
>>         - An unsigned 32-bit valued control ranging from minimum to maximum
>>   	inclusive. The step value indicates the increment between values.
>> +    * - ``V4L2_CTRL_TYPE_S8``
>> +      - any
>> +      - any
>> +      - any
>> +      - A signed 8-bit valued control ranging from minimum to maximum
>> +	inclusive. The step value indicates the increment between values.
>>       * - ``V4L2_CTRL_TYPE_MPEG2_QUANTISATION``
>>         - n/a
>>         - n/a
>> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
>> index 327976b14d50b73a631e4d2ed95d9f4d146c45ab..a1806ddbc797efa52e83cd3f685ef70d5b5483d2 100644
>> --- a/include/media/v4l2-ctrls.h
>> +++ b/include/media/v4l2-ctrls.h
>> @@ -64,6 +64,7 @@ union v4l2_ctrl_ptr {
>>   	s32 *p_s32;
>>   	s64 *p_s64;
>>   	u8 *p_u8;
>> +	s8 *p_s8;
>>   	u16 *p_u16;
>>   	u32 *p_u32;
>>   	char *p_char;
>> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
>> index affec0ab4781507be761cb791ff737460acf9cb7..00a2c48630bd198faa9a2b833a9aa346d8357555 100644
>> --- a/include/uapi/linux/v4l2-controls.h
>> +++ b/include/uapi/linux/v4l2-controls.h
>> @@ -920,6 +920,8 @@ enum v4l2_mpeg_video_av1_level {
>>   };
>>   
>>   #define V4L2_CID_MPEG_VIDEO_AVERAGE_QP  (V4L2_CID_CODEC_BASE + 657)
>> +#define V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP  (V4L2_CID_CODEC_BASE + 658)
>> +#define V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE  (V4L2_CID_CODEC_BASE + 659)
>>   
>>   /*  MPEG-class control IDs specific to the CX2341x driver as defined by V4L2 */
>>   #define V4L2_CID_CODEC_CX2341X_BASE				(V4L2_CTRL_CLASS_CODEC | 0x1000)
>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
>> index eda4492e40dc14a90a230601d8e23b0e13845d34..1e307781645543960e4b73ba46fdf83279fda4dd 100644
>> --- a/include/uapi/linux/videodev2.h
>> +++ b/include/uapi/linux/videodev2.h
>> @@ -1880,6 +1880,7 @@ struct v4l2_ext_control {
>>   		__s64 value64;
>>   		char __user *string;
>>   		__u8 __user *p_u8;
>> +		__s8 __user *p_s8;
>>   		__u16 __user *p_u16;
>>   		__u32 __user *p_u32;
>>   		__s32 __user *p_s32;
>> @@ -1957,6 +1958,7 @@ enum v4l2_ctrl_type {
>>   	V4L2_CTRL_TYPE_U8	     = 0x0100,
>>   	V4L2_CTRL_TYPE_U16	     = 0x0101,
>>   	V4L2_CTRL_TYPE_U32	     = 0x0102,
>> +	V4L2_CTRL_TYPE_S8		 = 0x0103,
>>   	V4L2_CTRL_TYPE_AREA          = 0x0106,
>>   	V4L2_CTRL_TYPE_RECT	     = 0x0107,
>>   
>> @@ -1993,6 +1995,7 @@ enum v4l2_ctrl_type {
>>   	V4L2_CTRL_TYPE_AV1_TILE_GROUP_ENTRY = 0x281,
>>   	V4L2_CTRL_TYPE_AV1_FRAME	    = 0x282,
>>   	V4L2_CTRL_TYPE_AV1_FILM_GRAIN	    = 0x283,
>> +
>>   };
>>   
>>   /*  Used in the VIDIOC_QUERYCTRL ioctl for querying controls */
>>
