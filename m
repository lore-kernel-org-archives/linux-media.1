Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793873A4F47
	for <linux-media@vger.kernel.org>; Wed, 19 Aug 2026 13:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787145824; cv=none; b=IgJI2AvSJIKnTDGSQcQsMCpGQR2r3rTj/CmMw31XYkY4CdkOrIfdsxL54a0mkddr5XkBTULbSY/2zVH3JNoKHgarqff3MzcJShVZy6bmA3hP5hCK8mAXqOmaM++ePY7sMETwAy/DjJNQfo3ECsLf8CrJCl5gAvYAYHwBlZLaAJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787145824; c=relaxed/simple;
	bh=8zEwHcSWYL+PfZ4t4xdDkAMyQ+XUHLz3oKHb9rAeYm0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GZeUGrGSlFAToPfu5mS+Q6fREDfq1lKTTRtfPAVRTpGcGczri2X1rw/cJz3J9M4TD6Rev4vm+YSmtqJciAnUCa5w5hoKV/iYADeMQAMPnCvKCGw3e5013gR3+lg8jCKj6YKQkZM8jENO11R/coLgSlENV4hC6lLcNc5sOZ5x2hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=phx23G3q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BTVWBAEA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="phx23G3q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BTVWBAEA"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JD0Ord174808
	for <linux-media@vger.kernel.org>; Wed, 19 Aug 2026 13:23:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	esjYOP0cHWLWtJ/S0JzZjMyOobiP2YG5+HUVououevY=; b=phx23G3q36vzMkjD
	VzSOvzfRbKIAW+NIz7GVj/qufa67rrbVOaMgGYh5Vrz/zqSJprH2dHldiPQRoFSW
	sL/UvxndBrdBv4jcC+3gdRO+ib0m+i66VpURNp2yiEQa1txsI425LCh3WG5tyiXx
	PKYaXmLaDUEUreD2ZIxm/RmYvnARoQYjAup3yKJ+rEan1pc6LEdDWR1e0VBgh94I
	ecdJaJYTpYdiw0msc8AQo+ddKlmh16ekSYkFtzXqh7NANfW3C3VJxQbf4v5ClHej
	epJIqB6zEwGILuMhCWFzoywy2kbxqPQ9xIX8ePXSmygwIguQuVx+ud+uZzDwD6DW
	Qm6OzA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfjkgyq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 19 Aug 2026 13:23:38 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38fa7b09921so1869417a91.1
        for <linux-media@vger.kernel.org>; Wed, 19 Aug 2026 06:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787145817; x=1787750617; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=esjYOP0cHWLWtJ/S0JzZjMyOobiP2YG5+HUVououevY=;
        b=BTVWBAEAMJEUl5K1c+3RlvrL+3+c5q44sIgFKbwh/cOqd16u4aFu5q8ehi9yfANXhq
         uh9euFnAK9WbELckH0OikbWN4Yp+HU+xxaraz5RlCxxFYSyKerOhhbtoppV6vITwB/W7
         DK4VV1CPlFj1gYCtcQ0L1WDSb6gg3bsYWt1SxSlfUqAXVQMUWPtznLmnLjjs/6PgLF+8
         7U5zSZRxXomT/IO4XFtp1ii0elrbFo80f8LH7RJqF6hIKai1IUcmksmUXl4BZ1Bpv3Ra
         2RiGw5Lj1XcmxBT//cpbtWFOKwT5NdFnVpc66vDuI1eHezJSMzV8iy4qbwlin7OZQc36
         8q8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787145817; x=1787750617;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=esjYOP0cHWLWtJ/S0JzZjMyOobiP2YG5+HUVououevY=;
        b=PM6uIMIKYuHyBHn3J3ETrtfYdN8L1e74h1t9yFMFmRxyhnmGGkwIWcjQ3D7lJbYxGB
         DJFZES+ksHeNXnsvVv/FqNXnskIn1ehaz3Or3+sLgWr+aa+8rxrBBdZRWNodS1lI39Mx
         qWwuQsdBMHW/Bl/WlJYHLwAwrQmy9eyAZ7lBHenz6dNvGh5uNC9PfZdIKpvi06Km3X1W
         2g4OwfwN8Kf0YYwvCHt0tNwYS2n9GGFPS2coazyJUmqruzdC6ttWsIHaugiCVZ6KIxeP
         pdCDVZ+LUkv4KqfpqG9MNSenkKCAVHhbjpbyPiAbnbAOfpZu+M7Ue5WdtIUSRk2NVoAz
         RqTw==
X-Forwarded-Encrypted: i=1; AHgh+RoiwECPc2c61pfO2pd3gIwcnkzv5diI8fDKr2PTC+CGGvAFIWCegiPXNlUFnVX5x5d4Dfldf44dA+/0Sg==@vger.kernel.org
X-Gm-Message-State: AFuF++nFJ7yNCbZViXv/bR6QXlFSFUEitN4odSSSlVw4DF6WMnw3eGxg
	llQ3X6suYrH2EhmE+ZmPtaptPCKPyV38PctmYmUhYo6vv/o1xMEhtHyrwiPRh70CZrTBGAwa932
	1HhkBB8oFlLlCbQSb46w+eHgNtXvvMtT8UcZAYyui9GA7ZYWLIqRsObLr+OJAjs7ilw==
X-Gm-Gg: AR+sD122fL/S7SHU5vMGmWzLSK5o0YUNs6DOZkeUoj+plwMBg5B16LshdKFHPSlkd/i
	I9GdYxVGV5VJV03YHntE/YpU3j0o1kpvlHM2WsTdSxAe2NAM0IE1q+zFZgIV4+cj3vkHfsQUuFJ
	zlwKwRJ9+wK1FFKIdrT5i7uxSxGxDgH8SjNR8mYu4mfzLudDFH28+xdpRyHIFtOWKamkEkvhwns
	jLzgXt6UfpWY2R1W19I81SWp6vaDkCx6YcsJB8fSFJ0atxFz7/fx8t0eJCNTZTayTytadQj3asr
	QUJOsuwx2f+m+HnIEGL3O5hqCBihQuJz0UXP4eoCaC9BQ65m1iMJ63iOuUQUuecTeP21EaMoj3U
	NdMCDpZCMwyMF96mI+xbp3bCNSGollw==
X-Received: by 2002:a17:90b:4d83:b0:38d:dfd1:7c1 with SMTP id 98e67ed59e1d1-39580a91ad5mr8388489a91.2.1787145817290;
        Wed, 19 Aug 2026 06:23:37 -0700 (PDT)
X-Received: by 2002:a17:90b:4d83:b0:38d:dfd1:7c1 with SMTP id 98e67ed59e1d1-39580a91ad5mr8388382a91.2.1787145816848;
        Wed, 19 Aug 2026 06:23:36 -0700 (PDT)
Received: from [10.219.56.166] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957f9aaa12sm2843059a91.5.2026.08.19.06.23.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 06:23:36 -0700 (PDT)
Message-ID: <cf502956-8c99-485b-bf25-9f89d81975ab@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 18:53:26 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/15] accel/qda: Qualcomm DSP Accelerator driver
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
 <f009a2fe-5c30-405e-a942-696ea65fb2f3@kernel.org>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <f009a2fe-5c30-405e-a942-696ea65fb2f3@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEwNCBTYWx0ZWRfX961m82xm15li
 Spv5tfkKFgpfMsYe9uVlAelw/y2O00UnenTscO4np2t1jJZdQbQ+x7xWvCbIUJqKd9vhHdmjUST
 ZtFj3WyUiAKyPyClNH1evRl5VnMVF/XZtvr1a0huhAzg2epKh8WI5j/qQGupagaKymGYjKmPCZD
 2nIGd60oDi+r6z3Cok8otuXKe2AU2i/V1lBF4HMtGNm3XKRTxljrH4dcbDV82DlTJidY7s5I58r
 /zi8Zt7dgFp28tCm9s6NxXyq3fXm2En4DebWJKbFVKUjbTV7U09KGeFAN4qrCLEw+CdrT2oGka+
 uSJqYZVxwpRtyVTeBky3gVlMiRb/g/IMelWKCrW2NpvnWF34ylEyMMq3CSO2MgqAGSj+f7lOXLO
 Rm/EMKLZBv1rf5s7Smzs4dvlxyPfz3n7/SdPWyFyGQIj0NymaxQQHz93niuJeJk3xPPlxm+SpzS
 iqMJ1qmG//yLZwMGcSg==
X-Proofpoint-GUID: HFIo0KvuCOsGde2KEBnl5CVvw9Hn3Tw2
X-Proofpoint-ORIG-GUID: HFIo0KvuCOsGde2KEBnl5CVvw9Hn3Tw2
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEwNCBTYWx0ZWRfX8Rc0XLh2Vz3v
 fqjrjn3rOMlzT4YTUlp3k+jbW6j1iIvkQixTufJ5RY6XGQXCb5fmKXxDmtpES7edmXrQrqx82XW
 PMgaq+cg3mTMuRp1scYOGFIOPMBaiFM=
X-Authority-Analysis: v=2.4 cv=Sb7HsPRu c=1 sm=1 tr=0 ts=6a85ae5a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=z9ogCWloIzyHX_id1hcA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190104

On 19-08-2026 00:48, Krzysztof Kozlowski wrote:
> On 17/08/2026 06:47, Ekansh Gupta wrote:
>> This patch series introduces the Qualcomm DSP Accelerator (QDA) driver,
>> a DRM-based accelerator driver for Qualcomm DSPs. The driver provides a
>> standardized interface for offloading computational tasks to DSPs found
>> on Qualcomm SoCs, supporting all DSP domains.
>>
>> The QDA driver implements the FastRPC protocol over the DRM accel
>> subsystem. It uses the same device-tree node structure as the existing
>> fastrpc driver in drivers/misc/. The approach for binding the QDA driver
>> to device-tree nodes while coexisting with the fastrpc driver is an open
>> item described below.
>>
>> v1: https://lore.kernel.org/all/20260519-qda-series-v1-0-b2d984c297f8@oss.qualcomm.com/
>> RFC: https://lore.kernel.org/dri-devel/20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com/T/
> 
> So this is a v3, not v2. Please start using b4 correctly, so versioning
> will be kept instead of faking the numbers.
I'll correct the versioning in the next post. Thank you for pointing this.
> 
> Best regards,
> Krzysztof

