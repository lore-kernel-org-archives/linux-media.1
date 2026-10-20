Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792533776;
	b=SAZRdh0GOO8an9IiPqKRNrI832E2X2tMUAMw8doWUqb9Ya0UzZhXlRqlY7cNe1obKTft
	 Gj7ugmR7p0zEVpbrkXBTxMzc1evVQDwLg5FtcvIBGbVak3U1HOIFa25jadVD5E3vZzOBQ
	 qiphMY8ckgbWg/aKKcHhtWKEHfxtoOi1LlgwWzaPw2UcbUl6Feq0NQLkmQueKVRqn6zUz
	 wlsDxEQZgeC4HChRufoDHLkhudEc5LhB0XduCfRDWbHd9R1aFq7Ct82h31gZt3X0ODEQ8
	 QIa+yyqK3DQMqpCcyXzYZGAVOqkS1R67vIde1EP+R+01eypdwGmdaPE4s2aQiv403hA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792533776;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wKC3LSlwdLktv3Fue/Fi/u2yc2DjRK1grGd0eHjkzb4=;
	b=HXP+TQp65jV5sWVzICItORz5mZLojizhiWJdkzgwT4FL0MimLcnt3TWQhQACiLp7u9B7
	 XtyUpUn0K8CuEPzTFwS7xpqoGITBkCGQUl8f9PkX6qXhZqavAvcV8DpdONnFYsWqemBrv
	 dTMXHVI4NTAT88PJYy1m7Db1t70kcO/5NarqxF7BrWaAE/3jIRVK5RetSwf73BWMzd3eJ
	 0yfW7p5rnTkOwPkyFJ4z3VBRyREAdPr1wAv7fQ9kaIGN/H7j38AFkI5EelKcDuccmlbHS
	 kFiDdfmsCE/6uUo1JtkuuWk6rpLcgmBHeFLEDqtOyvteyEiN+24BjavCJTpDGLHEjOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LDY8IEa6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="DyNbKyS/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10DD4606A31C
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 22:02:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10DD4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LDY8IEa6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DyNbKyS/
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KKu0Xq3229773
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 22:02:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wKC3LSlwdLktv3Fue/Fi/u2yc2DjRK1grGd0eHjkzb4=; b=LDY8IEa6lDdsm2w3
	HqtUZtENLlOIbAWt9TMOBbwBYjuyYuMzwXJcCMlkh3d83vFKabVZ8W8dYsTlVByf
	Py7MKdIn1jF8WDtiFvYClIe1mV52trAeKPhynKB+8BaJEV/9K/ux1LZsveN4dYPW
	C+MeI/jO3lsS2tX9V6aWJUEfD9MkFM8TKTsoyFf1ImdgWS+LB3oM9JyYEgBL5JR/
	rS4xkfen0ATt8J2DUpPAOIIIgF+ufvgRt9PkHCkpT8kpePGDgE/9/s6QwMK/Z15f
	s8CgWWRZvZ0rYkCsE3Z4PYN813MWb8bL/vneGvk0vIm52NWoxo3diBEbm1+1kh5w
	a5Hdyg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5nvjx4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 22:02:53 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36637676140so85431eec.0
        for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 15:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792533772; x=1793138572; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wKC3LSlwdLktv3Fue/Fi/u2yc2DjRK1grGd0eHjkzb4=;
        b=DyNbKyS/YQjoXyGKTttNzYfPc0lR6OGeBsuCTfbUrnhnX26AHyymskivASaJrky1ph
         sEtfTolhx9ZBuMuxr16pTFsoVTDRM6p2fccGJ8HuQ/0o4jUFdoo1lZ5oAP487/NCTc1g
         Ajz76KT4k7nNsIqXmsHncNleufp7PxbVGeD8EAkjtlDAircbstoKzDsXwErjkWkIqi4y
         Go3nzPPzLwtbg9B7zfKqDjtmG0nqbvhNcCteWhDVrM7CaHo8I+vXLIIL3j5jbtnLsG+0
         XRRT+9XJgTu4KPC6bA5Zkgl1TZeiNYQJ59Dx3gxtvTSn7nMxYDhl5QOBnnxDQHZsXT7Z
         8bcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792533772; x=1793138572;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wKC3LSlwdLktv3Fue/Fi/u2yc2DjRK1grGd0eHjkzb4=;
        b=igEYv9HtDqSNOkeM7UW8O5FCvtLvu1zCajSMfvSmOQR5NpNoE2FvsQKOFl6JA0Jzho
         xU5glgIMnMoucXbXoOjWGvFiOqlsXgRvrVldpfT2Ow3Edx3pq52znUh7I++HZ6h0d9JW
         iBOPsLOvy4uPBVTGcL3iZmQ+wg87A0crZJzoaPLnWlLRl/1kTNSghjB0WU3MYfE50fuB
         IHyK+5AKJSNVAyiSVuE+SbuNgGaC7JsItJ9l1aQ56HcnQTedHhyPuBuhjMA0nKfKqMT0
         caiNw9Ghw/NMWuRopScOIG1Up1HL7qXS4xTHEVsUcYEMp7nO8TKlcXah356GbHAUu6hm
         hTuA==
X-Forwarded-Encrypted: i=1; AKwUvBzdZTfqqHO5X512YHqW16ItkpjCwKY83dFeg2Hy+nlsdBdGe2mnkO4AoCTFpiGAeO1Eju/TrFTwR0dlhQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYK1JyRqZRI7a+QaLYL55DazcDQQmeK+TEVf3Si2GqM4y2i6mbLY
	wEgkmsjtEWtjqCivvvoJyKpcvYm9/LjrWYfFvr94nZLRg7bC7r/mqAE5TnRpatuGLcoE07Zx1BH
	s7/uDNVdyXGydSP9MKQhLZy4+mfGOCh3bOBgCYpKRyNcIz8sq1pl5vvNGfb8V2ym+yA==
X-Gm-Gg: AYBFou0vQeM8flXQgumY2+xubbf0yuCVc/PPk6CRvAufku2l9ACqKZhNMqK4Rrvr8dH
	r5JgCNSzWMZaPTw+V95WF1OTNWfkvWLxsUKLiW9NR0Xg5ZowEd27TiGMsaz+40mn6yQ6/D2wkD0
	0y6ht3QMDif+lQueXPuEy40oF6TQK1KoKKy86874K8zm/hN0cWDLUnvBb/q5Aw3GpoKFhOgTZMU
	UKI4GbN1lB1tncoU5IemDLrsT1YAxoaUAPb6qcRhEnzG5enFE9WLg/9LcfeAHxwRa44BD2FTXbr
	ceMvrworlY+PMsvu7ek94jQw/+U3npFr1GJBYwqQH1lhc6AO/PGOpa1gajojjfHM6iOLwSzlmEt
	FexqBlSSJO8GMvEV6FEHmXUcLC6gFXFL3ZSO9lNhF9stPObjrDn8BazYP
X-Received: by 2002:a05:701b:4286:10b0:16c:6459:35b1 with SMTP id a92af1059eb24-190a599b411mr185239c88.28.1792533772140;
        Tue, 20 Oct 2026 15:02:52 -0700 (PDT)
X-Received: by 2002:a05:701b:4286:10b0:16c:6459:35b1 with SMTP id a92af1059eb24-190a599b411mr185196c88.28.1792533771462;
        Tue, 20 Oct 2026 15:02:51 -0700 (PDT)
Received: from [10.71.181.181] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903a180ca2sm1154475c88.6.2026.10.20.15.02.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 15:02:50 -0700 (PDT)
Message-ID: <8ae43c5b-b99b-43ff-a56f-19f4d5dbe176@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 15:02:49 -0700
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
Subject: Re: [PATCH 4/7] phy: qcom-mipi-csi2: Add sa8775p D-PHY support
To: Bryan O'Donoghue <bod@kernel.org>, vkoul@kernel.org, kishon@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        neil.armstrong@linaro.org, mani@kernel.org
Cc: gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, loic.poulain@oss.qualcomm.com,
        vladimir.zapolskiy@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261016235502.2274268-1-anusha.nandi@oss.qualcomm.com>
 <EKfYfLCfqnEg_PLe_TsBkAGryJgP_tA140u-0ZYSL9q5kInrAtoRCiugYV3C2PDDvYjxaeejuYK3gqzAT4FMXQ==@protonmail.internalid>
 <20261016235502.2274268-5-anusha.nandi@oss.qualcomm.com>
 <392642ad-3bac-48bc-9199-8c3923c588c2@kernel.org>
Content-Language: en-US
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
In-Reply-To: <392642ad-3bac-48bc-9199-8c3923c588c2@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA4NyBTYWx0ZWRfX+B2qwQ4IT4Ur
 rxyuSJb1cxhseN7AYwLwJPUDE7m8dfKUflZBnksc5zy+jl0EklKaAxm351b0Ps28/R3BFeQh+cg
 T4Q0mTCrWuOBUGQAFC5M3xtn+pymUW4=
X-Proofpoint-GUID: bMxaA3Lt8s3qEAWyjmhWmQg765ILxkCW
X-Proofpoint-ORIG-GUID: bMxaA3Lt8s3qEAWyjmhWmQg765ILxkCW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA4NyBTYWx0ZWRfX/81gfuC0SmYO
 gqoiFWBpKHWT8bxd2IteA6Pwq9aDmA19mYPAlVddLI2l4uvyumGKIzFAC8FAS6Rib3v4HQ5xKqb
 CF1qNVq44ZxIEifoOxZ5f/t8c5fPUVj8gAOQa3Hf3vztWq0+r29RsdFBfryJW2zGNwzEilgI/qd
 Nju6L3zW031Md6hYtSkRg3YORgpea0mxWAnz/XoOn2ca3lYwMfdPA8jhKlS0ss87MVo2ty8FmZR
 A2B/cyCbE2CT4rqgPL5BW9wk4qUdDAY29OSu00mqyRMDOQCNddRygCGZvZ7j4bheDu3hCTLIPR5
 lwW3d5BghVsA+/9Ki3GTWvpEupdQBeVPw+SaYHmpzqmZ+mbA3EeFUPmoDtSNRVHgIAUNQyuAYSo
 jB5BGdlVhNm0p4xmJoLx1sts+C9DvIhb6f700l3uNllXzR9iM/PKXv6bJd56WxXnBt84XBjUsQc
 g/BukWdno9D0o3vbWyA==
X-Authority-Analysis: v=2.4 cv=TcsDJhQh c=1 sm=1 tr=0 ts=6ad7e50d cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=VjktAE_kRdQNXcrMly4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_04,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200087

Hi Bryan,

Thank you for the comments. Let me make the patches specific to the
functionality and make it more granular in the next version of the
patchset.
I agree opp_clk is supposed to be optional, I will make a patch for it
as well.

Best Regards,
Anusha

On 10/19/2026 3:01 AM, Bryan O'Donoghue wrote:
> On 17/10/2026 00:54, Anusha Arun Nandi wrote:
>> The timer-clock lookup in phy_qcom_mipi_csi2_probe() and the OPP
>> clkname passed to devm_pm_opp_set_clkname() were both hardcoded
>> string literals sized to x1e80100 ("timer"/"core"). Add
>> timer_clk_name/opp_clk_name to struct mipi_csi2phy_soc_cfg so each
>> SoC can declare its own clock-name strings; x1e80100's soc_cfg now
>> declares "timer"/"core" explicitly, with no behaviour change.
>> SA8775P reuses the same "timer"/"core" names as x1e80100 for this
>> pair of clocks.
> 
> LoL I had that in the last design and review said "hard code it" happy
> to agree with myself in the past, however this change should be
> standalone and precede the Lemans work.
> 
>> SA8775P's CSIPHY has a single power-domain, the Titan Top GDSC,
>> matching the legacy in-tree CAMSS driver's sa8775p_resources.pd_name
>> = "top" and the existing lemans.dtsi camss node. Like x1e80100's own
>> "top" domain, it is not OPP-scaled, only kept enabled.
>>
>> Signed-off-by: Anusha Arun Nandi<anusha.nandi@oss.qualcomm.com>
>> ---
>>   .../qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c    | 112 ++++++++++++++++++
>>   .../phy/qualcomm/phy-qcom-mipi-csi2-core.c    |   5 +-
>>   drivers/phy/qualcomm/phy-qcom-mipi-csi2.h     |   4 +
>>   3 files changed, 119 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/
>> drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
>> index 966d79c98f9b..85e89235f7c9 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
>> @@ -380,6 +380,118 @@ const struct mipi_csi2phy_soc_cfg
>> mipi_csi2_dphy_4nm_x1e = {
>>       .num_supplies = ARRAY_SIZE(x1e_supplies),
>>       .clk_names = (const char **)x1e_clks,
>>       .num_clk = ARRAY_SIZE(x1e_clks),
>> +    .timer_clk_name = "timer",
>> +    .opp_clk_name = "core",
>>       .genpds = x1e_genpds,
>>       .num_genpds = ARRAY_SIZE(x1e_genpds),
>>   };
> 
> Yes but split it up - "remove hard coded timer and opp names" - actually
> you want to make the OPP optional no ? In which case you'd expect to see
> a patch to make OPPs optional - instead of folding that into a
> functionality drop.
> 
> Because say we want to revert or re-order the addition of Lemans in the
> git log - we then have the problem of mixed functionality.
> 
> Or say I want to cherry-pick a backport - I don't necessarily want to
> include lots of SoC specific stuff that doesn't affect my part.
> 
> => More granular patches.
> 
> ---
> bod

