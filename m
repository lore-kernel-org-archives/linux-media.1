Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792477880;
	b=TbzOi34OPx4n+Cj5uf58u0Quxs2EXbsJlr0B5nop1waMp29aEKiOyK6aPXg1lByXi67Y
	 bRPRCPP/z7y2UGG6/DodsS5+wfGvsdS9RVmcGxPF+pOgPuRBeq4XQf43ujATXlo5rwGH3
	 wjpUx2swyCuyAhKK+eBg42yLJL9m7SAgPNHv1fNSk6RMYn5hFYKQxP7fZ5XVZ7jqbuhXA
	 7Tr44SmLcdfwOjp+nZDsu9YXHrN2Rlmg5cBp1g2SqwYkAyiS2V9YOr99pvqAfKFktzSam
	 QvC7xuxK9ygHOinROkj8X0z2qiDFurl86JRbhNRfeVaPpgoqrpQqxOzuPFmy8WOA7PA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792477880;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5qeBktWCqD8WCi35BHFWCxm3SbhsTKYAFb872H55WAE=;
	b=Ti7egcLFgIGKrgmXH8lhh0SVGGF8v1KTIM1w+kmuiNxkSIvn9LGRBXY3jlRCVhrz83QQ
	 pSqhVBGJxwui0fEiRo2clCHCtK0wMustED8bZM75uhZr7mJ+JbrikdlElqGg6qeLyNwYq
	 oyo0AAubGkXHdzZBJ0IejotxIXduyxawwoSIUvW9IxuwOyJu+qseBMVCwSUkS+ULBhjG2
	 i3evfHtvbl5T1IjWpiMES6nTHkM/gokGzyvVov0dZQPiFyFzY6PuL1xMvD+umh2eSP/lE
	 gHdnPirx9I4VJSJzZLjFbZwtLgcSn9MJI8VDZICIdTKxj6nX+w20nNpJ9r54/2KELow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CZfoH7RQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KWjDz2O8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F44B606A325
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 06:31:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F44B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CZfoH7RQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KWjDz2O8
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tNtt3306125
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 06:31:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5qeBktWCqD8WCi35BHFWCxm3SbhsTKYAFb872H55WAE=; b=CZfoH7RQmv8/vtfE
	gNKgogaPsrwkO7jBSRgkoIZ1WgWVsfNwRrHe/vbbHApbFlHyp6jqOtDU1hcbJ7FM
	Lh9iQFSavTU52kutaAeP8QPhQZL5aX03wau9GBdndavqtstEZ/Dvnaf41kXOSaOQ
	Uo0YYVjmexQU6r6jjUyDtoWg8Hgxl2X9cPjEImE+Jt/aeVX92aHWetM27rgoaMrv
	is6Wnrki+WKvhOPa6l+osIkfNMbz3XWYbqk71qnqWDc6CB6lN8lv1ohBFkbL0j2c
	KSy9zX4eP/epdIU1Sw7bUG97RgRRo+U1QBzF8W863ygpl7AT4cO9o77uCtEgAopu
	ppppng==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5ss581-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 06:31:19 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-53568f05f8bso9128141cf.3
        for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 23:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792477879; x=1793082679; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5qeBktWCqD8WCi35BHFWCxm3SbhsTKYAFb872H55WAE=;
        b=KWjDz2O8HU4SbDGylmcQeUUPmj1Qjp/+45EeNyzqA/GY4mq9BXXuf1pcFOphyThsny
         HvA6iOpDbixaGpWOrdrLEoB4YmjwaRlZA5Y0Wxa7IjZGleXEjUnUCQBqnSIroLyYfJCP
         NDRn1GTHuKmjoPjYJYRAJ82xA1vNnTdpfWkkYOSlDpPioFaseYqyzgOFMItJWJ4eqZ/j
         /8k76A8npyCNl2M+WaI3UK7jD+xGQ5i8tz1iy9wmrF1QqRGGkaaYfIDsv5ZkMmtWe/MV
         6vqgVYw/j+N1qRQn4dHYxVybR68Qg7XYRdHQ9l58gcUdnN98b860W+rHWA5U2bZ+UACT
         lDug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792477879; x=1793082679;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5qeBktWCqD8WCi35BHFWCxm3SbhsTKYAFb872H55WAE=;
        b=sq7CSnpg54zdJl9fHqjnbejlMGHb9K6gGUsr+osuYa+N6jiUd36oaObQ/FArKafxPi
         q9kTDMswQ9/qILez084JmayyW3N3DkitEEYxuBRtTKoTPaQYO7Yf6gCa2zJpjz9CbwLT
         DdIruFG0GimDNnnYl/bRqaOnzwDmaDOh5LfogosGFKXJERdqnKT70edrsF1B7mIf1ttB
         6jYDrGgDwQ+Js5sMxTGZ+tlux1tP4lglMvWI2IeMAMvBdHq9pUqOv6IJjnj0F1ZtMg5w
         wcQxcYxTbCaAMcJV5DRxjpQq5ECYn8tD3rBtlaatctTkHMSRca64wASmw0wDmzHFYLxT
         5uPg==
X-Forwarded-Encrypted: i=1; AKwUvBxCwD3vm1NHV6ObllqNXAjz1n6D5u2Rc46KeYlNOAvTSZdwuWwPnyHYyG138WT5n3LG9XF1WSJYQiOoiw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKp6ubhkUSoxtWG8nJrVKaFw7F0pRyT3pGWso+5M3o7MvOpFmOw
	DHDNYX3BvxQZSCQjJLHR4CebN6kkFcfBlficMXpYPKEe3PvInQ+F7e3Dh2UnAJqfFr7e9MdaIW9
	XTZugfIA4trqX98hiSA/JXMGK9V+LKWexDmwlcMiJOIvGXUUgoZZj+fd6Gm8IK+d5sg==
X-Gm-Gg: AYBFou27MKwjm6t46lODedCaWVOOT8pAIO8TGLh1AWTTXTKslRWxfbScpYxN6porGWt
	rahZxXdwoT4pjvI8HHAEGgQUvVE2kI1CfaTGUhYLHlqsfeSpIQMsMYLvO9uMmnGyAGqzOVlqoN/
	2ZzCzSx1Ow6Toqr17qtA9OeoyK4dZ9DFfo+plDM9ontj8WroXC2try1TrO5CeScqVp3c1yzSxOa
	Vu5tJNuub7FrYtYmUWPH+pXUOwmptNrx/FrAHIcq9v3Cv3nFPBNXzrJlyNgDPIX39da8qxG/7KE
	un/zcBWnaOXJbOoyCf0I+R6JhuhGhvDXhGzpjdAVZSDqS00rQqfd96A+jPa2Yb+HngphFiyTMam
	gRfqBIvr5DEpr8RE6HJwICw==
X-Received: by 2002:a05:622a:14cb:b0:51c:2324:666 with SMTP id d75a77b69052e-536460e29afmr169134501cf.3.1792477878555;
        Mon, 19 Oct 2026 23:31:18 -0700 (PDT)
X-Received: by 2002:a05:622a:14cb:b0:51c:2324:666 with SMTP id d75a77b69052e-536460e29afmr169134161cf.3.1792477878105;
        Mon, 19 Oct 2026 23:31:18 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40919bc742sm447200266b.54.2026.10.19.23.31.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 23:31:16 -0700 (PDT)
Message-ID: <d1070a58-98aa-4a98-b0a1-96e974be5abb@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 08:31:13 +0200
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
Subject: Re: [PATCH 02/10] clk: qcom: gcc-msm8998: leave the MMSS QM clocks on
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Joonwoo Park <joonwoop@codeaurora.org>,
        Imran Khan <kimran@codeaurora.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Ilia Lin <ilialin@codeaurora.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261019-msm8998-fix-clocks-v1-0-370949e4d8a0@oss.qualcomm.com>
 <20261019-msm8998-fix-clocks-v1-2-370949e4d8a0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-msm8998-fix-clocks-v1-2-370949e4d8a0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAyNSBTYWx0ZWRfX+zrVJAUxMuGu
 6kAn6w1rdToxUxma/A1xX6kE8tFG3aEybCYn+OGxOJojM5tPsQVJLfuxqnBkbgRscAcSQ94NpCR
 RIJmy79xFCD+VOafjhvhxjEyglqocFPu6QtLeG8pbuwDBsyDsnfDz1LIR1JB6Mn4hUkTMuDcaSf
 gi1NI8RcPhwjA40DPWFQ7cnB9foe/y8YJ9HTa0Vj9GF3DV93tlszN7OjmmknK0QprUR749IqkJ0
 ND7Slr11rGQxDoQslFS4A++0am+rJ3P+VcfCLI5Gmyc/m823cD45OyccmyGFU2uXjyI3UGtans2
 QjKT1QEIIXzmKkcsPrbMT/LuqMFYKiE9UldMIhscKrt/0z8VEcBAyuIE5WrxWzAssOqHSdmRg7h
 3wUY9Deru4tu73YjinQY9022pFcOd6kgMI024QDnsUzG3uQbitb0WC2/lbWnfRY2gzRGS1Hmyk6
 UIt7APje+F5M9wU0eGQ==
X-Authority-Analysis: v=2.4 cv=fIusTpae c=1 sm=1 tr=0 ts=6ad70ab7 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=ldyKz4HnRpUghmHhsoIA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: Y6JFnR_8Us2sPYHfeyxE8RRb3qPIDeCA
X-Proofpoint-ORIG-GUID: Y6JFnR_8Us2sPYHfeyxE8RRb3qPIDeCA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAyNSBTYWx0ZWRfXwLrzrADkq1fw
 I+kVJVvjdSPikToyhTHJ32PRDIuIaPkD7fNFI/ei3UUQLLbvCJn8D8c3Vi8uGxdgAx8IP6q6rsh
 9nx9nN6LzrZ6ph40NrkgtSTckcO996c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200025

On 10/19/26 3:41 PM, Dmitry Baryshkov wrote:
> Booting MSM8998 without clk_ignore_unused, the SoC resets while the
> modem is being started: restarting it in a loop takes the board down
> within a few dozen cycles. Nothing references gcc_mmss_qm_core_clk, so
> it gets gated, and keeping just that clock on is enough to survive.
> 
> Downstream never registered gcc_mmss_qm_core_clk, and dropped
> gcc_mmss_qm_ahb_clk because XBL controls it ("clk: msm: clock: Remove
> support for the gcc_mmss_qm_ahb_clk clock"). Treat both like the GPU
> BIMC source and SNOC DVM clocks: stop registering them and enable them
> at probe.

[...]

>  static const u32 gcc_msm8998_critical_cbcrs[] = {
>  	0x7100c, /* GCC_GPU_BIMC_GFX_SRC_CLK */
>  	0x71018, /* GCC_GPU_SNOC_DVM_GFX_CLK */
> +	0x9030, /* GCC_MMSS_QM_AHB_CLK */
> +	0x900c, /* GCC_MMSS_QM_CORE_CLK */
>  };

ideally this list could be sorted

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
