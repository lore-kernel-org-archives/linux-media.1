Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795626590;
	b=VzXNcduxO3qPrsOISDT/5cBpTBiqkeMRuyMJVMPw+xNYgXlTt+ezQ6vXns995nJmliaQ
	 rQv6zRzBu9/eExtT3kLAGY+806RART7cY5ScO1qe/UbZ9uL1i4aSAky0hEL01wfO7/LYb
	 95wBH2wW2bTfIXsoH/sjnbsy/bgfsOwnqbWj2BFXWm1sGxl50VZwyHL4FfCod2eeGz1RT
	 mhd1B5e/XH1sQpMIhE2KGQ/N6qGTYBsd7XHWFrhL69wMsISgRrf2hFdKg4Csgg49rSqK4
	 khWgAUkh7RtZ2FgwMJe8e8ioDTO4oxFphQzO5iVrlXQDVD/HI+T+i1pgir/EWBewwPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795626590;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Ffacn7nRNS6dp+vdW4d5BImSYl5nd9SJIwmzdMpCXn0=;
	b=zd4/y6yVVPPDg70EsBw/WWsQGTMOkSKEU+U9dbVwcA4FPVx1agCx5awfb6latF1ODs/w
	 gQ70Rd9aKKb53mB5Xj2gTS1HJqqG8YLp4CSyOEe1u5tO84lgm3MO2CHnB5fZ3/M3taufA
	 6i8d8WFQH8wC/0zWoNIc8v2SxHA8NmrxsHU9zgmL+RY6XDh7S/CBA3H+8/mBuCBk0rcYF
	 4i4lpkrLM4Ncp8ypZBMM53tZHdtj/5BqNSo6QTSSH/wzcZEzyE3F1yipHcADAGRrLKq9+
	 4hiDIuy18UetQ6jEquDW1FqBt7jAPOO8jLQoFj3QHt3WMxIuuSLB9HZ90UpSjfNz1Nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dEq1AXIv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g8W78Mqa;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8BD606A323
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 17:09:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE8BD606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dEq1AXIv;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g8W78Mqa
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APGQERr3007855
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 17:09:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ffacn7nRNS6dp+vdW4d5BImSYl5nd9SJIwmzdMpCXn0=; b=dEq1AXIvkaQYtT2F
	PQYrsoXWszTV7fsnNozEcnSX/a/6jZfyskL4ChCPeN6L1rvRUE5B2/H1Ek2+UM3H
	ykoNpBhh0iO4smAzQ7SOe73/EHdCN8LsbbCRfDeE2WROnLaoibVR7a3d6Nd5XOMb
	C91RusYZniwsKcvB/n422rECp08LMhIC48UiOKrNwshtdReIJWTnOVi5hYXXfVOO
	XR4rzSECQQvLozkP5ltDg5cIADh746d9AShqIdmHSqx6KRIFkSopUA4sSTayZPv4
	9HJ886IJ7aAodA8adUjOQCXoR6QHtP/g/TOTasXwBNkmDRtSh0ZEpFC2/1LjEVmN
	iAgb/g==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vuksy6s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 17:09:47 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8b3ad09ad82so80380997b3.3
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 09:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795626587; x=1796231387; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ffacn7nRNS6dp+vdW4d5BImSYl5nd9SJIwmzdMpCXn0=;
        b=g8W78Mqa8iHavISiyrUXt5jKRrWyEGScHZP8L64BXjl3zptiPOCYiV0OqBfniSP0Sl
         EBFil6yycGg1XUHSU3ianHCdiESSCR+tFmoOp3xy9/GCnVDU7mm6VQnAfjZng6CzG1Jv
         V5eJfizLi7Rv12fuGsEPtCfW88VnRmeQY9GcE16NKrGWltQwutPf07mZZds/M8ofnz7Z
         t5htaGtYemmj0o2dx/xa2ZcZOJAmlJt4K9jsCRY6IaMPEBrI9kwR1Uwe9dr2aeEaGAri
         aPnSTlfw6u5mDZZa+SkpTSMDL6kq32XwV8i1G0F261NV+DOWr/b2xCerJ/RMLmGSRElz
         16eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795626587; x=1796231387;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ffacn7nRNS6dp+vdW4d5BImSYl5nd9SJIwmzdMpCXn0=;
        b=dfwjXsSrMtkwg+HxmptfZ6cO6YOe/ikLJGlRlq23pWFGbqNwuDtcfxNUPTWi+Ad0q1
         BwZSMuUBiCSbmKieD5aYw3zWsACOO21Op59Rv4FpsVKYMMx+N5ZY8fYt6mOmuqP2Qgr3
         yDm7KcoapgYDjfYxyEQWoTtPfO4y1CHN51IqaxRWU43e3YubSrmE+7PiGFABq4YvHk8+
         GEyIW0ZE++IEoP6grNl5c1zXZ/oBthQIAZ4CINFIP2P4juf66/JBxwZn30FCbTIW3wOm
         ncMvqcyCszxqjjG3lUI3Z9k6bjEX6ANb32k3pjtxMU1krWTBLh6NkgqgwqucRPvqQ9pA
         S5Cw==
X-Forwarded-Encrypted: i=1; AL+hErHRPz1c6Fg3LHQJTCfuSmKkABbCd3PthrITRaVFuVtjgzRYzwrKNg/TM+hg9DXkV6U7mwUUSCGmqBFXdA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/6RMRvNchZ2fGlWZ/UZRsks6x5J5TcvxvsLMLQkRuY//RrDMob
	9Ynh17AQ6RRlxRkKDynQi2xd5Sa/dbYQOUKP59jJ82lKo2KthVVNQVWuaxmRV8aCvY+osuv/SAP
	sw2iZPqczVfWwX48M19EFt08pQxDZMkN7G8DrA4CEjXSKXo8+0zY3B3mSCaGu0697IQ==
X-Gm-Gg: AZFdTZcOYsLiuobnDaHEYyCj1vEfYreoNW3hp/m8tiigJcNelyLTVLIaRW4rtgheGeB
	IbNmJTuCzn2ghGDaMev1SvX0dZeltU0zfjQEgAcFjc3CALFMzuU2n2fTJUdYijQlBumESX9ahpj
	NqLtLH3RzbiMO1a26tyKhWxD6XqXAcpUCXXspZpQOwdP6j2hbJLGS2H1Q5CYJ9zz6R79om8KeQa
	iocLEXp9nzOzANyTzrAXQSmDzWxAQkmq4aJ/bCtGmGHgigtjfjE95tCxOCrWuKGMRc3RHo3IqXM
	bEKctRprjGzWS8IosPfPAP8rps7m/P9/jc1Mcm/ReW9pgyJ62vz7zD1SmRgR4EpmdJKYTYmvbCV
	dv9ZHqXwRvgwDWZWMkSKNO4JYFPkPLw05ixGAfnqoaIw1xVfGc2FzJWGCS7EwRTgQPKdVVZr79A
	ZL1nE76wX9ORwh
X-Received: by 2002:a05:690c:7342:b0:8b1:46a1:2893 with SMTP id 00721157ae682-8b520319b8bmr69712117b3.6.1795626587242;
        Wed, 25 Nov 2026 09:09:47 -0800 (PST)
X-Received: by 2002:a05:690c:7342:b0:8b1:46a1:2893 with SMTP id 00721157ae682-8b520319b8bmr69712047b3.6.1795626586828;
        Wed, 25 Nov 2026 09:09:46 -0800 (PST)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b34e9c3ffesm19399409f8f.19.2026.11.25.09.09.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 09:09:46 -0800 (PST)
Message-ID: <f255486c-d4bf-4076-8fb8-7c6caccfdfd0@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 19:09:44 +0200
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
Subject: Re: [PATCH v2 03/12] media: qcom: camss: Add streams enable field to
 camss resources
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, Hitesh Patel <hitesh@ebytelogic.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
References: <20261125080001.2540101-1-gjorgji.rosikopulos@oss.qualcomm.com>
 <20261125080001.2540101-4-gjorgji.rosikopulos@oss.qualcomm.com>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <20261125080001.2540101-4-gjorgji.rosikopulos@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KfVHIgYD c=1 sm=1 tr=0 ts=6b07165b cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=gmv_cWQL6D0Jf28gQFwA:9 a=QEXdDO2ut3YA:10
 a=kA6IBgd4cpdPkAWqgNAz:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: f0iTxIMtiDfqQuW8A3GygVDtZyF-lSyG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA2OCBTYWx0ZWRfXypFjer3JCjpD
 XCgsl2syiQ8LyBJWQMz8XlUyedVVblCwz8A/w3AtDe9nEscDxavTtTzQhXuxSYq8hQKGbUK+35B
 JpAZHMMjC7nx/RPIabXhwQU5iB4m2t8=
X-Proofpoint-GUID: f0iTxIMtiDfqQuW8A3GygVDtZyF-lSyG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA2OCBTYWx0ZWRfX1zh63685SvKz
 mam4a+lIuuUwfRvd5F2q/Y/cm9N1i9sn5o+SEpae0mD/raGL3rLh3jgpE2f2i0mkTqNKfHqSMRz
 cZCnmJ8pyVI+VY0+eSbG6dJHpMQHFGU+Xm4ebkmEHyDVeW9FLGjY6OvhIjld7fJCCVECdc3vImc
 MakONNQ6wWP5eVYjIxji+XhYSBqA7URZwo73l004AxxWqfEJ32ymny1SsrO5dzhMDbmEpRuFq19
 DT2y8fBFiBgfsJCLaz0n99PwUtAkblEhC6wLF4bbdZ06iU0JwaoHSjAqizSWYJSox580rsO24T0
 kHZAPnDbLGEvUgB0Cl5ebgrVuHktPR5uNHFhaGNtkVuq2+X9srNpmkaH+ee+bp/Jy/cp3ul4Ygq
 AVST0d89hzBsItLhd/X362RgYsjzHnjwFPz/10C56YJwIbQNgKNshwPsqVnXueSjLSd5Nk1re9+
 8f5ODnRlBKHa6nSag9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250068



On 11/25/2026 9:59 AM, "Gjorgji Rosikopulos gjorgji.rosikopulos"@oss.qualcomm.com wrote:
> From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
> 
> Add a per-SoC streams_enable field to struct camss_resources, used by
> subsequent subdevices to select between the legacy s_stream()-based
> pipeline and the V4L2 subdev streams API.
> 
> Suggested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/camss/camss.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
> index 7564a7c46fa2..621ea2e3eba1 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -121,6 +121,7 @@ struct camss_resources {
>  	const unsigned int tpg_num;
>  	const unsigned int csid_num;
>  	const unsigned int vfe_num;
> +	const bool streams_enable;

If all agree i plan to drop streams_enable and use stream api as default, v4l2_core handles
compatibility with non-stream api so i think we should be fine. Just that we need to verify
on all the supported hw's.
Keeping old non-streams and streams in parallel in sub-devices implementations really adds
complexity and duplication of the code which is general.

~Gjorgji


>  };
>  
>  struct camss {

