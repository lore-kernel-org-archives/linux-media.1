Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793712816;
	b=pgy6936DsCWi8PEPQeb+J20P4Sz2h/2zckWNOxrwRv8GR17GRQ//tPOvQSgdnU+TNXBA
	 0vFjKvih5ei+K9Xs589rtodOqsl4Dh860GrUD7Shhb2khB/IVNj23VJdbXksRbjNs/mUs
	 CcaRAF4AJUo56rnAUJCR3wQg5VgkIrnSOn//mJTZI1a1FL1cgGSABXCTl6lAneW1fErr8
	 CeHEiKC/FF4cLWvw176DKtmolgQWZgDAsQevoSrxwI6slRp688XxOZQxhV83pqlsox3bU
	 Uo2uGEO/3tI56sBePxcjKgWbvT5kI90MqaO5UuO/3VgnYtLkkODq9Nv/TGGdqa9x48A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793712816;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iQP0DffgHZK1//+ou8ZDmPpNoN8WnAJil4ETuCdPbuw=;
	b=ZjKZDE7EvlomMR1v+Q3uZLHB0qWoFrcvJLCG7Qr/5Am56n+f+SlxhpAzNlhu0C/DZGOy
	 BgORjha3c/dacR+oAxFEZ/NFVMoMXW220RlhI8YXyTbl6DWCRIaXALctkCVxoOvapFMPE
	 ixnUsi75RNkYQfLjRaFt6i+8QdIF7K5Cf7uD/Whk8QNFcGxDIRd0TsE0yVDk5pKlSKnPc
	 2H+4IOU/94+gW1kMpmuhly+UyLEvDWKFcID0NfyriWZ0MvRknB33ke2ac++c4ZBsJKvCM
	 kGB6eDQEgSxuQQG8LS/htuKQzTxcDCrwHyeeL+9BmKWGYF1fA7t3FxnzOg0E7BAm7UQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="MSO/3svB";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="K/frGJWR";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A21606D825
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 13:33:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51A21606D825
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MSO/3svB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K/frGJWR
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3Cl7Vm1820939
	for <linux-media@vger.kernel.org>; Tue, 3 Nov 2026 13:33:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iQP0DffgHZK1//+ou8ZDmPpN
	oN8WnAJil4ETuCdPbuw=; b=MSO/3svBkez6VG0Vv+LeY1+7Kyq5hXZ4kt7PeNjr
	5c1IYcz5yvdrVLTXOKPQZvZ5osMXAPK2tQJ44o9TAyYiApulqHTN+bHa8Zs70oqD
	VDQE+WRZCxOGuqLg+f9cwFP7jpfisAsxDuSZjkYmd7xk+Yn/tv6WZ52cvXZBBGJ7
	RprlSD1WdkS+bEFanAit0B4fgrhT2Y2GRJ2wJlU/13El6CRqEDCxnmMa4G+QlQ+t
	quo0cHqNJ1Xvz0Kax83RdUB6gGAmo/VQ0HnxnGOzCyMAWJMuTg73G5ooTdj4R/PQ
	jMae2YFCv9sChkxcFtCnOugBKFiHtNTqQU1hcyNnXgOvyg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq8u5j072-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 13:33:29 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7c10b8abe29so3246828137.0
        for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 05:33:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793712808; x=1794317608; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iQP0DffgHZK1//+ou8ZDmPpNoN8WnAJil4ETuCdPbuw=;
        b=K/frGJWRoOoeH+z+5VIcBk9jtjcU4LdYas3VxJFUcn7b1bGOhJrcyRglLhX4qqzo1e
         Lcijc4l/e2CdmPfp/h1GUGOzOiT3czoVtqpPhH0AmTgXN+iiiFH66kJshmAQBb/zxxp1
         zjUR7Se0ULEDpvl3h1CPuuMMXbCpkqIpnqkOKrK4Eg5GftjB2chLqqSpBV3Pz06mXVzY
         OoJRIjiyDk8ypd9P/2BsVZWwfT0BdV8osE6YR26vylpSje0S0A6vso25W5A8TVdmKvOk
         kMonoPmvu77MY74bOiug9hFL12NdhL6IhFaKRWat2WaaHk+QfzWb01XAnezhOjuF22Ub
         rqZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793712808; x=1794317608;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iQP0DffgHZK1//+ou8ZDmPpNoN8WnAJil4ETuCdPbuw=;
        b=25P2o5Ptav5NNgP5mQne+hm9K8mYzzpagaTcOI/aATBjWd0Uwzrr53C1sRVX74fp0E
         5kZJxiNDlzn3fU04Y0Nwh9JhxW1hTQocT+HLRVvFZ8EsDAHqOlqvJsT6R7ibqOWGxKNQ
         Ov7hlmeRu7EIjL9YRSQOX971ijUDG/84jCwKtz118ARGe51AMPlLLVjkn6622T1r3qAQ
         QV2+bEBcCIEmI8vrTcnGYcuo2/YF/Ua8EyJPxTF0gEEbbKgj98MKfY+oRPZQJMEdV80u
         NwfcHFh3v3tzVpswae2JDH4oIH3PqHqOIE1ZJR5jWgU9xrl2KwSsX9Xg5zuGdRGDSnkQ
         Uu1g==
X-Forwarded-Encrypted: i=1; AKwUvBy9A6ziyr2WKSJ5vVbX18LofGu1SWIAWI4prb/s9EUSlHk+YJEA2nA2kt0dACg+Q46n9YKr9TUH7fXqOA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8IfCOqxHn4GL++5F78bDVcgykQXhgq9djducTyDlQgLb7oij1X
	AsAZmUj/jhYlcrxuokC5mtOdfF6+6N+n0YoGMEQpHF32jio4UCA3tsgQpe5y5E2fh7GGypyogzS
	ZxCK3N20R5cd7KICOhCRFe+8CezzBRTa/xY4WU4TpM7bB9AzcNFAIdl4+rjbe9mm3Jg==
X-Gm-Gg: AYBFou2xu2ckxkVqEa3xro7ajzC7/n0ds8YDUpv8XRQIuGYJ+VnWfzDo3anH+8GXsgy
	oa7sTe+VuEnrftgL2BayBmsXN2d6sThPpDTWdUsO9TLyJjrZfDTe2gOSufKU5uPiWGcZ10lGH2Q
	VPoUw6DFZhBFwTBgIDejhb46z3FBTT/6E+fa07vtj8hckvkHaMK8MlzSlufs0k8S1c1rdrgDpfj
	0blRWQVNmCzbOyXDyNBk7QGSjDWiuE5Z+9/lsJsQFH7j0gmfjVYxccnTEmKVZy1z4d4Cy4zv49H
	lvst9dcjCMRpHFx8wH2mOX5txPPVc1T5yKh5GgfqEhoYyrcSM+uJfKK9wdd69i9Y7GlzzpsT0Cm
	TpFO1/etk7y247OsnsjjV3opZYbTGFO2TonQCp6wJe5zvRcoMEZJIRvixh8TCKtg=
X-Received: by 2002:a05:6102:292a:b0:7cb:bda3:27ab with SMTP id ada2fe7eead31-7d07262d5f8mr5193738137.13.1793712808395;
        Tue, 03 Nov 2026 05:33:28 -0800 (PST)
X-Received: by 2002:a05:6102:292a:b0:7cb:bda3:27ab with SMTP id ada2fe7eead31-7d07262d5f8mr5193716137.13.1793712807714;
        Tue, 03 Nov 2026 05:33:27 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71bae0f4sm22349359f8f.58.2026.11.03.05.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:33:22 -0800 (PST)
Date: Tue, 3 Nov 2026 15:33:20 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Subject: Re: [PATCH v12 8/9] arm64: dts: qcom: shikra: Add OPE node
Message-ID: <zymjeclhd2ezemd6jeujtsu4y3gb26gi2v4vd3gmi7diuaa23m@aqr4blf32t5b>
References: <20261102-camss-isp-ope-v12-0-702254689feb@oss.qualcomm.com>
 <20261102-camss-isp-ope-v12-8-702254689feb@oss.qualcomm.com>
 <bac09735-4136-442c-9208-556568d39967@oss.qualcomm.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bac09735-4136-442c-9208-556568d39967@oss.qualcomm.com>
X-Proofpoint-GUID: kSOcr8R_klAO65RiqepEaX02lr3FYwkx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1MyBTYWx0ZWRfX7DET+/24kpdu
 y8bbXcASCuvJ5JzXj4bRx7bCyZIl2U0TFD7jFGhHWXqAK+KSiAdOH0PqyPxVqEwFfIoXiGE4yTX
 z5XGFL3u94sXtbRajsHvya0Fpp8b/kE=
X-Authority-Analysis: v=2.4 cv=RZ0FmFtv c=1 sm=1 tr=0 ts=6ae9e2a9 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=AvtK1wfCeudOeV3Kv5QA:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: kSOcr8R_klAO65RiqepEaX02lr3FYwkx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1MyBTYWx0ZWRfX7HjylIKviTNV
 plCWxDxzyfRnSzt3ETUNgRA7YefStvfV2e6ekDu/TuhXBeOPrOJq/7E6gUqlr4Zd4ZvhgrdIppV
 FDMfx7CS2REzLCIzwiLWM/8AFIp0L+83+trsSp2sKCsuMTXvpETXMFKNvQRqTva2wWLSRuf6BPp
 ADtEBYVZQUa3bUdLrAoPGBzj571YCrpVwdvrxWhL1qG7a6BqmscOKlmv8NfETUcu90QHsiSNCKA
 KV0+DKXirAT7uFzAASqfBigUxZmtBrBwE0lhK7x4pF/lXtiyFIfyk1+GxW6AKFeURzNqwfc2lf/
 qZUn80gsIixdTTfSQ/fEwo0qAqvoMtJJt6rSClkzgEaVWZeB4UPylQBjvjEsBC1Tb3zA8TWWUeV
 hFk/ZbnSs40wxUwNFm+uqVCRZjbdgZwLFugrZKH3i0kJM8bRezdm949CT0SVsOBxlu5tsezRxod
 I2zrEiiAckNKsd/S1CA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030053

On 26-11-03 16:59:05, Nihal Kumar Gupta wrote:
> 
> 
> On 02-11-2026 21:17, Loic Poulain wrote:
> > From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> > 
> > Add the Offline Processing Engine (OPE) device tree node for Shikra.
> > The node describes the six register regions (cdm, top, qos, pipeline,
> > bus_read, bus_write), clocks, interrupt, interconnects, IOMMU mappings,
> > and OPP table.
> > 
> > OPE is a memory-to-memory block with no board-level dependencies, so
> > the node is left enabled for all Shikra boards.
> > 
> > Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> > Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> 
> Tested-By: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com> #Shikra CQM

This tag will probably not be picked up by b4 and it will probably confuse
some of the scripts maintainers use. It needs to be "Tested-by:".
