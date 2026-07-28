Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573323C3C07
	for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 09:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785230899; cv=none; b=u7TgzDr76Fd5dhNByjNtSK0EFJMi7Q5zRl5txMQT0dMNB9ZKKujfr9Vuw+/IUMD2OMtnvNZq3OJbNabmU2XYJS0NVKRIX/i3UmgdI0ypqR5zWABRPyZ/48tRWgAbecdFmXJ91LJgE5Oj/riPII+ezVveb/LAO+t95FQ/qQKZamc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785230899; c=relaxed/simple;
	bh=y42RM1fzOk5YTulLaeFHukZ9+4O1czG+LxxzTgCHJBo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LUuy5UTUm3JsoKwjSoKYwt1f/ctH9kPzk6cxKWpLa1yLN7hITXXzWeO6oLUNtKNsfS/My9j38lPaqJU5Z5KIj1thr7pXweiLk4UjoY1yOsr5FuCsXrcThlnlJn/3kMiLrcIeH+ASPtBRcTxOEBUm1r2L9DWougokzsQWcAhkQaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KoiJROtn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=btpeaIrH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KoiJROtn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="btpeaIrH"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S82DHu2480149
	for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 09:28:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5tviKT6P/kvNE3ZLVPdJj/sAPHdfeGtFihh4yLKTBkI=; b=KoiJROtnx6Ue0OWo
	umaPzEYnRqUuBI7ncigPld+C2Ahf7cxu/Sf1M63XYNo32RI9GH1pdn6Uf2aCt2DV
	iOrkfQtP2IZPAvg4pEADklWlXmMrQgvdMZXlbIDwk2SFrbLSEdKTK9q0aQKJ3xRX
	B3vtpxDR3k2qZA00gHsLHcpmQe8L3O04w7mgPtSfiEozTiiAaj/ouY9xHQF+eKmW
	Q6gjDFfbkzi8YvBs0D+XvjZzlr3hiPvJh3Va6QkkI357otGm0cmZLUD3coBjSGa/
	K1sR6LV6YC3O8TmIGUKIBBo8LH5UhemoSeyXlDaOLO7kVaCx0Sp5MlVqgv2OlFb4
	SaHOQA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpmy117jm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 09:28:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e66f9e2baso409255685a.0
        for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 02:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785230896; x=1785835696; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5tviKT6P/kvNE3ZLVPdJj/sAPHdfeGtFihh4yLKTBkI=;
        b=btpeaIrHA0z6hStAf/CRo9F/xoHSrGZfWN478jYkCWOuTKMk7dE9+EaqjmxvP2xCqv
         aU25tPDuIPMiP40vetUkHaG+phorn318OWiyHMmRaPdbkUPLkLVUckeqXvz0OaZvkCb1
         tEvfD+Ol+e4w0QaNDrnWYppkaTeCXMtxkrfYAj/6tQV7xxPGc3Yd9YMRbyDXFvK+MoXU
         D7WunchvKxhybGZMn7CCtE+BsXD3Cz0mS4hslsMALTgau2/HB6pXUBhbBTN4qZRSC+BK
         BU0k/pJVKLgfMl9s7sYp9J653mFt1++pCJy8Gwsz/LmBzVaKqTNnVL+p6TjqUjiIdJCB
         YrLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785230896; x=1785835696;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5tviKT6P/kvNE3ZLVPdJj/sAPHdfeGtFihh4yLKTBkI=;
        b=iXOwvYW8hh53C8ZTVq5QhdNDmzjNiH2Z4AzMzEfa+HIRb3gWWil4c9dk7XRf1axkKK
         ncV0jO9A4W1fuMM6oNNdISg1yko52Bn5baSRIa6FmOL56A8OgEdAzd1xJ1lwXqhQlO2Y
         6NkVIA4FEv1w2APEtMIBTLpcUThgjQ0qWVzi1yU13I+YDIJzST+6mH2sIJzCq/fJ/ApG
         8T0hS43G0FeYoBOyNVqnF/1UvIPLfgsmsqMDGT3P0YV0prh9fdaPoD06Bua87XvF4hm2
         5x06j/5ukZcE5VfNy/xQRVbnnKh2qErlGJUcGUaSbKVekCImwEZHaGEbqvFF7NIxLlE+
         E8uA==
X-Forwarded-Encrypted: i=1; AHgh+Row0U1j8TxhBkmIzVE3ondJSe2ftXPgoeHeJjJtFUXhkrGtqEzRq4ugHydz7V8dDziJ+CvIgPKiDzFx+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKgM2oIp7JPeuFuRYCtWIDu4UkeFKU7gZeTPV8gTuvTuil7Cf3
	z3QfFWlHHA48tfiCtq9tYFmhFhOm+drsfvvHQRuIJuPXejUB5lzDEdMemux9efcvLVaoWqfZ40g
	Tm/2un4Pxnbr1iMW468lLcDJtYdg3kybmiWL5zz31rH2XsFMh1ChZIAW7N+YQScE1+g==
X-Gm-Gg: AR+sD104BF8atfR1WzIfJ0dqJqHAyLSipdHPgIccTtGJoYhcBZI2d3QJELtzTjNNpLC
	6vpWPKFHW3SQytlH7h1PHysatjoPCvtfcvtYFsrh5Ho6Q/WoZp1qea8fnD4DhooAs6QCZ+pOyjR
	fN4JlIdK1S2gzwKkk49cTvWTivNowMkhjAOkSKyHefSbrzrGvvHJ2+KlryGR/d8444UhCJAJCvp
	c5wOHM+QpbJ80VQcE18Ry8g6AptcY+zwy79TIrtfDNB5Ap8XQQPdWG0CdsKLmC1x193xjhTKxuz
	oUsMHapTTK/1tSJrKB/juz4taHbY447EBnz8DpkNyelFqZ6SufERHFGFGQYWHOd0EHC6+zystJz
	Etxzlf1ErfGZX96bSoaIOCrxkkIDA6qSm
X-Received: by 2002:a05:622a:412:b0:51a:8c9b:64a1 with SMTP id d75a77b69052e-529d7169f3amr12172971cf.69.1785230896448;
        Tue, 28 Jul 2026 02:28:16 -0700 (PDT)
X-Received: by 2002:a05:622a:412:b0:51a:8c9b:64a1 with SMTP id d75a77b69052e-529d7169f3amr12172851cf.69.1785230896084;
        Tue, 28 Jul 2026 02:28:16 -0700 (PDT)
Received: from [192.168.1.73] ([92.247.57.178])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32c902d2sm723840766b.34.2026.07.28.02.28.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 02:28:15 -0700 (PDT)
Message-ID: <22caf78c-4855-41c6-8a36-4dde85e3d102@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 12:28:13 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] dt-bindings: media: qcom: Add JPEG encoder binding
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org
Cc: mchehab@kernel.org, vladimir.zapolskiy@linaro.org,
        loic.poulain@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260728082548.2511694-1-atanas.filipov@oss.qualcomm.com>
 <20260728082548.2511694-2-atanas.filipov@oss.qualcomm.com>
 <9ac3c44f-2227-44fd-abad-fc85ee57ea13@linaro.org>
Content-Language: en-US
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
In-Reply-To: <9ac3c44f-2227-44fd-abad-fc85ee57ea13@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: _u3_CikCrhQYgEuMCZV0ABRRC-c2PY6_
X-Proofpoint-ORIG-GUID: _u3_CikCrhQYgEuMCZV0ABRRC-c2PY6_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA4MiBTYWx0ZWRfXy27TaXMVYHDI
 Gpms3PnjhERzgt6bHgfenqF/vZwSWvQvXBk2iVparabxGHpNwC2vn4gxf+M3WlCZe77Y/zXRNFk
 W2kQF0ir7S62R0b5d8B8FG81BEF1j5KG69sORpQMdgmpZXgxx6IdsIr/JzgltlRuPeAw7uWx0uJ
 Aonl3yIsBUoSix+TnIK4vO4WJKf10dF3MxPAGoArhCsyBWsRPGWxfmhU7TAk8xmi911I2eoN1i0
 YORVvH/R27nba/yLqHKvPFrOX1HZ54l8fNP4G+wasAV5qT59nFTtIZbhFoqDUvGMui6MeiLlR2R
 mpFfmhmJl/HcypR17iiOXDfzRKEAOz9ea5QrGoHDlD1IlGnU9t9Vzex9lIWDCKKD7aHWIPhChAi
 Pez2N4xzwgGadGAwGxW+MC+vXN/NuFR4Wa0X5m+IRMS3vMWpXBh1pMxSRj3rUMz4zEtB5udNgYe
 v+ceB5ToLLLRFyKskWQ==
X-Authority-Analysis: v=2.4 cv=PJo/P/qC c=1 sm=1 tr=0 ts=6a687631 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ybD9qRDIDfZaXNPQ7Ca20A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=dh6gIxRJ7RYJEidOAkwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA4MiBTYWx0ZWRfX5mX6hDwt8+al
 zCY8hhi/EGQMfzowEU37GT3bt4EyMLM4MDEk9TNlUcG7+4v8yn43P2W7Su35mQTlQBxG5sCLryW
 8xK0m7WuvBa6mhyEQuEdQf+jvYyvrvw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280082

On 7/28/2026 12:12 PM, Bryan O'Donoghue wrote:
> On 28/07/2026 09:25, Atanas Filipov wrote:
>> +
>> +        power-domains = <&camcc TITAN_TOP_GDSC>;
>> +
> 
> I'd expect to see MMCX and MXC in this list.
> 
> ---
> bod

The MMCX vote is already covered at the clock controller level.
The camcc node in sm8250.dtsi declares:

     power-domains = <&rpmhpd RPMHPD_MMCX>;

TITAN_TOP_GDSC is a child power domain of camcc, so when the JPEG
encoder enables it the framework walks the parent chain and votes
for MMCX through camcc automatically.

This is consistent with cci0, cci1, and camss in sm8250.dtsi --
all use only TITAN_TOP_GDSC with no direct MMCX/MX entry.

Regards,
Atanas
