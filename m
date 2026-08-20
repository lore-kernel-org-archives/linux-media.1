Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3AF446068
	for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 13:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787231163; cv=none; b=jkjkQSAIStNj3yFgqbBKueViw9nkNIkYHGVhLAiavsXGeE14J6gouQ2o/vDQhVEkNOvLUuuPITiovhDkxKZSvTZ8Ged2sVaZwg5aqN+Z0p+IccedB4wQKaQsYGdI2j5hsnILBRv6sQL1LpXTabP0+0K5ucl/HagkQ1U/X7LMt6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787231163; c=relaxed/simple;
	bh=/MvLGjCq9P+3TJQdi9yv+SMKwpIqRwp5tDl+T95B12k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hK3Jo1TnwRDv7ZPyLVuobLsxJPFttUuDlAQ2RbpOHUqeG+if9xV8Uu1MmbGf58XaNRj9Epxmulc0zgb8Dy7wWXGFyrDzy+GfjKkUJeatO0AgeCOfYCRBZHiwwYc62qIyA/WBF4zG6bWtR8lbCm/qg2Z9UwHYU+rwf7blgLUc1PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jwaV4z2T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K+QNVqvG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jwaV4z2T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K+QNVqvG"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KAOqd72214537
	for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 13:05:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AieFSNSsSUo34uQSMJ/dNEJ/DOfK3/fGsi4sE8iI73Y=; b=jwaV4z2TzGHiIR6o
	jRjasUFvEdE3hZE4YOADkjaSjyq+fcG4SjuMiuZVqbaXpQo4fXaIGY24SYwIat5Y
	xEHhlCuMnmrr/SJYHxUbGJ+FCUVgQRxIlibWMy7b/sBOaiRz0+BwV58KjdvUWos0
	MymhkSBlK9tfmtpyUhUVKJsUFs7C/x9lF8qpNUMfawb2xETI4YbvdSb/Fm3cQMvp
	wpXyQIuiglhtbRGv11uPR8LPyT8bF0b6C169b+Ox9GnAJLwwDeqD8AZtXLm3YYqq
	gt/e/bKxwCGZ8iFBBe16qImQzjIyszZalA0J2/MKSZVYh0FOA7HSdLy82KtShU+Q
	AQ3oYw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5ytc8htb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 13:05:59 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e54b6556aso2763870a91.2
        for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 06:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787231158; x=1787835958; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AieFSNSsSUo34uQSMJ/dNEJ/DOfK3/fGsi4sE8iI73Y=;
        b=K+QNVqvGQJh9E1M4wM8omsoldMeAmnRhxq/AWSq/6fYpZVLKZMto52wOLUTOj4EJJX
         J2ZKIBm+3RviHXaOg1aLZ4pgWuPN/6SzfFBWGKhWg0epLnBiiLmcLJYvF+EjSd3QtDgz
         BA1EfrcPXcmrleUTdd2x4o1KM5WinCJWwsStadGAI3tE6PogA/QZe6zXQA4LGS+kHCQU
         0ClonjOQBF8GnmgB+n6jd5RdWs4t0xU1xM4OdewDqEkf4OpY/D06JccFAT6xrLqsd+6M
         V8loTSs74vRCKRHXq30Wz3ug1MJvVnEIw7sCdMsWp14+amE4L//z/b2p8X8hlDk2NBeG
         GIKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787231158; x=1787835958;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AieFSNSsSUo34uQSMJ/dNEJ/DOfK3/fGsi4sE8iI73Y=;
        b=H+bTatxorZiEu0b6qAH+O+CEJoGtGDcmc/YA7DQajKmP3kJlxFufIHAejFFPt37r/b
         lpEnF7aZyQFa/5ZVFu3BXx6utt77CiZlhAD17HeIEpUJXf4qR+Wl0mHkZXeOtmV9ToOq
         kRZ3s1Jr58BTFqd8uGau0qs3wJ8A0NUDP/wg9uje5Xg66GFLfsy1Vls88Vk848VN6yFH
         xWKn2UG1wykZb/FIuoU0QQRESYuEnYboGJ5hpwUWtiUW3iON93zOb/3DFZpAez3WFzzw
         WLe2yj4jrJHLc6Ipl2BnM3Te1F1qk5WpiZzPaDp0OVEA2PzdZs+vcdvWkdNJM/P0mXY9
         2TQg==
X-Forwarded-Encrypted: i=1; AHgh+RqOm+bS4Io5CJJqGZPwAmBr2mi0q8mtGmcmroP/gFIGjynbv4nZ9BNDLz4XOLfSBBS5A94AgYkggbUQ+A==@vger.kernel.org
X-Gm-Message-State: AFuF++kZDW3tcv4nMSsCy9wrSchos28EVatoZkUA3o6FzEgfy3a1I9P0
	k2nwR2RabN42hWCoBw5rhzzzprtlDagemvDQXNABlXGFsaTPlwmZyOlfgfv+QpLCDuZRGY1Tqld
	SfVqmnc6bVnFGKvbmHEuYTa/pf9T4aO+aXoW8XHkwsvKgyncH5231OGn/W80c0LJ7Yw==
X-Gm-Gg: AR+sD10S3CF0PRdyfd8/bjHIGLdfU5aj40KYYMDMQFZ5MySTJgvuMrTMl3SNqnoNUN7
	SD1oHnD+tjoGhtLXGpZuoVG8n6aQeqxfVrWyu5Sc64Ln0QOUG+IMLL5HnpjWJorvaO3zgNk8nx5
	492NqCY81OZA/kx/Ut7T0btqBhs9i2Pn9BQoTq5DtqEXWbqkQ4R6IS8Jt7OvexXQiWk/YOvqs/r
	GUGIacUoPB0iDmurWxNrIyZDwPoBBIRFmXYL7uOUxzVv3kY+AxFxPBmjJZVqUWWbLbcvva9SebJ
	Rh4Qu/ug/FJhi8xVjHMeR1eSee3Hlusa9KHfv+kHHqOpG9ASwZ2mE8ooREhEDvvbBfU9zvOVfpZ
	MiBupar7X6u9z5GteK3NYfOZyZFvzew==
X-Received: by 2002:a17:90b:4d82:b0:395:4de4:92c7 with SMTP id 98e67ed59e1d1-39580ed143bmr23044559a91.3.1787231157828;
        Thu, 20 Aug 2026 06:05:57 -0700 (PDT)
X-Received: by 2002:a17:90b:4d82:b0:395:4de4:92c7 with SMTP id 98e67ed59e1d1-39580ed143bmr23044231a91.3.1787231156489;
        Thu, 20 Aug 2026 06:05:56 -0700 (PDT)
Received: from [10.219.56.166] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957fb12145sm6574171a91.4.2026.08.20.06.05.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 06:05:49 -0700 (PDT)
Message-ID: <eb05740b-8683-41ea-83ec-8a4a484881e9@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 18:35:40 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/15] accel/qda: Add remote memory unmap from DSP
 address space
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap
 <rdunlap@infradead.org>,
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
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        srinivas.kandagatla@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
References: <20260817-qda-v2-v2-0-757ab8ed2f64@oss.qualcomm.com>
 <20260817-qda-v2-v2-15-757ab8ed2f64@oss.qualcomm.com>
 <6k6ogbosxx4z5bh7uriu4fnj24ycuakylq6g2gnuwsbckl2zww@e66jgj5xo52o>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <6k6ogbosxx4z5bh7uriu4fnj24ycuakylq6g2gnuwsbckl2zww@e66jgj5xo52o>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OqZ/DS/t c=1 sm=1 tr=0 ts=6a86fbb7 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=rYwYc2LNA-xZppdo0x8A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA5NyBTYWx0ZWRfXzz6clizUvTa8
 LQCrM/lMo6wYFlEZHJMnq7gTzM/oGmK6bU6jyLp1PC2qlWo3/+1wmy3ClsBjJjy8dKOjkCI8ry8
 HVynGqKAlUagJhyfRO66FwmwI8lqzcaDLj7R22TwjkWWLY1cU/RFjtJl9DfzX+45Xen0ZKEuTE6
 D9ldclmHDa3pKfucWJt9VGN89lxnoFoLAQCmpcyodSTR0EIVPNirnTPe+NBybY73JOC1Cu2Tvbf
 udiE5my1E7O8sEbo1wdXMyNgNo+fxdWlByJgB1TZbgIGCtPzTVl8g+5dQCbZ4TxkqZrsxs947Px
 s+TJVKLdQ8mcnQkVGe7GuJyiqs8vOQRRAgXdyHvzuAvyGK31SH35HShlFEHR7dXV2EwFrnLs3Oo
 Jds7iukqiwoazsPFtu+aJ+eOUNIYo+741EyAzzj+20hvzz6n9dCxnwEoGFw6v3j7nLgbjKdAIUS
 PhiTt9VJrnoAQJKy2Gw==
X-Proofpoint-ORIG-GUID: w-hlHVAMk-700P2hbJErvZsCO0ju6TIK
X-Proofpoint-GUID: w-hlHVAMk-700P2hbJErvZsCO0ju6TIK
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA5NyBTYWx0ZWRfXxmulTjzGMeq2
 BSHcJcoSfiKxfFjdm5n2kMSrRvg7Ha5aeuu5x6U+88+1lAgStHxlcGf1kNhTP4JNkwSr5XtY7SV
 6joIcvNEZ+AdV5fY2RHFZNzVkCd2IEg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200097

On 17-08-2026 11:14, Dmitry Baryshkov wrote:
> On Mon, Aug 17, 2026 at 10:38:45AM +0530, Ekansh Gupta wrote:
>> Add DRM_IOCTL_QDA_REMOTE_MUNMAP, which removes a mapping previously
>> established with DRM_IOCTL_QDA_REMOTE_MAP from the DSP address space of
>> the calling process.
>>
>> Mirroring the map path, the DSP exposes two unmap operations, both
>> reachable through this IOCTL and selected by the request field of
>> struct drm_qda_mem_unmap:
>>
>>   QDA_REQUEST_MUNMAP unmaps a region by the DSP address that the
>>   corresponding map call returned. It uses the vaddrout and size fields.
>>
>>   QDA_REQUEST_MEM_UNMAP unmaps a region by buffer identity, using the
>>   GEM handle, the DSP virtual address and the size.
> 
> Why do we need two different operations? Can you just pass the GEM
> handle to the IOCTL?
QDA_REQUEST_MUNMAP (RMID 5): The DSP locates the mapping by the DSP
virtual address that was returned by the corresponding MMAP call. This
is the older protocol message that only needs {address, size} to
identify the region in the DSP's page table.

QDA_REQUEST_MEM_UNMAP (RMID 11): The DSP locates the mapping by its
internal handle association. This is the newer protocol message that is
not supported on older platforms.

> 
> Also, what happens if the buffer is still in use on the DSP side? Will
> the DSP crash? Will the whole board crash?
The access from DSP after unmap will trigger an SMMU context fault on
the context bank device. The fault does not bring down the board but
might trigger remoteproc to restart(I'm not exactly sure about the iommu
side handling of such faults).

Thanks for reviewing the patches.

//Ekansh

> 
> 
>>
>> Each request type has its own argument builder in qda_fastrpc.c,
>> documented with the packed argument layout the DSP expects. Unknown
>> request types are rejected with -EINVAL.
>>
>> Assisted-by: Claude:claude-sonnet-5
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  drivers/accel/qda/qda_drv.c     |   1 +
>>  drivers/accel/qda/qda_fastrpc.c | 119 ++++++++++++++++++++++++++++++++++++++++
>>  drivers/accel/qda/qda_fastrpc.h |  34 ++++++++++++
>>  drivers/accel/qda/qda_ioctl.c   |  22 ++++++++
>>  drivers/accel/qda/qda_ioctl.h   |   1 +
>>  include/uapi/drm/qda_accel.h    |  39 ++++++++++++-
>>  6 files changed, 215 insertions(+), 1 deletion(-)
>>
>>
> 

