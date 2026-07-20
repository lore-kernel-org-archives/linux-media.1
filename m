Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A383D3310
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 09:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784538752; cv=none; b=n64g23zG+dFYmZ3VUysyQmAESkQrIb8lxK2yzPiQhppgf57ySjREbc0o7xAifPabwMzWKu9lpqu0xHfNjXfEFxzb9YywkRmp2h/7v3IT0uTCvYfOcPFSO6Clu5uzv5bpiJnS5dIdIz9a98SRH30ZFEAZPCkoo9gVXm7uqVlGEOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784538752; c=relaxed/simple;
	bh=+KroKQ504uZlS0P7BdvijA4kbRAC47SmmveENz3cvL8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YO3ivJlyU/c6adZStUBNMsM/h5ofDan8/rXMnERzCozixIjojiR/ZfxitTTObFwLqIsRRliL8bGDbsE88RSMS9uuRMF1PObJeb2DDczCWQNHAPAAlzfZZrMHNaJ/f5nFmQOdS6Czh4hiDbBzh0KSBpFA/nW8VSlGDvPbAkup10A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N4sBfy4K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AQh8kg/i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N4sBfy4K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AQh8kg/i"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K7rfx02979892
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 09:12:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pM3cA2IbXGthHBfz+fn33Io69DEDbJaIw/yDmpyN6P8=; b=N4sBfy4KFRoVQpab
	PLftOj5LvgIVJl/NO2VY/eLFN8dQD6mTlv63cXrPfSeI/wrAcmhDY4RUB72iWEx/
	Kyhb7+XrQ3GMs3sF3p2VOXkcgw0j3KcercuzZy9S2dYBgM+wH+JjbxcoIoDQzrhl
	DearleLcM2rc3rj+GOrlA8cR13y6Qi561AC7fZ3xrJzH05xOa97nCB0q+QQTfYva
	vFGEYc6pIRwuI5W80vzCTDuk1rR9CtQLUkyTn1fg+7pLuJvEPBhnYdlWDpmH3fBd
	GU+lK+QQl+lV/U7mg5VcPYg4aFScrsYgpilUBJRRmgxa5wkb3OI1oeBrBwHkRGgs
	Aw9BMg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhfpg0d2r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 09:12:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e566bae1bso191561885a.3
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 02:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784538748; x=1785143548; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pM3cA2IbXGthHBfz+fn33Io69DEDbJaIw/yDmpyN6P8=;
        b=AQh8kg/iV1JuoN27tAJ/hDuey/h8m2sA0KiJO3k0Neje+2vmtL9BTeamwNn4I/mmKj
         ywLj0B4Fu25N6Fk0qor0QKHU7E98rCUdpI0XXt8bBvnIOye0D4nkaffduriSpoGQWq/K
         8vZAP3Gn5LDKr9xlWy5FmzWM35ZuFgJYE4bFdzxLeXY7r5M/X1QMzCdmjWP41YRvD95F
         vaObyACvZKWe0rB6v9i99NmtN3OWOCN47WPg0tJcp0/xR3nz7it7Vm7jLjOQukW4BfTW
         7m6mP1mBVlChamM7w6lrw+k989ODd3FtgBzKDTtmph14plj5cuxmVHbojjsiVmtFcPwl
         g+Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784538748; x=1785143548;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pM3cA2IbXGthHBfz+fn33Io69DEDbJaIw/yDmpyN6P8=;
        b=qvfjcDLykewfoAhOMNGUT9bomjGn/a8rtvxD3Pk959c9nf3RbDAMSKOTTk8wIS5Sxb
         JMZLlH+HGduaX5jSQLhtJYPildpL+VI2jIPvzKTnucKY/30fDiTHrIsAr37BPyORV1K0
         FRGpmL5iYwxp0p0UAgGfayLfPpdH1aNVaD5gt3tAI05LL7J2fqPq4jwYC0LFQwPiMyyH
         UAc64vfneT4BmA8x/hAoKxWokrpOIHIyFMS9QH8cLOmNvGPzZ/whUWFcmx6ULj6dbh0g
         Q+tqbj2roaK2QNl3OvDv1kDgTyj5FNwZG/+QZkCA2KRLgdfxgLjQGc+OoS51MNNPum0o
         puuw==
X-Gm-Message-State: AOJu0YxJTx8WBJHccGZwtzKCwVKpE/BBU6r1MT0z6b9k3mXlGtfocvPI
	OHkpfcReN7bjPoOEpqBaWHSXuHgIazRoEjqUBBvLuGFFONkpP9cQaa+TUFGXw1rgsUTdvmWfRYi
	tOnPI2iwp2972IYGUmzxnR7hXyT9VXu1vc5Ddhxnx01fKxwR2h+yzqWV38tdS0qN4J6isxMHeWw
	==
X-Gm-Gg: AfdE7ckxrcUxx0iU1rDsAyU4Gu+4KGepa+f8Ix42/qECDXBri08AWI5RZQp/87Ypelb
	BaHhfyuJLB96R4upAdhDT4fBB3hmHGPBtv3lKsoH1mvuUG9MxFsaRNbiKNmNZoz99xFyCjHXBa8
	1/pzBophTs1V4DppcsRzUF2E4tYPDHgewDSMmKfjae3m+Gtb17JuOHn+iE+sE+WEvgyq32HTeIT
	r5CttDMH8L2p3Vi8BzsRdd50v5LvtZGjDmLLO59BrNw8rsTZqzaLTOd2pc/iNWhgyqg5kxMexBE
	6T7U3eefjImhksjyx1/VP7RzA+Od+vre2JWBnGe/Xnd9lFTe8/sPpunOJRVN3rIktej2kkLmH7Z
	YmYuqmAkzT8aCUHjZYnU3hl4m
X-Received: by 2002:a05:620a:d95:b0:920:798b:e290 with SMTP id af79cd13be357-930b437ba28mr1153247985a.7.1784538748111;
        Mon, 20 Jul 2026 02:12:28 -0700 (PDT)
X-Received: by 2002:a05:620a:d95:b0:920:798b:e290 with SMTP id af79cd13be357-930b437ba28mr1153246585a.7.1784538747757;
        Mon, 20 Jul 2026 02:12:27 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c19457d6f0fsm388845666b.36.2026.07.20.02.12.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 02:12:26 -0700 (PDT)
Message-ID: <f0cd0e8c-3782-404f-ba75-8e339ee678eb@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 11:12:24 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] media: qcom: camss: Report hardware version via media
 controller
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260717-camss-version-v1-0-7ed71fea95e8@oss.qualcomm.com>
 <20260717-camss-version-v1-4-7ed71fea95e8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260717-camss-version-v1-4-7ed71fea95e8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDEwMiBTYWx0ZWRfX5OIrOljmEgSx
 DvaPY1KbDYcz+q2yaJQmDcrVrQARClF9KwCt6ZvTamSitTySbAx+Z0xbTB/jcErCTIvGcmneD+x
 DxDBy8cvpRNgIVLU+nXj/PnPXV53V5Q=
X-Proofpoint-GUID: cIL6v1UkjwEQucUIJPWfaygPRpC6nw14
X-Proofpoint-ORIG-GUID: cIL6v1UkjwEQucUIJPWfaygPRpC6nw14
X-Authority-Analysis: v=2.4 cv=c+6bhx9l c=1 sm=1 tr=0 ts=6a5de67d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=uMUtGptxAjs8TZNG6GYA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDEwMiBTYWx0ZWRfX9ppKSOw5DDyR
 EsQwZ2mC3bRFzKVvKjgoO2ERa7h/B4+e3uCQTJVrKlhYjVGGpherCR7uIocRkXKwZpXYhc4Qp7D
 t9sfZjP2qFIgPASjVYLrYDM3XhUFnfdn4m9zoVVxZxdXIy3NJYUrOoNHRso7jOnY/z/N1qYm4mk
 7T9XRp0MF9Ws7mFMM+6qW4YL1uFzBZY4Rh3uaToJDeodAeBSH/7EhRsGxcyTT/3Sy11gAUnI8I4
 wZjCgqMHk3m5PznrsdbUOegjz2tLridqUTs/vldU8e4iNyCgM/p6WGWZCz3hbOJM/PI0BHG3uXN
 wgIpQWkoEK8vb1JdWFkvUh2f27EChM94C7Z7dchOqfzOu903V09ce9Ssb7TSNY5ButERc/jJ8bN
 AmqrVJUW+PuBxttUNFmPlJKBhLCdC6AOBdZZ7F0pG/2z2kojb16/FrXmV9R+LvJN3ZVbPDILO2h
 c6iTN5yKVOCCz8lF4ig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200102

On 7/17/26 4:20 PM, Loic Poulain wrote:
> Populate media_dev.hw_revision with the top-level CAMSS hardware version
> so that user space can query the exact hardware variant through the media
> controller (e.g. via media-ctl or MEDIA_IOC_DEVICE_INFO). This can help
> identify the platform variant and adapt behaviour accordingly, for example
> allowing libcamera to apply quirks or enable features that cannot be
> discovered through standard V4L2 or media-controller APIs.

[...]

> +static void camss_read_version(struct camss *camss)
> +{
> +	u32 hw_version;
> +
> +	if (!camss->top_base || !camss->res->pm_clks[0])
> +		return;
> +
> +	if (pm_runtime_resume_and_get(camss->dev))
> +		return;
> +
> +	hw_version = readl_relaxed(camss->top_base + CAMSS_HW_VERSION);
> +
> +	pm_runtime_put_sync(camss->dev);

I think non-sync is fine here

TOP+0x0 seems to hold on TITAN, MSM8916 and MSM8996

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
