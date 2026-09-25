Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E269B489FA4
	for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 09:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790330230; cv=none; b=iECRKsd5bijfGtcAulyBJR0WbCEdKF43EOh3vUVRzqnGu9IDm8fri53i4RZHUWOnpizmoE+R/1ms2ZK3xWAubpjrE4+OfDUW85MbJKm1M3nHs1esU7mmKnyALlqfeUBXeXIVBLnS4+GGK2GP0aRPhswrVONUUi+BIy24FXiB4AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790330230; c=relaxed/simple;
	bh=2GSHbF3YXVluZAKbyVS6Nt6058MWLjB86rDBXAHt+ok=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QbnyEGyZGm9iRb1I09vnau0j9kvP0sTeVzeCTSLqDcxP44LNM+8yWzZx0VO95DRdKuDINgusIwT6BT/upNXMinE6aQ8K5Yt1V3JG8RjQrTZYwST4JwBM9yD9TCTKQpezpmR7LUNF4ZhuJ1jYr6JXG0hohBbaoT5m1up5XbRuqaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gTXR5kR0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iS7Z9bAY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gTXR5kR0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iS7Z9bAY"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YYYE2911742
	for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 09:57:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E0cCmJXxBmFkO5YqmHaIc5Yvungzj9uhNYa0aLl1SBw=; b=gTXR5kR0Unq8X40S
	SK3/+9fH6PfVZKnE0FJlMV155Wu6TO4ZZuSwvXLTv+M1jfhqhDJp3mIy+FwCpTHL
	1tOHkn8r8eo4WGzTk0G31+3r+vxerLiy9DYM/y4nrLR9NJw8P9dj1lYUGeMKAcLo
	GARCugl6mbkfU2W30wBfobo5Jl5Q29Fa42N/KuSPBAMYQPzShV4PaWNSYmXPAdAb
	bpfVv+VtWVXCjZ73lg7ZaeY+lpkba2FB8K0VvgBBm7uPW+bL8DHyAYMX2NCOcLDs
	RZXEM2+ZHu9wADkkMnpNQ5Enl/NlKEctETmG77REYVTB/ivt1tdB+TpIErJ1Ele7
	pBIzNA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwhm511jj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 09:57:06 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-144f706e063so1587046c88.0
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 02:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790330225; x=1790935025; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E0cCmJXxBmFkO5YqmHaIc5Yvungzj9uhNYa0aLl1SBw=;
        b=iS7Z9bAY3lK9OegEYHtBsA80TJY8Ij1CfVCR/854ecX5sKHkK8fSJJvJke2+KUpaj+
         eb6RyNWGMDe0+WIvs9LU0V1/mwpGdk4n7FWRvM6XgpZZ+BLfe0TBSgWJ/eCNRSkReidB
         U+gcWWjwI4Ey6DtXbvaxN8o44DzjGM3xH5LOQmPqFoSKtR+PZDeVh54tpDwtlZ4TkmgG
         7OBL0vpSsTG9urmXOwxSiNknTMu3SRIJLqzJsHw2IjJIKMeDBVmyD+HULCu5XKahI+Wo
         /CZHmHNKABTWpBCswhQI7+K9U71iEDB6wV0rcynCpY39tCufhImD3TjWgTUrKlGBBb/M
         YNsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790330225; x=1790935025;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E0cCmJXxBmFkO5YqmHaIc5Yvungzj9uhNYa0aLl1SBw=;
        b=SOQ9jtyUuN1Bru/EEjXcX/3eYk0uuphr7Hzm2kHOO20TnDx/qOABHcTQJvxpcKxJgk
         g3a+Fo1Dx5X/yIe7N4EfDG0ZvCStpRNMlaCGfnikLSP7qp5YmAqnSBvd9EcfiWPNSfeE
         bK82KJ6eFolTKaRv5909SOQzQFapdE0UqFn7gNJ3IKRJhhU2MhRZDtgyPgjmvPOVeEBw
         CCq9B3WAlH8a3yv4RBVI9qGIYV2uL4KeYGw46xNWUA2wHAKVQ6PXux4fQOM4csTLu3O1
         JI5ShOFUrBSQ4Ll/8cx59mxGZhSDr9kmVoEnPjTPeB5QLB2HfrIYZE6tnM7GegYimkXF
         H/3g==
X-Gm-Message-State: AFuF++n/JLJG4XPXrbMkRwqJXm5XyZ8UAuggcuHMGejdFTrNaS2bVZKl
	Vr+w0dt41j10Gwd9M6ZAouQRMnjOqygBd/sT/0xC1MlLE6rZDC5gi8lziX8dqoij8+midvAHgRt
	tVPJjpuiWC91dK4Hjo6ayBS2ZfGXRRYup9eh/kCScS2aRfHaKOwAUOheHpTLYt4SS8g==
X-Gm-Gg: AYBFou0eKaecBssAGyVEfJn8PLlZ5A5H44CP8BWwBbBvPp1QKO5Z4OxE3QyReFkt2Dt
	QjWets7GAQgJzPKfJ/MN4dTPeRcayJkU0EPNSF2LKREn0tu001jFE0S6/HHkVDnRPGhHmvvqKSE
	mUBcxSTBaNt5B2106/AHIAUkVTm8B4/l110trJ4UNxlXoWEVUE2JFC75DrPFPrLH3G4qpLsiFcE
	1mwgp74Pv/4/3xtu0R6ac6HoLUGRzbbEd4APSpEYDN5FyJpoLsb9SiYN3MqAm3h3UEuh2gNdsFf
	yB+vyO3qOZeInYiKrK4qhr9odsVvmuQ4v2Vc2kQCHVEIGvOw51PGozntAV0fB4+fDGx5KaGqxWf
	9SdE7BmVl09NcI20=
X-Received: by 2002:a05:701b:4588:20b0:143:37b8:5007 with SMTP id a92af1059eb24-14504031b64mr3802320c88.2.1790330223785;
        Fri, 25 Sep 2026 02:57:03 -0700 (PDT)
X-Received: by 2002:a05:701b:4588:20b0:143:37b8:5007 with SMTP id a92af1059eb24-14504031b64mr3802280c88.2.1790330223054;
        Fri, 25 Sep 2026 02:57:03 -0700 (PDT)
Received: from [10.204.65.250] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145acc45f03sm4731779c88.7.2026.09.25.02.56.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 02:57:02 -0700 (PDT)
Message-ID: <5eb29865-5d14-4fb6-9d79-5e2af6a08c8d@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 15:26:56 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: nord-ride-embedded: Enable iris
 video codec node
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260919-nord-iris-v1-0-94428761ec06@oss.qualcomm.com>
 <20260919-nord-iris-v1-3-94428761ec06@oss.qualcomm.com>
Content-Language: en-US
From: Gourav Kumar <gourav.kumar@oss.qualcomm.com>
In-Reply-To: <20260919-nord-iris-v1-3-94428761ec06@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: f7s4cMy-obZ_qScuCwQ2B_ySFepftqGT
X-Authority-Analysis: v=2.4 cv=QYnzLcbv c=1 sm=1 tr=0 ts=6ab64572 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=yR8J6TAb7IqefvQR2IsA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzOSBTYWx0ZWRfX6fuIJyGIeBRE
 wpyMgE1KQ/5f9OdisBfOqMSUmzccCb2qSF0exIYdyqv/dGDLalP/bU6IM7cDbyRL/t6mUOIkex/
 V12u51P0cH8DEcO18+JDkNd7pIEHWoV7CNAL/yX/7FiJNoI++WaryYc91p2HRGJ6TRrDz13z906
 nQrm6SJmZTkHasooHGnZoZjl8srqqLxab0zxTUmWozaqKZzn8EQNCaBGZyCOH80kEzIHBbRre20
 Xnr/1OARMrxYfhd6DiAX3ZyK6jt5ox8ynqEAwQyWqpiLGStH5KFJGlNDoKXjiWr9at9jpzVr47m
 fNc8pSrJ7ss89Xjp5lo292P8ah/NpaYwLfvbEqa/X4GCvEJ3ryCRhR0v5b/kBTANtLwXNREE5SM
 aguhtl5fDBrH9OLYjKZ9ZcooJ6MJf90PCaQ1r/OnCHkLoZwlEolRvoS4Uv74B82NVK6LFfHStiT
 C3uPbTjDqcdUrM0n6ZA==
X-Proofpoint-ORIG-GUID: f7s4cMy-obZ_qScuCwQ2B_ySFepftqGT
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzOSBTYWx0ZWRfX5SzRZV5zHAsU
 a6L81aYrgRTc2q15hdlEv7/OPafLagN0NxFW11HOaTOtRz1XtCosAAOeuYKzgYgiPtDxstgok0X
 BFvL8H9BN4OQL68lDFDwo3suWZkJphM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250039



On 9/19/2026 10:14 AM, Vishnu Reddy wrote:
> The iris hardware block is described in the nord SoC DTSI, and enabling
> it here allows the media iris driver to probe and use the video codec
> functionality.
> 
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/nord-ride-embedded.dts | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
> index 2ad26902ffe6..98dcf57652fe 100644
> --- a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
> +++ b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
> @@ -442,6 +442,12 @@ &dp3_phy {
>  	status = "okay";
>  };
>  
> +&iris {
> +	firmware-name = "qcom/vpu/vpu36_p4_s7.mbn";
> +
> +	status = "okay";
> +};
> +
>  &mdss {
>  	status = "okay";
>  };
> 

Reviewed-by: Gourav Kumar <gourav.kumar@oss.qualcomm.com>
