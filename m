Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F9B46C4D4
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 15:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784648522; cv=none; b=BKecenD5bcZSuV1liN3laDC5b0afvMivRtUn/FJE1YWo1ynOG1fhPjjQ+2mfnkxTfMCdRkt6fGIADjVQ31NPdm5ozL/uNAE3IZ0HCxNh//Eazm0cqchFOmGc79k5mPboyWiti1yLmMtROs2pK8JbpghPPm8WaWTgx6JN73tE2j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784648522; c=relaxed/simple;
	bh=nhEeOqEKgSq3GmWXx905R5Hy2j68p3z7csWzxLz4KmI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jIJzQVdL/4T7w6+E2oVtJUn7xpn4OHR0lTlrJo05NffribLIFn5plghELIP8zQYrjqsKfggNOQ4t922Ko38awJxMNJ/wZ0rGxlVITxbIkTTHfZZRdJODE//INftWppEVG4SMayqtRR/3jM3dAYqI40DyJkpOPXA9GThkenhe83c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OU26wvqG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g7KYWk0f; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OU26wvqG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g7KYWk0f"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDfqea1938609
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 15:42:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tG+/y07EnAc+VJ+hv6KDaBBFa6O1drJ9FLrxO9bjP74=; b=OU26wvqGLRa/9VYW
	8tHHATNFsob2PR3L/qIGkbdD2gAYyWj8p5Y0SUmcQccFQBatTTntbwqLh3iylkM3
	TW1xGjc9AI1GKGV5KC+yIWs2Csh/PB1Xtq0EA0NUXsg8bKvTI/aOAvM+Qo5/Qqhw
	1ThC/T8wtuXovnppcqPXczQV2EDZAsoZmxN6Qbed5Gv+YuB7XaTTTMF+BV55hwu6
	mVYIjrhi8tn71xpc9XXTAZxdIcZqDlq4UQVH/2D+XnVjlOesGVhKPUEVGleMQwn0
	pecvWIMUCJDkkAN+YleSFl6GSpnhm8npTZ/mxP2jJAVJb4rvsCc4yBv2Ga9ZW+Ii
	nJTOdQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9bs8r4p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 15:42:00 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cab3e9cd922so6126118a12.0
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 08:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784648520; x=1785253320; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tG+/y07EnAc+VJ+hv6KDaBBFa6O1drJ9FLrxO9bjP74=;
        b=g7KYWk0f7KQQdC+MBCM7bQtBh58YOYma5TauqF7LxGsCY/WNm2EkK2JxI2Jx6GNp17
         1ZYDhSSx6VB0l3ptvzWq66c7sz9eYtKkzxgIajINbOVY9B1umvqe+xK7/F/LCwbCtfBx
         YZYss8a1oZpxJInj7WvYa4AxBZlpcx8Mkt3EiFVqbbM9vY+vTzjfngATYi7g2gWNwj1O
         qM4vAf5kgD8OP61ayIPuv+kE6uIc9qMDNT/RxWZ8OFuMLTo10c34CoVR4JhHNK0RU8Ae
         Nzbxhsv0AVT79f/xHI+pWjDcUHpOqOwGyVj9f9R6K94Q4ctYrJND048tNv+4RSNtL+6/
         E4zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784648520; x=1785253320;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tG+/y07EnAc+VJ+hv6KDaBBFa6O1drJ9FLrxO9bjP74=;
        b=SW4awmUszu6az7S+V/JLza6zQbRF2tDJNc2INRrMA8JntpgdH7cgVUY1/Dwd2LnlNu
         JwAitBzbc1LhttX/mZ99F9R2T+1BwpCihQNrk20q2adnJax2/FgLqpc6uRj+pA2orN9x
         L4s8lg9nKhgb51k6yIVQJAkghwzzbaVmuhzMU6+4/O8ogqN/EpTkHqZQfYF8KdduFwZu
         GgVkx2TA/DEvayBA5kFPe0x4Nh3OPewS8IDUuarjVbi1jo+B0CysUZdtO2hQHhxCysRE
         KfuZMtcdTuOGpJs0QMjA+pp5rTiu5nAPYDTCwYbQbhvXPergF8vZJUiPH0GmJBeMnxlo
         oFRA==
X-Gm-Message-State: AOJu0Ywri6AV2aowitjdMtllGIn9NvlduqIAnyUngyLR/IRKAQ/5IB4n
	tfxjFLxWZgNodVp52blx0NW+N7MyYLe7+AJnjy2q2cUlc+DdjKe55MYpWMHI9NuseY+NhpYCb0H
	8VUEu0jU2OFONx1SvUkvavQKumEUNpSWHMTX/7d5Ugaiy+pjNzFGY8gpKOraCwWt6VQ==
X-Gm-Gg: AfdE7cnkESX1mgkaLe1AnesiA0Rm7Mxtvsd1hWQnub9YQgaHuPBvdFh0M+mgNy5QiFn
	kxmOYjaU7Vvi9Y6MXMYpYdFBU8qKSGx5wKp5Q9FDSsVXUiZ6ZQmnGrlix2SZYkDP4EA9Zp/nQ4m
	skUkbAhBZxLAsE7bzxAMbjSnTMS4jLMuBxGKffdPjvktqqNSE9TZaeyTGAnvSLs6B1jhu5K3J7G
	C1XvtjQXPRFvIFFf4jAdmRL9eUZ8gAqaYWol4y8IT2heCx7EaePBDfo6j9c0FKJ53/a6dq9+OaD
	cVGR1fibLEZ+CZvbmWZutD8UuAqtIcKZi7H0HwMKyc9aJxIUYrtl/WKrYYT7IyB+2/kH0xs+n8Q
	CoQ9MC3W8u1JdMPU7XXb+D4hf/c71tjEJ
X-Received: by 2002:a05:6a20:2446:b0:3c0:9c1a:8953 with SMTP id adf61e73a8af0-3c3ada78e07mr20134632637.75.1784648519735;
        Tue, 21 Jul 2026 08:41:59 -0700 (PDT)
X-Received: by 2002:a05:6a20:2446:b0:3c0:9c1a:8953 with SMTP id adf61e73a8af0-3c3ada78e07mr20134582637.75.1784648519102;
        Tue, 21 Jul 2026 08:41:59 -0700 (PDT)
Received: from [10.206.103.83] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1c9289sm117159eec.29.2026.07.21.08.41.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 08:41:58 -0700 (PDT)
Message-ID: <17b99e4a-2fc8-472f-8d3a-897ec4d0e2e0@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 21:11:53 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] media: iris: add Long-Term Reference control
 support for ar50lt encoder
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Gourav Kumar <gouravk@qti.qualcomm.com>
References: <20260721-shikra_ltr_support-v2-0-702842f1f3c2@oss.qualcomm.com>
 <20260721-shikra_ltr_support-v2-1-702842f1f3c2@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260721-shikra_ltr_support-v2-1-702842f1f3c2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: VTcTMc7J7FGmFXPaCIg8Ku_mwWDOchqP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE2NiBTYWx0ZWRfX4+dA1uxPZHoX
 na0+0qoh284Lb8Zj5tCNSOJRlTs5gnD2GgJotubG1TjgGKszaVeMd+mvtjYiW1NN5qt1IgGBlGj
 UuH2pPh4XRM6jLhDCH7GsIPpvKPka9VxUs+hrVvfFIftY9PtNvUp2OjjhUgT6MAGHwElcED3hOM
 +qgtv1iqe/dV/DvIJLeKdSjmw3Pe18467o91gkt1/kFsciGjewRgEEkjGOw7Yftvsmx9OhEhPU4
 ZEb8KozxvbibGIyHTucgZ8nfyIiKx8jtmHv9PngidOIHQsRSDmx1tlRT+8+l6iggHb4npCUlICH
 nDK9NU0vHvKr5sOymt1PAWvJeybagW7O8JBgIp3hYKj9HRCoy78LaIx+ei6eEkDOe8XwSdrdFxw
 OEK0zYTkLBNoO98EpIFAv51uxDOu+ZRHurs1AtR2UweEONZAfBTM0HepZ8N03aumavq/GkgeUr3
 3OiFHEt5D0DuIF23o3g==
X-Proofpoint-GUID: VTcTMc7J7FGmFXPaCIg8Ku_mwWDOchqP
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE2NiBTYWx0ZWRfX6iIDVlrS4xH+
 wfOJfqp2g7JtilZj3nCIR/3QfRkCjAPl6TPFm7ASv1MsF2ST90gR0ScYo1JzBwdc6/2HYnK59P7
 tsh/AL9aYxpIQ16dA3g0SmEn48KvZHo=
X-Authority-Analysis: v=2.4 cv=QK1YgALL c=1 sm=1 tr=0 ts=6a5f9348 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=gm-eHnAy443RRWUYm5cA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210166


On 7/21/2026 7:06 AM, Vishnu Reddy wrote:
> From: Gourav Kumar<gouravk@qti.qualcomm.com>
> 
> Add Long-Term Reference(LTR) frame support for ar50lt gen2 encoder by
> enabling the following V4L2 controls:
> V4L2_CID_MPEG_VIDEO_LTR_COUNT
> V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES
> V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX
> The ar50lt gen2 firmware supports the corresponding LTR HFI properties.
> 
> Signed-off-by: Gourav Kumar<gouravk@qti.qualcomm.com>
> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_hfi_gen2.c | 30 ++++++++++++++++++++++++
>   1 file changed, 30 insertions(+)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
