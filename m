Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4026D4915BE
	for <linux-media@vger.kernel.org>; Tue, 13 Oct 2026 06:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791871595; cv=none; b=tEgRUKUjsFCXh+i8yYKQoB8Lr1lNnWgH0lrKw5VUWwD/Ic22juOPiP2M8udeV9B7JXaOMfQEDWnvsBRTLMjOMEtXLAkW518Y4HBBbWFLs/hnNpFO+0S+Y3/vUw9yYgBDdkbXqtIlmHeYXbitolqZZAhAlyfIqFQPVCjyw41na3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791871595; c=relaxed/simple;
	bh=jKBCUCn+td6u/3sbwm42C8Jz26hnQBdGnVitYLh9jlI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PvWpthNykQYVvdYEkYChzLqsVF8o4/I2MyutrAwhoUI4kUm1bYOcX/HwlBkNPTW6O/Oj6Lme5PDH8nNlTLvoO7YsEcCd+dZinJlSxdjm3TdjGI9stmvoeUqTNGhY05+4j/7eA5KfUUv+B5llWfBQR/438awC+wM1kdDe5AEFtQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xp6MWfu0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Oa1WjjRS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xp6MWfu0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Oa1WjjRS"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D3xCfH3475951
	for <linux-media@vger.kernel.org>; Tue, 13 Oct 2026 06:06:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lBpEuv0VacJ7/LOvL3HaJpLo8m8Hmqbr7rbjKNUqTB4=; b=Xp6MWfu03rxCXJ4X
	9WoxFhM/UBuwwDdjrTmhhS4hQxjt7O7WKG7MLK2BMtKMMjRpkJWC3or5TmXXgOKa
	lGX19fmYFMpkryFjBG0drysSKqO8kbtOdQX8gD9f6WpUjRsUMbay4u+cV1xbDgJF
	Ycs1r24wen8yZwCplQ17VSBqYJxFb614Szrg/ynnYXVp52aOr0utTttf0NaE3HiF
	Xwu/UXpjh86KjAi1hpmtU+RYGMLA5fpc+NHcZZJEJVCQCe1M3+MJYbU5S3VTX40N
	pkPEvWJldnVl9Kbz70Y2tc+9fgnrFnqV9CtJTL9IQ4+SyeqzZ6vv+1VPYFTdThs+
	nmuvGA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9d7j8e1n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 13 Oct 2026 06:06:33 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35a4d2e39acso6743799eec.1
        for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 23:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791871593; x=1792476393; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lBpEuv0VacJ7/LOvL3HaJpLo8m8Hmqbr7rbjKNUqTB4=;
        b=Oa1WjjRSY5OzHOtJ1Gf23VzPi13ovkWhurUo9ZqEooZrVdWnAgHIfSWeag3xF8dfwx
         cRLeWjzcFKowB7fpmPlRfOjLfH7mxIM13qyPXoR5O9AITaGBIsgWe7Jn9XCBdIiQgJRh
         WrI1bP1zI+0eK27fv97cSY/xivxLnAJJHuKtFDgn4uK8/Tn6n+959IqKFNccR+Kt5o+l
         T/k5cAxMz1KWiit//ETHpqku92jUiJ1BzRAWVTSK7iaydeCP7F4z5RP965mk9MI3yWFx
         IEM7bsSjc09DwK5NoKStyA36vc+6d+ypt7ryMIy1ecWmAxuQORV4Ei5xX9fk1UOni4lj
         tUpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791871593; x=1792476393;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lBpEuv0VacJ7/LOvL3HaJpLo8m8Hmqbr7rbjKNUqTB4=;
        b=o6YQdYq6Qr2p9kLdcTCqeftaLv2ugBp+JDwZGVS5Hdbf07LMW8Oux2V6+HwU6PTDEP
         2k7B8mfVPPfkxhZpXQ3pO+440pvmXWz2VeUeypBQ0RO4InvOfSegFFuOBE/HUnsklkWw
         v/GACJCtFnO0LlcyFKRpGZtQr8Sn6jIc9sEqXb7CvcIcF5Jqc1P/hkB9NGuU3GLf4dq7
         H4hfG24UYhAmHwiNFkrLIJk4IHO/HI9v8g3oc5TtlNydUCrN1Ymfpun35V8eBpTsbMXV
         1GvJVoh/LiGL/AECsZTwRBwUoSbmog2S/bLFjNEBpeIYiDRncAoQIcZzxu9yJ/IywMb6
         wo8w==
X-Forwarded-Encrypted: i=1; AKwUvBwHuQFospv6rYEt+KhJtGC/A3JqAdgXjZU1fvXg/dkBB10JgofY00NpT8iOGxpUTd6SyOyJF49wwFlA+Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYKDnfJPzlMZ3D2KkVA8mce7jZt1Gdjw22bHxi7F2MSErwr7XBuS
	P1MeKXQIPUnoeBtQLTSZVHJM0jHfGgVl5mxbhUU5x2habVOAbQRyLB/fF7Tx7P3ybPeKvYXjffs
	3Q/rPz6DtA0LveWVj+UKQsy0BJMV+Y6AvC6STRyYndBz6XXQ5+LRo9q7Y0aBZ3HFs0w==
X-Gm-Gg: AYBFou1RPXZzxTtLdm9NPPNDm1oc/dU+5LhNV9q9dbXk6Uh78C0NwxqabY+hg0XLt+h
	WCZDfmvOM24+vGHb9AwFd/OpjdYshtcYUiBgFW6Ut8NkwIMxOGVhVEvxwV0og5hZuWZ16g1RUhj
	NZeaBwtXrCSccEx9sQL2QiNDquTOLKODcQ7nhNIF44SxBKEDjkvEmt5vQpEuqUChpB/47cunLN1
	Rt7p2JWaAKKvQFytmHM0R9WH6Gw+BRKThnoy5wYPiJO5iyXbKVUvkVDtQlj97u2b8ITrEPwVi0e
	kqM9AaA4ltDTUPFlodX+vzcNpDsK1OTPREgTKTP2l2hp0xzann3XIUg9aA1VYk+cmzNCtIFwIk0
	25x959onMIfmdueK4e3/g1ACMI4zQCCGDJw==
X-Received: by 2002:a05:693c:240c:b0:35c:dd03:55d2 with SMTP id 5a478bee46e88-35cdd035d62mr237977eec.26.1791871592455;
        Mon, 12 Oct 2026 23:06:32 -0700 (PDT)
X-Received: by 2002:a05:693c:240c:b0:35c:dd03:55d2 with SMTP id 5a478bee46e88-35cdd035d62mr237937eec.26.1791871591944;
        Mon, 12 Oct 2026 23:06:31 -0700 (PDT)
Received: from [192.168.0.172] ([183.83.141.157])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca1b53dsm37232595eec.6.2026.10.12.23.06.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 23:06:31 -0700 (PDT)
Message-ID: <43f487cc-c8e3-4993-bf1e-41e3a9aaa7e3@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 11:36:23 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/2] media: qcom: Add support for the iris codec on
 shikra
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20261001-shikra_vpu-v6-0-37143dc1bb9d@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20261001-shikra_vpu-v6-0-37143dc1bb9d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: kqYpiARu13XxypnJ5XBV4h7vJO-iJcfR
X-Proofpoint-ORIG-GUID: kqYpiARu13XxypnJ5XBV4h7vJO-iJcfR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAyNCBTYWx0ZWRfX4iIRxeyXHVyO
 js3e+6MSEVs53bXySps+rf0QHI4bLRVoEY4wjC+aFBMLCO+22e/g+z6Jcc2U68XAIAEn18bWdS5
 P9F1pj/wPqyavSNLA3VlH1B3WPt+g0I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAyNCBTYWx0ZWRfX7q9kirZ0M+sS
 k+6wmlH5CX6def0sppVgpp2ujseLf8uer0B7PANy+UQPF4vhZmVRk9yHQxbQsJKm9CrFM7iJjM5
 G2/KrZEvMOo3ZOSoZWo9agaUnfeS/HUWO+N1EZgCmpriTxxDhvoG8fhpeUe4c7ixQf1Asexgfk1
 8sA6BgSpSjIj64MYZBzn3VKeII2C22NVozDhXxOaE9/alFdNymef2HVTl9yBB8DEIs7JPVRh2eT
 Cf0/jJ/vpe7PSNeyKrI60usUF0Uos9Zy//UQh1BlEE/mpGnXT1RPYdOBOHHUagLudS1F/KP3/hj
 SLzUOVznufAk/aC8oRBXv+p1zRWJcs8ho5Qeky6397lNTu9dR7s7BiOGNIYay2yT9a447+t4Xh+
 24HhhJw3KpHMcin84zl+oDvrbGvmMMKm8glr6D+4sqK5fFNI/LGZaK2e0vVnpVtChyFrSTm05lK
 FcEo0ochx9Z2QTMorrA==
X-Authority-Analysis: v=2.4 cv=PMGaavqC c=1 sm=1 tr=0 ts=6acdca69 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=bQUMaMctTmycBtt4xuJn5A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=Q6wxVgh2rZIxxIaB2AUA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130024

Hello Bjorn,

On 10/1/2026 7:11 PM, Vikash Garodia wrote:
> Vikash Garodia (2):
>        arm64: dts: qcom: shikra: Add Iris video codec node
>        arm64: dts: qcom: shikra-evk: Enable Iris core
> 
>   arch/arm64/boot/dts/qcom/shikra-evk.dtsi |  6 ++++
>   arch/arm64/boot/dts/qcom/shikra.dtsi     | 61 ++++++++++++++++++++++++++++++++
>   2 files changed, 67 insertions(+)

Do you plan to apply the DT patches to get them in 7.4 ?

Regards,
Vikash
