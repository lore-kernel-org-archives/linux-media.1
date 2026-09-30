Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846A343B483
	for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 10:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790764446; cv=none; b=RY/7vaBSJ8QTX2FANmoxnu+xbCyhoWweJax2PKGWN+g4zI+NCWTTBoSDmap3U+oBai9v46PzAHWtB1ABrPpGF37IjcL5cBzr0s1VkhEhBZiHze8/fIuRr0W5lHNDfoVHwLDOl1CwcNFziNMq0uZAEpwlsgVsc6pnJLGgYbq+KyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790764446; c=relaxed/simple;
	bh=B5M7ExAdSYXfY9Ds6hbircikXslMTP7HxDS17duaV3U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nue3bwt+W/JjhECni+jRLSVxWmLwLViLRof62fZsQxjkF/q07XClmgW/9cQk2xBeZRVTU7s9Gl6/VzKfKU4XwBZNz/b5nb45yXZUxkczZ6lQcsy5/uqInFAVPwdepv5ekgHDbkNIiBOn0a5JQY5qr7ZlvHuKGDIrbR/RaA7FkYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mcuLfzas; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DDJvBFU7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mcuLfzas";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DDJvBFU7"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U97mM74151670
	for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 10:34:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mna7ZMPQZMnphcYmegEctv72t1rRymVguBHz0zldzK8=; b=mcuLfzasxShQJgwb
	mMbKqSxFaxJ79aQakGIq9OtLRDQi6rPc6aLJ2alM2KjKJayGEjR3hcE7TadMmAUp
	ZBsE7OQ13BrqwC7nCT4cN7SaPS1szAs/jTaq99+p8EKaM8Dv/O+7uAa/CKJl8SuR
	D7bVPAp+cD/oUvG+e1/hDfOB2oBCJuJeB6UuhPZHdcq/vS7qK8kPTOOtnKn9+yA/
	y0sTaugqJX2ccet6gdX4OhEGQUKzCtYmDA2Ul75joLl10Y3zBoa15Q2yxLVLwOAm
	qqqePi2Edm1AyDfvrsBpDWsoX8HNbTzO8fVQXLxc7Y1vh+0e4AIyJ07YNzUWBxiO
	n3sSVg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0yh80bey-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 10:34:03 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-530d04ab694so17112701cf.2
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 03:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790764442; x=1791369242; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mna7ZMPQZMnphcYmegEctv72t1rRymVguBHz0zldzK8=;
        b=DDJvBFU7IX9+poGrYkO3rPzkXlhgqdtTjVsRyLpoUMDqGSSfK0uhQ9IWCE+5NLyRK6
         QysDosrttDZxi7+X+kILwc7BHnJKpjRiA67S8F710Zwv76KrYORUNL1mPbZqzuGeBl2J
         I4cPHH6MqrW7nw04lCP8bL3d+VffhPx/envs7GajmWbD/ru1bSRBBKrjmL/+MHlI9bJX
         xoMVpcemXrRfoLdl5kdaCQWVB/NqaEQY0e8QZN/S9lryK99ZuzaiFmS6r82yj5M3fzpo
         Uh5Klwt0URkp4ueiOkp64E8/k3DGZglWHddydd76nBFYT94NThfszADCxjvDqFN5qi+b
         W4mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790764442; x=1791369242;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mna7ZMPQZMnphcYmegEctv72t1rRymVguBHz0zldzK8=;
        b=NIiQzlXAZyNcar4EeyeJ9BEEXvyIYRG6WdIJ4ebdBdB5MLNKJyh4rwf55RJQHunK/h
         0Y8e5GdT6yyQm6xxaa51yrw+RV2qn00S3DYdZ1SQ2G7iLGkZDtNoG0ZciZTmOuFk22il
         3MlBMdVIDQ0AImkn4bw0pn96oduQemBUMkyE5UPKPB/iXqjkskIUr9VFJrSBenAseaHT
         +sH4PYAr8L+TLdpzT49lAf++dRNvRYlGU4ptoxNdn+Gyne78bEmgs+QJ/rhaQUQ+9j1A
         ZWVxZYzVohEVJIOgZhHW5H4ElyWd75hvZuvHkQYpfUNEMHR19G0sMESpf6GTHun+2D9s
         qsnQ==
X-Gm-Message-State: AFuF++kFQQh9hmb7Ck4S24ROR9yLp1jxnv6NFn+8zUQPqxyj6+/OC+Ee
	+WsXvP0ScrFPGhZ1kzIJlq+LL3ObP048Gn/jyPWfyxSujcYTnTzPLWlLXbhMXrx2EWL/Qubo9kr
	Z/a1LB8d2TIaZ2CSvnEUXVi5iwzyBTGrTjp46p1VQb6meE3I7p5eFwr8UmheEYnOoDg==
X-Gm-Gg: AYBFou3t8taR4w3YLImvpiypmRDtCwDgF4LMMNVohXbTX8ifDztxFVBNHsm/utMsmzi
	+ZkKS4qJV46CfYxtnUCauKq91a+Y7m2nuIHostnjBXpinlpQETXIM2vsbq6JxW6ASFKzq7vXxO0
	BrZHJaLodaNeRrG82hXr5CecV/5LqkRAIZrxJLD/1lnpDCfct0D935HPt3RlN/xoJ8hzSgZ5R2k
	lwp2ZUnYUfjL+uS5dLLxnFBw/jyDr3ZNceb6ITY1XOZuAwA5U3RjJdfiEg1uI1S7ivY6vAwrK9r
	lVo1B4UkWgppJXTfEX3jTtjIA2ytuhI5zgblZdxcF6YCk9Xv0ZXJBIzZaUKN4+XQYHrMcTewg2Y
	5lx1nc5CaUELb1EinpQudfA==
X-Received: by 2002:a05:620a:6506:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93ca9418c15mr132548885a.0.1790764441805;
        Wed, 30 Sep 2026 03:34:01 -0700 (PDT)
X-Received: by 2002:a05:620a:6506:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93ca9418c15mr132543985a.0.1790764441219;
        Wed, 30 Sep 2026 03:34:01 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e22f42da8sm44604666b.19.2026.09.30.03.33.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 03:34:00 -0700 (PDT)
Message-ID: <4f56045a-a2d0-4c3f-8e69-9ef8d933be8c@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 12:33:56 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/13] media: iris: Migrate iommus to iris sub nodes
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
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
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>, iommu@lists.linux.dev,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA0MiBTYWx0ZWRfXyjhNRr0ljaOR
 5s58XSmZFNMx4dkwiQxupglX7lR96PfoiNoGMW1C1d2mU0aUR5bOE93ZT89v6OKbtHLJsE+E9mj
 A+4CbZeKpA0qf/VX7CPCU0E1GhCojV8ZH+WhhXFSx3Vvg/1xu9t0FnlggW6EbEkvNEeM6Z1m9EP
 BsI9Nc3FRCgHbN+FQ71yenDNw8715EGo0wjstVxZ9HWKfMZ1sodn+r2H6ED1eVSqp6gQAiWMyOj
 Qh524JR7V/pePAdqn25/va5IOr+p60Vn2JSEgcETzDPPqeZ1KqM3db3gTCREt50UFM6bx3P6LTz
 aTJ0DhBLPX9OVRyzozMDT06Aar+QSZBHr9zD6YMrI2wy/jI2jgnEFcQFF2SaCIgTLJc60kI4oNG
 QU6zCl7wbOATP28IKOoQdcaMkyioDXDjiz5gvQyM1EYTIlMwhbLOFEATIEhiuYkL7/zqKi1bpgc
 NXbWoJ6SeZIsHqSpjZQ==
X-Proofpoint-ORIG-GUID: ZXnN2nd-5NlVQ_nnstM3r6MYEJMmgMfe
X-Authority-Analysis: v=2.4 cv=NedzRGD4 c=1 sm=1 tr=0 ts=6abce59b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=ekhMd59VzrWsTOqxRA4A:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: ZXnN2nd-5NlVQ_nnstM3r6MYEJMmgMfe
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA0MiBTYWx0ZWRfXw/dxEnibhRuu
 3fVylySLbw3/T13FdeyjBZY30B3LumgUKm7+3oIVXwSdxTKI6j+WD4Z/OxUcXTJ1Sh+tXwwZkc1
 jVJgez8hFxhe6aY5yZ/pF8F+N0/0mV4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300042

On 9/26/26 8:33 AM, Vikash Garodia wrote:
> The VPU issues DMA through several SMMU streams, and the hardware does 
> not restricts specific streams with specific addressable range. The 
> non-pixel stream is restricted to use 0-600MB of IOVA space, while the 
> pixel stream can address the full range:
>     +-----------------------------------------------------------+
>     | non-pixel stream addressable range (600 MB - 3.5 GB)      |
>     | 0x25800000 - 0xe0000000                                   |
>     +-----------------------------------------------------------+
>     | pixel stream addressable range (0 - 3.5 GB)               |
>     | 0x00000000 - 0xe0000000                                   |
>     +-----------------------------------------------------------+

Please address all venus/iris-enabled platforms once this lands

Konrad
