Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739DF4DDB56
	for <linux-media@vger.kernel.org>; Tue, 13 Oct 2026 11:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791891105; cv=none; b=WZoXfDHKm17wuIg4W9cHHiuy6SScAHTWp0UaHHm0QQncijbzn2mj6vT/ERXlK+iKerAMnfJ7VT9OtGlbsQcmRDAq6Sc6OWBjvXMnPkMmax5kEo+IDop5mMsdV/QtZRpY/7JFLCpe/R2I2aqOTiJ2xWXc+cjsEh81eBOI/rxtwEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791891105; c=relaxed/simple;
	bh=qdiKT4pmaWhY8cndNRhuiVjoc5hyS/Nji++DpODZTw0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dVJrANUa3tub+U9AKgAT4x2EOgJQtWCsh4IIaMhYuURI2X5+2HfMm2kA3PH2l6UUOwgz1B+T1VY9BNnlZStOB5KLnn0hkRs/a6Stal691W2jDRTkzC7RX/r1Ln9V61EVl1L+b2P1iEkoFqRajhDoahKgphb262Wj3X45k9QmxJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iOXrDDKv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RtStyIuA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iOXrDDKv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RtStyIuA"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D9oHMH3476145
	for <linux-media@vger.kernel.org>; Tue, 13 Oct 2026 11:31:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZeY3naUwVeFhdjZs9x4ilplnPc1XUctRVcxbOkAAhzs=; b=iOXrDDKvGjszz741
	c0L1h/prwDSdpeda1xijIxjPOy1L109J40TmW+JsGyyG59V2t0pXMv/eyvF9o7qJ
	QcsokoUjqPJA7BiCiaKqUNdG5Pcb4S8xzChg4NXZiECjUObta/vaA1JicgByd2z4
	FnfsLB40AM+nYwTt6Zbc+wshjFuWtKvZU+ZwZ5iAI2ZGLP0xGLQFYxKv9HU/SDAi
	vqSvi9U/GLLcU0gqRaEcJn1CtmSHsF6CC/qX2dBRfMB7SfY/6dFBSz2URQ5TaCJq
	zI8R363Iv8flZkVNdAaew6XkkbgW8yn0qE9pEXFKsJxs0H0wdfyIa/KhTII/iBo3
	wu6zSg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9d7j9sy7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 13 Oct 2026 11:31:43 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-980b637ed69so174566241.1
        for <linux-media@vger.kernel.org>; Tue, 13 Oct 2026 04:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791891102; x=1792495902; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZeY3naUwVeFhdjZs9x4ilplnPc1XUctRVcxbOkAAhzs=;
        b=RtStyIuAiZm2bcugeU5vgumyAtQojOUCey+tFiv4yhI7Zaf1cGwh+3WDuA8zFIKuVf
         Fj+iYQVZUOL+I0xhPN2g2rzSuD1RHqMEFZEsFclpzlJwnfktilJmXrdsNR92+RURBOey
         1U9pfZeHcE/Mgal3CjAeMKfALdA5tbLB/J8Zo3p6c5k/SJAGEwodbsqSOHrNENGnDYK1
         2SjTCr8ePmrbW0nidWApPMRSiI1JD4OtX8wcOdliIRszM3eSgafWmys6qbt5evxWI8/o
         /vGcotO/gH5clXTiMJHyYp4TVu/Cps/HcHZ+pYLDpYd8GdMEW/zRH5T9nZwf0m95A+aN
         nnNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791891102; x=1792495902;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZeY3naUwVeFhdjZs9x4ilplnPc1XUctRVcxbOkAAhzs=;
        b=auN4aezOGeVud0p4mjvPD3MVrBJmaYxmZhVZKwAG/ZJJJC4x4bugUzl+crE8eqy0td
         BhkPmY2zC3vnZNz6uGAHnjVv86IgpJL+h6k1PdUlDNa98wWzXp6FKwWUt0++o1Dl9iaP
         BrVR0qGrsQ3Z2OhYCqB08BKE/fO/B7du6r4aLw2Pc7eHJGbbftD4u9hCUzL2RmQIb18K
         hvJ2To5fGQumAey1RbQ+5UoVjokC7CZP3a5cE2y1F3e4BySjBwn6xNiZs/szhSLXW211
         Z6PsApag2hJaF5cQkzouHVihjuEgV9pT6owdgekzErlaODf3Jv7etjOECije9uchusCc
         NGCQ==
X-Forwarded-Encrypted: i=1; AKwUvBxWpaQwDogx4opJSwmKKdACLfID5EVUerrT1eHJQbhLWOy/vBMD+bqUc3xcHmY2KbtZQ8wlEF8GN0eXmw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIYLH3MHHSuXGmySW9PqQHuPxD8rrKALnBEl9cEewuYXrIk1pYp
	m39Vl5VgNlDxmyw9FHRFxegVFtoqQnL0wIg1QPPupR5NkSeBJvZ1QMK1nU2QIDYzeQHogkmsnXe
	pL2ycSJDBjzLlt1+43r2IBXqTQ9lis4DKklVz9qXPdPlBSJaR+NM7k8Eo23+a8BXOcw==
X-Gm-Gg: AYBFou0jOvOzz57LK57N5fdeii1kj8Tu6j8M7ai0pWaRJ4ji4E0K86b+vSA0cjkkZ5D
	wODuI5NRoZ4aE+rdI1n4t0cv8Y9QToOTs/VO3PSwFf5MNMYMNm0eCvkQCws8eXiPR6d7w/0LSXh
	6V1EkOoZehPdM8DAdva489wCoWDsMYZqtiACKyCYeBUCnDIGDfEwbwxby0Tw6F1o8akv6KaZq5d
	ReL56ofkEqWQPM2HckoXlVWZjxitYHEfp1D59631hp7chqsawW3g4N9p9UUneKBUCpMDomlzbba
	2AsaYr9V3OHoonS8nmVt0R08B6RZFW15rcMBKSPqldqU1yyxHu3mXPzUHbNtMC410OyfGXH7Pya
	TAVeQey9pq6pICpl3y6NyIBdKobV3aJvUC/wqJq8=
X-Received: by 2002:a05:6102:370c:b0:7b2:b159:98c3 with SMTP id ada2fe7eead31-7cb3739b2c4mr3084633137.28.1791891102508;
        Tue, 13 Oct 2026 04:31:42 -0700 (PDT)
X-Received: by 2002:a05:6102:370c:b0:7b2:b159:98c3 with SMTP id ada2fe7eead31-7cb3739b2c4mr3084619137.28.1791891101934;
        Tue, 13 Oct 2026 04:31:41 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19f318c31sm132972505e9.3.2026.10.13.04.31.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 04:31:41 -0700 (PDT)
Message-ID: <e4da8a65-4743-4f39-9d31-2b9c5626b60b@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 14:31:38 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/4] media: qcom: camss: rebase fixes and SC7280
 enablement for the streams API
To: Hitesh Patel <hitesh@ebytelogic.com>, linux-media@vger.kernel.org
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        ravi@ebytelogic.com
References: <20261013083306.1132036-1-hitesh@ebytelogic.com>
 <20261013094751.1503021-1-hitesh@ebytelogic.com>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <20261013094751.1503021-1-hitesh@ebytelogic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Kjcs4yFdl4hkoAjSE3xGFs_5YhfnGwho
X-Proofpoint-ORIG-GUID: Kjcs4yFdl4hkoAjSE3xGFs_5YhfnGwho
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0NSBTYWx0ZWRfX4I32MO0s5pGV
 nno1UKadzcbai/9z49vo0+fq/DohgeRlTxjVkX1f1yZe6In3BSAubfqrloIzL6TYt4LhxwikePM
 9cOh+M1U1SJuk7tGu2Kuv18oL1H2HXM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0NSBTYWx0ZWRfX1K5Fe6z+Aec+
 TzSprXToLHVxdRl9PfXKOnDVyfOK0rRx5GxAAxj99iEh4raUIe2F8/d1zP47sqfuUmtQZmnhKkL
 rSa9hjaEmuW6GAe023Gga1ZBpT/VclKxGtEJ4T94n1cSANjPkKh6zrcFi0ynjo87jogDHUmeYZH
 /Sm3bkG+JpDoLU3Wu/40WIC7+sW9gKJ6dWWZG9DSTVNIxp5ofPm156V0sUukG3vT6shg31WMOFr
 6fq4aIV1L85S6iypqr9DHwhlLSMypnnjmtzGsRyjUWe7a9S9Wq1S4sYU69CqVjzh3fhtHydImYq
 WX1BXLTvkyEGAmbvwwGqMnyQIxvO1eQ0cjDTwgye456AD3OsqrX49OdC8hRwgDhoRV4O7K8t4uy
 /eJWcmxJcEg95PvA4n8KlUY8xuHTO4gyOq3Vk7pLTjdqVDycUV6AyKS5BexYa3ghqTdEDwwFGdN
 siahwv1YmoRSBXKMsqA==
X-Authority-Analysis: v=2.4 cv=PMGaavqC c=1 sm=1 tr=0 ts=6ace169f cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=baXj_NEP-ELrwSMyPQUA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130045

Hi Hitesh,


On 10/13/2026 12:47 PM, Hitesh Patel wrote:
> The Media CI failure on this series is expected: it cannot apply to
> media-committers next, because it depends on a series that is not merged
> yet.
> 
>   [PATCH 0/8] media: qcom: camss: add V4L2 subdev streams API support
>   https://lore.kernel.org/r/20260911062213.195007-1-gjorgji.rosikopulos@oss.qualcomm.com
> 
> 1/4 changes csid_streams_set_format(), which only exists once patch 4/8
> of that series is applied, so the first patch fails and the rest follow.
> 
> My apologies for the noise - earlier revisions carried base-commit and
> prerequisite-patch-id trailers precisely so the CI would not try to build
> this standalone, and I dropped them when I reposted as a series. For the
> record the base is next-20261009 with Gjorgji's eight patches applied on
> top, with 1/8 rebased as described in my reply on that thread.
> 
> Gjorgji has asked to fold these four into his v2, so they will most
> likely reach the CI through that series rather than on their own. If a v6
> is wanted for any other reason I will restore the trailers.

Thank you for your series, most probably next week i will have some time
to post the v2. As discussed will need help for verification from your side.

Regards,
~Gjorgji
