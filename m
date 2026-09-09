Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0697E54A7C8
	for <linux-media@vger.kernel.org>; Wed,  9 Sep 2026 12:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788957665; cv=none; b=odny1Z/ZEL4HwWnxc2xT0fPRTNhJEb+/nbCyKfaxxqC6pQnZTTAlTIRBBclAOXIyGQtYe8I34tHIh/vmI9wBgt1GOsvxBUHNucD3BpTM1/nnAveq+RR8i1CLP6K0CZ0lae5JF59WHfh2AVr5P4vCvQCeQG3A1mvFN7HTJS9Ppyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788957665; c=relaxed/simple;
	bh=mAOeGgqZpoUnhK7c+giQe4dLuI0lwdz7a/xuTj0ZKzY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ahuDfudk+1t6Pg31wrcg7YqQwmLTUDXkoN8nl6JJQ2kvMvvmfv7gxbe18iOqMMO9m1xl3D9YDTVhx9gElyEwsCoDOsddatKKCOhPTRPgagRc/fg8G/50I8C7s/TNvOHsvujWTzoLu/T3PXEMR729A9wJCiHoE9VqBiNUHq/vYeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LacJz//s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FLY2jeCx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LacJz//s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FLY2jeCx"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BoX9h2698594
	for <linux-media@vger.kernel.org>; Wed, 9 Sep 2026 12:41:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+czh1A3D+YBFR+KqXehnyt2C4qAKnD5hwhKwNg2nHmc=; b=LacJz//sDXqP2tNh
	PVtbycauQJljKVumbNno70TXYqXz4wceJ3DRYT2lGjQYDZ5be+VlCaNwQ/OEY6JT
	gN4/TT7dRZFcgWOxQBGDbBSRSfue08PYq3WOanmZFmh3SH4LiyvE3J/56EmPfDc9
	tsraOV6nWxQuo+eFeRFDlc85WSKJx/UqZWNB9pevW/pNO8PuD6HxYRP8g7cvgTWq
	ccyLca6yDsoTZZ/xc7DfZha7DqfBAcS9RPCMDI6OkVyLSxQZtPxhuGzJwaCm552X
	tupdOFZ6w3tVMxHbc8T/tJIg+qx3/ENWyP4z20uTpmoyTa9nmNd5lDwu3+PtEWJ6
	CNnBJg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk6xh05nj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 09 Sep 2026 12:41:02 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-938fd633df7so76337685a.1
        for <linux-media@vger.kernel.org>; Wed, 09 Sep 2026 05:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788957662; x=1789562462; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+czh1A3D+YBFR+KqXehnyt2C4qAKnD5hwhKwNg2nHmc=;
        b=FLY2jeCx3Xc+7PzpjhUX2pgudsb1q7PxhJLmWXy+1iPfchjPm7jlHZnKJch08QF1Vm
         IvLp0qBcrknc3s76opdnIozA6kT1XSgoYRbgSbakLQEVV1hZ4ZZrgpApYXSCj21w71+f
         i11vBllsi5FgvfDiEjO/YilFWy5qF2YvveeI6nah12Wo/84/kWAIyKa7Ev+CkbaaCn+8
         uPdcPqlFkkK2EUAyivAV9nTPGDX6NPTX/DdOJ36fTEKljUCOEyXTW59cSePkj/adUmNj
         kVdQIDWRiax09aRRyZJsg/FDPt6cTIfm6RRHwtnUpor9AN5x7FE5VLB/lsEtLXX3cBzJ
         thGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788957662; x=1789562462;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+czh1A3D+YBFR+KqXehnyt2C4qAKnD5hwhKwNg2nHmc=;
        b=gnA6xyzrT7I4XHdt+6JkopcuFGw9MBfPgqARXaxNFl9Ccc614fQ7VLO6iqit44xn5a
         hzgL2HiHjkzemXe5k0MDtvLarevPjL3O725U2043lV3aCRJ2bOfJg+bR2n9GvdnEhBp7
         AJXUYtGX+MhkiJM8n30CF5gX2KiM3VHjOoHTymKY6PCx0KvxaMm86VZN9zqf7tO0gPXO
         aevEGaM/VFTKjtnnxPpBfdaVqzi+177fAcib8JWhhl9T8Sh4v8oZOkNTBogc6k1HW6gs
         Hpw3g2PjuHwMdXkvmgN5DAiNF8A2L+DoxVKF7sla3c6OQTWD9aititq8M0J1kB+hktPP
         tUaw==
X-Forwarded-Encrypted: i=1; AKwUvBzfP/p6VQ5/zthLwzsaqg9IZvjqLUKQrUtLFt3q1BRFwKxVp5v6uXcZ1Cp9Wjs0hTToqiONRHnI9+Bo2w==@vger.kernel.org
X-Gm-Message-State: AFuF++kG2aAn1eUG+3uZCSMDvDfchcF/yBsQMjYs19t+ElSsWrl/wE3G
	fOtjbUyfb0BD37YFmKUT7gpuB8m9qFADG/yyp4dBddR4glWmlR8hgn/zqFIrzv/Pq6Wthfe1+MI
	aip5ECBfshHwOGgLOpJlCZVFsn/wwEepQ6LXDcJlvOcAU9dv2ye6C77XXMj0ktAv0AQ==
X-Gm-Gg: AYBFou3D/SKT0e80tgEtIwFjqDGo43L3QI0mv+6mHGm+htTUI+E7fwUiw8KOv8r0H8F
	eB9avXAJejcnNE28pXrRS08fHevPQygKZe1+k5R/8YJgZgXYHo3+W6P6tn3ZLE4qj8wYGExMncJ
	HMyTcs9M+poQzRBojvTsK4NftykIV4PjfOOTSZopZYP9lpUq2XMPeF2kr5rvhCrxBJyGwsStIcd
	+C9miZ1r+2S+5UOnxT7D4z0z6cOTYq0tM3dX/+K87+TUiTtTkp8vZaQeLKcgrYkFUwFYWI303Vc
	Ks9UQLXzOEb8nQKxdyWml4l8bZisnkpkaHWX2cgITIlk77asUXQQSZ3KHRaJLco5ewVFTtkxwV6
	9aJFsYIZ8FaOJ7tVEszszxw==
X-Received: by 2002:a05:620a:4141:b0:939:47f4:935a with SMTP id af79cd13be357-9399188d614mr2540884285a.5.1788957661941;
        Wed, 09 Sep 2026 05:41:01 -0700 (PDT)
X-Received: by 2002:a05:620a:4141:b0:939:47f4:935a with SMTP id af79cd13be357-9399188d614mr2540880085a.5.1788957661423;
        Wed, 09 Sep 2026 05:41:01 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9863cb3d6sm1362285a12.0.2026.09.09.05.40.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 05:41:00 -0700 (PDT)
Message-ID: <b02e141b-8e7f-4904-b9f5-0a9cd0ecd377@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 14:40:55 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/13] arm64: dts: qcom: x1e80100-crd: Add pm8010 CRD
 pmic,id=m regulators
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
 <20260906-x1e-camss-csi2-phy-dtsi-v6-6-067f2ecc4630@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260906-x1e-camss-csi2-phy-dtsi-v6-6-067f2ecc4630@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE0MSBTYWx0ZWRfX9TmsqR/ncphl
 kIihcGoXMaHbFhyrdIxbiwIMgGcv+Ffqy6rfr0tnKGWNkZ/AHjAqtC+CCY4842A1bNfZXbQvQbd
 OuLCtBoWvgsgwhisUL4PUGQGcaCbjG0cXzTwj1OB2JIoLfM+ngNQQ+9HbPWGrBxI5ZpdzEeisKc
 Outf7ZPhKjnT+tguOcA5jC+j6XrpqGas2zZ2Q8gO9z241xJyLJDXyPEDlSxhTATBHGhm9plLMws
 fJDWbgS6V5atQY4Vr46Iskz+6WmrFqmoTCt9moPemRr9oHfladC58o1sFQHN3KFHBe8n4TNFFTo
 oAjCL14Jsu1Ue/n3t/WZL7q8CygzuBYK8GzPDu9kQt3JFsByY2QeI6+3GwhQD2TPo2xsQSHqM1s
 ke+8u/ZMYERHew9NyPfvkihfZ2qbOAzsOLVhUw+H8P13XYR0GBD70yMSzGUuiieEJoR1CKCBZnF
 Jo1CWQBYnFZj5LG+tQQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE0MSBTYWx0ZWRfXxV7TzQZUzm8l
 nLybZ7CwdQW/oDip5y4jwBJydYALYEFMlSfzvoncQ9cCNKuvpdzl8G2WS5/WBs8ZWHDEjII10FF
 uIHx5DRwZ71P1GJy5V947l2HqI07S/8=
X-Proofpoint-GUID: uJ6Bm885R41JF2XsHNoF1ZbRRGTFTvpl
X-Authority-Analysis: v=2.4 cv=KOlqylFo c=1 sm=1 tr=0 ts=6aa153de cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=f-AdFH0jOpSPBr_pIgEA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: uJ6Bm885R41JF2XsHNoF1ZbRRGTFTvpl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090141

On 9/6/26 4:20 PM, Bryan O'Donoghue wrote:
> Add pmic,id = m rpmh to regulator definitions. This regulator set provides
> vreg_l3m_1p8 the regulator for the ov08x40 RGB sensor on the CRD.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

this somehow escaped:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
