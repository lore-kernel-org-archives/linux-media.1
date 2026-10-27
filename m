Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793116725;
	b=I0c+EQWnCcAAbwb4/bx6YqSABHAHfzmWxC7hbaN1iPf0X5zkGwY0+PTasBsT0cg1aFEc
	 RLZNgdGDCbr8FxIjhLi4Jn5Qf0YLPBczvCVacwmY5Pb+qAxMc+Cu4kDKRqxripfO2g7sf
	 k2T1NQq50vO59bO7KYxYlsAHEUEL/KY7fTRfWz5dvN8qbp0W0+xhsxxNkmV1LjwB/wgcu
	 1iUwg1yBrHyq2N5mcTcnosIWzIXRMnhReHq+YsG+WY77FdZSEBV7gNZTeBseBU2HTcg7D
	 dxe/+GkAItMmwJeznMkQeSKSV6DXqrrp1hKRCarLSxzsqIIB2nnWxvC3UI05uEKpJRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793116725;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/yIWyQunKXfcHJU/jPfgnmZ55cnAcfEQ8VE3Neqv5Hg=;
	b=fxplsCHqWI36DkprKArPBAPFvNENQFz3Vo5k+5Gn/F7nlloq44cn1bfmz7NHQTGFhu4M
	 JPBJnGmgYHDcRzqJ7f/pMAO/fhN/xw9uzwubITjj2zWjnthXz7219Q8HlzPyIEAMkjKx4
	 V24CyOdni4OR1rhXVHktVQ1fXC+PEpV1cVTIBMrlFUYBxpW/GaJEzzRbUaqArt5c6B16g
	 IU0U54fzXEklDwrw6iD7PQ1UWbWwqdxLdHn931EBVIF7+jORkrDvU95mw4W9MvDsiugfR
	 zgGVrMgVrVwAK+UEIdrWEcgC+Vdm6OMUftK3ESvtTE75d+cY7i4WAa9S+MPGjEPTlfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a3XNotsa;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VlRo3Mv7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573CB606A31B
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 15:58:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 573CB606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a3XNotsa;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VlRo3Mv7
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RFL0FJ2549092
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 15:58:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/yIWyQunKXfcHJU/jPfgnmZ55cnAcfEQ8VE3Neqv5Hg=; b=a3XNotsaUyDQL1uw
	78FVAxhd5m0hakz1Wei7MQIOYmtuzS4v6+sM7J8u9rVcruRD4ll1kS6BxVr9GV4N
	TBrLq/o6c+c7O33ZzjbNncQUxWLVHNRYEKRdnu8lGweLfRgxyBYwaD57lhQBAZj2
	9EDgkPk0TLEe5x64l3c/pUfJZ5weO3hsEUNW+uao3Yke9TuNj8ghSQQrSjbKxA5U
	KTRlOyPSJTOXiZ+L6SHH27V7i1Ngbm1T99UmAwmIs8VGQL9AB5Fza77GP8NoXzHJ
	bYNTog9hETuTSK3U9kw4h/wVVHV8zIs5PJeQk+VIXDAV8LxnEWxXBqLtr20UTsEc
	mYKZPw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjrq69sb7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 15:58:43 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7cc2c798d76so95892137.0
        for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 08:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793116723; x=1793721523; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/yIWyQunKXfcHJU/jPfgnmZ55cnAcfEQ8VE3Neqv5Hg=;
        b=VlRo3Mv7kWS+xyEHcRmMPGdoGkD9y1LpqXpQK/8+ElXWQ9d5RuAEE0u6LxxhxeyFD3
         Tk5Rvo0FmNgn2wha30jejM1C1rOsqckgdoFqh/KnodoYZMPrxTnZmTyVNziJyIQJphjU
         00pni65XEy1trAShZeyQbMs+baJve/3a4EMJYPg2/hKwt+t4fESoPZ8UOj55jTzHvadr
         4y4vKGAkFu2pNFluRAfDqavSPZlKrP2rTfgvSO7d23/1rFX/W4JsOwPAJEG63b8CzyAy
         Anw+rFZiz3pucipfEtL4DpWUE416+jfV0iTLreHoOrLyLPnLjmD2IxuBvECYRG2OkRDa
         ubSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793116723; x=1793721523;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/yIWyQunKXfcHJU/jPfgnmZ55cnAcfEQ8VE3Neqv5Hg=;
        b=LkykeAApibwZQ1aqQLue5xHVDU22XH+AQWPzgRXrxsAPSC2HqT8QJzYao/AcLChrQQ
         S2Fx5rHi8oebjpNfsUcKoMjJGfq6UuRBerzzCQoCs74s+gWtPwdB1Af2/UECshZeb8eY
         WD3TiIabFwhaiyZUirj6hTdsAF2dkZ/M7peMvN160JHQAvcTeAIaG7nfNPAeGBqCBOjm
         QuhG3Uh66OHwOlZEZtckPmRqZOcBwKcT4UEUjjjIqWrtXs/JaSFRYmW7U50gVddMWadT
         03hcMKwWTAn3fojs5jw/6tFvV8II8FAG+cgUeqIt9XaftmM4cJ2mMg3IwkBKn/jyflFQ
         gaBw==
X-Forwarded-Encrypted: i=1; AKwUvBwaQNgCCLbAi++2MZn1Gpl6ARFJTwsCS1gl8mkBa6ffV6iPZ0hUd06umfUOfMVRn6cH3Xr3m+6R1o29PA==@vger.kernel.org
X-Gm-Message-State: AFq9FYK/O1VJXecLX0irHLQh1O9yVUDOQLwWbP8h0OpZL0OQfF6iYhwO
	tvpqAZEQGpUZ+o9199HOzi2Sn4EmlFoI1YAWkpEw3X2GKT2GdCYxrQFVMf7pngWbQ3NF9rJfPST
	46lqBvg+7lmU6kOwJbhocslC47fkBgTlGd1Bsf6H2zTgIiUarzDBxXmZe531AuLjwmg==
X-Gm-Gg: AYBFou1LKVWya8RdcG53098+bNCNblHqFzGGbom7zt2lwnVeOZrR7bRgkZ30DnM6jMH
	AhCtVM9RW/UvZP8yMT11unrTrzV9dljjWOGfwJCSQ4Vj8IPv2RZ7jcBOV9axL/VWYk5nqcgwhfK
	TEC/7N68C0hfrArhjaJ00UbATIlznP87E/3vghR0k1PRbvRF2n+HIZ+DUVFDo/UaPJHRnTW0Bhv
	NmYvfYn/Jfm1d/ERtXZeQmxgq2YO0i3pByjkCnOAHlhXuirhcAFlruocc8HCGbHgRnlKOwTVVOq
	FP1E376kR71+pag81oaL1a0HRbwNBEZPa0AzoMuHx0N9cbrNyLlWI9hftDkGpxeOopEU7SgozTx
	QdL/bmv57lAv4dtpuckE3vQ==
X-Received: by 2002:a05:6102:8699:20b0:7c8:3b8c:82ae with SMTP id ada2fe7eead31-7ce5cc59d5emr3593364137.2.1793116722572;
        Tue, 27 Oct 2026 08:58:42 -0700 (PDT)
X-Received: by 2002:a05:6102:8699:20b0:7c8:3b8c:82ae with SMTP id ada2fe7eead31-7ce5cc59d5emr3593344137.2.1793116722060;
        Tue, 27 Oct 2026 08:58:42 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b49640f1b9sm227658a12.19.2026.10.27.08.58.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 08:58:41 -0700 (PDT)
Message-ID: <9a299c47-a92b-4086-8218-3f6a06a25460@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 16:58:38 +0100
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] firmware: qcom: pas: Add optional video memory
 protection op
To: Sumit Garg <sumit.garg@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20261027-pas-video-v2-0-5b52bca5add6@oss.qualcomm.com>
 <20261027-pas-video-v2-1-5b52bca5add6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261027-pas-video-v2-1-5b52bca5add6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RYwFmFtv c=1 sm=1 tr=0 ts=6ae0ca33 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=FUnjqt_kGT4GknzHWowA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: 9dFnfxi3BPvboDD-Pds0uDQsIoz4T3U3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA2MyBTYWx0ZWRfX0fda2xcjLqrq
 rkfMy8ttPa8EDZhl5P25xQj6W4ZrlA7GdiDO7DRmMb9GlwdV82wsNxWrPADwBwf7R7hB5AQ2OJ+
 wVBLUbFffM55VoEf5Qs/wf0hX8cGuzI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA2MyBTYWx0ZWRfX+F0YUKGBBZ6c
 eCszzD6FWGsy3sNA+YRiTvoGZzOnw+5FX95oyxaLO09EyWmlZV6JW7BA7xvFUatp9yyLi2Z2TyK
 LRfOYoOcNEfL2Z1laRhz865QJIL/X2K3gvtB/tpWC14MzafeyKoImvGFG6ifX95d+2bJWF/vPwg
 W7BqqS/M8WP3QavQLuNDOMmMGsK7Y6ov4fTWApUB1jInw0CWXRcfpNjtCknL2o5wgon22EEnXyz
 HzpZvpKbJwh1HgX8NBqiiJVldEf7HN+X/5AdlBGEo+nPjbxsdMuHaePPOlSyFXh0vGrQ4VknMjC
 E96jJJ+aCo0As9THN+5MHBZLkza34brrg02PVWIXUAa4P0xSsxfq6TXVOzfkvRFcId2r2RyZtEN
 QM2ufvMMhOQKuceldh29nms0XKnjmGK9wjtng66cx23uAFKVOTUTUIjEef+V7zuMspUTQlAMDFF
 4sjAfr84GWvsdBXncNQ==
X-Proofpoint-ORIG-GUID: 9dFnfxi3BPvboDD-Pds0uDQsIoz4T3U3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270063

On 10/27/26 1:39 PM, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> qcom_scm_mem_protect_video_var() is only serviced by the SCM backend.
> Other PAS backends, e.g. OP-TEE, own secure memory protection and don't
> implement such a call.
> 
> Add an optional mem_protect_video_var() PAS op along with a generic
> qcom_pas_mem_protect_video_var() wrapper so that clients stay agnostic
> of the active backend. The SCM backend maps it to the existing SCM call
> while backends leaving it unset turn it into a no-op.
> 
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---

I agree it's imperfect but it fits better

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
