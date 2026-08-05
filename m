Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49CB03F3276
	for <linux-media@vger.kernel.org>; Wed,  5 Aug 2026 16:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785947877; cv=none; b=DjKgoH/M971c+rCgSxMczRxVpbf0I0mVdSU5QDRvfBrVybCu3XgydTHEa75/EMddcxbQLT8dxlk1BfINtYk99XN3OY2qHTJTg2mSJ/8NYOdouKC2YotaMJdu35cxv09Ou7VMdV8cR/HuhZxxWJ6ElMqYz2iZSEFh0AwuJbklHQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785947877; c=relaxed/simple;
	bh=8+2PylqWNZrDsBe0yH710HlQGVqpY2LoeL2x1geD5HI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uR/9fVXjmeueBWfZjL9PIDpfAHnHBGrNbqnqSeh7WfBeIC41ORIE7f4Odp6W+XfmyNYD20xLdvXGqsn1rGFh0rgP4idXCzyM303CDYVKMOQp7svwllbON7aQNCU+mlqz97Xt0RXrFgiKdj2jfuEOFaNHly6wvMHEaj8cSR8mGp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E/q1PROb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j/m+PpQG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E/q1PROb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j/m+PpQG"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675FV3pN3019118
	for <linux-media@vger.kernel.org>; Wed, 5 Aug 2026 16:37:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WdGxg9qUyCSflIvbg1X6LXTFMLPukJPalp2YGPQ7aHY=; b=E/q1PRObfw/N3Rsi
	BwqWsOC7t+FK8Xhiu7LCUSSo+vxTvUEjlxklV7MbfhIoszyWrskLy+nocoXXRFHu
	AJJ54d+LaReUw+XU163W1YYf1D38ZJfLcoxSZ0VcmEDyj+szGXpwPJHrcV6zT0Cp
	H+zYFB8TNymNKLQLrFVopvUw4SYZBdjUYmkvtfC71pfvXqHCvQVucK44IdPPPCTX
	JWW+dz4Mi3Fb7CsOHERAJ/sPSoG0AToDBBU1JSylq/Qz6xj0qdzsO5Aly4AighZI
	dxuOVCEq7Lwi5pwnAInwd0aN2GnbNdHvJYlUOrtOWXd6Iz2C77lRJqfXQGauzu9i
	iqBNZA==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv5x5h310-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 05 Aug 2026 16:37:55 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-48ade85cef5so242891b6e.0
        for <linux-media@vger.kernel.org>; Wed, 05 Aug 2026 09:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785947875; x=1786552675; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WdGxg9qUyCSflIvbg1X6LXTFMLPukJPalp2YGPQ7aHY=;
        b=j/m+PpQGVYZJbfT9Ar6o5Agx0zjf4LXWSBnzLxDotz7hqQQ80hVelD8w4ZMmyj1pw7
         ZGE/NvC4F/4EhNg3M1QfLJRoo563hskUPrNJoo8Xytq0EfJ6tEtGutL0OXaxIiSvIdqV
         E/5cAwkQwywRNVI7QMjkJ4cTCcNO3Z2UBSfdJiyj6Kqnb0F4o9KUCOPBJllyogaEiH4y
         jus1C4/vYZyj3UOJYiTIu5Ica//QG7SWycj/tU5VGBnq2FDzmCuJcsZZxmIvEoBcOAUu
         AeGsvMla/ujGNAuecPQRlrcDoPIsQQ4q1kpAbx0OB6uYCi6gOvSn/ZVD1aBO2Kp/Yd0e
         IBpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785947875; x=1786552675;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WdGxg9qUyCSflIvbg1X6LXTFMLPukJPalp2YGPQ7aHY=;
        b=luKjDHF27pmQncpHop9ZFwY1mXhuo7vSOY+/ht+/+qSXvBBLxHSNs/2tv4OoqIVhM1
         LlH1zm9Y8Y47K1j5iDk2Gzd6F7+lZpdVOTmQ5VTjI2xxykg+EUl0uNW4huhhJLMnx5ja
         qmy7w6JXUy+7m1CthPdoHjy9CbhnBZn/8Q/i17xW6xZx+RKOJxSaAiMaUW/UW80fa9Y8
         P9rqWB1KV9k8AWtiTFmp+CuZvq/SJs++OamOK2pjMpz7iD00bNSlZqVN1P4sJK+RELuC
         Npxv1HJwy56YKEvizDtgaUSB/2ULxvmVVkhN4rAieKWtZJAz60fixtaeZ0QKkwAoOAeC
         u8Nw==
X-Gm-Message-State: AOJu0YzTDW5VynWPPvGxlF1xtwrZ7YtWDWebw7E0PjsXhJ5xOS/ygZ9G
	74xUtfizTbw5xs3B3G7j4vQhClBGXJPVAUaEiTYmzTPcnOqDIjCncLzM+0wCczDwbreYD2C2hhK
	iMe+HdnwYHrXvB2TW6oMmHX0f2U7jMs+f7LAtmcIX035E9Qc+JF8+1hi6yZPcA7rzDg==
X-Gm-Gg: AR+sD12wIsv6ipZmhAFXPGrbKcoRtqq2pVTBXWdhAAr/i1bJlSHO+Ox4n80fRLTH+00
	PioQriyevAXpTSXVlklPnWrAYbInJE+3+FAr/vjkExzp4hkj3Siwy6JexMfED9sGZmPxEylj/uS
	q+bVzI0w+7M7M6C0FA5jJio7D1E3LI/9wPtd5yA130cVPNRfTiuQutEipUxImafILKF2HC7hbXY
	b3190teE8rTfrDaU4tnq93oQMFpsqzbIKoKE1D4BLtpy6y7Z7GTVtCoeNqgprT7rm+udLPkzONp
	3nTfxxaxDUXeGMygD71trjyrh6PxlyTcdY5dgdJiU+XimLi0Uh1ToDPR9B+OJxmL7EzJwxMNkH2
	CgVJQ6zdmLp2+FTn5HNY20dgj2kT05v2xyIBsFBNJnfO0tFdVDdgBbKuJi3g65Q==
X-Received: by 2002:a05:6808:1588:b0:4af:5d69:1cb8 with SMTP id 5614622812f47-4afadbf4d3amr2748590b6e.0.1785947874722;
        Wed, 05 Aug 2026 09:37:54 -0700 (PDT)
X-Received: by 2002:a05:6808:1588:b0:4af:5d69:1cb8 with SMTP id 5614622812f47-4afadbf4d3amr2748569b6e.0.1785947874259;
        Wed, 05 Aug 2026 09:37:54 -0700 (PDT)
Received: from [10.110.6.162] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4afae458389sm2360760b6e.2.2026.08.05.09.37.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 09:37:54 -0700 (PDT)
Message-ID: <196c4ff1-bf93-4c56-8d9a-4b00c6b3924c@oss.qualcomm.com>
Date: Wed, 5 Aug 2026 09:37:52 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] media: v4l2-core: Add support for video encoder
 ROI control
To: Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20260804-enc_roi_enable-v3-0-e03b622a2d48@oss.qualcomm.com>
 <XgpvBhGwesIZWJQTWMOrfEh-k5I7ZGa3NN9m1CSaxF-l-aHmrWAyOhmgRX1ZK-FyLhhp46TD3DsskT1wBQ4Kew==@protonmail.internalid>
 <20260804-enc_roi_enable-v3-2-e03b622a2d48@oss.qualcomm.com>
 <3cb31ce1-bb06-4202-aeb6-8e8437e57085@kernel.org>
Content-Language: en-US
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
In-Reply-To: <3cb31ce1-bb06-4202-aeb6-8e8437e57085@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDEzNSBTYWx0ZWRfX+73LinIFFq09
 ZKGhRkONvY+w4QUNLRNYb2GoVAd55ZwmdhP7BwmTmynK6Aw3Y1nFM9G1zphxCIMExDNsy5WUbEY
 T1HeFcyyC4yJ6bKExzDLy7rMJTESY9e24Hre9+GMvoMIlHNWkFjG6NOtx51UoksQqYvUP59XHfZ
 PReto/1kUs8r9aIzGqwBsKEtMWGnP1w025kCNxYXKi7Ov3inb8Iyv+pigjvUkoRfsSYBmQKAHC1
 6J07h+a7JSR6kLRsfeDIuVyC8UxTkxp6yHwJIsreI4GM8rZL2yuX94rXchw9yf6VIb2vjArLli4
 IBqz5jupjRqPeX1xrcvk35oWPtruOxv90aIT9H70uaweFxXugEbM2tmbSYZA6+OrnOm/O6BDTjX
 p9a3cfBTGdx/q2RMAUGwMbeDb+HW1YJySAr3jB1T7PHmQFKc/H6LchRuxMX7yGO7QbsrJuxEDJF
 0Q7c7vE2iuVBH55oOvw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDEzNSBTYWx0ZWRfX+Hlhx3r9WJJL
 DrjePhhvgdNuortZHrmo6H0nxqUp8fcb2Pyd3y+ObHoMB9ZTfRyEchbJnCgxqjVdF8my2fuib4X
 jdrWoovtbWyOJG668iah7ovP6c7Tw5A=
X-Proofpoint-GUID: ptycuoU1xncdasYC4bms_6OgzN9YMBhO
X-Authority-Analysis: v=2.4 cv=cIbQdFeN c=1 sm=1 tr=0 ts=6a7366e3 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=T4rr7CIfql8Qit_6xdcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-ORIG-GUID: ptycuoU1xncdasYC4bms_6OgzN9YMBhO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_05,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050135


On 8/4/2026 8:51 PM, Bryan O'Donoghue wrote:
> On 04/08/2026 21:05, Deepa Guthyappa Madivalara wrote:
>> @@ -1588,6 +1606,7 @@ void cur_to_new(struct v4l2_ctrl *ctrl)
>>           return;
>>       if (ctrl->is_dyn_array)
>>           ctrl->new_elems = ctrl->elems;
>> +
>>       ptr_to_ptr(ctrl, ctrl->p_cur, ctrl->p_new, ctrl->new_elems);
>>   }
>>
>> @@ -2030,6 +2049,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct 
>> v4l2_ctrl_handler *hdl,
>>       case V4L2_CTRL_TYPE_U32:
>>           elem_size = sizeof(u32);
>>           break;
>> +    case V4L2_CTRL_TYPE_S8:
>> +        elem_size = sizeof(s8);
>> +        break;
>>       case V4L2_CTRL_TYPE_MPEG2_SEQUENCE:
>>           elem_size = sizeof(struct v4l2_ctrl_mpeg2_sequence);
>>           break;
>> @@ -2247,7 +2269,6 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct 
>> v4l2_ctrl_handler *hdl,
>>
>>       if (flags & V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX) {
>>           void *ptr = ctrl->p_def.p;
>> -
>>           if (p_min.p_const) {
>>               ptr += elem_size;
>>               ctrl->p_min.p = ptr;
>
> You're adding and subtracting newlines here in code you otherwise 
> aren't touching.
>
> ---
> bod
>
ack, will fix this in v4
