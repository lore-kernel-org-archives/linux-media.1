Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792717599;
	b=Khyix8QB0G6l24YC8RtxPuxeDnlJCl8DRiQW8Jtask8vgdIK69Rdsb923Tj03aVM+gUu
	 mDz877ZjUM3dgsWW9qiDKzVDgVc9OYtniWoVnYE5RMuLG2fmvXxMVcxxOq0N2dHkw15Jb
	 li91EkIhLIwIVeusztplnClBIvmRHwNnfo4Lc6yVITN3W4KnIUrjSkZAbLtwIwjdRn4Gt
	 C1Ox+VbSucTU1tzlvDjJNx6qK1HTanvhWLo19lqeRlgkoKPxXYYPKnO4zxpX8getnZcR+
	 7Py/8Gk4pwXktJiEYXmNt5NC/Re1aqrvOb/2HctI13GviVfh9hBkEdr35TZ8opnwK6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792717599;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dfuW0wNWB+8VJLorrjVBoDy4Ob+iKOb6dWhlcZAnFYQ=;
	b=fkJTdAzGD956n27d/g4REhz8ZmkCsVr37+J0JvqbSv+iqQqvVvd0MZCSWFfrWTYnHD3+
	 iBSFcfCfFKsfZ/8P4eTHpZ12VO8LeqPhNLkRMGVE8AlVTKKHoSm1YGs2y9QQ3l90aa5l1
	 9wh1USCbZ7anv2PLpX/u/09zSzoZVkkKY0oQKYekoFTOUGeVg6B7PZxKF3zTpnLyPU+F+
	 GSiKZzGt63noJ2C/oqjbbpKI5V62t5SrKuzAdeVDecioE5wAkicFEdJlilQcj4utVo8dI
	 dp+NrXzecbBdzJMulH6buApNTEyW4tJ7Q4K8xduDFPk99N1EFtNGPVaKtElUGQ3HDBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bnIxPimD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E002nKI4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88E4606A31F
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 01:06:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C88E4606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bnIxPimD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E002nKI4
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MNa5Bp1083053
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 01:06:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dfuW0wNWB+8VJLorrjVBoDy4Ob+iKOb6dWhlcZAnFYQ=; b=bnIxPimDxayqnUXh
	GL1+VNL7lausi4gGZLDFEgRk7OH66jnQllF24jrKXDHFdt7eCoXO/rVsl+kJO/Ya
	plgnq1OPZR7X7XjK2fHrOGhdqM/q2Ic3PdnmcRsWRW7v9fj1rpQi/A/P9oNgt8WS
	UAdeOLy1239U69RmscIvZx/0LEQYDONepK0OTNmVGE3fA1ZbejHM3FOmOZxbmycd
	zs3l7SNqrrVf7wyWVsuT6Wb2CrT63tUupeEEZkyhzvAVjwE5hbIU7BWdzjUybgnO
	77wB9wLBFkW3xYOUs2CBgWjorzITB4cD1uynoUVMNX+u7muNYerXM/pcM4eFbXA4
	Li74sg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfnyw1sf0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 01:06:37 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1665200f4c2so436819c88.0
        for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 18:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792717597; x=1793322397; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dfuW0wNWB+8VJLorrjVBoDy4Ob+iKOb6dWhlcZAnFYQ=;
        b=E002nKI4G7M6QqefEkRec+t2NOXaCXOBuFspxuQo3yxLyJVEti7+GfIZSvwaB088wn
         hA3+TY1K8HyPMQEUvGa/5EeoWqJkD4/iMNkGNrYdAfxtncHL8Kj5ffL10t+D2QU3q5P2
         /vVXGRU4CmZV955fjc7ogz9C0+I4m4DfkPtCMy52FtYeXjJ9coK4FPxQ4oRxVmJvNID5
         gXVUcCxzDcYmp0r6AetlA78SHnfxif3o1wCqOgqgXYP8RwSk6CuTcwrFU1nRHz/5iJ66
         QF+jj5yBY7wAnxbXVMKvF3EnnCSXKU+NyG4cVlDzxGtABj7kQ4Goa5rvFrb7mN55dOfr
         UdLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792717597; x=1793322397;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dfuW0wNWB+8VJLorrjVBoDy4Ob+iKOb6dWhlcZAnFYQ=;
        b=irWQmzSeT+4YcHmMYkn23YEEvCeZO23IVxN28dPIJlhpoDLNKZVrpYVn9X9Za7a6Be
         0OOdenGtO02GdpUB+MqoxWnHmZZgYGXnOcISupr8q/bQq0jtynok4BgsMnl4Rcpz4GbJ
         rIZO9/U5wiDvnghFODmjpYoyVYEDtqW7fJCoCMa+QZYiBrwaomoia1lBHD01+KJkLftO
         SEY/4k6pAfHV8cuhdXfnTW+OpjSy/SckYWQNsyS4qCe44mQqomxZJDXLPcSerWctXZiY
         bk/u4xdzBmqMlMoflFHgWrphAk7kvDNAQNk48kRIfqqB1ax/Jb8Aldy5fOreYSZIKijE
         L0LA==
X-Forwarded-Encrypted: i=1; AKwUvBye2TjhTftcBR8PZG6X94AIRUqoEmuZwFfo1rJ12h794+z5YE76ObPZW4owQAz07+LU2R705cZvWU16Og==@vger.kernel.org
X-Gm-Message-State: AFq9FYLTTcc67rGvNWmcHS7kUtzNWagmx27sGpeAVmhOeCQ0p8gtLq45
	RwXOFr0W7NU2ePSQSaPVm519EY9RD1jw9UfMVZ1UIojIifm5C0YtF7PeNj534vhAjRm7/T70so6
	oS3+031o7M/CPp/glywtUU9vyE5JsfC/OmJ+4M1bnAlB6Dg2hVg64ejcesWxbrIwlKg==
X-Gm-Gg: AYBFou3NIj6PlKPI6BNPrA5AGaZp6YL0GslXlsTPScaZ0fC9TVooFJmYEIHOUc0bfmJ
	MjNl2wAhD0V+tm/cKehFymtBYYqFKctRwS6pgP0sXplsSEnuVpuZqcmEqxDJNDTooZzCqs11rBB
	CH4cQ3YZ2O7EQneaO587gJ/73vmB/hu1uwT8p6isplLBYZsYaTF9b/r+6MZ9cHJQHIzEw2fn1MM
	6lnXlC3+vD61dvaHJDi3sCDk1oHcGm+qjQOHQ02l0JCb4ApuMDnhyGYC5xj9CX6iRm20/h6ll70
	peFBVPU9VyVh+Lhx0yISfHxsLq4ZkSNP+uus5o9a4EhKyYSPuVCVpzsMC0VcGtYPe+w6lRdxCIR
	/58yuoOPHnSSJIJQ0eF01ek0mSkFFdA5mmlF2ZNubh6jkVONWwz36fmWF
X-Received: by 2002:a05:701b:465a:b0:195:76af:b810 with SMTP id a92af1059eb24-195c5cbc3e0mr1043953c88.25.1792717596506;
        Thu, 22 Oct 2026 18:06:36 -0700 (PDT)
X-Received: by 2002:a05:701b:465a:b0:195:76af:b810 with SMTP id a92af1059eb24-195c5cbc3e0mr1043913c88.25.1792717595831;
        Thu, 22 Oct 2026 18:06:35 -0700 (PDT)
Received: from [10.71.181.181] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-195eb9afd61sm1877551c88.14.2026.10.22.18.06.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 18:06:35 -0700 (PDT)
Message-ID: <7a593e23-3f35-443d-9ae7-2ebc031d41c7@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 18:06:34 -0700
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
Subject: Re: [PATCH 1/3] phy: core: add generic MIPI C-PHY configuration API
To: Bryan O'Donoghue <bod@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>, david@ixit.cz,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, vladimir.zapolskiy@linaro.org,
        loic.poulain@oss.qualcomm.com, mchehab@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, gjorgji.rosikopulos@oss.qualcomm.com,
        jigarkumar.zala@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        linux-media@vger.kernel.org, krzysztof.kozlowski@oss.qualcomm.com,
        daniel@quora.org, konrad.dybcio@oss.qualcomm.com,
        christopher.obbard@linaro.org, alex.vinarskis@gmail.com
References: <20261017041733.3946816-1-anusha.nandi@oss.qualcomm.com>
 <20261017041733.3946816-2-anusha.nandi@oss.qualcomm.com>
 <a6d8514b-269c-441d-b280-4895b5f21fac@linaro.org>
 <xGBkVr2J5eTHzEO_i4LTjdWGRO1MXGiIijMf1PGUbQ2gEYqffgMDMtx4uiNyBldbbiW13zmcxMWZYYjJ1s--Vw==@protonmail.internalid>
 <c6d963f5-a57e-4086-972a-4f04af2c5b42@linaro.org>
 <324dcc61-6085-446c-8bf7-564486f319bd@kernel.org>
Content-Language: en-US
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
In-Reply-To: <324dcc61-6085-446c-8bf7-564486f319bd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: x3DdRcsHczzCJ2-UuaDHXGNKDcmgpmjM
X-Proofpoint-ORIG-GUID: x3DdRcsHczzCJ2-UuaDHXGNKDcmgpmjM
X-Authority-Analysis: v=2.4 cv=dphOmFg4 c=1 sm=1 tr=0 ts=6adab31d cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VgxvMbUO6sPQWDWUjzgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAwNCBTYWx0ZWRfX+vGLzgZCL+MZ
 V/OfYcJeCv6rhRBjkskR499wSuOdSXi6rUTXbrCibu6eMQTpvHs7z1dTf04f4z7c8/9OSM1Qij6
 i9t9MyNy4DOBW/iPmmodJG/9/tc/Dwc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAwNCBTYWx0ZWRfX+09nIn/QsCsr
 Lew/jgK59I7NBqzAfgEz3UIaNoSWdJdP4bG1eh9/GhOMKAKRO1BrTLwrsRDCpi80rBm8x6bJkMF
 qerjbakjWSTKnG+FdWdODonc2Pdk/Chz3JKUsDJloGOSlFXPwAarDrvDjBAUrTX4E5vcGkSN+81
 P8nBKi8yJSRQ5gAAVJha2LmoTuEVWemNRvdj+S8RSj9zBpXFrGVQAyHnr78IyTJ/bcYQBQ2nloM
 9Pi+JIN7/02GhRse6zF7XuLd3rvfwps1yMCHNXeJ2yVG9GBpGOyXtTc9ITkDAmAT8TqVu7KwJPD
 jvQ2aV2VTr4AyU4UnQ4hg1Dwyg6rH9cRco7HvFQHH01lU4dWafiNm0Ys9INdzkPRs8kmA757J7D
 y4AkpnsmdJJbL5vIqN/O71TpKUK38p73f4wwMKFhVXWX6xWEAlzPKm8n9kT7HQmnKh6wa/UCSNz
 UGm36jwY3KwJQwWt3OQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_07,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230004

Thanks Bryan,

I align with your thought process. We don't need
- lane_positions
- lane_polarities

I will add symbol_rate and fill in the data appropriately.

Best Regards,
Anusha

On 10/19/2026 4:24 AM, Bryan O'Donoghue wrote:
> On 19/10/2026 11:24, Bryan O'Donoghue wrote:
>> On 18/10/2026 00:00, Bryan O'Donoghue wrote:
>>>> +    unsigned int        lanes;
>>>
>>> This statement and how you go about using the data aren't consistent.
>>
>> Re-reading this.
>>
>> unsigned int trios; would be fine too => data_lanes and lane_polarities
>> is a multiple of trios - always three - does it imply that the first
>> three entries in data-lanes == the first trio ?
>>
>> Presumably.
>>
>> That would work too.
>>
>> data-lanes = <4 5 6 1 2 3>;
>>
>> =>
>>
>> trios = 2
>>
>> =>
>>
>> data_lanes[4, 5, 6, 1, 2, 3];
>>
>> trio[0]:lanes == [4, 5, 6];
>> trio[1]:lanes == [1, 2, 3];
>>
>> Probably "trios" instead of "lanes" makes more sense here and the driver
>> just always validates that count(data_lanes) % 3 is always false.
>>
>> ---
>> bod
> 
> I'm going to argue with myself.
> 
> data-lanes = <1>
> 
> =>
> 
> lanes = 1; // not trios no need to introduce a new term
> 
> =>
> 
> three pads on the Soc
> 
> =>
> 
> The question is - is data_lanes required for the CPHY opts struct ? For
> the qcom CAMSS case the answer ~ always no - we will be attaching a
> sensor and will read-back the positions from that endpoint.
> 
> It is conceivable that other systems may want to pass data-lanes down to
> the driver because they won't have a media-graph but, I'd say we should
> arbitrate that then - leave it up to someone who needs the fields to add
> them.
> 
> =>
> 
> lanes // the CSID and PHY should agree
> symbol_rate // so both the CSID and phy agree on symbols per second
> 
> Remove:
> 
> - lane_positions
> - lane_polarities
> 
> Since at least for this series, they won't be needed.
> 
> The CSID still needs to know the number of lanes and how many symbols so
> that it can calculate bandwidth so .... lets just include the data we
> know we need.
> 
> struct cphy_opts {lanes; rate/symbols}; dropping lane_positions and
> lane_polarities.
> 
> I've no objection to the low-level timing variables myself but OTOH we
> don't require them at this point in time.
> 
> Perhaps drop unless/until someone can show a need for them.
> 
> Excellent bod, agree with you now.
> 
> ---
> bod


