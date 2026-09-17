Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86378598C01
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 15:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789658781; cv=none; b=ESwl75jQWH4zea81Ss+NH3bv2VEDtYu25fOWnihSaXcUsEINAtZnAatQ6A1nVub7/x8orrDLGfEFuaCV/Dxriy/kh7/wVjInXqJixBwwLVuEbRoL6te4XJmQ5bT0WNiOfUlLvbUxPIhwnOU99NAigRY7eBMvb/qqCadcCHOcQmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789658781; c=relaxed/simple;
	bh=3qmlskWMzY85Oikfhb/KXg46Z6tfOC9OdCPH+ZehnJM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SzRNsVxCW/jA8YSuio/TcAWGiArF5zxfwXgcx85GyPHNa0UYtefqmzm/c+qev3do7cxERyqS2A5kCUj8KNnMgRAaCZlytdvawL7UNIYT8zld6DJTDzyXQ0IyiT5E5HwZbqrcaEs9GIGOEZ3SaRHXGsYJVvwI5cDK3WHawRN79Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U/r+rU3n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aoJeDqDd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U/r+rU3n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aoJeDqDd"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HDio7M1137784
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 15:26:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ln57oQHyBkL7V+ZLstDX/rR8
	u1lfqU3aYXYeyOqWe4E=; b=U/r+rU3nLB+dvF0TXAM7NKyQDeLKUjbIyQ8IyH8q
	zHYKb7kGN7xu4WIAEOq4K9kOAyIvvKrJ3us66pLC62z5kP/9cEDYX7xB1ohEIOA5
	CcJTkZL8NVU8CFt8i9qCv73hftU1mjLTZUcXG8tftC1nrPH8qsMPuMowLxI4OKd9
	Bo1VMNr4MCVaX3OCEqqHHZ9Ygln1anRO/2vULSoIgjpp/5mHU+H7D2RwLYK7FlhP
	4vGTGMXKRXE0/az1woszeD7DVx1bvtnoq5gLTuxthBZxOpU+oqwhTYgG13Urn0B3
	lbJS+5dTNrKq5DB5mVH2xqhGre5Go7S74NzJPqWtTyeXjw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gr8uw2vbf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 15:26:07 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9105cf082f7so18962166d6.2
        for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 08:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789658767; x=1790263567; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ln57oQHyBkL7V+ZLstDX/rR8u1lfqU3aYXYeyOqWe4E=;
        b=aoJeDqDdLdHkj7EXitk/82HUu9mbJSvyeBgFtNUSQbdXMfSzryWzMPD8ouC2zfsKp9
         br7eh3Ax6LQ4xRyvZJHWyzxPMfRjoch93WJNlQn6cM8qoE3tyo8lkO7RHC33tO5onHGV
         APdT0Oa3th1kN5h6MWcEXwkhBDIG8Q7/tQPUv7YTlzJm+V8MuqERfClalmnB8C8kfyPn
         k4Nl4UIl42zdOa0ntCXfa9gt64Ejh2TAwScF3oJHTVAniVgh3uhY+Eckh/MX4cDs7HCn
         ckAoRa80E6CM7qUnYrqt4zCTmKZlxIj0Evdk9RQTPh1pZIIZ3hSsK00dweW+wKkarLtW
         ymnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789658767; x=1790263567;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ln57oQHyBkL7V+ZLstDX/rR8u1lfqU3aYXYeyOqWe4E=;
        b=pC/yS34q4+MYZL71xdvlVvMRj5Fa+QmpsxCyyQ9r9L8TypkLAoiueXVnnLUF/L2NHU
         NXX35clnQxBua9HhywvqgVP861b6SSpG2tzJMCRxxLs6KDG3Uu4zv70yPiK0ALsU2jAG
         aTs6UzhIZcW9TG+7advELYdq67SYJpmwuEIGBsu7rOy0qEBwLiDSNHmRIB23hjFFT+zz
         yP1TDKgt2ZRqwRFAMwwyDIfTAzsWOQa57gz5GPDVFPDA4yxrGLvxykewah90LipqV0I3
         f+b1eVxcf5ESyrejSBy0ICROZ03xD1+V2ZJKC9/MdVuFnlZZYz4NAbnJ0mTdQJpS0TCJ
         08yw==
X-Forwarded-Encrypted: i=1; AKwUvBxkJ6h79EZy6JfvzVBPmq9otTOu/IHmGbi+3Nt400AiEQc0I55hC9tsGe8DJCKxbcvD/49TPer2UqZxiA==@vger.kernel.org
X-Gm-Message-State: AFuF++l1lxiEZn7gAYcmvj0d4wHLtp8g/tGtbcywPJFOzuNxk2k8yOzk
	zzaf3HIROSmYwHiMEk70Qphm9p3m0WE0VvTIMZPtnMwJ2ujbMAfnubQ+Nmq0gQBpEdP2hj6uTYk
	rHkH8maZG4G7w7WAaD23UwTO6uvtSIqyYzKPgNcIP2UDDikMhTwy0iJAU2o0A9fJUJQ==
X-Gm-Gg: AYBFou0GZdvlwor2f7BSDlSwyn3Ig3R0o6GL2jnxwEJ23NHMBbGetAQ2DBeL4pbUM+h
	VbLA3575/bPlIhVP7gXhUdHLI7owyGmat+pzZ+UGhqJz8BwxDC2pCgmg7F/cmmnrh9y6Li/wTjM
	EgqElrGFym2xf1bzlYwJkpLOkqMKsISoTuYKZmpO31JPyhJE9sA5wkJvXtOYP7JOTmtzuJ1k5kG
	uYimPcB8mRC0gP0+kYvwV7ayQc6az/19MZ4S9VzSRIxszsXl6u80bTZTzxi8NKZsQ5GbDSUl57M
	Fo0NJBdkh9OWIfFGHa4Cn3AardkljXVpUN1ynbH7RBlGU2Y/gJigj1dFUuDBxYO5a+y+RqnlTnn
	4ifDl2TFBOi33ijw=
X-Received: by 2002:a05:6214:5b86:b0:912:264a:874b with SMTP id 6a1803df08f44-9123d70d4a8mr129825996d6.8.1789658766451;
        Thu, 17 Sep 2026 08:26:06 -0700 (PDT)
X-Received: by 2002:a05:6214:5b86:b0:912:264a:874b with SMTP id 6a1803df08f44-9123d70d4a8mr129825146d6.8.1789658765936;
        Thu, 17 Sep 2026 08:26:05 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd232d5bsm82102005e9.12.2026.09.17.08.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:26:04 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:26:02 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Subject: Re: [PATCH v8 1/5] arm64: dts: qcom: shikra: Add CAMSS node for
 Shikra
Message-ID: <2zraylrv7h25qgkxbqpq7rg7nodw7hsajshsdxxf5gsgtrigxy@3keepqqao3eb>
References: <20260917-shikra-camss-review-v8-0-9b9596221cfa@oss.qualcomm.com>
 <20260917-shikra-camss-review-v8-1-9b9596221cfa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-shikra-camss-review-v8-1-9b9596221cfa@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: vKKSzr4gohblTZE9W5GeHhGcxX6_V93F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIxOCBTYWx0ZWRfX7qm0l3p08M0Q
 vEg2SweYc1r/ryFushWvmDMwBlFteaHXhncOEH27OAY9UplwQmoObO3XYVKj9fP7kCuVA8huUJS
 O21Bcon4pmBGo6cGIx5gSAj3s8AlygbdQGfgVJmNWLnJtZu3y/jLWL2hY7s4V+YzSUzA968+pLZ
 LCbyi4Mvk+wPY0x+iiX8TgObBy+60WAM3bSdyJ0M8McIZcHbZXOJOKF4U3JIJDwZDfsL5PCC9Xt
 zi0p3vvEwHIH9kDJk4KIgfBcj5QgpsFmS+ONVptZLMXwv97FSqKaLKVgSdzdhh9BSvJG8IZW//5
 O2/Hua7d5pqkbWE3civsMJcIoi6aAYZtIp/pRCEhZKAzb60qzKJ7Gw1oGf3A+AypPkFRNtqSM89
 EbU3SxUM8XdBZjXPD2/95gyFXzdIEOe4/hz/nrfX4B7VixpdeuqEi4UG/rO5k15egIYOvQZYM57
 3z3V4iH2Np7rK3aZpDw==
X-Proofpoint-GUID: vKKSzr4gohblTZE9W5GeHhGcxX6_V93F
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIxOCBTYWx0ZWRfXwhaU0kdRoFJM
 A3ForRZrRk1kDO2ZdgJ/lJy9Zlz51mFfuMy+wczOKTAbY0XD3R7a4IS3LAT8MUfSlAOd238Xwc2
 hfuCFoMy8aGftKV11+JYCwnTzLHxwFk=
X-Authority-Analysis: v=2.4 cv=dMUzC+Zb c=1 sm=1 tr=0 ts=6aac068f cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=XE-wypd_VeY0GsksmEIA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 suspectscore=0
 spamscore=0 phishscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170218

On 26-09-17 17:11:00, Nihal Kumar Gupta wrote:
> Add the Camera Subsystem node. Shikra shares the same IP as QCM2290
> with two CSIPHYs, two CSIDs and two VFEs, but does not include CDM
> and OPE blocks, so only a single IOMMU context bank is needed.
> 
> Co-developed-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
> Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
