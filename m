Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792537905;
	b=FJNty/aRtmgcWsZhjWMP3IzTK0/dj+85Lc0TPLo2CkQHO+bHU7sxZTQ7D88VcNVufGoC
	 jILrfhRy75JYFW2B1Snl1eZUBrZ+pkbt4Bd8sDUSQnd45bS/dbfpiGorDk1P6eclcvdau
	 7ybcFNHSeHdksKuBxh2Eu76ZBd/iXXrImtxtzsBCdA7s5lLwanl+U9XqDVA1HnbQKZVDD
	 e73xNZUj0CfXWqqQlhfkl/oWh8CldFROdFoyP0ZxgfZFq5McOLKUFzniP2EZMmZrMqnPj
	 Vt3R7Jp0BGLq1BaQfvAOf04TSwD4iUMW3AZR0ETrOhTC6ZB+zuvknX8gZ4xLG82CpNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792537905;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qtARsC4Auod18/0Cb93J6g5b7nimOjNLB7M6YwHe+gg=;
	b=bcFzgKOWL7PTE27IpmBvD3exfoe72Uo8eLNNInJP6htNGyqhobrXb/wR4CnMl1sdKgIS
	 MyVdMXgTovUz4KzNjWyLbbcqa/CW05mBINSGEDKfMp8PthWsJwFGGgTbcOvQrAsCHhtld
	 9GmdWIHnWr6vm9rpCFGw93JQz23fKce/GHu4fQzrE8k3+UTZJodUNVGkiAeISOkmjcexk
	 FfJgNJjLoqB//nPm4W+MmavAyDfc6OGak/bYn2V+AEHFcCo87LEW4Hg+QwJMsaC8yMJBO
	 wP6FKAGRhvLUKJYjVvbo5M70ahWcoLEswUMnt1AK4A6PuFM1m7VX1j33+Lk/jcK2chA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bxRpEk0D;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W+UjZSQ4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD7C606A31F
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 23:11:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DD7C606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bxRpEk0D;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W+UjZSQ4
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KKu4Aa2442330
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 23:11:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qtARsC4Auod18/0Cb93J6g5b7nimOjNLB7M6YwHe+gg=; b=bxRpEk0DXBU8fjQ/
	MkgQLbp4diXe5KClxhkcqBdDEs8cZr5HRvGA6oFAdgMIT1dqy4DRHo0TagbE0ft4
	b40/AWtQF4191cgMhCNIrEHzrvu4kp6ZB30bbf6Zxw6s3kKz2zh9sBYVto56S0Mh
	drEr9xMc6Ek6AMc07bpjh3AKSq27iZMuZr+aiG58zX6hXFiiojBankFs2SrK2iyb
	25NVW9y0pwreUy5/L7TKd5sAPE6VF3/BM3eAPycoolgD09WPxBFISv1UvYiXUSNH
	TofhQwRN7gVEkzl9Ij6TwyB0+A7720LtYdrkWxyBFzskF9eKfdYXJ4B7tmCMyLAo
	lTKEhw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9hs0a3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 23:11:44 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35a04491c56so170048eec.0
        for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 16:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792537903; x=1793142703; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qtARsC4Auod18/0Cb93J6g5b7nimOjNLB7M6YwHe+gg=;
        b=W+UjZSQ430eerf5kQGdan+BWVxDHWsWWfX6w2EQHz4tLgvROc9T3I9CBbKKochQi21
         gfnFCZddCswl3yKKfmMRWnyhQg1ahHpSe20bqg+wdODsVT5v6Ql1xXzRHjATBcYJbHDY
         ZcI0t6eQ35wuhzlEWQB7enwnLBY2EFSmYiEP0YTSNcQ+ond1+Gn3DXmeB43nYmBPq+r/
         Cvkj0Ey+/9lfBacay1hpr4xvYf1jl4NvjBk7iCNzXFhmqK9uJ8xuBQogE8WUjmE9NuLF
         6y8yyxS7cTieBeAXoWjHrk9OtrRed9LFC6z/8R0DDF2E5iAePmlCnTAH5vCCRnyJ1KS0
         KPcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792537903; x=1793142703;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qtARsC4Auod18/0Cb93J6g5b7nimOjNLB7M6YwHe+gg=;
        b=fQ/fNXJrXxE/TOfHmScE2z7hbPD2GNW64xlQX5iEVi2sbm0xO2SRamQxPLdgSaXkJy
         IRXCf1of7TzrEkmpV2qhu4xdYPHkBpDRX2JtWWAAeryn3VzkeClnb7Bnda/6Qn6X65Vw
         emB83iOfUczkPptmwKYee/JIqMwvg+4/peh3RnYIl91ZXFmGzGnwuLVWNm26RBWAEPDI
         lSYvOekWBLOfR8Cz57JJ4XU53m+P93rwQHH1OyehWGSh/Y1WWbnW2Udo2P3/Y9ocD+CC
         05qL5XJS3NjQ9u/WnVBaEPHt0vyosDAit4A0yLVgGRV9UNcy6hbwg/8iANUjwb1Ig5mP
         KMnA==
X-Forwarded-Encrypted: i=1; AKwUvBw8r0ACou9dLSpzURzu7ZZM4dQcuXFPhPILP7I/tW3aD/PHRKNrrGfgEXxffJFELzQReSU/QE1Q/0adAA==@vger.kernel.org
X-Gm-Message-State: AFq9FYK5se1/PmTnpVt+dwKOeBeX6NDainvQkuIgyGTE4P54nwDj87+w
	QfuEwn/1aEWHGb9qnwgkNIYFTa1wuRd4OI3WA4rS1i1ftMe7VZEH22TYZk0yl0xfYQocIDR3cEf
	+9IkeT4MTY/XGVHbQpuqKfti2ebvdOnZl2fzfsoYLXf2DiC5iiQVS4rYbY1TxeyNkjg==
X-Gm-Gg: AYBFou3zhg1AlixvWHoEjlCsiarPTdiMQnFtm22V7ax+RlutpnyEVH7kEGI/Yj+Wfab
	3vOM14SOFk2Gqm9h7uSeP3f5qqPOM7JaEc/FG7Z00z48Ab/Juimol9gskdtvoKV0AKgCXIlnAut
	nZGLs84KR0ehFu1HxU4AH4tG4XmVMP0XMTpA+Maa/d3oateieJBLlxRhDcze9CvxGFTjE6eSGRU
	LkYFK2WjFPvFP+YwxO8vl6Lnx6m1k1GuOjS74WWZfUq0jMpAg4T1awDL4CgxT9xD6b1YTTJxVcZ
	Y784hqikZGcm1IJeeawsh8mFhtJR35ulkQIl6dZPMGY1wdLMf8tuPbvJibSY8kSODsBY/s9fbiW
	au52Ok3bpDXTzsiUN0Ef5ogFVR0jHQyuPNpF0FCAjnDjxvZakB55gR6+v
X-Received: by 2002:a05:7300:d58d:b0:351:606f:2832 with SMTP id 5a478bee46e88-3674c92db53mr831475eec.3.1792537902823;
        Tue, 20 Oct 2026 16:11:42 -0700 (PDT)
X-Received: by 2002:a05:7300:d58d:b0:351:606f:2832 with SMTP id 5a478bee46e88-3674c92db53mr831426eec.3.1792537902166;
        Tue, 20 Oct 2026 16:11:42 -0700 (PDT)
Received: from [10.71.181.181] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc88b5sm1704329eec.10.2026.10.20.16.11.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 16:11:41 -0700 (PDT)
Message-ID: <471fb0e6-1a86-4ee8-b86f-3e5bc88b1918@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 16:11:39 -0700
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
Subject: Re: [PATCH v3 0/6] phy: qcom-mipi-csi2: C-PHY for X1E80100
To: George Neacsu <geocausa@gmail.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        David Heidelberg <david@ixit.cz>,
        Neil Armstrong
 <neil.armstrong@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Suresh Vankadara <svankada@qti.qualcomm.com>, tjose@qti.qualcomm.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        jigarkumar.zala@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com
References: <20261016-x1e-cphy-rfc-v3-0-40a346a72153@gmail.com>
 <db2fffdd-634c-4728-a2a6-2ab1816b07ba@oss.qualcomm.com>
 <20261017070443.989736-1-geocausa@gmail.com>
Content-Language: en-US
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
In-Reply-To: <20261017070443.989736-1-geocausa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YuKa1IYX c=1 sm=1 tr=0 ts=6ad7f530 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=Yf9p7-GFqWoa8jJlbhQA:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA5MiBTYWx0ZWRfXxTGxxgwfgi++
 BsOB7u5wE9797sv0rsCWPPmEJYDrKhhImpYWrEtKnmuQg1HlYpoyyZPGFLkephUgihcpHaeOfmb
 pK+70EKcnr+s+QY37Ek5jyaBWTnfLW4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA5MiBTYWx0ZWRfX26Os1wCMuNFx
 oNHVwWblZn3NgfdHRSle8Ads/gopIMr+8phFZYg6OTnvCrKipKko3tGk2mP0EOcY+1cIpGpULbr
 Aqyky9DQVPdIp3IO7M9Lvbw+Foow7Bkbk8RFTy6D+mhweTo9ZYhA2os4rdy5jgDOhFKVTM1WQpQ
 bzOqcoY4wSF+KeslMfCw5wZp41uMTEsKJeIFgPXT3lbIXnYCGjysXZzelzvSbFYzW7DCS0i4qJu
 1J3UzaKpRo1u2UOmNcAqBaJZfFHFZGnYVo2ivmJ+NbJyITX0XwlAqvPt282T6HGSBw0k6ypRdLU
 tCKh2LI030N7+Hp5l/Jm4TQ6kuiC/rasjdvq7EnzGvXDQffbkoY5QV5jsfHmVZrPgarGmLj9Kbk
 n2i6BkYtxuYxAVFnW8sYKOEnv9ttlvbA0SsiACuKNnBaiqGn4ZRtdClGjoVaSmEQb+yF5cERV22
 z4Jpj5+2n3tNJvPXRQg==
X-Proofpoint-GUID: ooSU66d-O1ctjM4gDkNsvuFn7HWjkPms
X-Proofpoint-ORIG-GUID: ooSU66d-O1ctjM4gDkNsvuFn7HWjkPms
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_04,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200092

Hi George,

Sounds good. I will release the next version of patchset which will
include the best versions of Nihal's series and mine after careful
selection.

On 10/17/2026 12:04 AM, George Neacsu wrote:
> Hi Anusha,
> 
> On 17/10/2026 05:31, Anusha Arun Nandi wrote:
>> In our series we split C-PHY hw-ops into a dedicated
>> phy-qcom-mipi-csi2-3ph-cphy.c (mirroring the existing -3ph-dphy.c
>> split)
> 
> Thanks, I had missed your July series. Your three series cover what
> this one does and more: the generic C-PHY API in its own
> phy-core-mipi-cphy.c like the D-PHY one, the C-PHY ops in their own
> file, two SoCs, and the CAMSS side including David's patches. The split
> makes sense to me, and two versions of PHY_MODE_MIPI_CPHY should not
> both go in.
> 
> So I would rather build on yours than send a v4 of this series. I will
> send the X1E80100 sequence as one patch adding it to
> phy-qcom-mipi-csi2-3ph-cphy.c on top of your series, and test the whole
> stack on the Surface Pro 11 (IMX681 on CSIPHY2, one trio at
> 2.4 Gsym/s), with Tested-by on your patches if it works.
> 
> Review of this series raised a few points that I will check against
> your patches and comment on there:
> - the settle count computed from the timer clock rate instead of a
>   fixed table value (Nihal);
> - a u64 symbol rate, so 32-bit can hold rates above 4.29 Gsym/s;
> - trios instead of lanes in the C-PHY options (Loic).
> 
> Also, Vinod and linux-phy are not on Cc for your PHY series.
> 
Thank you for the heads-up!> Bryan, Vinod: unless you would rather take
this series, I will follow
> Anusha's.
> 
> Thanks,
> George

Best Regards,
Anusha
