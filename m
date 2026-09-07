Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B035148033F
	for <linux-media@vger.kernel.org>; Mon,  7 Sep 2026 10:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788778622; cv=none; b=YJac2u1Wzl+JXIDMr9Hyd6JmgcyaJ1ahR63x0B0qADvwRKarOwrIM9RV/UXNCqK0clVxVg7TiTSmrfIKwsjQFGHLJrXY8XbAeVVcv61tS46WKRlauxEaep4jSBMR3KBqT5T+rqCtnZRgCYR7x5BipezXCs9AAFKaySPIgDlMogY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788778622; c=relaxed/simple;
	bh=v1gOmgndgVwqDZV5PtIH26ja5YsrzDRqZskTemBCXng=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tbg640OOkSv6/jAbtjUKLMuQEbm51At7i6d2JdO9++Ry35yfTi5fWxjGEzUeh+AMKdg4GMRBqIxHkinN0izUD/I8I1YkjZOe0KmR7z7e4m7osb8Je3jZGFmqRN94cvTqMkmxS8lPXvQb7dpzLBHR6a9uZPcvIHAiondsIFSEoWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SMDs+HB5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hoMn4IyK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SMDs+HB5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hoMn4IyK"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687An3j83873334
	for <linux-media@vger.kernel.org>; Mon, 7 Sep 2026 10:56:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S/u2aOnm7jMdJvz7fdHpTftANtj5i2bKRGQOMp2ZeKc=; b=SMDs+HB5G3BJ4Haf
	jEPFDlTrUrnXF7BWyrIGYFivDdaud7fvIL7+z8AlFDabEKQyYfBu4fSNhq4yl1nZ
	EIOtEI/8q3+7EZjsLZEF3j2Z03Ahc03OhfzaQ51c1UU3czOPrtrOdnj8ekouxUeC
	jPLaA62Vlyo1Nbg98zcUOiGEKCDXdxY94gfO/FxubMzhIZKCUbNWJRdYe3RmJzzI
	2TTJEgShVm9J5zEjKcCcjtb6jSA7lGelod47u9n9QHQB6mHPHM0x6urthO99O8oy
	YhC4FGmDDfOf7c1BqNP+efAqqqluBIu65b0AeBM+P8Me5n/AiHI0Py2+XWNiFWKp
	SgCE+Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghnmj1p8u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 07 Sep 2026 10:56:58 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-396b9ef3070so5460840a91.3
        for <linux-media@vger.kernel.org>; Mon, 07 Sep 2026 03:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788778618; x=1789383418; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S/u2aOnm7jMdJvz7fdHpTftANtj5i2bKRGQOMp2ZeKc=;
        b=hoMn4IyKPpo+eSABUFLWrwTgFo++A9qsBjJH5kA3+thQUk094CgG1NMqXMCR79MVLp
         rLLexeSf/ZJlzQXUNBgo2yhoNVByfWh/n/MkKHExYIZFWQwfycb07Wz1ctmWhXVDzrxp
         LB0abEYzTDa/By1ETkKoKIYDH4k+RtViJE3eyQkUT+eMQIdNGGDGM0aKbMFe2lGY03ye
         u6E90yIAlJjiKuC5e0lKt1emia3+deWCSA9kNpgtVdXgkAGpRScnrLlpj9ITUREWqV1X
         7WCPGZ149PCzAhv+EjVTkWuYta2lWuzQdfc2gRv3djrafY43jE6RvBC4wYff89cMYnR+
         JPsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788778618; x=1789383418;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S/u2aOnm7jMdJvz7fdHpTftANtj5i2bKRGQOMp2ZeKc=;
        b=kccLxHj0tJQCsFbYk8WFEdpshaItNEEDI2KTBXIAFr1dhUOSBE8UIkuA9L5hPdF48h
         rqK+RKvdTuJIclqDFzyYNRH82VQQA1SWP9+qdy54aBloAV6wxx+GyQvHVgKq07dnsIbX
         Us55Q6ZNbzd645qB6gcFOoxW88/kwVhgGSZqJjHjK49gzf21/61HmaA1P64KDgl7Pq3D
         pnpLIrz4wqxsqRC0FaUrJVpFdgk3hho/dzjsDDBHsOSqjWrsdrHQZpeJUcjsXFeg5AJm
         7WE63wMSKf4OzEuVL7r7SFdf1MUL+ZaOLrfrS5AEfA8I2PhpLqjDcq3Uo67pKAQX1wHe
         jnaQ==
X-Forwarded-Encrypted: i=1; AKwUvBw5T7kgV71PMnL5UQuSFn8iZL8nRF+r4UL2eEqztr3lKz6qgj5eUCGRNiCVeecmF60fsFWaSeZ85ju3KA==@vger.kernel.org
X-Gm-Message-State: AFuF++lUXyJms3jRigP0vJLtkL7rgvNNVkjoRSH7gVxvTFEMukVDePYS
	Gs84bigjT5ebt8XcbkRN9dysdF5kNqHpGRBYuGNtbfycyV7ZoU7KarrdHpQLc5j9RxWbNzv3U3e
	Pa6av8+K1N0fv+QdedZqI+LEK2dxCMon9KBmb4VJPGL+y76JTCs/mBxVCgw3R6xZYUg==
X-Gm-Gg: AYBFou1AXxlC7cCYqpuxV/tgidZFpdFls7eM7+2AkyNVXIFRV+GNAc6H2r+Z18SRiv/
	I2rRv8oZQM0uHpqJirv9zCie14aM+scf48StypCTJbMwT0tw+gfBCOqUF3TTLMy/MNoPWtcv3s/
	7GYlQVz9gnHRXBItcgIa0Ju/kaJvchSvlPzByxbBHrXbdUyH8g9jtGNZ3Re/nUbxZxZI4NmW8RR
	6CajSViVRr74M5iPH1fNr7bj/pcW3J/VFMDbLM6KBdOQFmubHIyJjAbR1ibDKgDSl6y0WWPsv3t
	pz9jTi7KKiz3rNiYf4QyKiPU9A2R7IvxlZ034HQbQwGyARKtWrq+9VMjw7YqBdCeGKzqXGwLXMl
	65+rIRf6toH6bBGNAbadudGD00/WHXJtAYzfIuMNkJ+yayOjZy9pOf5ENq2AJN7PeMeEZDEeFOl
	hW8Bt6v6UnqFm6Vq3w7g==
X-Received: by 2002:a17:90a:1189:b0:39b:61f1:8032 with SMTP id 98e67ed59e1d1-39b61f18060mr6977288a91.16.1788778617632;
        Mon, 07 Sep 2026 03:56:57 -0700 (PDT)
X-Received: by 2002:a17:90a:1189:b0:39b:61f1:8032 with SMTP id 98e67ed59e1d1-39b61f18060mr6977214a91.16.1788778617136;
        Mon, 07 Sep 2026 03:56:57 -0700 (PDT)
Received: from [10.79.116.160] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885d29esm30014762eec.2.2026.09.07.03.56.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 03:56:56 -0700 (PDT)
Message-ID: <97360c1c-f573-48c5-9917-4bbc34ad394d@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 16:26:48 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 Glymur compatible
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260907-glymur_camss-v2-0-75f7982dc983@oss.qualcomm.com>
 <20260907-glymur_camss-v2-1-75f7982dc983@oss.qualcomm.com>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <20260907-glymur_camss-v2-1-75f7982dc983@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEyMCBTYWx0ZWRfXw6VmUrqiJIE6
 oTiVKs9HVLiQ1gEPE84BmH3FBEcpU18k5U5qfIz2wpMaHNgFvs49r4dlgl8CyjDKK9SDfgMKZJC
 KZiEKtwnQDmmDh1KSQ8WADJVUf7lUXPR1Hc6x3yi/MUZCe/VFQxti91zx9KPHLYCaOothM+2J1z
 lU4PSZx/PNAyeCxpZzQjAT4eYDK35i5AuLgA315A8Vys35X2vSLAuHC6SN9oMCgMHIxWBmD5sUO
 /J0Qd0bNpd4V22OiFlYvq5Bn16S4VXqbUFoVA7vXc0taEJudo1L6Wu9JZ73DxTDND+26BV+KRPM
 wOAxklr55NzA3Jx3H4bSBoS8iRKC2XHMNncN7JUkq/6LugVzBVYFkZdjhyDnSCf2cR2NT3jTMLt
 FbEyQ+3Vkp7cuUXV8CGPZfjx3NWyF0thDO/CiVwuDshQY2IL3pEF1+MAa6nfXZpTsasvQIno2kt
 eaO+IJOIABZR5Mv6uSA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEyMCBTYWx0ZWRfX69WHw3pTNfB0
 X+Dki0Jg+8F8arJkbckHGt+402wGVEGBT+0i8ZVxdiDggeTRJAxZ/5bvvd/RiyLSEaostUYLqpI
 GAGuahib0SPqAkcWHk6r+ugQqysTMMk=
X-Proofpoint-ORIG-GUID: X22mW4qHUbyPWB-mYj7UTBzCNXzDznED
X-Proofpoint-GUID: X22mW4qHUbyPWB-mYj7UTBzCNXzDznED
X-Authority-Analysis: v=2.4 cv=LZYMLDfi c=1 sm=1 tr=0 ts=6a9e987a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=FCQm1kSmxEXMnWVgeMgA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1011 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070120

On 9/7/2026 1:43 PM, Nihal Kumar Gupta wrote:
> Glymur integrates the same CSI2 PHY IP as X1E80100. Add
> qcom,glymur-csi2-phy falling back to qcom,x1e80100-csi2-phy.
> 
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> index 993271c42fa063a82cb0f6edd41e87b30bc8e109..7ac944974849b99abd982b1544ef39fc32e1f21b 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml

There is no such file as qcom,x1e80100-csi2-phy.yaml,
Same was pointed out earlier on another patch,
https://lore.kernel.org/all/20260722-literate-nondescript-seagull-cbdfaa@quoll/

> @@ -16,7 +16,11 @@ description:
>  
>  properties:
>    compatible:
> -    const: qcom,x1e80100-csi2-phy
> +    oneOf:
> +      - const: qcom,x1e80100-csi2-phy
> +      - items:
> +          - const: qcom,glymur-csi2-phy
> +          - const: qcom,x1e80100-csi2-phy
>  
>    reg:
>      maxItems: 1
> 
