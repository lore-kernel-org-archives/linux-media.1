Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB7346A61A
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 15:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784648834; cv=none; b=JGp79d1CloyG2fDsoVffay6tMz5HPQchbMiYrVyN6ibYW2vvA3/wc16YGGSgnjGi0UqOCSojdiXtUm1NrqIZYZQ1NuwzEu/ayyMUbOzUDmWNFUy8TB7hoH6ftloZabOxPsrGZtl7619YciKLCMY3XNuh3mEcV4Uj7DzhE1NpUw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784648834; c=relaxed/simple;
	bh=zwKkMtOFMzBA8FAGAj3ttNusCK6HnkT1gFHAuYcxEFA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bzqiBK+4XjyA/gdLCbbANkyTZ9jYf9zMDyhTPO1DlEb1zen2jCjeDrMhTdu43mT/ag4fn8S6wsGiuRbN6CXrenJFlN5X7lti1xRZhK3BnGM542NtDadiBGF/v2+NVslOVyo5tNuHwS23ZFq92MNcc78DwbXspXgDqdycJ3QwT2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ck9KwbSO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cs1yYsrR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ck9KwbSO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cs1yYsrR"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDg74D1958776
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 15:47:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zly2uUbQOEsCV5pKtS30p7KKitdIviS1UpDECLW9Y54=; b=ck9KwbSO3X6Zr+3e
	IaEUDQqoLy30CyCKFZVXlMJ7QnxKu1wzLQn4a7hiVKtRkJK4Pdn8te8ZpibRsIsK
	PraJeWxurQPEz+hnjlHuBggmvQu176y7xO1/FtEGCiqo3D2bS7VegeJpWNOf3fR6
	S66FQDA9G6DHlsUiVeEnCPOJq6vO/jAbi5ak2wFSQSfqZ2PW7+s89ki1aLaBDE1A
	Y2aC1J4YvV6KqZwmVW8EKFrsF2igVyfZzBKWGuQ0P4Fw10slzlTaoikPafGeVP4F
	hIC4l06+1XLynEpH5Dx4IasWJ09dkMHDz5RtPsHpTfIxfO6itEk7ppwemWRmiXq3
	wqhmRA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1bvuadf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 15:47:11 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cab041eced3so14082986a12.1
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 08:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784648831; x=1785253631; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zly2uUbQOEsCV5pKtS30p7KKitdIviS1UpDECLW9Y54=;
        b=Cs1yYsrR2eBNCY0xICrLaTpkuFr3QNA2qacn4m2LUDcIFeRSjPPmBAAcmyWI2t8YI3
         jjJFasDzDLtg/unPsu6zXjI4iHCqVdmSUEcksxdwrlyZr4ymsY530BB8vQf8GTgIVqiv
         Lj4Zq59S64U1PDBDV+48kJkDlVVfOwXPJolzVde8lQyRskLDw0P2KsLYCM2CDOS9qTsc
         Jtoz8E2KHLGfycCM6nzQfRnLF3ruh0qM9lFbb5U2EkyjxeBQ3k0hc7wg7oFKsmyiSbLu
         w9JMq3NDgKo0gVT8eN4QqgiSxmknDt5s/Yr9tBtsjHeFuXwAKX8TBE5JhXfr9LKGnw70
         Mr7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784648831; x=1785253631;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zly2uUbQOEsCV5pKtS30p7KKitdIviS1UpDECLW9Y54=;
        b=e3xZXJ07Ct4Ed5QRAtRGx6lVURiVuS9mPNp1k3S1TB9xvVLAq0wZQQEthk9qIy7BWe
         UUGKQnYJCGCnCD5Oxd5X4rtAaXAqNeOHX+TyWtsFlFzIsGv1eJSp1j8H5fjRaP1xJGcb
         8LRe2TYGfCXcs9oNzGNrcQOb5Ng4CJKS5Yl5MVX+YineEzJdO9IsXouJeKOtKEAvry/H
         QkJFgClY4esxVke6AL9jMDGdo82Ywwj4ssEkPywtwIpUDZ3zgO4DGh2K2TMh4QbT2q+D
         3wnnaOPyzB4e8AOrV3okdq5onclF03XT+xKXSbH3U4BIA7GS+Ww8L/4ibVfCg23acIrY
         lt7A==
X-Gm-Message-State: AOJu0YwXPNvsWOFc+BOAD75nj7YnDAIB4rA9cmxyZXOExUNUtnBRlyP1
	PziV+M3h1wmN/FHDUqrs1s8cbagAwmLgB7ZYJi/9XSpXzso4bUOkyt88tJzAU6/XC9iiWS2pqn/
	NHfypo3x23ls3XrRsbHTEt2101SVvRyTwAIlJpnLo+eKkgSNXNiGLKLkOCRCTiX26xw==
X-Gm-Gg: AfdE7cnLWDAIFOdIVLrlVu+8Eyh90HIWgIES4todYiTnSDH3K8Ws7pvvns/AurwNFgj
	AnQHAzJswndwa5noHx0fmFbX7DD0SPaDdidIf9TrO9TXi9Rw8QzFykf5QprDYUPRC7eU5AaZ8/n
	DjLA2g2vcP4AE4+0MO/7Boxt4NmZcsB+/XLfEFvRhfIup5NT42qZ4lYOQ6i3INvtfLmq0Znuhqt
	QshYLrT2+96pnJWANxmmJuoXKLpGRRBBJM4mCOzw6CSf4yrjlzuLyp2vpqKrekFqj5u6vwiHDDh
	3zBp/bjptMgYdFeoWSqg5Znw8MWYfTY3PzJ5RfHDjqkK/9sIXffnNyQHn3jOBZ2oV8A1FTdTZEV
	fomAEkH8dzJ+5wRwLEYNRAiZGiNu5q4wN
X-Received: by 2002:a05:6a21:3b89:b0:3c3:64cc:311a with SMTP id adf61e73a8af0-3c3ad64b57emr21118476637.22.1784648830828;
        Tue, 21 Jul 2026 08:47:10 -0700 (PDT)
X-Received: by 2002:a05:6a21:3b89:b0:3c3:64cc:311a with SMTP id adf61e73a8af0-3c3ad64b57emr21118441637.22.1784648830364;
        Tue, 21 Jul 2026 08:47:10 -0700 (PDT)
Received: from [10.206.103.83] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2de31a7sm42081607c88.15.2026.07.21.08.47.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 08:47:10 -0700 (PDT)
Message-ID: <dfef8579-075c-448d-b011-39211433cf76@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 21:17:04 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] media: iris: add hierarchical coding support for
 ar50lt encoder
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Gourav Kumar <gouravk@qti.qualcomm.com>
References: <20260721-shikra_ltr_support-v2-0-702842f1f3c2@oss.qualcomm.com>
 <20260721-shikra_ltr_support-v2-2-702842f1f3c2@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260721-shikra_ltr_support-v2-2-702842f1f3c2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: bpmvx2yZYXXkDHw8n7zhYUrW2OQu4CVE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE2NyBTYWx0ZWRfX+rygxBn7xzkh
 mGk1jDQwl05KggUQ/KvtOrbGSNWe6r4JURVQpVO8LCGpwkV5fIETRse9J/VQZQ17iTdsh8Lfoow
 yQRilFWEI1Oz0cfQs+sVUKb8cr0uTaY=
X-Proofpoint-GUID: bpmvx2yZYXXkDHw8n7zhYUrW2OQu4CVE
X-Authority-Analysis: v=2.4 cv=Sb7HsPRu c=1 sm=1 tr=0 ts=6a5f947f cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=cBRrNc7nTFFbbESh8PsA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE2NyBTYWx0ZWRfX2DwxFVLPKTpp
 mN2JBFCyeTOkQlLFYQOqLfTJt80PoINKsU/75IsxrmL4K105LImO8UeDguRsHfZ9v0tVPxsObNj
 ZJjw69CMruczVpuzkEZW1qd4gRHPSPqQMaR+fzRvsEPwESG5MpjdaUKNRIL/pVELM5OGL7jdNuf
 7RtbYWVOuhnAPG+axGHRzL4T2aSmXq6CUIFJhL4lJ01ckhVMjwRXofytQiaOpIdyx2R/9QxYB4B
 PBff0zBaHynY53CxrwgFJXDuiKXCgidhxZL+Hc26fz19idmhvp7hrY4flO3O6ewYsWz3P4yS01L
 qnDaLooU86vM1q4YY4kPXEpLTqt6zFzB8qLS+YRTDiillbrw6X6Kxa/6zGmJMYTyKxFXhHQxgXf
 iKcGkk66lOjISJWsQgp3Uk5dr6WV9irFdZ+ImY5Q7wg/VRmHG4WTURABbvM6ymS5GevrA6b0tzj
 CHl7nyeg0LZQ7Cr4FqA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210167



On 7/21/2026 7:06 AM, Vishnu Reddy wrote:
> From: Gourav Kumar<gouravk@qti.qualcomm.com>
> 
> Add LAYER_ENABLE, LAYER_TYPE_H264/HEVC, LAYER_COUNT_H264/HEVC and
> per-layer bitrate fw_caps entries to inst_fw_cap_gen2_ar50lt_enc,
> enabling V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING and related
> hierarchical/layered encoding controls for ar50lt platforms.
> 
> Signed-off-by: Gourav Kumar<gouravk@qti.qualcomm.com>
> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_hfi_gen2.c | 182 +++++++++++++++++++++++
>   1 file changed, 182 insertions(+)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
