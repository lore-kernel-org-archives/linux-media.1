Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4833E3E63AE
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 07:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784704471; cv=none; b=L4kybuOBWVfrT1Lr+wMxc7VraMtjfNmgROTILlnG/h/O9wyR6J2gySxmHtCPPOlc6HmlBkfwiAl+j6S/XQ1BRPJPrZogg3xCQFX+9Tjk7oUYlRi07cOeGnPVxdp+PZCZ45ILHISh1ZNlYlsFVrMN60MlJ2ieHCAgq90g9QdyOYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784704471; c=relaxed/simple;
	bh=poo9J93CiiYTownm8oTrSBfMdjoeuw+S4wZBWxJ/QL0=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:References:
	 In-Reply-To:Content-Type; b=BsuKwjVcieslO7npsDH13MpXnFRSCPhcZqep53XZVT14EWdusfVZX1mmmbFhOyzfHavDPbhQr0LmfHxY2QDuvaj+DzqqndD7TE3ApPlXTJ+5wRdO5whqqL3LHil4zFJzowPlIhVP0AfH6qKkJV5onPwnBBnMGkezZJSmDBTkwwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AjAqo7LA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dIRhwcIy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AjAqo7LA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dIRhwcIy"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M53nSB3917761
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 07:14:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o6WZlUuh3ud4p8X6xsya3c8SjjkN8PuSsK3pWB1fpMw=; b=AjAqo7LAuFLPTaW+
	g/1pLskBeOz/IJGLF/MUAyzKMnFXDB+lJCR73CwGumcStABOBxIR1lpMmopSJhFE
	q5WMM6C0Cwydk+/tY1R3nNXG+puSausZOvEmMRMTOpkwpWks/F/9B1sjf18banSH
	Tm4p/TlUtC9e+EMHndKx1V+k6KCMnxnBLSGbeHWDS0dzVwUH2qMcKGe8WDYPxDl1
	rudj16LahEaZgvd+KiYtIgPgPcmiZb8NFleBZ8iaXkEPrbiIk13jvJOZZjvQQfkq
	YxmMEpTvyenz6MnTT5dPkDQ39mLpJdkBPgYCORVLPZM77jGSUPoIjg8cKBsEmrwo
	WD//vg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6aapuv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 07:14:28 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e7ff7b375so3295998a91.1
        for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 00:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784704468; x=1785309268; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:references
         :subject:to:from:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=o6WZlUuh3ud4p8X6xsya3c8SjjkN8PuSsK3pWB1fpMw=;
        b=dIRhwcIySRfNtI8tJ7bSagbs0EWPyK9et2jT1qe0Ut4cbQkyV4Qd7DIQoU2K0UJ6XH
         Bcs0g52dpzmpzSpfxc1dGPATtxaaJ3IhtbZoSO0QmHEWlKOwC8C+zBoEqBbWE2aTmfPN
         sLtbVDGZdoPtgPYRBT2Ymseq+CIblLSOU0z0DHak04ii8OCIbMBZnWfglafdv2i/voHR
         lyq4CZzxJpbQknujzzXRM0NdVyeu6cnACLW8vzO0IafclRNV8Kxy5XUOnMjv2yFXDHuO
         ihzqASC+QENsN6LOdqYSvSbcVV0GYTwrwqKxOvVtE0PW3peCWnGIv69do/eUVjBUYgAg
         E91A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784704468; x=1785309268;
        h=content-transfer-encoding:content-type:in-reply-to:references
         :subject:to:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o6WZlUuh3ud4p8X6xsya3c8SjjkN8PuSsK3pWB1fpMw=;
        b=QY52hkOsKIkSxxj1tNWBirM8BjY/mM7ENU5BOzEIIkt/BVlC8wCX1H3ZjovLYz/XdG
         vqyZhi3vCalGeVMxA1tHZa/f2AylN/56oAz/4ACPG67BAOoZDsnYwqUmMVQv4I98FX3P
         31wnlPZK2FyemWm+I2mkbBy6k6MWWj0D+UhALi8SG+TMi53gXH82zprSKVtdb8afo4ZV
         asDJ5+gBt4LzuPe60++LWu3p5fX6KBtAYA+SydDr6nQk4C6U7NqQYVYzR2NmkT6JzCrW
         Noz0ftqy6gwH+XrmSIm64vczgQhKpDDKYPOMJoNVEMUhyBvtU4Q6gQMYkwIeyeZEzmet
         7kQQ==
X-Forwarded-Encrypted: i=1; AHgh+RoVf7DtIatNdqkE/pmAHFUvKzbXDI8ieAUy64KydLzTXYJV64U8lDQQqrstKkMPQyoOO01Dt1CDIfR4Vw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOJXi83BoLlKEzcKgPVT/+XnDrqO1Pv5UZyzfQmj9cX466PS8W
	Vlg8h7hR7WtENekiAZAyf1inq2gYPPpMD+C05TAxMTze7j/B6cpA71fNBgnX9wuNrtGwGbUZUv4
	xvogYEFM133iRINJwuZRXc0bzYQnL1d4cyNFhzJAQWh3D3XJ0+M08Xz4bcR+YSimaCg==
X-Gm-Gg: AR+sD13mR7xU/L3+7GEPJnPGZL28sCcjnEirhAag+zMPYEObY0cS9qOA9S76CM2o0Jh
	4zzoT41ET38H7lMxHIurhlfEMJymJ6iWNCxAK9wOYVbQbZx6bjkwNS0ofh6zzFleCKB8egh9Qbc
	cmb7mVgpiDKN09YtKL2Yo5QADFfTcSQntp6IMyIEFwsy6J8Mb/sDBjMQhkbV3Q+g2b6ZI4Jsc9V
	TAs3NWlVgW/t3BqaEVohwJcHaHUqUt9i5IwEw+MYaKvoK8yXbEurC99fNUvOiUJbQuTxzBSUfVQ
	Ue2rajC9REBBVWFySJODFGcePv9cBLHt5bDIOfUh/erMLwXNs9jh6AIuxjNGX0a4Zz18QAU3E4/
	1YFB77+ZXw37f6MJ9WPRXUgezzwE=
X-Received: by 2002:a17:90b:1f88:b0:38d:f1a4:1116 with SMTP id 98e67ed59e1d1-38e4b537bedmr18504096a91.33.1784704467809;
        Wed, 22 Jul 2026 00:14:27 -0700 (PDT)
X-Received: by 2002:a17:90b:1f88:b0:38d:f1a4:1116 with SMTP id 98e67ed59e1d1-38e4b537bedmr18504062a91.33.1784704467297;
        Wed, 22 Jul 2026 00:14:27 -0700 (PDT)
Received: from [10.233.16.34] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e92091875sm2754093a91.7.2026.07.22.00.14.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 00:14:26 -0700 (PDT)
Message-ID: <ec502fa5-9e9e-4396-9599-4b297061bfec@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 15:14:20 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: hangxiang.ma@oss.qualcomm.com
To: Krzysztof Kozlowski <krzk@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <quic_vtumati@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v6 2/7] media: dt-bindings: Add CAMSS device for SM8750
References: <20260721-add-support-for-camss-on-sm8750-v6-0-a5f841061d18@oss.qualcomm.com>
 <20260721-add-support-for-camss-on-sm8750-v6-2-a5f841061d18@oss.qualcomm.com>
 <20260722-enthusiastic-hyrax-of-zoology-17bd7d@quoll>
In-Reply-To: <20260722-enthusiastic-hyrax-of-zoology-17bd7d@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA2NiBTYWx0ZWRfX0tD9mbN/6sDX
 DElSg8Lzb/TVXZcWPhcH6XAGOqcXTLC8TVZT69wQPVTWb53dvbHmjkvuLtbfkAiSzMm4kzxsoj5
 vQK582dXf+l+6e3teEuw6nXRXordtqfd1jHJKfCj/SYo6wJ3A7sPUyQvIFnv7FqtyL18ABOOIoh
 iYlte/bcer4IuBJXrKuuDU3aUmCCo65EvycTK+p/uQjycT7GJDvuBcx3e+W5mn/JnXb5If4yTHZ
 omWVWfFsc1NfxGBcrrF93hlgN6q/JlZqnivQQGodL/UrnGVARsgvVydRswx4NDb+WGhOmX63eqg
 R7lx3e2MrWENRXpJAe+0wP7eIuPDbFling7fclsJ32ZWLIp0d21oHqZyySV3CZIl2Xy8sliHK2C
 Eh3LJVbl3DUwrP/8y0aWj0KsSVaA0nGxnl6Cst80FOwi2BjOFmrW4+JTbD5Rxrfm5/D9y0yP/Gi
 GTFPgMFExbbLNd0SZNA==
X-Proofpoint-GUID: cO2BGpBoI1dKDYa4TQqpOVs2bZI52A75
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA2NiBTYWx0ZWRfX01uFjVnMUnCw
 XvUTfp8naRnUUSx4F6YdoEff5psobTD626R+MFvUkjCAs3mxvbwGXQ27uAm1aKsCGSWKvOV2xj3
 OUvOroshYiFnf2iVg9FCuGD3IpXAmrw=
X-Authority-Analysis: v=2.4 cv=HvJG3UTS c=1 sm=1 tr=0 ts=6a606dd4 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=g9Y63sCnjjm7CRfqtwoA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: cO2BGpBoI1dKDYa4TQqpOVs2bZI52A75
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220066

On 7/22/26 3:00 PM, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Tue, Jul 21, 2026 at 05:46:01AM -0700, Hangxiang Ma wrote:
> > Add bindings for Camera Subsystem (CAMSS) on the Qualcomm SM8750 platform.
> >
> > The SM8750 platform provides:
> > - 6 x CSIPHY (CSI Physical Layer)
> > - 3 x TPG (Test Pattern Generator)
> > - 3 x CSID (CSI Decoder)
> > - 2 x CSID Lite
> > - 3 x VFE (Video Front End), 5 RDI per VFE
> > - 2 x VFE Lite, 4 RDI per VFE Lite
> >
> > Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> Drop both tags.
> 
> Binding was very different.
> 
> Best regards,
> Krzysztof
> 
> 

Ack

Best regards,
Hangxiang
