Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D977147252C
	for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 12:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787056765; cv=none; b=mTWoA8XJ0llK/XCzIoaFLQ3XrCUEVBvfWk/Hd2qkO7GSEikteK2Eg0wnt5J7beEPoBWw14jfiuR/bOO1oxOvTDXpv+a92Gs5r3bt6Xle/IANetMV3/qr7UGGg/irvLQ/k0VoBISXi9gCr45KzVrCasliI5YFWJZD7+180J5YipM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787056765; c=relaxed/simple;
	bh=YWSxs0QhOciQmaLVZF+gvmiXEVMso+zn92JvOv5pGPc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tqggAf2ERcJhQurqN4Phv3ymxCU2ZzRyTu+V6voRGdHRaLITpvQkM6SMYOKRucjep+9SnobGKQ4BYCAzV7qCOhueHiGUR90hDMm+ObmPOR5iVzMSFaOwhmweUB2eGuBH5tSF8iwZrE1AQVa34t2QtgiPTIny01AngAH0REJFN0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TM8J0xCm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U41SdFCw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TM8J0xCm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U41SdFCw"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IABWhv1544848
	for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 12:39:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9sT+fDlFKf91nl/V9cobhIbz6pURUSVOTqoQvdEFabo=; b=TM8J0xCmEZewL4S/
	dbMxsHXBib6HAbyTZYLYPSDrx98anNKB/jwnSq93FKHHtlEArfohkCMk9DwbTodI
	BqmbJPZuGmAcR0xw6sJSe54hZZDWpw9qS8CFhcteeqgU3YNuRH6svWAMPmBrepPW
	Qdz9yumvQ8pokDpLIlf6Wr1v/e5jbQkHHe7QhuBGkNgOMOzWGLlfuC8/Tj7qm63U
	QQ2E23BbF53ab0rT4lZHVxrmy9ZGdOr8KBeGaW4v+LCcC5psbnTdZPwyai3yThAN
	3QVLrArxnwkbQfhgRdvCTYgOl2vNxL73a4zhE8qdlaXppS6yzJNgRFf7/UOUL/PE
	jUZgPA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4dcn2n8s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 12:39:13 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bfd1772d8so6997341cf.1
        for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 05:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787056752; x=1787661552; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9sT+fDlFKf91nl/V9cobhIbz6pURUSVOTqoQvdEFabo=;
        b=U41SdFCw/owJbmuomeOXAZMJkj4GSCmfntJTlnH6srb3fRdr1xMevdE/fQnHqTklir
         VUEQm84cnXq2o/upwAn2/bnA3oy8gjnzFf1UOhVf1m9EkXKu0XRArmMquUDg8b96BOml
         fhqyh+Ayf69zsCP48/1fQaradpGyl4hvrJU7rR+jTYjsUT4qHlaqb0okathpXA6Bcwlw
         ENirtRMa6yE5kmmQY9EK+0lOPbgTEMzVXdHNAemECkeez2TMvbwyJvF2jsbZUDqGP5uN
         9iDJKOHfjZzeBiJFF+DIMb55x4g3KQQTJUhgPbNOtCnG9TlcACpPG2lcPTxUQQZrKUFD
         W0+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787056752; x=1787661552;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9sT+fDlFKf91nl/V9cobhIbz6pURUSVOTqoQvdEFabo=;
        b=oKF42eAaqXACk96a2P9WM1WERZplCkgNu0p6GEyti+DqrdinaIbBaPe1K0t4O2SDLC
         ygTFRHgBd7or37LaaQtNyi9lusc0MGavTyDbjJ1r2v2wTjBXhMExkUMaoUUrvJpecmFl
         f0JYqu1+h6rBvaJ2jghG9sTU6+O2AxADRIjKcQ8FRcswiAHK0T2xFAALmUGFuWgxX7DX
         JMoNAg7ACMhWg6gkPwD9lgXmik7lJCs2+5LwmHcHOrMFrISVxrrFnfbSUHFk5y0MtdyP
         8/clIqayzhMR/41ya2krJUGLI4tlOs86IpGp/btj1pbDHKJDk0E9rTNXvw0Q2IkKoQ8F
         zDAg==
X-Forwarded-Encrypted: i=1; AHgh+Rp7tE8jKrolbm8VTjDXkBvWnZaz4Ce9vJ8uHtXHkqIqARfIv99LO1Jbzu6qnR6SYrEhlrdMYizsXfwzLg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKnUw118uQrEYgPgF2QEWz7n7zWCVyGoFv2w3Pc0TkN+dRz9HJ
	E8czLDCAT0gbe0Ysh6VPcB83ZyILyYlgGCh4wCtzuPo0/YmUeIISuPv6izxfT7uxMx6DdKYOmEu
	giF7jq/aZOCqdGq7gB/446k+rEz5F57iuKi10yTqPTf6lEwPKZ28afqhW/klhoP22yQ==
X-Gm-Gg: AR+sD13/utAoHgyFy4a+ZX6+qpgJavB6iBFHsVXedg40ywotZ6taBMVoWvGtCFeWe2Y
	klzXIBw7bQKekdOWS7f2AeIuTi04qXeIcLRG+VX2D7xjyICoNtizDI+AuDAW+d7MIvjIMH+hRnc
	nc/1Si7y1sMQ5iPYdcXr5WQkzllN4adJOJ7IG4NfCXczzGud2Lp1mrE7cT+AfFTqkslHCbL/bwO
	3slUL7Rcrmu1AQxAUY/bLRqeMoI6DzhdQOMjc1YNfBhyUyROWeMUVJphGCL5aY7c/sK7j5cJiVI
	dS4UOcqfJmJAZC9vZZzfjJOaT9NPFRxPDF3N1M0yJYqTtjUxhHzHenL1s0/hqwgu0AhtFj2PK0h
	XPlOCanjTlhF+LWepmMfUEnrE
X-Received: by 2002:a05:622a:1787:b0:51a:8079:795e with SMTP id d75a77b69052e-52d854d318amr235315541cf.4.1787056752499;
        Tue, 18 Aug 2026 05:39:12 -0700 (PDT)
X-Received: by 2002:a05:622a:1787:b0:51a:8079:795e with SMTP id d75a77b69052e-52d854d318amr235314971cf.4.1787056751991;
        Tue, 18 Aug 2026 05:39:11 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3d8517775sm1713144a12.2.2026.08.18.05.39.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 05:39:10 -0700 (PDT)
Message-ID: <4b0287b4-6fa7-4fe8-a880-446ecdf01b1d@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 14:39:06 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm7325-nothing-spacewar: Add ultra
 wide camera support
To: Danila Tikhonov <danila@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Eugene Lepshy
 <fekz115@gmail.com>, Vasiliy Doylov <neko@altlinux.org>,
        Achill Gilgenast <achill@achill.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20260801143125.267054-1-danila@mainlining.org>
 <20260801143125.267054-3-danila@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260801143125.267054-3-danila@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: bxZUxwhN5Djn2HaKcR3Lza7Xj5-CDgFb
X-Authority-Analysis: v=2.4 cv=Gs5yPE1C c=1 sm=1 tr=0 ts=6a845271 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=OuZLqq7tAAAA:8 a=2Ii_74CIHdEfXmswDR0A:9 a=QEXdDO2ut3YA:10 a=4cnV9WtFwDsA:10
 a=dawVfQjAaf238kedN5IG:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: bxZUxwhN5Djn2HaKcR3Lza7Xj5-CDgFb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA5MyBTYWx0ZWRfX0GPKAKduz8ni
 v7IeP8KLWkKeKt6ldJY2Y4LIsccHLWOxDTaZxwwQN+aYSRNbuY3s3x/dlkE6sykF777OFL8dIGH
 kTMCMLOHBoIpkiychzEieS9LhgVHVFBswuO4XsnOh98PbDWyQsPuas8ZHJrTIlh/5ETPmx0EkEG
 uuOaKnvfePmV+9pHfkbBt/YYTzgnfMB+Abbs/kxYRksP9DIA3rpljTT8sFXwcCNYw++tsvPlv9i
 30GG9AbZla+pRk3CXx5PBdg0Xu+ksp29SnJa87h6lWV/sLJsUabBictLYVpLf7kQkWPKLnmlVIO
 BqFNvD/ihsaN5h2n5gkc2RAPFwiFOVOJp8W4+rpt8gwoy97I931S8P989Bjy8R16nbutaKKG7cO
 ngAWC/1m64VYTjtIT0wnKYI2oAyXXMC88HQzy363t6STTj0n0Lk9pRkahCa9Dcoz0AmYObZChrn
 HpFaU9bfp+fN4EVR1nA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA5MyBTYWx0ZWRfX41c6pqTApR+R
 P147KOkO88gDOwNs+x6C4TX0Lqw1gPAn+HiPqPoMzlD01y6dpD+l8VWvxrBwjkz23p5jBSvubTI
 BS96eByDkfhqHumsKZ09rduShv91fyQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 phishscore=0 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180093

On 8/1/26 4:31 PM, Danila Tikhonov wrote:
> Add and configure the necessary nodes to enable the ultra wide camera
> (Samsung S5KJN1), connected to CSIPHY 2.
> 
> Signed-off-by: Danila Tikhonov <danila@mainlining.org>
> ---

Same comments as on the other patchset

Konrad
