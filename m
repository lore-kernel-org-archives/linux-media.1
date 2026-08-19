Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47FA1344DA2
	for <linux-media@vger.kernel.org>; Wed, 19 Aug 2026 13:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787144736; cv=none; b=FQzUFnq0ttDBVimjiboOdSvRnwWxJKKbLvCvzTLf5z/yKflytIGnXboMG48o+UmJG4Gj37GSm6sI/WueNBhe+SF3pVPaecEb9PXKu5J+llH0zz54vo2gIu15hziHiD+Hsi1YL0Wf+Z68oMpGFbeph4O74SgWirPzbfgnKOAausY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787144736; c=relaxed/simple;
	bh=yeAn53QhD+ejLswrNzkwv8ur2hDkhwUdtZ0G7WwZFdk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cJPb+GR786hyGA02djVRMSqXWNF/i+UOV2VQOt+OfNOIU2466MRy7/vJFangcuk2xJGCdCANb8evFwy5wz3c/7WQtmnWYVd1QfZ7YpVtUY9G622LjKc6Lz9r+ZCRQV1sFfEVGrC+b6/8JRuTw1rTNrINsfmm2y53RmveyVNYh7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K2LMLWRM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=juRFr5M2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K2LMLWRM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="juRFr5M2"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JD0gRE3601258
	for <linux-media@vger.kernel.org>; Wed, 19 Aug 2026 13:05:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LZ5DADcP5lyK3Hc2KgnGBzVe5cJ/nTw1zxLeW7QKY5o=; b=K2LMLWRMhSf9IfQR
	DpB6P5ILQueozCgCu5JXWzSpQPKmbFV9bRj4KnArcWAgE1E5S/gbqv0Vgd98elSy
	2Z7Qd9YrW2KiLmg3GAEsloT8Tny6ZBWrgy6GQZLMYy1EMqRXDc2c4syj+gfFTzQ1
	gjIbgeLR8+sYoUBMBOO/vUs+IBWDVDvT8m77dmmY6dwtHAdVK/5/N6mfB3Wd8rKS
	hkFKjswlekvfHUg/caahLolHW+47x2nNWMU9d3JilgNrSzCYD6KFkCTh69Hyi2bn
	7hlk3jq+7XnFCejQyDo8khR9H/FVbuJIXfSbKO2tEO8qqugq4AIrZYvPWbYY+VLJ
	jC5YWg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfm3acy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 19 Aug 2026 13:05:34 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cd01a14e81so14219285ad.1
        for <linux-media@vger.kernel.org>; Wed, 19 Aug 2026 06:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787144733; x=1787749533; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LZ5DADcP5lyK3Hc2KgnGBzVe5cJ/nTw1zxLeW7QKY5o=;
        b=juRFr5M2veQpbq/ZUsD4/OdOXpMppBUZgBGb2BrALvjVQbUZ2ib6kFNhvLoL9Z46hh
         lg2NGWlz065HjSm0ANMylBwuAltx//YQ2thjqNa0A95fiMYSvfAtFpnMmpEx3MOWO3+q
         oUK5HwN98SeBmgV8pFzWe19vpEFu+JdSCjzoSJw6FiJmn8NCGZyJgMXubKCTiia4IS+K
         fIqK0obn5FE+GlfMr3Wl04NMknbodO1SocZQgt5m/7FIMluTW4KHVOVaWbABz3JehFeX
         trkWDtjrpOL/HGYLidKwl6zkxrIVt/ZLVhRZ/fy3S4tlVvMfc8Dj6tZY+GeY8YD7GLFE
         S6yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787144733; x=1787749533;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LZ5DADcP5lyK3Hc2KgnGBzVe5cJ/nTw1zxLeW7QKY5o=;
        b=L+us7h3IXHTE/bmE0ENlkBdV1pWCiqt5Fg3Y4HQhDEmlPnjui9882m9RESSZ6BLmvw
         dnhb/i3obqrzaIxGPoIs1y1eBu4lBvL1D8Ix5gtUeI0Y2Z6dPPOtESyCHIRot4CCkrub
         tSq0FcajRwMBFaNgyCJpcrnO+pllMtY8Dpjiz2itVZw8cxvZZcX6t3BHeHk7aRePL2X6
         rYuMpzEBdVIATFMD5Assiud2JYZF8UAvFqMOJCpnLmFtzEir9fi43STtGOp8uAF58Tx9
         MEQ8l8OhWwqR0njJ4affZd7BYY5JVyhJpWelH+WHHv9nsP5facN1H+pdjdfGAw6p4j27
         n51g==
X-Forwarded-Encrypted: i=1; AHgh+Rp8MvesJKs7vSLPC+WAIsLoU3CdaTEVcf9mqwKqixA8wvASQHkOV1w1gz8XexN6h+/Oa9bhkWErSg8Czg==@vger.kernel.org
X-Gm-Message-State: AFuF++meXquG5+/QPv9DEAj8zloLEA+MlW+P+uiFkO4G97LhJB8/iepy
	8iO2/EQtm8FZkXbw2NTLk6tyO7IQ4TSM0cb7yNp9Izatk7i1yBIhao/5AJE4JKdZf8FQEspwcF8
	z4JbBcKBPXn69doMyfPljHA2zgd4bTuUq1l9nyv8POArGpjEtBcEqVjvCUyjur+3xDQ==
X-Gm-Gg: AR+sD10hnnAMJNANKcLK9XJ/SpI4yi0xOQXYelGVTzNK1CrRHEvyHll5Ip3+q3Ng9wJ
	cb+G5cDeqbleDQacVLAwIODAA9GaXBW97Oi0ioiu4VRCukoVMXOJO5X5d39KxUqzfHrHXF29Ay4
	Bk36yUZPg6njvKLSUMkx3l0o1Mv+wLx0TAnOQPC6nON6YxNyWWCbUQIXf4IOhLG3c3D2W2PUPuz
	7N6k37FvjKFgN98zPoNGHf9WjJ3Oxt5Q8IpNSEi/aqLSF6WpiRW2isA5I1qOcSe+qO0IjqPw1lI
	J65/Zx2xKRKIXlStCOoVi870A1QE62+DUrs5s3OyXJaSXP4Eu7rPHr1DtM2TXzkz34JIdHlOkji
	5vddRGlX0R/cN0igp5o8qYlF6KcRO9w==
X-Received: by 2002:a17:902:fda6:b0:2cf:a108:7605 with SMTP id d9443c01a7336-2d60186263bmr89345055ad.11.1787144733051;
        Wed, 19 Aug 2026 06:05:33 -0700 (PDT)
X-Received: by 2002:a17:902:fda6:b0:2cf:a108:7605 with SMTP id d9443c01a7336-2d60186263bmr89343405ad.11.1787144732529;
        Wed, 19 Aug 2026 06:05:32 -0700 (PDT)
Received: from [10.219.56.166] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d5c1e54330sm24796285ad.44.2026.08.19.06.05.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 06:05:31 -0700 (PDT)
Message-ID: <e0a25f11-5c7c-406f-a223-da29bf6e1401@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 18:35:22 +0530
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
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <cc43a545-20a1-4f15-a7b9-ca48842bffca@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: OCLhdxwfN9PQC75YooBPzkqQg1JHiEfa
X-Authority-Analysis: v=2.4 cv=bth8wkai c=1 sm=1 tr=0 ts=6a85aa1e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=XbA7GbUpZyLIT2ThUnsA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: OCLhdxwfN9PQC75YooBPzkqQg1JHiEfa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEwMCBTYWx0ZWRfX2T3egciI9CqO
 1CT+XI35hFvBLLtA6U+SCTdr9SFNXlbBcx97x7L8Vd2vxE/HOHy7O7/I6Jq/tx8xeTcLXhLZm+w
 +gAPjjuUTL9MGabXBNfE0jjFz2AeGS2mZNLchdvtyCMZ/E7HkNWuDXC1jzTrqkpMufBPVkr+/yb
 BXeZqHqkneyRsFQ1POQ4lJiwNMMW42x4a3/QYgycEaS0kPS2sGCM9mjbINB0j+aw1g5fjfaaOnM
 0tmXaf7RNQ1s5lRiDJdhiRCcxi/KvtjeebJW4BTu9MTphPLxOyh/65ov54wNKe0aCgnxFtZZsYb
 e0FWsowg1EJNIiCfc8DOQTQRiBBhv/+CcxMJyHWsGrbXF5GNYJZdfTzF65WgTqySz1W/i4xPr/D
 6H5Z4cMDeRG55ZWFHdrrv733jYS+zKqx0YHzfZ9oNtJN0ElT7EcWCvqE40u59n4rtocwl7pl90q
 Ex6ncBHQ/Ir843yCQwA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEwMCBTYWx0ZWRfX/aQIn83pRF/e
 uW0zGovC83SUEaxzOd+wqQQ3yTZDX/jFeSs4L/UKlyqWpCmWnVyfj4iGg7L0VOzCZ5T6aFp0KsN
 Cpust6Dd+RGke3X8T1B9Ug8HwdrDT5s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608190100

On 19-08-2026 00:52, Krzysztof Kozlowski wrote:
> On 17/08/2026 06:47, Ekansh Gupta wrote:
>> Add a MAINTAINERS entry for the Qualcomm DSP Accelerator (QDA) driver,
>> covering the driver source under drivers/accel/qda, documentation under
>> Documentation/accel/qda, and the UAPI header
>> include/uapi/drm/qda_accel.h. The linux-arm-msm and dri-devel mailing
>> lists are listed as the relevant review lists.
>>
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  MAINTAINERS | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 912837dd4640..75fa90c137c7 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -22388,6 +22388,17 @@ S:	Supported
>>  F:	Documentation/devicetree/bindings/crypto/qcom-qce.yaml
>>  F:	drivers/crypto/qce/
>>  
>> +QUALCOMM DSP ACCELERATOR (QDA) DRIVER
>> +M:	Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> +L:	linux-arm-msm@vger.kernel.org
>> +L:	dri-devel@lists.freedesktop.org
>> +S:	Supported
>> +T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>> +F:	Documentation/accel/qda/
> 
> There is no such directory.
the directory got added in a later patch, added this patch at the start
following the comment here[1].

[1]
https://lore.kernel.org/all/zideovhb7djvsbydqmdyxbgh6cte7xc5ouhm6gsreww6klqqae@o6w6wd4tic4r/>

> Best regards,
> Krzysztof

