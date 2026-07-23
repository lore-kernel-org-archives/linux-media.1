Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA6B3D5C12
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 07:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784790078; cv=none; b=jL5DYgiPC9E8ijRw3YvitMCq55m/7qc+rq7h5j+Xk+WT1TZnX3mFvjpF53XXt+TZRCwSZdE7rBi1WZzvIN0mEdJ/sTH8mNaw1zgjrEo09By8b2lS+rOOAZ+7kpPqtBtbGIQjCyBnz8Im+FsJbX8xcS8A1OuwBsFhnXaZg2I+5dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784790078; c=relaxed/simple;
	bh=zAZ81sCJNAi3t6d0FfMfyie//p5p3THcXqqXzyEhH24=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sQdnisRiJOQcmXiiQLr8VLmJPsnNW16BeHyuFdg1UVsyEYwss7ok1blRy/6l+gS08G53GP0K8sU/VvTMdDeqTJ6NeDezM9deRLWQ/0whZGSHkEQ8l92HCT0nLt7yvDrcpQxnIUbt3j296K0ZGV9ZQmNj//myN8XWDFbha2++a1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I6jKxxWN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RSEVA4q2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I6jKxxWN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RSEVA4q2"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N6AOwh2889875
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 07:01:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5TBRc7bTqgEM/bqTiAcERw4iIbV60MFDEO8+VBa6JHo=; b=I6jKxxWNLtF377iV
	qFup9vK6zlfzQr8aw1C/Fz+1iiOA7p7wggczZ2nuM33cniG74Yb3KVvRbqS6x25l
	ZjDlyNk+lBUG8Ve3zUg4T8uDmFlTyv9Dffyr5vb2vDzl8j7Kxg+KMYew2sQEg5z2
	HHwfPlscqmBWbs7vypwbS6ojV2jkzcP54q4U3LROJz1OEDOIwpQeynBtrC9jJXo+
	9VCRHHhPJtBmNQ+PxG9L/N7IhJq+qOAiW7vl8EPyufjYtGY9clKkdrNTrm54u7DN
	/gQw4vGjD2nlNgn8iz956/IkWyNj30hLQWp0Prp6mGB/NSxKaKpda1mm45UtAIrj
	nbrmEQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkafw0v1c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 07:01:12 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cab3e9cd922so320457a12.0
        for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 00:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784790072; x=1785394872; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5TBRc7bTqgEM/bqTiAcERw4iIbV60MFDEO8+VBa6JHo=;
        b=RSEVA4q24M6loCcao/1n2CjNngaQ5f2IpMkza+yUeeTxIBU1CKqaAMuE8eVryNR/pR
         xPIWbvmhZudxirjt5P3W+IDNhejpkI+1FfHeLCQRkcrc2PjlhKqY4gjnOAMfXsoIRqrd
         +9MVCOFZ+3KclZp/l8BlgKV/RQlClzaxLPvjQKAVKVyCoHQLoFrcbI2lWo954pLYdi+o
         XGpAJjA5ZQwOvAZ1fvkp9pdU5AfD6sniL5rumRljHhM8skS2VwX8xWAjVW51lwodzzkm
         i/xdiFy3hHs9Q0RAV8W0uYEk43mCScpgI4r/plQBNLv8VbF3UtE/oi9+7HpGtrxF36fI
         IBvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784790072; x=1785394872;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5TBRc7bTqgEM/bqTiAcERw4iIbV60MFDEO8+VBa6JHo=;
        b=nE57xOR5+1J141yv9MIH04+uLVublJneqmiHu4BOCQhIetspzVlXAi8UmDL2ePbed8
         N2faREu+DwppUvsS0TMiZNo6cy0qD1Z3uw0ERrbyxTWCDV6pv9HwceOz9L6QMoa5l37f
         xhx5R/+bJBaD7S2099wfCc4OrN028ogLANxX5Cl2tc5SwDdDC6X1HV8OTZ2BXm/7o37r
         jVTpHA5q47fTS5BLDp1EHjuhqTSojNJiZZQ0r3637Kg3VVHwVrtiV9TWko5P21JuJ1T1
         QbTnBZK9nHcgQmvrrtU4AuuB5t2YZnctLai15q75DSJDXv8FZurw7so2nV5tMIxv+GvF
         mUQQ==
X-Forwarded-Encrypted: i=1; AHgh+RohVcgboR1oaEa2JXE8iBasaLdRuvHtAvcyGedxZ1TR9zyev6fCIL2Cv331ABv2MzXhLrBpdrnb5X59JA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxtBZhEtKTZCYbyRj2xAXTeIMUh9JwVxVrdESRiLJOP11PQOivJ
	WwPzbAvCt8/QkrVODUg74dZoHc4tvm4nbTumtswCdE4tUtsr+OV5xTn26DnhOIRjIIj+39WOBhg
	akB2gnoE6L/UKWhda8Mj5zzOImDVo4A+lCoGsVGckOewOsCquU3LcXYPpiOpvIHlMcA==
X-Gm-Gg: AR+sD11KpR5S6lwQJo1OiXHVQj5aC8ExSClnHEUOe97YIZioOB7LRWdhpt95NEjIeCF
	LRcfbby9lyf5caYsjQl/8Z9lvxGBfthCKQIh1/F7SCfF0Ozul0SJTszP+rXzOsFg7NY9HqBhV6F
	r0xB6tIZYFio/3tmrOFyJ834arI6PeH+86QYbchhEORE3wRn4JrtadioXr6M8aXGkbp/ZM7VYOj
	oyK75UeeZNCqEu2ao1+VcCP9RaKY8kqwBpqw2Ub9OK3hAtrq9O2WkcvY2zwKMGmObiyjmKGQENU
	1ds1ZorBiORwdf/byesXU/j3A++YqXaKVQJ5OqMuFYGjKTqj069b88IO/F3YrbGGO1hSseAzYpI
	F/E/u6trrbzvJka7Wh7ufae9QnqXd6kZG
X-Received: by 2002:a05:6a21:338e:b0:3c3:8fc3:5373 with SMTP id adf61e73a8af0-3c44b1538ddmr1900236637.35.1784790071984;
        Thu, 23 Jul 2026 00:01:11 -0700 (PDT)
X-Received: by 2002:a05:6a21:338e:b0:3c3:8fc3:5373 with SMTP id adf61e73a8af0-3c44b1538ddmr1900183637.35.1784790071470;
        Thu, 23 Jul 2026 00:01:11 -0700 (PDT)
Received: from [10.206.103.83] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d13003f12sm21341064c88.2.2026.07.23.00.01.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 00:01:11 -0700 (PDT)
Message-ID: <71649d73-e7f6-433f-96f6-a9122c463d70@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 12:31:05 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] media: qcom: iris: Add request key frame support
 for encoder
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: quic_qiweil@quicinc.com, Renjiang Han <renjiang.han@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20260723-dynamic_encode-v4-0-5fd6bd549ead@oss.qualcomm.com>
 <20260723-dynamic_encode-v4-2-5fd6bd549ead@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260723-dynamic_encode-v4-2-5fd6bd549ead@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XNkAjwhE c=1 sm=1 tr=0 ts=6a61bc38 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=BkpJrCez7YhOQuFup28A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: MJSdyRaZlwoTRU4iNxSRyArFSeEl13aA
X-Proofpoint-GUID: MJSdyRaZlwoTRU4iNxSRyArFSeEl13aA
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA2OSBTYWx0ZWRfX5iAg0oBSzrmH
 PxNAiS8/rFYNgcZtefvnGuaNe/3is9AGj5t5rbcq+yz+YzUirQDWhYU0NBNi1yNfp256qTxlo8B
 Kcs3+9Vx1UZh14fpoTQYniHcR1n7UC8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA2OSBTYWx0ZWRfX34939keOk/wY
 cIMed6RscUk53OyOil7sUmmxzkshYMLz0BNFiMuvbSlRefz5Ynza0umNknMYI1TKBmvt5EXGLmm
 gjo23/wahawqOR1LWoWhQdOzu14LtR7CAtDrwpRKa7KOsAdMnaDjX7o41i1RD2zBSJ3sY+F2FVk
 rw0dj/2r8fzoP/pig7WpmWM/v9jI+3freornc/ms9poN7NfCg0ddoMH4zbQiAohFUiTT1DVCoBc
 sl6kW3ILHPuTXHtQdNdj/OtV6htlHFCf+wB3gGNOrAkmmkq+T8ncowZ/5yyRcZ45tGlZgS6BRQe
 sUQ4a2MKc9dUKW4ya5ZmLexMliykQbrMf1c9n6SlzGVIJOGWDcl+IQFVa5aitSPX9mbBVBJJyUm
 X+ekA2m0HvpGYagdWyuGJ04m++/m3D+WnY2QlY+SNizDEfHXob3AyREbhSIzfJOvwqEPSXs0mGQ
 9uneJBAfvQGJzdfBFKg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230069


On 7/23/2026 8:25 AM, Wangao Wang wrote:
> Add request key frame support for both gen1 and gen2 encoders by enabling
> 
> V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME.
> 
> Reviewed-by: Bryan O'Donoghue<bryan.odonoghue@linaro.org>
> Reviewed-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Wangao Wang<wangao.wang@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_ctrls.c      | 22 ++++++++++++++++++++++
>   drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
>   drivers/media/platform/qcom/iris/iris_hfi_gen1.c   | 10 ++++++++++
>   .../platform/qcom/iris/iris_hfi_gen1_command.c     |  3 +++
>   .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  1 +
>   drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 12 +++++++++++-
>   .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  7 +++++++
>   .../platform/qcom/iris/iris_platform_common.h      |  1 +
>   8 files changed, 56 insertions(+), 1 deletion(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
