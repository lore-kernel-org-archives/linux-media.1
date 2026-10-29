Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793274335;
	b=aQeMkTnsWJ3kE6F5R2tcQw1UVM6VfAgGgj+GzzDWuAPG0VLKBromp3Z9cuX7xQqeTYs5
	 BD05jJDaFdaySCeS+lshVV8a0F1ngBz0AkXsEMLukM3c/mp56dw6mp6rKCaQTdhEIQGYl
	 CSiKUPmCaSP6hfnbhRCOV2hGQXTRCbVK+5Z01kUNsgvK88pl0cwvUPeOdcHjqvwH7lpoQ
	 6aW3o7U3RKWYCXPuB1ATO83mC06QsqtPNvQXt/K5Ddm+VpambxChcNaAuQvTW9bnPCfrR
	 NcVGYO+gZuoKQZz4i7zmG1S/nzCZtHO+4i4KP67Kp5YJH1ZrAoMwXuH2oOjvUOy1FVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793274335;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=TMWXkVvY7365bUcSbC/c1WgzijbCguJDPiJAF5/hEqY=;
	b=dzpW4PNni2IxSPl3mM5OSDJ0S3yi5vxifMP9izH6vFqAySv+FgTPTxsy61YnicM9WEMg
	 mleBHN1vA+oK8kQEz8hZZni9MsGD+h4gs0sTihe0p3VtJBkwtQMA5v23d1SF9mjy/EXu5
	 BNVLY9zgc1/DPmyTCg/OQA7ySSmOS2vMKpBhTPJd/JhFtyP/YvDC99enAZiQLC40810Lf
	 wAdt6YntoiDdkeFvSsqJAnc3A3VSXdAnbgetTf31HwoV1CX5ltm5JLGctOHPUxuDtDhr+
	 SwwE+BLQNsWGj5kd243Afxg13DXHfkUrsBq8kvdGg5HlR6PTu0pZe3RpMBwQ1iI1W+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EDewjzYH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fPta+DZU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17589606A31D
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 11:45:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17589606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EDewjzYH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fPta+DZU
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T8vE6V3824988
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 11:45:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TMWXkVvY7365bUcSbC/c1WgzijbCguJDPiJAF5/hEqY=; b=EDewjzYHcRMdlJLo
	VoGq91+Z+QOaXmM2eq6RMF1b3n+Zuc3wLUqFQZU15c8jb5G/dsFesPMWuBdWK6WR
	gc9pMK6TM/posn2sPLcSdoK13tRAraVKuczXAAAFVTTL1kgSyGZ6aHf0R/X3IEz0
	y9cZWih+vxDyalJLCyS9QisNtUjQ6eS68oWqhfkIYg0++A9dmYoQLPJsTovRoSqG
	pvLbYeKlx6eKtQ0T/mDbiGSNrB7aDz08+MRwYwXJbPQXxNzXsPXT1MUK09L9dcDM
	KV3YSjcE5YKvWb36JEATgBRakZPdvg2GeNOtVuAbYcCtEZ3bav5dLbj3ywHaVIFd
	gzKyJw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkut3j6d4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 11:45:33 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ce7a85f04so400751885a.0
        for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 04:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793274332; x=1793879132; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TMWXkVvY7365bUcSbC/c1WgzijbCguJDPiJAF5/hEqY=;
        b=fPta+DZUfoRqdIsHPdNqc2ByeXobXmP91o0berZN0lnGB1/OT05KuQd4SJ68osHkJA
         rBsSyJd3f6pYSNY+z3so7BB+RTEQIIdoo3Dd5kC1R87Q4uCyLkj8R7RNymfSue8KYI25
         gZxYyJwrT4dGR47n7VWvx/El0ftBndX1Kv+fJHy99fxNk+vJhFNRcfXeB3uCpZ38g+lP
         EUzCVAimf7+8Nb1gdZ0cM0BeeQnyvWj72b+b4qzIezpbRTsG6YcBE3ltP8VuFOCrj3Lf
         RpAMPnnhzMpjpnqYiDulWwjMABAXmhS6ICe8jTn8+F6VBhqsKSrVvqpgn+a1lRwpd0PR
         X/Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793274332; x=1793879132;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TMWXkVvY7365bUcSbC/c1WgzijbCguJDPiJAF5/hEqY=;
        b=NJPkv1VGkPZva/wmD0rWJzy2lp6G67iU4zGrOACsTnEL0rgwQzA41oW2BDphdwXJfQ
         hvma3S2kOK861qD6DhGDzNcoNDMx2RW2HmuqZRltNwIfI+4MMgkNtIDh2ZcSGp/XDRe9
         oowZ+2uoNotqR+0Ci/uEy+pe3SSQvyKi30hbSv9W/YT9XxBSin0uhjEdD7x3aWSELSDb
         GZGGckNrqzIX2rkcRtzAikgRXZFfhpk1i9m0OVZXxWA5e+D3Y2jeBjHBxRMHM7HVh7ZK
         ZISiPsyWBJPkN4NJZLYM5sCEeJur5XH3x1ziSeZHHddV+0bDSFVvLTVEZxdDdht5YvEi
         MIVA==
X-Forwarded-Encrypted: i=1; AKwUvByYrOLsl/aFP+GLbnH0FSv/eOfkoOwo4+r3kxO0ukoRXufvV2DOS4B5LkgfZKyQl7OcBelpQYv8X920Dg==@vger.kernel.org
X-Gm-Message-State: AFq9FYInVMQB5LT8rNwqpBXUQvweYO3NPvpB/MQ3YxDb/cvjm8bIkKbZ
	HBdmuyWq7/o9dqlKgZs6DPlCIHpr6Zp476Hw4mzJUKTVkb7PDrjDCGuWsoATn43fnfsGwDm80KY
	vjHVhqbskugD/b+lDUf7vUPtVbr0UO6Ax9m1HR5GFhamgM42F7aQCvTVhqrzQTmcqjg==
X-Gm-Gg: AYBFou017u0df+t5ZJuaqi5VPHCk65+qwpKzxCHVHf64zGjXzhNDRCVJxIqj8fcWTb5
	UZSvRZUoeH6McFKYKvRdyV4FW3s9lseyqJerrFOQr2YayEraN/I5RZhccze3/GKuRzGNsKodViD
	RTjSrFXy+7QkzDlySYqiR7t+AWVRCCVpfCOq/y33HVc0pw7zpQRNaSwc2ExPw6gicyiNkOAe/Qp
	9D41+gt0fUBEu4HIWdLphqtyJZOvNE1czoin/LjLKmcb847TW0s5h3ysKINnJKZKZWjHFcjMvqR
	BDkfYc2DKJVEsDkjyAxY8I536zbeQ02b0a3CUwGLvdL3BxXB9igPdQTmKQPdDT/1UYkobNPrkA2
	VqjbzGGITqPfuOUzRge336ft1aAkEGVGOGd9HiElI6KlsBnU8gpZoe+BOI8biheY18i/468adtO
	cmEUy+RX/Ub/MK
X-Received: by 2002:a05:620a:1a0a:b0:93c:a191:88fe with SMTP id af79cd13be357-94408984e70mr723490585a.8.1793274331983;
        Thu, 29 Oct 2026 04:45:31 -0700 (PDT)
X-Received: by 2002:a05:620a:1a0a:b0:93c:a191:88fe with SMTP id af79cd13be357-94408984e70mr723485485a.8.1793274331265;
        Thu, 29 Oct 2026 04:45:31 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a92de010bcsm102028895e9.0.2026.10.29.04.45.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 04:45:30 -0700 (PDT)
Message-ID: <cbc783dc-cc2d-420d-8e80-3a39744218ce@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 13:45:28 +0200
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
Subject: Re: [PATCH v4 0/6] media: qcom: camss: share VFE clock sources by the
 highest rate
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261028132403.3505037-1-atanas.filipov@oss.qualcomm.com>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <20261028132403.3505037-1-atanas.filipov@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA0NSBTYWx0ZWRfX6xtOBAbNILd3
 M9dEMCTm5VGxrM/Hv9wD0L6iV8zxNYC8Xv4fVahd5zdOkOh3+Q5emBdporTd7sJI7+fZNdqXz/s
 JtFvaEd8bcfpQ68KiAyR2nOC+0Gtlec=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA0NSBTYWx0ZWRfXzdtNfS1u6Uks
 EHeqZ+PT0APLDlIXy4rjDxHa4Pz2UWz1ZaRuZTK1D+QaDRw927IdGiwWF70yHn2E4khLf3P+y+4
 ZW0Wqt1jGvJJbXjmk2+dwSVSvtxqMFmjgCoUlrKbJAzmCuO/01mfw8Am59IpiDlg6l7K7e8MZko
 Nqnic9cdOgu3T6xSCTIJeGCVquHw7K416uktiKE1ldTViy9xXeHOONdPyx+jvDOPYN/3M9/xw48
 DOKRM3CVtv0F3T4Yjnj+YcPQNnu02ZXd6TZdmgbb3+WZyt8lIKMlmN4QerPf2v/ENqyhMrwgRjZ
 CMjFvngC2O2WKWN9zH2FgtzzOYKV6WbneUhJv63pkiSiDJXpKM5IMdpEjfg+iiWI+FFFD4wON+H
 3Phr2UTAAJq7blSiAcUrCq28wwvT9c7gPXpANxJumImtUKPNuD1iP8JS3ywOZrOoOKNWpzOJSJN
 N/AKDzTbMu7CFEmZvUg==
X-Proofpoint-ORIG-GUID: vAYllEqGlFMxeP-l52ZvZQvt0wuFXCOT
X-Proofpoint-GUID: vAYllEqGlFMxeP-l52ZvZQvt0wuFXCOT
X-Authority-Analysis: v=2.4 cv=HYSB3SE8 c=1 sm=1 tr=0 ts=6ae331dd cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=sgnbebFuhaldx4-h5P8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290045

Hi Atanas,

The whole series were verified on RB8 board (SA8775P).

Tested-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>

~Gjorgji

On 10/28/2026 3:23 PM, Atanas Filipov wrote:
> On SM8250 several VFE clocks are fed by one clock source: the AREG
> clocks of the two full VFEs share the fast AHB source, the two VFE Lite
> share one core clock, and all four VFEs share the camera NoC AXI clock.
> Each VFE sets such a clock to its own rate, so the last VFE to power on
> wins and can lower the rate under a VFE that is still running. The CSID
> also sets the VFE core clocks to their lowest level when it powers on
> after the VFE, and nothing sets the camera NoC AXI rate, so the camera
> NoC runs from XO and two concurrent streams stall.
> 
> Two examples on RB5 (QRB5165):
> 
> - VFE0 streams the CSID test pattern and VFE1 then starts an imx577
>   stream. Nothing sets the camera NoC AXI rate, so the camera NoC stays
>   at XO (19.2 MHz) and one of the two streams stalls. With the series
>   the VFEs set it to 300 or 400 MHz and both streams complete.
> 
> - VFE Lite 0 streams the CSID test pattern at 480 MHz and VFE Lite 1
>   then starts an imx577 stream that needs 400 MHz. The two share one
>   core clock, so VFE Lite 1 lowers it to 400 MHz under the running VFE
>   Lite 0. With the series the clock stays at 480 MHz until VFE Lite 0
>   stops.
> 
> This series lets the VFE own its clock rates:
> 
> - Patch 1 moves the minimum rate computation out of the VFE clock
>   loops, with no functional change.
> - Patch 2 keeps failing when the pixel rate exceeds the VFE core
>   clock, and clamps the other VFE clocks to their highest listed rate,
>   as the VFE clock rate tables need not have the same number of
>   levels.
> - Patch 3 stops the CSID from setting the VFE core clock rates.
> - Patch 4 sets the VFE clock rates as minimums with
>   clk_set_rate_range(), so that a shared clock runs at the highest
>   minimum of its running VFEs. This applies to all SoCs.
> - Patch 5 lets the VFE set the AREG clock at a fixed 400 MHz.
> - Patch 6 drops the unused camera NoC AXI RCG from the VFE clocks and
>   lets the VFE set the camera NoC AXI rate.
> 
> The camera NoC AXI clock is also used by drivers outside CAMSS, and how
> to aggregate their requests with the CAMSS one is still being discussed
> on the CAMNOC interconnect series. Patch 6 only covers the CAMSS VFEs
> and fixes the concurrent stall today.
> 
> Tested on RB5 (QRB5165) with imx577 and ov9282 sensors and the CSID test
> pattern generator, on single, concurrent test pattern plus sensor, and
> concurrent dual sensor RDI captures on all four VFEs: all streams
> complete, no shared clock is lowered under a running VFE, and the
> camera NoC AXI clock runs at 300 or 400 MHz while streaming.
> 
> Also tested on the Lemans EVK (SA8775P) with imx577 and the CAMSS TPG,
> on single and concurrent test pattern plus sensor RDI captures on all
> seven IFEs: all streams complete and no shared clock is lowered under
> a running IFE.
> 
> Changes in v4:
> - Keep -EINVAL for the VFE core clock and clamp only the other VFE
>   clocks, without a warning (Bryan O'Donoghue, Loic Poulain)
> - Use clk_set_rate_range() on all SoCs and drop the vfe_clock_ranges
>   flag (Loic Poulain, Bryan O'Donoghue)
> - Add Suggested-by to patch 4 (Bryan O'Donoghue)
> - Drop Reviewed-by from patch 2 due to changes
> 
> Changes in v3:
> - Replace the CAMSS clock domains with clk_set_rate_range() and fold
>   the rate ranges into patch 4 (Bryan O'Donoghue)
> - Fix the VFE AREG clock at 400 MHz (Bryan O'Donoghue)
> - Collect Reviewed-by tags
> 
> Changes in v2:
> - Split the minimum rate computation out of the clock loops into its
>   own patch (Loic Poulain)
> - Add the Fixes tag to the CSID patch (Bryan O'Donoghue)
> - Split the clock grouping from the AREG clock change and add an
>   example to the grouping commit message (Bryan O'Donoghue)
> - Rename the per-clock entries of a clock domain from user to vote
>   (Bryan O'Donoghue)
> 
> Atanas Filipov (6):
>   media: qcom: camss: factor out the VFE minimum clock rate
>   media: qcom: camss: clamp VFE clock rates to the highest level
>   media: qcom: camss: sm8250: do not set VFE core clock rates from CSID
>   media: qcom: camss: share VFE clock sources by the highest rate
>   media: qcom: camss: sm8250: set the VFE AREG clock rate from the VFE
>   media: qcom: camss: sm8250: set the camera NoC AXI rate from the VFE
> 
>  drivers/media/platform/qcom/camss/camss-vfe.c | 182 +++++++++++-------
>  drivers/media/platform/qcom/camss/camss.c     |  44 ++---
>  2 files changed, 136 insertions(+), 90 deletions(-)
> 
> 
> base-commit: bd1ecbb61afefc6a8b876ccbc31e9228b44e9eab

