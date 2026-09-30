Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7010D517BD9
	for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 17:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790788006; cv=none; b=ohC+ruajH7qpmyghsq/8WvN+KcqeaH3PvvbC32WcjN3IjwwJiAWbjWd3J1ySyaHNDkiPsU5KY8RX/RnGtn9Wd4zcfSgJKL6iGfs2Lol9JHzV5qnpZMvSK5dNDo1JADVvxavAV6ajDu5UYohrmvxaGIuJPg6mlL4AHrAyQ5lcVC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790788006; c=relaxed/simple;
	bh=wbUWb0ZWoMuBoNOLWj78MTwyRP6ere99XpL7VbU67dY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I/Tmurtotu/FhY8LrR+zZBlMsA1Wh2NoJCGfiRtUPJhcnVXXNsPu+Vq//O/7rAactCz5QZAqqVPRvhIkDGgiugx+QmIawb2Ao66TT5lXLomnLM9nCdaEqs7rFfbhnsCUkeJB9olevcewlzsqG8tprHx5vqiLqwmDFHNeaXe5Y7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GZirZY3w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X4Aqtm3D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GZirZY3w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X4Aqtm3D"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UGjKTE4035430
	for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 17:06:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KtoxYiM21cxbx6c0eZ+nMQPBsKWDHMPOuCB5rj3KsWk=; b=GZirZY3wjnOBVGkf
	3NpKmwklkHMsqYLFe59ZB8U0HL3b8ornbr2ybMg0LHFxIwB14OQBZbNR4ASFxrr/
	8rQOx9c09DNCLYM2AazsbZ9XJxZhxBG0YIyLIbvZVf9f539FQLGfDvnIVO1iQgT4
	aPZBjAF0VcHjvI0sm8DGxR8IcLlaVP+h1W3dnNRNoD0NE/zcBRr6f6i8P3x2Ps5r
	gzchEKuqNdX7meksXmSZRxdab02Z8hAevREKQ3ULMRhxiEFfVdhxOFl0fw3NsSDM
	E86J7nn/QUdYZwOhNzKzwQSyCwHP4uoplbNsyRNxH8udt/ko3zJnXxE6WGh/NUc5
	pCstsw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h167pg4b3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 17:06:43 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3426f4acfbaso658642eec.2
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 10:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790788000; x=1791392800; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KtoxYiM21cxbx6c0eZ+nMQPBsKWDHMPOuCB5rj3KsWk=;
        b=X4Aqtm3D0lLSn9gqSC32KA/3A52tNSiNd4beV6aRGrgNndclMmr5UrVyWZUC2ugenh
         zwS/MJOLSBoF/X7Sf7g6P+OQ15jjxJMtnpAPmq5GODXK5aQczMv3/4gdjMuTSnviEOiI
         CBMlxAOx1ZjcmSsIwlaKOuRvkVTxFFbccOBXA6rppeYJEsxtrWPjGwElMXg43L9RCalb
         NcDreMULH3bi8XelPdH9tKYcn9JWltrIJRPe86wRbddbS3CUwTagAVAk3hQrYoLdbtpw
         QNEhhF8vrznC25/8x40FVQNxibJQiA/niuwMqFTz0IdFTwz+uhPQ3+hP0KdAe3y99RMa
         ZW2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790788000; x=1791392800;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KtoxYiM21cxbx6c0eZ+nMQPBsKWDHMPOuCB5rj3KsWk=;
        b=n+x38lT29uiegfjxnlshDslKpAaD4xQgSfQ0rV3ufTTCIlEyXpdhB8ffr9sIgOnizN
         iGX4Acsi7HzkSGdy/T2HD+coDK0VsCxHhcD3nbAATwIAdg12INCyFcCoWIjUJA9d+C4C
         mN7V8rjMX6r1Oavf/npuugMi7qeVTT04pEtpOcB9EOKntzuscSao61HTlHoXuOISkzSA
         Gz1q6iUUEGgAjo+hibzOrkqH/C7ox3oSCbv22mcdZ56kHG7WgZm8FDmDWJxb2yYlSqJr
         6QMot7JFLKX1qerTGbdbMpN4e8Q12jKrozsMf144lbEZtXp+ZETtqsCw2z9xtxAFruZm
         lmGA==
X-Gm-Message-State: AFq9FYLjdNZtjCSYsQV1m2Si4HO/enBkbtOKlRBeOXgzUubhlij+zSPG
	tlD3Vgx58m+gv21em/Jlwl3UCwIFUG25oRxNG1yhAYR7Cm8zXvcpnmifScy3W4WsTbLWX0Ee1ID
	SDl96OMFg/XhbfyzXOcj5Lrl0z4xTajdfuQ0mYXCwwehThoLO+FWagruWtiGTj3Vd5Q==
X-Gm-Gg: AYBFou1SneGhf1wyZ14/xXlwWZkO5Lu09Bvnwx2rcTdmDL31VXpvb7tRdCqC1FtCAoM
	ftJxEABDZe5HCWj5ih4g86SeYhOLdJ6+SwCiaHm7Qfq3pyzMYTBSes5UzTbAXS/8Y0GmXDgn8wo
	jy2lKiH6ITtJtU7xXhW0nQeIEBDrRQUXKnRDH9y0z84swzNWfvx7JYg2D1oMzJzcqKchneokarg
	udzDuwow3N00dh10Jukgn8p80eGrrJ7XRqcZVnrTPiM0n59/Fzq9y/CNPZmzXKQp5jemsgn4d4j
	FcFHnXjDLzkG5pRA6I/T9KeZuoU2GqoxcU5VK+1eQKIX1XN5sYqL5yV9PG0C73CLhoc3D2mjQ6e
	lxjcBK7RJIxPsvJYNlg9S/8xLGb6qHZylFXPa7eIdStXZB4Wlo4OFPlPY4FENMA==
X-Received: by 2002:a05:693c:8085:b0:34c:f181:85e4 with SMTP id 5a478bee46e88-34cf1818b1fmr3509359eec.1.1790787999482;
        Wed, 30 Sep 2026 10:06:39 -0700 (PDT)
X-Received: by 2002:a05:693c:8085:b0:34c:f181:85e4 with SMTP id 5a478bee46e88-34cf1818b1fmr3509310eec.1.1790787998651;
        Wed, 30 Sep 2026 10:06:38 -0700 (PDT)
Received: from [10.110.82.170] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34db3162a00sm520303eec.10.2026.09.30.10.06.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 10:06:36 -0700 (PDT)
Message-ID: <563dc214-8588-47d6-88f0-e80fe20cc39c@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 10:06:33 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/5] media: v4l2-core: add new control type
 V4L2_CTRL_TYPE_S8
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20260924-enc_roi_enable-v7-0-6fa7413af23c@oss.qualcomm.com>
 <20260924-enc_roi_enable-v7-1-6fa7413af23c@oss.qualcomm.com>
 <5448c02a-3238-f658-43c6-397db2878519@oss.qualcomm.com>
Content-Language: en-US
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
In-Reply-To: <5448c02a-3238-f658-43c6-397db2878519@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: OPNM0N5xojr-Xf2uZDfEi-b5xSJIgS-4
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2OCBTYWx0ZWRfX1C9+TAx89sfz
 vCo++LZBd8zaml90no0V2DgWReUoxOByVG1U90Z+i0+evCCaac2DZf42hJL2r49XO5y8rsv1IQ2
 Cua0VJrvuKb2JoNF5w+77sCXYcnS/do=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2OCBTYWx0ZWRfX4h6MLFgXVjCk
 xF+Dj08g7dUknaGdsZygy5w0468osiEQjPB4E9Wyb2f2jI+jgQvZHKyL4v8G4zTk0lgDfW8jWmy
 aFJZeWjbcKqn6MvbjeDl/jAIbD+muVwJKKNvjq5lcmbpeseB/z1zvQu5Rqe57lN79dFYXssxoyY
 LFZwKEdbLhpUhy26vWD9Bl2Ybdweb5GIEUC0aeh6g2VJBcQXLtLAmlmNtmBmOj1Kah9u0sec5GU
 p1kjHS0k68l+o7yTopeR8OWjeZXkpd/iPDK8wB8JjPWIMBkMQQwvJ/Ek6C69k+8mTT5p6xOoJ9T
 g0+VhxA5zFd6QHw8BTdpczqBAoow7TLLynV9L5v4Y5C+R4HQetDdVYx45+MZf0cVU5hD5vTGTN4
 bh2ngIx7qPbiXoIOwfQnzZchV8s9WsDN+/hzlZC8gGyz1O2qYQ40cqJw27GIVXJmHfzGGYTEOxn
 p+cxv3RaN2GakmtWozA==
X-Proofpoint-GUID: OPNM0N5xojr-Xf2uZDfEi-b5xSJIgS-4
X-Authority-Analysis: v=2.4 cv=WpC+otfv c=1 sm=1 tr=0 ts=6abd41a3 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Q7n_TknA2OIddNHkTQcA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300068


On 9/30/2026 2:53 AM, Vishnu Reddy wrote:
> On 9/25/2026 5:58 AM, Deepa Guthyappa Madivalara wrote:
>> Introduce V4L2_CTRL_TYPE_S8 (enum value 0x0103) as a new
>> control type for signed 8-bit values. Add necessary support in
>> v4l2_ext_control, v4l2_ctrl_ptr and handling in v4l2-ctrls-core,
>> v4l2-ctrls-api.
>>
>> Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
>> ---
>>   .../userspace-api/media/v4l/videodev2.h.rst.exceptions   |  1 +
>>   .../userspace-api/media/v4l/vidioc-g-ext-ctrls.rst       |  4 ++++
>>   .../userspace-api/media/v4l/vidioc-queryctrl.rst         |  6 ++++++
>>   drivers/media/v4l2-core/v4l2-ctrls-api.c                 |  1 +
>>   drivers/media/v4l2-core/v4l2-ctrls-core.c                | 16 ++++++++++++++++
>>   include/media/v4l2-ctrls.h                               |  2 ++
>>   include/uapi/linux/videodev2.h                           |  2 ++
>>   7 files changed, 32 insertions(+)
>>
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
>> index d78328152b7552f8f0d30a9e2f7c104bfd4b70d3..fe5f8992389c32d8f35f432229ef2f734002644e 100644
>> --- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
>> +++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
>> @@ -188,6 +188,10 @@ still cause this situation.
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
>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-api.c b/drivers/media/v4l2-core/v4l2-ctrls-api.c
>> index 93d8d4012d0f4fef004e417d0aee2ae44b1b30bd..7d41cfd7378baaa929d4da0266c45f731bb54285 100644
>> --- a/drivers/media/v4l2-core/v4l2-ctrls-api.c
>> +++ b/drivers/media/v4l2-core/v4l2-ctrls-api.c
>> @@ -980,6 +980,7 @@ int __v4l2_ctrl_modify_range(struct v4l2_ctrl *ctrl,
>>   	case V4L2_CTRL_TYPE_U8:
>>   	case V4L2_CTRL_TYPE_U16:
>>   	case V4L2_CTRL_TYPE_U32:
>> +	case V4L2_CTRL_TYPE_S8:
>>   		if (ctrl->is_array)
>>   			return -EINVAL;
>>   		ret = check_range(ctrl->type, min, max, step, def);
>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
>> index 661a3a25da5220d2e824f71e68871181533e6cd8..c5df0e0a54f81c73975f427957b7c99fd421d5ad 100644
>> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
>> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
>> @@ -297,6 +297,9 @@ static void __v4l2_ctrl_type_op_init(const struct v4l2_ctrl *ctrl, u32 from_idx,
>>   			memset(ptr.p_u32 + from_idx, 0, elems * sizeof(u32));
>>   		}
>>   		break;
>> +	case V4L2_CTRL_TYPE_S8:
>> +		memset(ptr.p_s8 + from_idx, (u8)value, elems);
>> +		break;
>>   	default:
>>   		for (i = from_idx; i < tot_elems; i++) {
>>   			switch (which) {
>> @@ -377,6 +380,9 @@ void v4l2_ctrl_type_op_log(const struct v4l2_ctrl *ctrl)
>>   	case V4L2_CTRL_TYPE_U32:
>>   		pr_cont("%u", (unsigned)*ptr.p_u32);
>>   		break;
>> +	case V4L2_CTRL_TYPE_S8:
>> +		pr_cont("%d", *ptr.p_s8);
>> +		break;
>>   	case V4L2_CTRL_TYPE_AREA:
>>   		pr_cont("%ux%u", ptr.p_area->width, ptr.p_area->height);
>>   		break;
>> @@ -1442,6 +1448,8 @@ static int std_validate_elem(const struct v4l2_ctrl *ctrl, u32 idx,
>>   		return ROUND_TO_RANGE(ptr.p_u16[idx], u16, ctrl);
>>   	case V4L2_CTRL_TYPE_U32:
>>   		return ROUND_TO_RANGE(ptr.p_u32[idx], u32, ctrl);
>> +	case V4L2_CTRL_TYPE_S8:
>> +		return ROUND_TO_RANGE(ptr.p_s8[idx], u8, ctrl);
> Should ROUND_TO_RANGE() use s8 here instead of u8, since ptr.p_s8[idx] is an s8?
Refer to comment from Hans on v5.
>>   
>>   	case V4L2_CTRL_TYPE_BOOLEAN:
>>   		ptr.p_s32[idx] = !!ptr.p_s32[idx];
>> @@ -1501,6 +1509,10 @@ int v4l2_ctrl_type_op_validate(const struct v4l2_ctrl *ctrl,
>>   		if (ctrl->maximum == 0xffffffff && ctrl->minimum == 0 && ctrl->step == 1)
>>   			return 0;
>>   		break;
>> +	case V4L2_CTRL_TYPE_S8:
>> +		if (ctrl->maximum == S8_MAX && ctrl->minimum == S8_MIN && ctrl->step == 1)
>> +			return 0;
>> +		break;
>>   
>>   	case V4L2_CTRL_TYPE_BUTTON:
>>   	case V4L2_CTRL_TYPE_CTRL_CLASS:
>> @@ -1732,6 +1744,7 @@ int check_range(enum v4l2_ctrl_type type,
>>   	case V4L2_CTRL_TYPE_U32:
>>   	case V4L2_CTRL_TYPE_INTEGER:
>>   	case V4L2_CTRL_TYPE_INTEGER64:
>> +	case V4L2_CTRL_TYPE_S8:
>>   		if (step == 0 || min > max || def < min || def > max)
>>   			return -ERANGE;
>>   		return 0;
>> @@ -2037,6 +2050,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
>>   	case V4L2_CTRL_TYPE_U32:
>>   		elem_size = sizeof(u32);
>>   		break;
>> +	case V4L2_CTRL_TYPE_S8:
>> +		elem_size = sizeof(s8);
>> +		break;
>>   	case V4L2_CTRL_TYPE_MPEG2_SEQUENCE:
>>   		elem_size = sizeof(struct v4l2_ctrl_mpeg2_sequence);
>>   		break;
>> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
>> index cec9217d97ac698cd447574f5d079dd913a9ef6f..6a181a6c6b43beae87310cacb044a0cc7ad2c063 100644
>> --- a/include/media/v4l2-ctrls.h
>> +++ b/include/media/v4l2-ctrls.h
>> @@ -27,6 +27,7 @@ struct video_device;
>>   
>>   /**
>>    * union v4l2_ctrl_ptr - A pointer to a control value.
>> + * @p_s8:			Pointer to a 8-bit signed value.
>>    * @p_s32:			Pointer to a 32-bit signed value.
>>    * @p_s64:			Pointer to a 64-bit signed value.
>>    * @p_u8:			Pointer to a 8-bit unsigned value.
>> @@ -61,6 +62,7 @@ struct video_device;
>>    * @p_const:			Pointer to a constant compound value.
>>    */
>>   union v4l2_ctrl_ptr {
>> +	s8 *p_s8;
>>   	s32 *p_s32;
>>   	s64 *p_s64;
>>   	u8 *p_u8;
>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
>> index 5373dba640fae3d19247ab1c74ba336e05dc0fe0..ac588d0093df9cc35c11d0b9d41d052d5e800925 100644
>> --- a/include/uapi/linux/videodev2.h
>> +++ b/include/uapi/linux/videodev2.h
>> @@ -1884,6 +1884,7 @@ struct v4l2_ext_control {
>>   		__s64 value64;
>>   		char __user *string;
>>   		__u8 __user *p_u8;
>> +		__s8 __user *p_s8;
>>   		__u16 __user *p_u16;
>>   		__u32 __user *p_u32;
>>   		__s32 __user *p_s32;
>> @@ -1961,6 +1962,7 @@ enum v4l2_ctrl_type {
>>   	V4L2_CTRL_TYPE_U8	     = 0x0100,
>>   	V4L2_CTRL_TYPE_U16	     = 0x0101,
>>   	V4L2_CTRL_TYPE_U32	     = 0x0102,
>> +	V4L2_CTRL_TYPE_S8	     = 0x0103,
>>   	V4L2_CTRL_TYPE_AREA          = 0x0106,
>>   	V4L2_CTRL_TYPE_RECT	     = 0x0107,
>>   
>>
