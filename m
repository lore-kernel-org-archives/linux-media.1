Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA81D311C2D
	for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 04:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787028030; cv=none; b=AiytfQ2DDP0VqRTTU5tfe79nWv+Xibfx02ypNd90brFSZvvSkgJdncpsHyWWEQtYetbvjOE9wtSWWDLdkj4AgY9/7WYlooGvJjnPLi5yFlHf3fpNTb6SUHymAwp40zeGosMEMJLeO6NknhmbyGYU3O+FQRbNcVaTQ5T2xBFdVt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787028030; c=relaxed/simple;
	bh=SkI+jLB5PybtzDBAVH3JBTwadJx+1GhjlOb0OamvgDw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nk8gVLzrDKx7yzZl2Vf1mdnvOulznEDJQ0CXcA0hUI16fueB5mjwgkKBpvQzOuSxbD0SQQ43rdjNxu2gnfiBa+BW9xBzoqfDluu/CXWwIg6ApoceSbUkVYghxtVsyQh15JVJoBE7BTyksTvtEsP1ZptALwwvuKlw7r49e6ji2C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bZmsGspu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hd01uEe0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bZmsGspu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hd01uEe0"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I3G1AN3833686
	for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 04:40:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NrzWHA3rSEs1ygei9S1vAZxJ/Pn8mnrI8++ukqsmDEA=; b=bZmsGspu7FTgZAHE
	gRBd0rBWRXtpP7UkhP9KoRFyc1yMqLpm1m7xHGcmM01K9ftPJHOXw0rweGqkv2Bp
	KZlNiULXfhiKK/ax3kHG7QDANYBAsOW+Ex5hiTRGux7/qwXwfsPb6uaj9QisHiLg
	ZIlc+4m8fRZ2wrXVEeZV6qNF1t+KRQKjhLB9T5IFbPdxmOo+cMtR4XJIrPXwyVq5
	gVwLx8g0XNw14LqnvOiGtFAhAF7kdz5GmS0DztvUapAM1PYaiGtI+mtKgqyZsEp9
	CMqva/aoq+bPOzCZrbZ0ZX3NfYqG2H1L+ecxx88lH0gjmEfPXwOU5VbH/PSJc5/J
	Gczyyw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4fba893j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 04:40:28 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-385d2703b64so627811a91.1
        for <linux-media@vger.kernel.org>; Mon, 17 Aug 2026 21:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787028027; x=1787632827; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NrzWHA3rSEs1ygei9S1vAZxJ/Pn8mnrI8++ukqsmDEA=;
        b=hd01uEe0CP1oJIhVTWDcD4KlvRKVwrbew9tdBi3OscTDhjoIMoBvEsxi/1xNDvJlAy
         JqrG6HSgLlRhaQ61+phi28FrkoMC9hDQnKItIFiW6iPjeoIbwKVpgE0WVmA5eSSYF9Fk
         fVi/JtCdmrFpl9Xq/tpL5yPVCnqOQKKZBRUAmmCODgxT5Xi6MaGEel81ONtg1NuXtSc3
         XV9jjyoOImM7lsCceMlpCkjZpv/rB73yElLm1QC7j5YkNSWaUUXkg4DCDBGcv4Aa3Ghi
         hEHsxxo7UtDB4Jcio+hFPhIaFpo5flDvgraYOGPGaW2Xla0nSwq4+XhVHY9ivnaWVXAs
         mK3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787028027; x=1787632827;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NrzWHA3rSEs1ygei9S1vAZxJ/Pn8mnrI8++ukqsmDEA=;
        b=Q3C71+q9xw11ENmpCFtZxXJYPBC34g1QhSwGs7LhQ4uOmdFbjniIFnqGr3LtVJV1x/
         645Xj/S9jVwR+aOKDHUwIqQ9mBz1led889WDezx8M44O8m7VL3RCR02scsq2uZT2pqzW
         cFiVUtpSIrvu8sJ24e+a7hncKmA+GPbq1uyFjMJwVl5i8fVpXCYfGOuGO3kVTCtUJzIp
         BvearrQxeA8kbh0/rzGfj87UK4XVhb+ZQhJc0kvGlqKHx8HLfk3PEu8X2U9Eq0Ui88ov
         5PFY2eCsw41fSvmaR6OhZgjpky0ZaadJT5L8uQyF0lmf4Fuo/fY0LaklcDmXqDPLy8cq
         lSww==
X-Forwarded-Encrypted: i=1; AHgh+Rr5HzvEiQ0beVulQsPT4/OCsbGdEHGS00NzpyV5UD8qmo37rkYkA/E/tFNptw7RpBp9QLJVNsVAi2E6KA==@vger.kernel.org
X-Gm-Message-State: AOJu0YydK7zMIOHomeNh3EG5roIczGpxsEGtKzutnjO42+qJvFLTrTNS
	emOKih6Z+l71pu2jXXW7jRhJlDS2YKu8UWVn5MnsycEuaGvTtHjkwyqAZSZvj6qatt+1gp2PMUE
	mON8b1QnNuuB9aNhdrXSlk85SoQZkIxayAKMjNPv2XZ+DvfuVvkkWbplNexCE4lNQDQ==
X-Gm-Gg: AR+sD13Pg+VxgJFN661YEE+QRGvy8e4VfwvECsP6/tXRzeMu7ERTsrhIxxhCFD5cZDK
	czI87NrZ3wqSlJNj8unArt21c8kFVgziTCJWZOwVVKGOJrGCZI++/n6OAuRvssQGEfRIwhlKxem
	OXefVBb+W6azhyZHyVwYcFS1n1MfpTNrM+n40HJeOMNNkD9x/JPSGuEq8DCrXCRtGyvFGdK8MpT
	zqEU/M82BL+vzl3FgSV7ttP0kfis9XUt52QozHHIDtWSrb5+ne16bCKL/rw8Nv58IRheCMhQLaX
	ulOhXMyCb9wbk8+bbGHm2yxacodL6UgZBN8oNjRYBskCVnKuNBQ0ENmutQzB9u5Kpp1MPTfnZsB
	MwD+96CWFJeCggvGJNy2meTEQ0DdwkQ==
X-Received: by 2002:a17:90b:518c:b0:38f:cab0:9aa9 with SMTP id 98e67ed59e1d1-3955f17c702mr3916865a91.13.1787028027484;
        Mon, 17 Aug 2026 21:40:27 -0700 (PDT)
X-Received: by 2002:a17:90b:518c:b0:38f:cab0:9aa9 with SMTP id 98e67ed59e1d1-3955f17c702mr3916824a91.13.1787028026993;
        Mon, 17 Aug 2026 21:40:26 -0700 (PDT)
Received: from [10.219.56.166] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3267be8e35bsm11880079eec.14.2026.08.17.21.40.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 21:40:26 -0700 (PDT)
Message-ID: <c54f5212-809e-4517-beda-f86b375c086f@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 10:10:16 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/15] accel/qda: Add QUERY IOCTL and QDA UAPI header
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
References: <20260817-qda-v2-v2-0-69a02e9090d4@oss.qualcomm.com>
 <20260817-qda-v2-v2-8-69a02e9090d4@oss.qualcomm.com>
 <r7bx25akbxomzhxxyqd644efy2vc65etwcnhlyha7wm7xrt7ea@p4v5sesn5rzw>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <r7bx25akbxomzhxxyqd644efy2vc65etwcnhlyha7wm7xrt7ea@p4v5sesn5rzw>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDAzMiBTYWx0ZWRfXwcb+IJ+WqhDY
 3/veUgqQbBmO5zO90bWrfRwLEOQn11VcNDj39FxHdHdu6Lf4w+UQio6rmnlaNDOljC66iMlAQpe
 jFRt3QUKdUKBpndjSpWE/9QjUgfJ6Yw=
X-Authority-Analysis: v=2.4 cv=VsITxe2n c=1 sm=1 tr=0 ts=6a83e23c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=GCkxi1q0J_mCzIEPFfUA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: -V4bZqSu4hL8njb1V1fycXoiDteOwk2e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDAzMiBTYWx0ZWRfX4gkCBuAx/LC9
 Ywhgf7hFD8aBhuqFBhwjIYdhr7U0NiIR8XU4bJwSYtK9v6BNern3vz1AUPLvN67O2fCeGNLuqoX
 oowvbbrigZbPmMxEDhkWw4KA828VglBvF7kP6/sHTVhY3KyaIMw22bZ/9U9SD5L5aPo54h4YIa8
 Ymm6HLxyEiIzTmQ9X8mIUEBIWV/SM/U5ySxJ1Y4fPLWdJoTa2zXZncwla6RlwHs8OsxjsSxtkMj
 SVdInRqn8MHkIxt2cINwPvv/gfqH+2fBt6B83B7EdpDdq8QiC5RbIUklIMa4HDDXSQ6FSHZgOvF
 a8fFyy0uk1kH7aMWBAddHiDQiycc1HhkPOVKFNe36EYw+ISq2yCO7BFS+6peQs2pY5ToAkr/viW
 ldeaaSY7hfzLPknek9CqSTWhMtjSgqT9uNNu/h649I1ZeOZfgtBPo73y3Ubgsod692VatXw23pq
 ZTHPuqC9TUsuvvM92WQ==
X-Proofpoint-GUID: -V4bZqSu4hL8njb1V1fycXoiDteOwk2e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180032

On 17-08-2026 12:28, Dmitry Baryshkov wrote:
> On Mon, Aug 17, 2026 at 10:17:43AM +0530, Ekansh Gupta wrote:
>> Introduce DRM_IOCTL_QDA_QUERY, a query IOCTL that lets user-space
>> retrieve information about the DSP a given /dev/accel/accel* node
>> represents.
>>
>> The IOCTL takes a query_type selector as input, so it can be extended
>> to return additional parameters (capabilities, attributes) in the
>> future without adding new IOCTLs: drm_ioctl() zero-extends the argument
>> structure, so new fields can be appended to struct drm_qda_query as
>> long as they go at the end. The first supported query,
>> QDA_QUERY_DSP_NAME, returns the DSP domain name (e.g. "cdsp", "adsp").
>>
>> The UAPI header include/uapi/drm/qda_accel.h defines the command number,
>> the DRM_IOWR IOCTL definition, the query_type values, and struct
>> drm_qda_query. It follows the standard DRM UAPI conventions: fixed-width
>> types, a C++ extern "C" guard, and GPL-2.0-only WITH Linux-syscall-note
>> licensing.
>>
>> qda_ioctl_query() validates the reserved pad field, dispatches on
>> query_type, and copies the DSP name from qda_dev.dsp_name into the
>> user-supplied buffer with strscpy(). Unknown query types are rejected
>> with -EINVAL.
>>
>> qda_drv.c registers the qda_ioctls[] table with the drm_driver so the
>> DRM core dispatches DRM_IOCTL_QDA_QUERY to qda_ioctl_query().
> 
> Please tell your AI agent to stop describing patch contents. Ask it to
> describe the reasons for the change.
ack>
>>
>> Assisted-by: Claude:claude-sonnet-5
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>> Changes in v2:
>> - Add a query_type input selector so the IOCTL can return different
>>   parameters in future, and switch DRM_IOR -> DRM_IOWR so the input
>>   reaches the kernel (Dmitry Baryshkov)
>> - Reject unknown query types and a non-zero pad with -EINVAL
> 
>> +
>> +/*
>> + * QDA IOCTL command numbers
>> + *
>> + * These define the command numbers for QDA-specific IOCTLs.
>> + * They are used with DRM_COMMAND_BASE to create the full IOCTL numbers.
>> + */
>> +#define DRM_QDA_QUERY		0x00
>> +
>> +/*
>> + * QDA IOCTL definitions
>> + *
>> + * These macros define the actual IOCTL numbers used by userspace applications.
>> + * They combine the command numbers with DRM_COMMAND_BASE and specify the
>> + * data structure and direction (read/write) for each IOCTL.
> 
> Is it not obvious?
will fix this.>
>> + */
>> +#define DRM_IOCTL_QDA_QUERY		DRM_IOWR(DRM_COMMAND_BASE + DRM_QDA_QUERY, \
>> +					 struct drm_qda_query)
>> +
>> +/* Query type definitions for drm_qda_query */
>> +#define QDA_QUERY_DSP_NAME	1
> 
> Why is it necessary for the userspace?
Currently the requirement is that on systems with multiple DSP domains,
each is exposed as a separate /dev/accel/accelN node, the library must
query the domain name to select the correct DSP to offload to and use
other dependencies like shell etc.
> 
>> +
>> +/**
>> + * struct drm_qda_query - Device information query structure
>> + * @query_type: Type of query (input)
>> + * @pad: Padding for 64-bit alignment (must be zero)
>> + * @dsp_name: Null-terminated name of the DSP (returned when query_type is QDA_QUERY_DSP_NAME)
>> + *
>> + * This structure is used with DRM_IOCTL_QDA_QUERY to query device attributes
>> + * based on @query_type.
>> + */
>> +struct drm_qda_query {
>> +	__u32 query_type;
>> +	__u32 pad;
> 
> What for? If you have u8 array afterwards, you don't need the padding.
I'll remove this from here and bring it later if we extend this ioctl to
support other options.>
>> +	__u8 dsp_name[16];
>> +};
>> +
>> +#if defined(__cplusplus)
>> +}
>> +#endif
>> +
>> +#endif /* __QDA_ACCEL_H__ */
>>
>> -- 
>> 2.34.1
>>
> 

