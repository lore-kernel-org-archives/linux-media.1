Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B670470126
	for <linux-media@vger.kernel.org>; Wed,  9 Sep 2026 12:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788957983; cv=none; b=Mh3Z8WMZzRu+W69vghyiIy4kwVLjkyYO/855YcbniRvkmev/XwwMFvd2nIiwQ98fxTtejpdWWeRIfFz0zldCBgye4ICEw5Kwh80mPYPdujFpvjv+wDYqL5eNJhQfnXGvriy/c8XrS/3KWJxNrodZmRwCT06mFPYX+IDrEafAD9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788957983; c=relaxed/simple;
	bh=yI0YtwwDoRq46cm6dlAsPClpp9C16ia2CjUjaVPn11M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JKR75T7cBZUsGbaFysrf8zy/m6UJsn2pLv0OoXo7VQUCkn9MAcQY8JSyXNmxa62Rxjm+FlJzbUSEEAYN7rbJ3KOweUVzouGR3WVItKObtzwq6CtQi/8UISX2WTrw3RxHgKXwA+ha+EKhT8uYYAe1LwVUYpHwwfoV1yhaZY4YsTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dkkJeDvQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WXpcP0fO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dkkJeDvQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WXpcP0fO"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU7tb2375926
	for <linux-media@vger.kernel.org>; Wed, 9 Sep 2026 12:46:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1Rx/vpo0zvv0ttoTKgs+GGM/ZJwxjq76fMb0r1Xbs2U=; b=dkkJeDvQdQ3LR3Mu
	2R2KM1Rqn9gxAo8WifsUlLYIdBz/yVuTja/aKb4DseodKUcbyr9FCsnAgcTw2rVE
	PdNnFEEdM3JXy713aNWi+Lz+jovQn9zxDcWUp2I8Zkslr1OoTU8K1vL9c6At/RGQ
	+j0HEZgsxELhJjlOOVqEuFPvLslwlrWNwmbJHCv2+/vSFV9DxIQVTSJtHXsk1b4t
	CnDjS9ccmHDX//Y91u9ZhhZj8P/hNbcKOsGJI9vETDw8bbhh0Cjox+CCkT2hJzbq
	d4DoRXwEcsf7b8dS6g8iaDN9odOPE7Au7hes4KNL6ZiXhm8yjqFP4HKrb73APElJ
	lm5Fhg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk5ru0fde-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 09 Sep 2026 12:46:17 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c665139c92so142136e0c.1
        for <linux-media@vger.kernel.org>; Wed, 09 Sep 2026 05:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788957977; x=1789562777; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Rx/vpo0zvv0ttoTKgs+GGM/ZJwxjq76fMb0r1Xbs2U=;
        b=WXpcP0fOO3qccXf9R/Tern2dNLmsE6GM76og1z1LXLMzCBsZShdGmv4y2aSqq5kCEB
         jDwPgtNInKIclRsj75jrKhFiAreHwwohLX9ZP63UndWAJ0V394CqDeIv6RWQfYp5+App
         /KlhDGMNSSYHOXJp/AnT9hYNQ2HFWzRiRWWvvESeGwnGP0FPuuBGfzWax8tQhGCgDjHB
         6nlEwEZEi31hGSmmw+azJD+Z1NaQStv4Y7zcPx6YgjpZdYsP6tL6UadvE6IclK/y1LX2
         Qn4SMGhzZYwN3/gt4XXPLhol+QJ6DBv97MoYviox4x5lA9qdMCLwFRxaCh0r3O1BPvuf
         O3PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788957977; x=1789562777;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Rx/vpo0zvv0ttoTKgs+GGM/ZJwxjq76fMb0r1Xbs2U=;
        b=oFyL+1DOHckkSkAVu0SDzvhvsQxskqyJ7JxJl4jyZW6GC4WhQcCRQMba9x0iscqouj
         X6YNPP68sp/hZhuiEGCQyGPXhfVTHoMlx17Z6XL6jDt8bjYHkuviVd3LG546kPEwi4zj
         PAQoegzbcxsE03bd5YZoY100CfqTV5vHCcr1w4GcB2QNMHUwSOF/ZCbNgqNS7srV3AFp
         UGNiMisbO3Sq7SSWizZmOjPVevwGxgNVYu9ZNbkpenaPyBMQhkC//jS2ja92+PjbBuNk
         stkiyRMnuSPRCvlQwgAHQJtTQRFVBmhnqYIDdjFWvINnpqZPobkV5Hnd16cD2cC8s61Q
         3loQ==
X-Forwarded-Encrypted: i=1; AKwUvByFcMiYJ96QaQA8Y8T/yYWkA6T3VU5Al/BrwHSIg6w7lP8pBPtYJk/UBo33BoY/FgcVit/XNkzLWmyiOg==@vger.kernel.org
X-Gm-Message-State: AFuF++nG2xa8Dsq0wPEcwfJ8exp8M9MvktaQcbFfJSjA0NDctRwQfYlR
	vZfv1eP9Cv2nj4ekYLNwtAe7xUy21Aj+eB3KbTocmb2/p899bMGO4aP6Qcsd17O8Ej++S9b9hLV
	VPUXrSsoLB6Eh1nAKVja8EUTie/HByhpsXympxVIrPaQaUqeTtCmJ+1hanFYZkJ7D2H9o9oROjA
	==
X-Gm-Gg: AYBFou1Z3pB/UYmUdm4QuLlmtEKqmX0I5zUiswIy2SIrUyKVodFimZ1eoV+ZsIdlf5H
	Pu/G43DqxhyqlDqpAw8ZGnXWPzqyN3PPlkU/Me8MCvy1U5vL8oyrUFnOlF5FvF5sMkOnG6ba4of
	9MR4Jk8jdCIQIk4vvNvlZpI4+iMCbsEP3+ClsIGA5qik/t+ONn3K5m1RvXr74Sb8wlhme4krUeq
	eftMCpUd2kxGX9J0iNTBd7q8QcZgQCVi59sVZ/LIaxiCWmwtzjkqM5w1WsXYTndwH+E4LoFidep
	NbHOXzDD8mZJ75qgG3j/wrUepsI1vj+B2J4oAVlrNThZSKRgaHghFpbqC4AwH7xJrVhW7aGl2H6
	Ejqb3QNbg6OrPLBHP88zSWw==
X-Received: by 2002:a67:ebd5:0:b0:790:563:8d1b with SMTP id ada2fe7eead31-79005639f22mr328264137.0.1788957975505;
        Wed, 09 Sep 2026 05:46:15 -0700 (PDT)
X-Received: by 2002:a67:ebd5:0:b0:790:563:8d1b with SMTP id ada2fe7eead31-79005639f22mr328244137.0.1788957975073;
        Wed, 09 Sep 2026 05:46:15 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260cb7a18dsm762361366b.0.2026.09.09.05.46.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 05:46:13 -0700 (PDT)
Message-ID: <ae3a76d2-9c46-43c1-8521-398ca23b36e0@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 14:46:11 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 05/13] arm64: dts: qcom: x1e80100: Add CAMSS block
 definition
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20260906-x1e-camss-csi2-phy-dtsi-v6-0-067f2ecc4630@linaro.org>
 <20260906-x1e-camss-csi2-phy-dtsi-v6-5-067f2ecc4630@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260906-x1e-camss-csi2-phy-dtsi-v6-5-067f2ecc4630@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=M+997Sws c=1 sm=1 tr=0 ts=6aa15519 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=BxjtONQi-ztXtwshH1IA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: ohPDJ6HTrnMJWhOSk4VRRss0QGovu4y_
X-Proofpoint-ORIG-GUID: ohPDJ6HTrnMJWhOSk4VRRss0QGovu4y_
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE0MiBTYWx0ZWRfX9QWMnkTKVmEO
 G6vYdEz6Iv6rqIsVoFOQPDp1Xce3dhlDSiVj2gGyIU5B1ald/pV0cGPYZ4GexnkvJCYOr2WFeLl
 xRbN23ElKQ0VSEfM206J8J8d0n7P8dk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE0MiBTYWx0ZWRfX9Jexuw73JhtX
 idGPmZRXoiJ/hZ2LtdrLUSQ0GLinaQBLhDDzr8Y321qkVO8uOc57z7HH7zB8VNZPKepjVe7Wll/
 Wh7K++4nHSplGjHT5B5gdvDtdZxLXW7Fj1CQNGLxR8yk23/J4825SmsM33nbdubkMQtlOgKdMMq
 9u6HNoDqREyBSV3KaBsnnxrKELjAY66a91NbPpg8hbw2z+UFzQQn0n28UysZvKZWzC89jTTkDjK
 3wxQlE21y9pgOOdrxTPM9dZh10SPJaKvx+quKe1Hxf8U8wfbVpFvjUccwEl0AKTV+VK7oWLgN7w
 ZPllTKD28fEg2iXFNN14j0QeHB6ZTwSWs6zlagb4vNM8njQbyQUU4ifY/GSS99O5O/3kkyttYNq
 7IpZxPEjtlq1WfVjjT27krwk3/Q0+ZCM6F6+7DvRaAPSk7wbsD+l1J27BllcrJS2QgOE4uLioiI
 NRxkutS0NsL0E0kBfKw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 spamscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609090142

On 9/6/26 4:20 PM, Bryan O'Donoghue wrote:
> Add dtsi to describe the xe180100 CAMSS block

"x1e80100"

[...]

> +		camss: isp@acb7000 {
> +			compatible = "qcom,x1e80100-camss";
> +
> +			reg = <0 0x0acb7000 0 0x2000>,
> +			      <0 0x0acb9000 0 0x2000>,
> +			      <0 0x0acbb000 0 0x2000>,
> +			      <0 0x0acc6000 0 0x1000>,
> +			      <0 0x0acca000 0 0x1000>,
> +			      <0 0x0acb6000 0 0x1000>,
> +			      <0 0x0ace4000 0 0x1000>,
> +			      <0 0x0ace6000 0 0x1000>,
> +			      <0 0x0ace8000 0 0x1000>,
> +			      <0 0x0acec000 0 0x4000>,
> +			      <0 0x0acf6000 0 0x1000>,
> +			      <0 0x0acf7000 0 0x1000>,
> +			      <0 0x0acf8000 0 0x1000>,
> +			      <0 0x0ac62000 0 0xf000>,
> +			      <0 0x0ac71000 0 0xf000>,
> +			      <0 0x0acc7000 0 0x2000>,
> +			      <0 0x0accb000 0 0x2000>;
> +
> +			reg-names = "csid0",

Stray \n above

[...]

> +				 <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
> +
> +			clock-names = "camnoc_nrt_axi",

And here

[...]

> +				      "vfe_lite_ahb",
> +				      "vfe_lite_cphy_rx",
> +				      "vfe_lite_csid";
> +
> +			interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>;
> +
> +			interrupt-names = "csid0",

And here

otherwise I don't think this is going to get any better without
holding this hostage for another N years pending a rearchitecture
of the drivers so

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
