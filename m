Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCE146D57E
	for <linux-media@vger.kernel.org>; Fri, 14 Aug 2026 14:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786718491; cv=none; b=hW36myr+xxVQhxB/heTIteI+7Bd0jufodQ/31DOuekaSP7Yy2asiW0416V6TKBnBUbUvrPBrOCmyH+4oZjoXyO5UDvDNwmMoXK7rCUzuRhwER8r/jalnB+rnXJir8KXPVA6eU32R1uWZS0bF+qDTOJ0L8HlmC3bPxITzoiWrD4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786718491; c=relaxed/simple;
	bh=QTe92VTed7P60FmFpX0Q5Dd4oLw6vNGPMsslVbNyB60=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YI6Q7jCEax7U0w4Bz2Wkxq46r55CwrOe1SsZhHDUflknY2ffchX3Xeh6RYA5EiborAOmPZ7Mr1n3L5j5Chad2QfyEXMyt5PA1Ukg35fLnPDsjvmWDGUg3l8qHyS3am/h/9A7flz4iS+2TK1vTWobL6XW5hd9iNDUjVHecyOYiCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f4eEd/ba; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D6vKEC8M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f4eEd/ba";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D6vKEC8M"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67EDx2dB1906770
	for <linux-media@vger.kernel.org>; Fri, 14 Aug 2026 14:41:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/dVGa0Epfwju3+kziPy6JjeCQYvIjk2mCPesl9qfjeA=; b=f4eEd/baj7CPamLi
	uO7qrsSde2i5yZ1haRIgvmVMsVqkxKYzl03CDAOJU4B+ynEtXBhVeM5KwijYjKBF
	4W2YQrZ2KDa7F6Oqvx2Dmb9ZsXsmdttHeyiIWH9CYwLJBogl9120gQalm7fzAgd6
	1Uv+1nL8Sgyz51Z4oD0icIy2Yyw2htmy2UO9w8PblLUopfxX5+J4k1yaNkChwjGV
	dapjMof0K4NCgm/n6mV+jDIzk5l6Yg7ySDL9VEmE4MPRmAM0N7AVb6iMZBfx5lVM
	yFnGxOb/PGqEt8yKT1QjuLToUTyUzsjamrBDQc8Tn2P7uR3w5H1YcroT2o65Bxaz
	cUpOZg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1xexhu3h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 14 Aug 2026 14:41:27 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d004f13426so15497615ad.3
        for <linux-media@vger.kernel.org>; Fri, 14 Aug 2026 07:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786718487; x=1787323287; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/dVGa0Epfwju3+kziPy6JjeCQYvIjk2mCPesl9qfjeA=;
        b=D6vKEC8MrRpfLwKfVLnVs7B68NkvWLoKOaD52RjV4w1gn0hYwy7YNY8yy8lEfZdK+G
         eK0316Ph4AsS7ZosovH/aJ5Q6mXf+Gf67RkLi5/gJqFTefVrultmNlhwsnVi1HPI98X3
         aMETKv6G1eOuIu7wgiUZEu0WkZHDo7Kmqymp6IkI15FyguTTWagjiFEBigJDtSAe7o+D
         tG5t7/RhVVvo0lSBN4ph3DZSnNuRRqDwcNKYt4l+2Zn08qd/016reAzrNIHXKT9US0xr
         FjMVGVj1vrG818OJdWI2EW/TqEhG5f77NvbQmtzxopopAenDp8zLX+fNu7mqOSghMxZe
         Zt/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786718487; x=1787323287;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/dVGa0Epfwju3+kziPy6JjeCQYvIjk2mCPesl9qfjeA=;
        b=MzjvBHgyJ/HiWWInTmsOxttjuS5Dhnk/IjqFk7H4BUE5asETFyfeL777KYYZ/bPcYI
         ofheulG3xph0hFqTq8TS04SQUcwicd+SapN4ouHVzrn/XmW2vmXR/+o65qmPldZuQqcx
         qjmCPmY7oGBo9l/Vig9Uw1Pa+cYEKMuiNa7L2Uy0zl83Zmncq92nPCWQ9RF2DosjjRir
         /Vx2Fw83fCETEEbCSPz6/p51hY94u1oJ+qpoOFu0K3dh161VFtSG195ED7lIEq4qCV8x
         qdtsYs+G1U0DMUyUh74MGkceWy9/kZvCFtikQ9ccIhU1F4jyxb49ffApOr7l77Prqe0p
         23Tw==
X-Gm-Message-State: AOJu0Ywxa6L81Nvkh8s0IAd4awIrzjcQiLLmOlU6Fo0zZ1fRQXWMcFAY
	DCTJdNuf4HX2umJiV30Y/ClKfe31nuGvg3cC+6GZB5mKYwH4eTbr0NMqO3HHvfbWdgNpumy4u19
	olXORbr7mhlSLvIdDxyV3bpO0RegpBA4B4dgRU6zBSnSD2w3Dasz0vkbJyYYIhDSHcg==
X-Gm-Gg: AR+sD11O0MZTnXVyZlqSYIhrwLB9WszF+nS8w0x37kABQbxBf5EoBHUjR55CLv067N7
	29EVs3WRK1Fm2Dy2iFW1wHoBdFtPQz/TWRu+1U090/ZZWBQ4vng2v3rmcFx+QUrdd/EHt7UWJmI
	G63eCcE5iZiyFt9bWi3V5dvBzttNxijFLb8gjo4/Rcw5SB/IV2RuG7TUZbW1RZXejyKj+xgZdgJ
	tQ0pIVHNvnCPWN46H102uNBhGM2Y8N1klpXtujoXO4eMbhtyl36BTV7a63N3B0D2uCFKMcXOsuH
	gx3ogh+2XglpmWfLN6ZHh+IlN997k+kQcgvCFaaIXovjBSbFlN4kaqDaS6k/jv+pqAo3WNI71O3
	ahUF5ibQSJAtrhClpjAtz4HvQnNmexbzF
X-Received: by 2002:a17:903:2384:b0:2cf:c543:2c7e with SMTP id d9443c01a7336-2d3b088651dmr86267595ad.10.1786718486453;
        Fri, 14 Aug 2026 07:41:26 -0700 (PDT)
X-Received: by 2002:a17:903:2384:b0:2cf:c543:2c7e with SMTP id d9443c01a7336-2d3b088651dmr86266655ad.10.1786718485849;
        Fri, 14 Aug 2026 07:41:25 -0700 (PDT)
Received: from [10.206.103.83] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320e9df03f9sm5561208eec.19.2026.08.14.07.41.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 07:41:25 -0700 (PDT)
Message-ID: <67e2f178-125c-4fee-9e56-9c5e31e996ec@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 20:11:19 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: iris: Fix iova allocation from restrict region
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260812-reserve_iova_in_driver-v1-0-ed62f801275c@oss.qualcomm.com>
 <20260812-reserve_iova_in_driver-v1-1-ed62f801275c@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260812-reserve_iova_in_driver-v1-1-ed62f801275c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDExMiBTYWx0ZWRfX8mKwubzYWTp4
 b550aRA/6Bd7NJknsLMPIvU8OmAQ6XdyAlBVjk1MI+cHCHFV/O+bLQs9qP/s92tbgJ0t7KgmqjK
 w3nGfv8bqL2yX95TA8Pw1xVv8gqZIf4=
X-Proofpoint-GUID: qXF5iNhbH1E-Ukr3RJ6MY6QXB2e81CDR
X-Authority-Analysis: v=2.4 cv=eO4jSnp1 c=1 sm=1 tr=0 ts=6a7f2917 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Hj55FqqFgxrcsKo4rRQA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDExMiBTYWx0ZWRfX5o2bkNJFWNr4
 bPCMoU+2OxfTzsTjDLZ/zcdzEGSIYKPhz5ltQijo0jbjE/yWKjxGjuDLwe77+bPqeBgQD8nXnQN
 AvYhMtTExyEgep2cjb2pqRJoXk/Kn7XDyHKoObgzJhhXSz8AqIX5qqNNjqnmng0lCjCTHwzpRgL
 DczyU208yv2qLkHyEofvaVKhPVjdiJGbPXCvoIy7M3PUkdAJOD3uUCURu9foAHzsDqYHp7VTqmw
 oGV3h+c5tLoCGB+EkNEDkCK0YTgRGdmMZm19N7MHcctx1zP04pzQd9vyFFC5sNXA6bDRL9fV0Zt
 oYJMEZ0CfPjv0clSETazS1xdXwYP/pC1cm9ZlD3KbTJV9Zx+OMTzsJhfO0eFHZ5PCUMWFovoXz7
 YmvmvtlDAeiRZOYKgmt1suJfdlkKHu60pEbMen/9ctOWadc3yn+2f6CQawm4JyNysF6+JrYn/nv
 1zWst6ccXfpAdO3yY3A==
X-Proofpoint-ORIG-GUID: qXF5iNhbH1E-Ukr3RJ6MY6QXB2e81CDR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140112


On 8/12/2026 4:25 PM, Vishnu Reddy wrote:
> The VPU issues DMA through several SMMU streams, and the hardware does
> not give every stream the same addressable range. The non-pixel stream
> cannot address the low 600MB of IOVA space, while the pixel stream can
> address the full range:
>      +-----------------------------------------------------------+
>      | non-pixel stream addressable range (600 MB - 3.5 GB)      |
>      | 0x25800000 - 0xe0000000                                   |
>      +-----------------------------------------------------------+
>      | pixel stream addressable range (0 - 3.5 GB)               |
>      | 0x00000000 - 0xe0000000                                   |
>      +-----------------------------------------------------------+
> A single "iommus" property on the video-codec node puts every stream
> in one IOMMU domain sharing one IOVA allocator, so nothing restricts a
> non-pixel buffer to avoid 0 to 600MB. Once an allocation lands below that
> boundary the hardware faults, which shows up as unhandled SMMU page
> faults and spontaneous reboots.
> https://gitlab.freedesktop.org/drm/msm/-/work_items/100
> 
> A series to reserve the 0-600MB IOVA range via "iommu-addresses" was
> already posted here:
> https://lore.kernel.org/all/20260807-iris_iova_600mb_fix- 
> v1-0-3996f67e33f9@oss.qualcomm.com
> 
> Those changes involve DT binding and DT node changes, and discussion is
> still ongoing on how to handle those for stable and for the upcoming
> sub-node design, with no conclusion reached yet. Thereby a critical reset
> issue is still open.
> 
> This is an alternate solution to fix the unhandled SMMU page fault
> by restricting the IOVA range in the video driver, which also makes it
> easier and faster to land on mainline and stable kernels. At the same
> time the patch only reserves in the IOVA space without allocating
> any physical memory.
> 
> Currently sub-nodes are not yet present, and only a single device is
> available, so the restriction is applied to both non-pixel and pixel
> stream IDs. This makes the solution unoptimal while fixing the issue
> considering all scenarios.
> Once sub-nodes for non-pixel, pixel, and secure streams become available,
> the restriction can be made stream specific.
> 
> Fixes: d7378f84e94e ("media: iris: introduce iris core state management with shared queues")
> Cc:stable@vger.kernel.org
> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_core.h  |  6 +++
>   drivers/media/platform/qcom/iris/iris_probe.c | 69 ++++++++++++++++++++++++++-
>   2 files changed, 74 insertions(+), 1 deletion(-)


Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
