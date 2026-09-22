Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E0B488221
	for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 18:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790100839; cv=none; b=ULscruAhRhGGqCaBSBs0FU2OVWlo1SVdD36EcYAHYS9sEn6Bp0aP3aTdMqsrWbZU5t+CjI1vTZPR+5pzQsoVOKUTY952JLO3E9oUen2Cdmci5ZKexllIj4GCoNme+5HqPv1SRi2MhcahU10E+jupadNb9zpo1iKooIiQkOEUze0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790100839; c=relaxed/simple;
	bh=8qHJ2jljwKT7vkezJXoh+SzC08ST7KZa3akvLAlytVY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uENDeNaZIBx7vLtENvYTSW3ckYDmFNt+fWSvdhDMy5kiQyp6cKqtnfMjKm1s8k4EOTy+PXuMjgMa/CqWu1RC7TQlSKbFzPf96mxZ8fOXWZN2zFbHDLQQxh+YuTu2rkT20rt8pUIV617gNfrXylPhh4GhK6a6IIU8weyPEZKlZRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OKXnRmlc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ck6sR4S7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OKXnRmlc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ck6sR4S7"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI7D9h209407
	for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 18:13:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7XlQOqTWG0GA4JV4YRIpDCXGSIq0z+OAUor2GjpNIyo=; b=OKXnRmlc6HpnTQlW
	NSKH76A9Pmj/LswsA2hG960qCSljI4x1BoTahgkfNFjvdjrrrVDYWBmhYgF2Moc6
	3Qb5dBjvlRSG10ckGZfXDAwzp6hGcTNKFp/O6hM3OIva6cNYiI+S4bFz7q24SYpU
	HEygRS6OfUcUGpjtL1UFIGQJpW6NLr5wxwXHVBOxeIC9cJ14Vzl2K8clsmpLDLWR
	hj7KWwyf4u+94RRSXa+sNTpsf6ScUyGNlYbnXRGq7POjUMs9O27dnS8Pq4fTGVCp
	O0HU0hPmh8taPTcHLMXCIeLqQoMj5JoLY3OTxLmt+vEX/kR4pXA8UxoW17VtaTTe
	Jpe+Ow==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gufsqc4a7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 18:13:56 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3284bbaa89dso258946eec.0
        for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 11:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790100836; x=1790705636; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7XlQOqTWG0GA4JV4YRIpDCXGSIq0z+OAUor2GjpNIyo=;
        b=Ck6sR4S7aLsyZEBRNN02we6wZKfdj6+Ho4Vz3LTHks9VLKLVyR+HQDltndx3H1uCfn
         XxLLv5/ruqj+x5nCHjOTaFn/6xu9mAdX6eqUADpytaXjHDI8PLIWXarSBvOZqE3Hvj3S
         h9ZPqSZWt6PaTpqk2wj1jXb3MzDFujHWuevf9zpbDngyE7i7N1u9uUTXdADtTspleLdq
         9LUCFBjGWsTiMtXo8b4/usO3ELgID9fl1V4Wen37lI2TvyeMUva5BjUM+Xh58bjRZHxY
         AqffgS4ac/8N/lb6XcJXWVYgp9VdUT1fpmqS88xtmy4m7q1DfXcHOLPBHncWLZAYx6nJ
         dwOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790100836; x=1790705636;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7XlQOqTWG0GA4JV4YRIpDCXGSIq0z+OAUor2GjpNIyo=;
        b=UW85RE/wxpiLMIdrJSQdAIIBzQ0b+5PDvYCmDUdUYJkmy4jZwlOHpHSNWqg2WDQP6G
         o1uRo90Io3g7jihixgrKXJRNkmuGwjm5XrwuOL0fbuyndhdDIPGi59NkTAymINKByL97
         a4FyQaMcEPJ0mrh5kCeCKa05/pbJsBMsAApkPghlc4BmH8PSoGNS4EdxScMBdyvQi5Hw
         Jg/HAz+XQR/haOBRm4TPy1A1AZPShE9FzSpFDatYu3jvvSNxAyvOEpeSyfID/N9Fke0g
         wMazQzYdMcus0Dgzb1Ww6ja46Ull1QH5XRONdwzbNQ/1O3uMAdC0mAw4cn/545Y60M+z
         XYbQ==
X-Gm-Message-State: AFuF++lVL9iC5f+ZmobAPmPvCsTNGC3dWQTRGldFWWHAE1yKIwdl+DZA
	p9JSkpja7GjW7XgLGWDOsIGlByTsKpTuDBV2xxlKuhfVD+RpKcoKA4+3zfFpM45mlWUquGm408d
	rY+PZTWnafec7sQCkUzvNpM9diPw4VFa5j3an8fagPYUOnO/e19Vj6rtDDg/M9GV0fw==
X-Gm-Gg: AYBFou0BUBo3XhUO5WMs4fnIc6Ju2kFrKKoq053m3qW6OWStgTAYkd35BX3/CyRw+fm
	BvHzN4elxd6uxAGijw9hYwjbhFSzAGneoaMcEv/HfzKzI6o5poNPXBXWMKWEXBGCAJtpomM4nqn
	+lrXI6aoZVuQ0mq+dMw7krPOH+MK6nV8gamrbx1xEd3UdJYl4iU33U1LcNVGEukZ7zfZNvi8N6+
	7XqmiIN9+JL4IuScbvocxMgLv0voqwHkRQ6rSG+12HmAwdXSL+/5ynvAvmGKcjZ4gYWgkf1dinO
	xi462JJzMp8RUrheSdwsjdEcv5XAMiiFrss5HK590adjIKbjmU1UH+bT+Txa70H9GOHyj8CKobM
	ym4uyrfCHGiQZGyt/XviURO3SdwJFpsNrDg==
X-Received: by 2002:a05:7300:fb15:b0:334:2bee:348e with SMTP id 5a478bee46e88-33e8dbc413amr101145eec.22.1790100835568;
        Tue, 22 Sep 2026 11:13:55 -0700 (PDT)
X-Received: by 2002:a05:7300:fb15:b0:334:2bee:348e with SMTP id 5a478bee46e88-33e8dbc413amr101119eec.22.1790100834980;
        Tue, 22 Sep 2026 11:13:54 -0700 (PDT)
Received: from [192.168.0.172] ([183.83.143.245])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96846f85sm14407eec.20.2026.09.22.11.13.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 11:13:53 -0700 (PDT)
Message-ID: <4da1dc31-f586-43fb-ad6e-110248177b4d@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 23:43:47 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: iris: fix VPSS line buffer width and height order
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260922-vpu4x_buffer_fix-v1-1-d1b6f1c24285@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260922-vpu4x_buffer_fix-v1-1-d1b6f1c24285@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: cUuOi-OGHge1bbMLCaszLW7gK3D54ROs
X-Proofpoint-GUID: cUuOi-OGHge1bbMLCaszLW7gK3D54ROs
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI2NSBTYWx0ZWRfX6Ec2/qSvARmT
 WS5ObGDox5JFdzh/SYI5Dyrmsxy6kJg5RGFB1UlNIq1Vfcxq6z29D39jAIIAFXErmrJz+9fqr2S
 HZrsB79EvnHR7SDsIwAZLF4d8J/sepI=
X-Authority-Analysis: v=2.4 cv=NKBAaE6g c=1 sm=1 tr=0 ts=6ab2c564 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=d+GKXRUq2vCLDWIvqUj1TA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=LNHj20nFQCkdnYxJI5cA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI2NSBTYWx0ZWRfX2XZmaBS1ksMS
 YmVwXoEbxHNGRkaZbHKu/e43AbRuIPknKPyICTyf9hH7rTMbALZw0AwPq/yNFEJYpOXlhcr8Uyx
 UV9W5ztL5sSoTh636SWW1w5HWfd3j6y4BMbpIqykVPROk+a3FytGrBZWoDP4+k95wgLxk2G9dLL
 5q5EhTp9hFny7aAOueCy7NNH6hSqn/OaLBIaKsR7VCFEH8tWw27COvfd3lyfxvCY1hLhYyPX3pT
 kUINsLheIHQVu9H1RCLvDAS6Z+6xQBaSdvIPjyG/Bux4dgdRFOl7H4z2EUQil+wFDfFiu02MNrx
 7mv3OYmvTsmDZ1MRP0yhBZVoxgJeCU1/yqeJsUEHO5WeztbUu+hDPgybObcCVonPuQJYVMbczUC
 KOZkbO+De7wwT8O/lTMFGSQ4u+slOQm59drLDqWMEnz1DjYRo2KEW+igg80LY0/AoOMAJ9PJ2km
 YKjGapvUX9ojiJrIwZQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220265



On 9/22/2026 8:54 AM, Wangao Wang wrote:
> size_vpss_line_buf_vpu33() expects (num_pipes, height, width) but was
> called with width and height swapped, miscalculating VPSS line buffer
> size for non-square resolutions.
> 
> Fixes: df816dce1b01 ("media: iris: Introduce buffer size calculations for vpu4")
> 
> Signed-off-by: Wangao Wang<wangao.wang@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

