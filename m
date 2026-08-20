Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F368353A84
	for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 04:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787199176; cv=none; b=JmKKdtoUTrxRPqZvZTtEaMaUVtJORxGJR/l46kc1+wZEoWEZhpYP9WTxbmdoNTaTHWxzVd4seHPR9WOHzDSk8fPnNGely65uldiCRVojK/RQ2DSwbUl6FdfA3JqYB6zF7IrG/G2k7uUMry/AUbvHnhCkJTrynZaQPWh2z7ZUllA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787199176; c=relaxed/simple;
	bh=gl53nmErgxNHnBhywqBf9y2uMEPF2VoEaOuh6BLQ358=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dEjA15GJ3bs8L0wDTKi/jpF6pCqoCTJSR/oHQJda9h28wKSqivj2PEW+AGw2F46Q+ZvcLkRylD17UBtnCA6wXsX0FyD8u+zazmC8cH10VBvmUURUkYZSL/CAZHq9NblzoRqNpZ9ES5Wtf3g82Ol+CJNMrqlBun/qy71P0lKzpZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cQgR9plk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hu40D/bC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cQgR9plk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hu40D/bC"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JL8KpC939908
	for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 04:12:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/So9S1KEAt5OvNBUFCqjrX+Y7R9w32tufku2nOhCX44=; b=cQgR9plkA7XTyz/x
	f5xmgIfOnuBZAITDNXw+tp/xBCL7i5h3742aucSTz67ITEQ5pVQ4x7GlZpopD2ue
	rY6S3YtJIkGI9E/vThBosMqht2uFYyF837f3tVULItgVkoDUAR4R/YQldZsRAjg3
	fNaOBmcvmBuf6ZuxwMGJ/QzhHI4ZGfz/CFL3VoPXESuTblDWtaU8xQZqY+MwjT7N
	gkKkqZjnUPBQTz4IzGUHtUIou0iJ/Ri9cQnXU4Zfprgw0zQTIeKiQd2Wh7MtWuPy
	jL9pNN24O70HUA93grBVhLfx8C/OrP2WvJllP7HItMIgTiQsRHL70lboMin87WeN
	V8s10A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5e5d38ks-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 04:12:53 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-381250979d5so2157123a91.0
        for <linux-media@vger.kernel.org>; Wed, 19 Aug 2026 21:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787199173; x=1787803973; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/So9S1KEAt5OvNBUFCqjrX+Y7R9w32tufku2nOhCX44=;
        b=Hu40D/bCC8YAFixzFVG4IXF3u8YNievRXiKl3WkJCyGCmcnZLEfZ/JFJkpT/Pq1/1B
         k0S3va/i5yvli+fpfx5HBAuklcwPMUEwgiK4V4Rvnwr5PUnsJbIC9VCX12UAm63wtdXh
         my5kKhWbaE13rWn8x9rZefSiIWz+tXdrrxcU2Xvj9lSegu6SkxKrvsTucfaGgOYn5CAf
         FRsnpKsaS8wGAlGIqQcLOHkwvU2+K3xAjwVI7fLiy2/2mxP6hExkvb8dQqHuH15oRoh0
         AFDuA/puzvRSuM2lIsKo908rIoDP2RojdTrEJrMbOhmeiyj8sUIejRCPtzO84gClH3Fi
         nXQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787199173; x=1787803973;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/So9S1KEAt5OvNBUFCqjrX+Y7R9w32tufku2nOhCX44=;
        b=ZiCSGrDQz9okmspDwHCbfFM5DIjnq8KDflrA2fdnUEB/saT1d3GKwqULPg16iM5RAy
         i3S4IMK4qhKNQLZRc1FNC/e7sJG4ubzf7eBAtCnu4/XTTKZ+SOrk/TL1eGZNkng27ZeK
         xPpUwE+mVbUs5Llad6OwkektAQTikAPOWMAGsuvZXftfHH/oS4/TK0tHTikV7b3cBRyz
         E4BTIePuX+WDH1rEopahuxL7jGPqHM9C/HLNcve/FyEM0n5c8VAcZtfIct9HpnBNxSnj
         CHSNKEHZc5kGmRWiZhFHX/DbgyY7TOKInKGARW/UVr+Sw278iIWKoesAXc9xFWGiP4wQ
         Go7Q==
X-Forwarded-Encrypted: i=1; AHgh+RpCgwqzn/P10tg3Fqjjo+ahgj/rckjw1id418RQhw0sZBaMKKynSiThJzdE04LHdcbAE9ixyNWtqOp1Vw==@vger.kernel.org
X-Gm-Message-State: AFuF++mAICszFn1g6YmCaU6lXOQk50+GODE1OnZlRecRkdsucjB9vavH
	2+BJH5dLqBHrzSFrbGHsRVC2cr63qbZqAB00qFiZqwbcH5f3KNKQ2f73KfSVl+HTWhpSruKGMeI
	ZhnQlgHdRB2Bl4+hPIOwi5MDQW//PXc6WqaVokExU9kMsl26mT2/39J8bZnSL3vMKGw==
X-Gm-Gg: AR+sD13zSXSZk8NNp/8k3yGw4XoXbB/+rCoYMG+yqtP49zePwMOMnfH3im8L3S4+4pk
	wfVqV+1Pl9d9uFdDAdzFWXSLxd/OwLhS76s0Fgdq78ihg0HtQdkol3TBOpdp+9sZ9MGgXMA+PfX
	9W+taEP3ihAsa/HgojOT0cu36xkmuomf7dkE1gmVS1Zn+XOULt2a92Gfi6SjtgYgG5Nck+8vv7l
	Idc+dLSuz2nBEe2rlXW8V+9yUY9RPKhC7iNfA01ewRjjtIF+ze18RZkDik9MJAvz/me6I8TKPvn
	K5keeTE3G4ZWtFnHrw9u7rlH+N9aLZVlANUGwPh3oh2ccEnYQVQsC0Wr+UAgfFQ0FP3wvQ/tMrY
	a26zhi7uz4tQhAhSwj5d5SvgTlYTRFA==
X-Received: by 2002:a17:90b:5385:b0:38e:c232:9d3f with SMTP id 98e67ed59e1d1-395812a872dmr18290528a91.5.1787199172843;
        Wed, 19 Aug 2026 21:12:52 -0700 (PDT)
X-Received: by 2002:a17:90b:5385:b0:38e:c232:9d3f with SMTP id 98e67ed59e1d1-395812a872dmr18290423a91.5.1787199172352;
        Wed, 19 Aug 2026 21:12:52 -0700 (PDT)
Received: from [10.219.56.166] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf15ff5dsm11842356eec.25.2026.08.19.21.12.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 21:12:51 -0700 (PDT)
Message-ID: <4f11dfb3-9d92-450f-97e7-f04404c63250@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 09:42:41 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/15] MAINTAINERS: Add entry for Qualcomm DSP
 Accelerator (QDA) driver
To: Krzysztof Kozlowski <krzk@kernel.org>, Oded Gabbay <ogabbay@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling
 <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        srinivas.kandagatla@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
References: <20260817-qda-v2-v2-0-69a02e9090d4@oss.qualcomm.com>
 <20260817-qda-v2-v2-1-69a02e9090d4@oss.qualcomm.com>
 <cc43a545-20a1-4f15-a7b9-ca48842bffca@kernel.org>
 <e0a25f11-5c7c-406f-a223-da29bf6e1401@oss.qualcomm.com>
 <f725955b-27aa-4b20-8a4b-84906782b921@kernel.org>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <f725955b-27aa-4b20-8a4b-84906782b921@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDAyNyBTYWx0ZWRfX2IRuYHfMIGyV
 dxY5cp0KiN0JAeXj1N6xLvn+1PzkCi7k/ZEvifSVZXVJuY5IIaG2YW/9v3y9ggrmo+1e8gTdZtT
 XYg6q64+/f0zsHc6CI0l5ngaDQ9/y+89pqpec/dKpQE1GH4ByO+ORChX+DkYrlR0uHexqovsjWb
 HU8rVpWPq+cSdvKTwZKuR3N1Jt1S5rc3bOw49rY1h5g1Zy5wBEUEOpfygEpAqLwMDz28r5aKBbG
 PBQ2SVd6QenBPXEN7nZA3SnONOovrfjxpwSldXy9IoYDfjQ6XNUBHC106pyAkV9ihBiPfj3OohA
 afei/pKlgU3KT9IyKjkyNtSgl2AYUh++Q8/IcNW1gcSs1f43wDEvLmZrEf3OkGimjO38jEAtYSf
 fc8bQe6Z6tH1BmUcVcbLYcHLwl+Wl6h/HqOEPOA6FqXGhadVfAtAcSAuSn/eXrFaVn/u+U8Aas7
 c8mT8K6XC0HfC2e4HMg==
X-Authority-Analysis: v=2.4 cv=cuOrVV4i c=1 sm=1 tr=0 ts=6a867ec5 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=4Unm9NrEEcootba8-QIA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: dlf3u0wZM6fZubhYiam1beJ9TJPGLr41
X-Proofpoint-GUID: dlf3u0wZM6fZubhYiam1beJ9TJPGLr41
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDAyNyBTYWx0ZWRfX5/ViGnMi1rao
 xS93R9Qyt5F31VCkzcpiWrx82+6JJyA3nMaqmrzGkeUljMcP5M/e1EXmOQL4aKmsDVyNCG7TVE2
 zfR5H8sVpksvGulZDuUF08Z/7jWlyp8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 suspectscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200027

On 19-08-2026 19:46, Krzysztof Kozlowski wrote:
> On 19/08/2026 15:05, Ekansh Gupta wrote:
>> On 19-08-2026 00:52, Krzysztof Kozlowski wrote:
>>> On 17/08/2026 06:47, Ekansh Gupta wrote:
>>>> Add a MAINTAINERS entry for the Qualcomm DSP Accelerator (QDA) driver,
>>>> covering the driver source under drivers/accel/qda, documentation under
>>>> Documentation/accel/qda, and the UAPI header
>>>> include/uapi/drm/qda_accel.h. The linux-arm-msm and dri-devel mailing
>>>> lists are listed as the relevant review lists.
>>>>
>>>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>>>> ---
>>>>  MAINTAINERS | 11 +++++++++++
>>>>  1 file changed, 11 insertions(+)
>>>>
>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>> index 912837dd4640..75fa90c137c7 100644
>>>> --- a/MAINTAINERS
>>>> +++ b/MAINTAINERS
>>>> @@ -22388,6 +22388,17 @@ S:	Supported
>>>>  F:	Documentation/devicetree/bindings/crypto/qcom-qce.yaml
>>>>  F:	drivers/crypto/qce/
>>>>  
>>>> +QUALCOMM DSP ACCELERATOR (QDA) DRIVER
>>>> +M:	Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>>>> +L:	linux-arm-msm@vger.kernel.org
>>>> +L:	dri-devel@lists.freedesktop.org
>>>> +S:	Supported
>>>> +T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>>>> +F:	Documentation/accel/qda/
>>>
>>> There is no such directory.
>> the directory got added in a later patch, added this patch at the start
>> following the comment here[1].
>>
> 
> This comment did not tell you to make it non-bisectable. This comment
> asked you to add that parts in your first patch. Why did you move
> patches instead of adding this into the first one?
ah I misunderstood the comment, my bad. I'll fix this in next spin.>
> Best regards,
> Krzysztof

