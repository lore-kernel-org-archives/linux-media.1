Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571973876C5
	for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 04:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785212020; cv=none; b=Qv/1cTyCZiotl9Nw05IhFBtxnL8lb/4eZ1q6EbQuNXUpP/DNoA/QZ9skUJkgJIp5vRhLPh7uxLvQbFQAhWwec0iHy510lslDkkUYLKyVP5mUruVbjv5QFoeqsDLbyXN1+BgN3bdKFDW4fk/T9b8i6uI3cfqi9IJ4R0TXZqqDdvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785212020; c=relaxed/simple;
	bh=ntWIhGPCv8YOpC68QvRSI1f4rEH8B2H01GQ2C0C/DsU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ymsghho4VfiucvEf7Y2XwwZYFQZgABpXM6T05hIlKraQufoBfJRXMO6wAtm4+5mus6rSA0KfBgQjU1VAU+E1m1nHGtuwYNcPeFY+KodXHm+CzjQPik7cwu6tfbz6HkAt0QPevEQ1xZd7oKAYQ3F82+wX+X0t8kckRySRabxRH9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hL5gMY6D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LMSxApsA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hL5gMY6D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LMSxApsA"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S3amN21423508
	for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 04:13:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n5yvewQqBiTql/JhNjWI05fR7zGFNYByzwORgxWpSeM=; b=hL5gMY6D7NoAqVU1
	GotzTO1voT+Omdo7mIvv2/0GRlI9XY8d4CVyGb9vD7r3f+dmbJ8iqOp0ebrNIPVa
	4tJZJe0XFUJ3nYsPLAqyH9L4KmYuOIiJnYatHf8RDjvxlq+sdPij/j5/7hvnl3dG
	nuDTPZBBGbPa3yKlUXhRldg7N1c2drVjCTqutKtftr8ayRQs8hJ1KSI5PJrX/JaB
	qp0SXVNuUo4pqBLWHu7xfEa1gWXtDTJcOzef8PpXaP+f3zsf1bhkiy8d+WweGsy7
	6GedkunIA0HJ0zkZEkFe2XjrYN1nZmca12QBqQMqxyDE+xs/LRwlnxbPhWIR8AcN
	KaFljg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp3v2mkp0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 04:13:38 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-ca8aee88725so5191498a12.3
        for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 21:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785212017; x=1785816817; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n5yvewQqBiTql/JhNjWI05fR7zGFNYByzwORgxWpSeM=;
        b=LMSxApsAOXu9fMia7TS1Es0ce/5pAeA0RvaBK6AVzjvF/p8i/e0JR37fyDiJ/L+xfv
         Bg6PiIP8/+AK7/qn1evDYnLp+kZp7Np4ypukj5DTMiK57vXXDnO8VO2HBZ6ZP8TfdGGY
         LYBgPAUkrIfFE8TCNIKoQjrBdDL/CJHLreKg12g2QNr4y3m5KvvVNrmgynYJIS9GCxuc
         ApQti5sT06EsFcbSedR+RQvp1podS1kNcbHLdrtLo5lVoyT1IIZs9+NPhXD0JEzEQgDQ
         IKJ6hgHxv4LJlpjflxmIWJPOl4kmmvc1yLl5YIusnw5q4PWCgEwVZu8kn2+LaS0+muxK
         pjnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785212017; x=1785816817;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n5yvewQqBiTql/JhNjWI05fR7zGFNYByzwORgxWpSeM=;
        b=FZ+MFahlNdhJuvXcBXEz7rgyNpK7Ii3osvIznhskB+4pRIrAGi5nha46cENRdvKZWH
         d6AK1Ai5MVBfa4Vba0mpfpWot/GBP66k2VdK8S63usDGEzIM/mnLToe+vdIlK39CUD7F
         WhdxgozELmuZ5cAqVgfnPRusgEBC/GUUHLI/cSxnB0k1/QS0hjYEwPJH4I3hXtJ4kKxr
         x5Aez0BifR5GIWxVhFfUgVI5sJ/3Sbg1ZC1NODfjsiLc2fSYY2coN3VbYc7hOt5gK5J4
         7y7m9Y79jr3FFs8oWt8GY84TRSvXTqr9/cRbqVkoqb6wqD/b5LiSdxSU6EXJ4t7gMOYg
         pFvQ==
X-Gm-Message-State: AOJu0YzUzTDk8QAicJGzmtOhXyAML40GHQOB5OVeLYyYvAfHZXECOAzn
	ocYQgwdFnLM4ttTdJQTFWjFsBt5Z7GHmzztS/1XkF3SiSqlrAm3tjgrkkOhoivy1kQdJ4Fei6OX
	zzOQC5l+pN5KAZ9P4vdb78WfDBm32aqNlTF4FilOFwqyUeW3GQ0nrP0vvBWvdtaUaxQ==
X-Gm-Gg: AR+sD10j8WMB0vZ2wHJRZqUeskMegLZHRMAHWJMDEP04RaSDcnkozz+j3Xo4JAym6k6
	ywltSSnlLWHq/iUj6MTAPmRiK4Mip11N6xR6oC+Dw7y+r+8IBW0HqfUD2l3nr3H0gJCHBHqn8ak
	0UoijM8z+ODG0/W2xNui1GP0rN437vbQTTqDuUiR8RBOfL80W8rmA+UWvfuGrAkR+8Q4owEnIxE
	mwS7KR11oKMggXGojprw6nTIBhTlDRq59yjEWarSkZJYyq0Q5lckZaazlRo3n8gC1eohy8s1piM
	CJDUb7T+K4dq3tTpdEOnPnmtWxCbxQgzcJbPI7QWSvt7ZLx4Uzvv/7H5Hs7+xIScxoppHgqbY5D
	6z4+SDmjpUGd0xZMdgvHJY0OhnmcnTL0JVw==
X-Received: by 2002:a05:6a21:6d9d:b0:3b3:26aa:5455 with SMTP id adf61e73a8af0-3c8aaf7b161mr1156287637.13.1785212017266;
        Mon, 27 Jul 2026 21:13:37 -0700 (PDT)
X-Received: by 2002:a05:6a21:6d9d:b0:3b3:26aa:5455 with SMTP id adf61e73a8af0-3c8aaf7b161mr1156167637.13.1785212015342;
        Mon, 27 Jul 2026 21:13:35 -0700 (PDT)
Received: from [10.204.101.119] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e52f0c6f2sm32025750c88.11.2026.07.27.21.13.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 21:13:34 -0700 (PDT)
Message-ID: <8a6ff7a8-f547-4137-95bc-e4fae3f668da@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 09:43:29 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/3] media: iris: add support for multi_slice in iris
 encoder
To: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260725-iris_multi_slice-v7-0-b4365c4930fe@oss.qualcomm.com>
 <20260725-iris_multi_slice-v7-3-b4365c4930fe@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260725-iris_multi_slice-v7-3-b4365c4930fe@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDAzNSBTYWx0ZWRfX5Z4tMguNhESD
 k5O1GhO6oBrtZER3LRGKUQBfp6WfkKy3fRHCMwIzmho4HMfnmwcIoSOPe8Sg4ATn41lSUYisomL
 0tDpr7aVDpl5c//bbG3I8hkcNzOezCA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDAzNSBTYWx0ZWRfX1qZK/RAq7Vu/
 JRzXiLD1QLURoa0st4R7c0HxVSOPaYN1z7KglkqsFttpsPN4YQ9C7GCANdSGeuzzBnWc67Uaukk
 y0qQXxCLg4U//iStgyMwTvtbcVbdzqpsJMAQSwD+xQu/QnaryLYqHkDFLBcQBaUIaqST6c3RMwt
 hs8AqisdBgIUuAX7gye5B+1eCbb/rv/oNDH7+Sx69fScRMz1LlmVUjl4CenSWMVzARThH7wGaDG
 ZOOonm+pUiRC3/uRs7HDREOi+Kin7TJCEiyFxpWVDpzuRwcYuiXv00IRQ2ssnLTwRrR7Zo4douP
 ut2IViFqhavA2Jyo5o6f4LNow2A9B+eUkmLEYZcaujsRIcmqGmCa0pUysxOzWy2z9WPaEcnj3nB
 5RINJxjcPYHBHmayJdjnY+AutMibfSO1WHo/wS7BI5VcaURnIvrvmB93ZTOxRwGfptLouQDU5an
 AUnKKjbP0yiLmk8fOEA==
X-Proofpoint-GUID: WbxQEUdVBagTN5BVU0QauNdHV6Fu5nGU
X-Authority-Analysis: v=2.4 cv=KJ9qylFo c=1 sm=1 tr=0 ts=6a682c72 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=grlzeUCm5dlgAkIZSioA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: WbxQEUdVBagTN5BVU0QauNdHV6Fu5nGU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_01,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280035



On 7/25/2026 11:38 PM, Sachin Kumar Garg wrote:
> Add multi-slice encoding support with MAX_MB and MAX_BYTES modes.
> 
> Clients can enable slice mode using V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE
> control and configure slice size via V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB
> or V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_BYTES controls.
> 
> Signed-off-by: Sachin Kumar Garg<sachin.garg@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_ctrls.c      | 86 ++++++++++++++++++++++
>   drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
>   drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 45 ++++++++++-
>   .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  2 +
>   .../platform/qcom/iris/iris_platform_common.h      | 17 +++++
>   .../media/platform/qcom/iris/iris_platform_vpu3x.c |  5 ++
>   6 files changed, 155 insertions(+), 1 deletion(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
