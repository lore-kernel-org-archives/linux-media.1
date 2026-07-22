Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8363BB12C
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 07:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784704404; cv=none; b=Ai5dT20LU9wgll2xGv6vwexVX5BShT9w1n2f0UxMHCZhYZvoy/SG+SCiHIs/l+ImTRntDHRft/nEJAidZa+TXVA8ew9nBfNLig5mlFfw3C6BTR9eKV+2yKHTG1db7R+9/WsbDYsltLc/2pHbszGtSCCZXSQkjgiSug4mjlSXkxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784704404; c=relaxed/simple;
	bh=ZnLV/a5hdCoNMYjPosDmeMWDt60E2q1AWPD8RW/wiVw=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:References:
	 In-Reply-To:Content-Type; b=cnt4i0OLBZWUTf71/5jKV/w6+OP29XOpJ4R3NrTxcKJ34xw9A5P5T3YZtko6QrkoXX7PBjEDg6VNnixdZoa48XiwxqiimU4w0AZaqV2nHV3xiLMkDIMOyvJzP5pAcPLQRsldliR5NiCF5KxQQLjKiVcjkiDsq1Vr6sxa+HILF4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oDcb8XA5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YCrTncQk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oDcb8XA5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YCrTncQk"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M53uQA4055654
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 07:13:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	csGFu5RbC9huQdbcAYKh5q0jdyq9oL2CD75umdOlyVI=; b=oDcb8XA5MEFXSY/L
	BF/mlYWwsiAyRycu48mvi2oln/tEwZVxo57vvl/5hthjsWEY+9PU9SYR1sMnR4F4
	dyqbxat7S+mKJFM2pJAY3oeWPDrmN+ASB+Xy354fOwLSbKr96J6FXCqjEaCd3lCa
	A/Ikz6HsUkkcL936MWH2Id4vWb1eqlJ6s/eygSV/Ajpnpji0xDffjSRhM/MP/Zha
	kg2s5XBYcrxcPCPKQp/vRYvXh/cSdfAfd6vqf4og47L6QTJpSur4s6sQ52W7+0Jy
	XLKSG8+Y8jXPO9eEHG6F4nD2jdCN2LS+jJUVcGcNzZHdYvNHn6WwWRMpjSEkIJYk
	CItDGw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjpxdgjat-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 07:13:20 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84e048a801dso2462002b3a.3
        for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 00:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784704400; x=1785309200; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:references
         :subject:to:from:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=csGFu5RbC9huQdbcAYKh5q0jdyq9oL2CD75umdOlyVI=;
        b=YCrTncQklgUPYSJeNjGkP36YKpXZFk35Alj7uO3vTEnXr0tPpn71qePTFvEejzg8uK
         rbPFWQ2DGXoUYRbYfuGBHlRXdtXjPoBEeY8yXgJwTMUidtLHwJDXZPKg3O8lfTU5t17W
         WVB0wgGGDDUi9vJkZgP9BTeFwJ3QPWXqVQpQadRDXlT/A02gvUERtP6Rfw0dQc3cts4L
         HL3soNuznFs7rT26ZLpxBHcj6pVZkJDpAZRZ7LblomcZngI1Vcrs5HMhMoxp5AYyv6mn
         LtXO58LgthlfolvyUasW0ivI7J4kyo7rk45g+9oP+JGUYFSmOfr1cx8cGfp0mn4MM4lH
         LPTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784704400; x=1785309200;
        h=content-transfer-encoding:content-type:in-reply-to:references
         :subject:to:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=csGFu5RbC9huQdbcAYKh5q0jdyq9oL2CD75umdOlyVI=;
        b=iGbtr6k6166uI70O+vk2Sl7xAUaBEpGQ6XKTrVaZg+UsBJcsMeD/qzs8wzSO5PG5TL
         0OxQfEF2J6s/aBLutELpJuqqlZuHgiFWKmEnmh81jXa3/YV01GRQWd+MteBfIN63MPas
         SsNY6z71aUov7szxXX/k+yzDdO2HuN+KnBTcY9D9u0AOqdc008T1xcC35rihWeVHvm2c
         0x0vGuEdYXRHQbhI635vJoR3BDsbRETR1o1WgLjj98dPly/zWG9nfTbr7MBhNDzpJ1Tt
         2SoFSv+ElTkQb0nQUPU+1Snhn2m3dQy98w6sLXns7Uk4nEIijFXFxej5Zi7WZPePEQmg
         8GjQ==
X-Forwarded-Encrypted: i=1; AHgh+RolQHLsvYGoUJfOdLI7JG/RMzRjFnTZyExSgW/blK8Y2iM1aMS67izb/CTYnBLtZ/Zflm7CGnjJ6cuIuw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBlgoaXzPWwGnJHyp6a7cT62Uq0pV2r36mMQ84vz5C1x+DCyFQ
	6yDKmzqv+gYfJ7YuEMC+I9pis4pFcIjXTT2nm8rxrJp7N7fcOsTWiu5bVkk76h2BE+DgZyxCVsc
	PAVJe+k8xgdz7069SjbzOI3Lt+nlSDOz7Ei3WXUgfyUae6gB+tzEd0Ar95SCrUuNvPg==
X-Gm-Gg: AR+sD11HjQIhr1wx5XyF+VMgql3n3o22jDFZVOvVwKceY7+7Zu9T5sNMugu69CYULB2
	fD760ZEswO6CzKVIilXDJpgh1it50VPNH2GwVsGv6KnaUqTgefqp5isf/8PVLvA3bJYxUYk5xLO
	S+Hy2ihOvYKQ8fqVOMpSnVdAgrK3bGbHGD2THDDeNGS77gqHwR9mrWvDSEeyKzH4+jY3aQ4PXZW
	eF+jOidNg/BKGcHC64RHoeTTvkcscwwD3mZdsh51lQC/oXEU34gnSIEDPnHHs0BNFMLtcSblb1U
	h0cRnBqbgZhKAU7TQGg3cLGijz2fa6TeCnRFT193SuOUY98VU2CyT+MYaENGlzryTM+6n4R4ty+
	Tza5aUcDPbIjnoHnGR/5Zf/JaEu4=
X-Received: by 2002:a05:6a00:18a0:b0:847:9bdb:2cd1 with SMTP id d2e1a72fcca58-84c294c0adfmr21781070b3a.54.1784704399789;
        Wed, 22 Jul 2026 00:13:19 -0700 (PDT)
X-Received: by 2002:a05:6a00:18a0:b0:847:9bdb:2cd1 with SMTP id d2e1a72fcca58-84c294c0adfmr21781034b3a.54.1784704399345;
        Wed, 22 Jul 2026 00:13:19 -0700 (PDT)
Received: from [10.233.16.34] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e17573c0esm851062b3a.38.2026.07.22.00.13.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 00:13:19 -0700 (PDT)
Message-ID: <a5545d73-32c0-49d8-9601-1d2bf10d426e@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 15:13:13 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: hangxiang.ma@oss.qualcomm.com
To: Krzysztof Kozlowski <krzk@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
Subject: Re: [PATCH v15 1/8] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 Kaanapali CSI2 PHY
References: <20260720-kaanapali-camss-v15-0-c0b1c1167c5d@oss.qualcomm.com>
 <20260720-kaanapali-camss-v15-1-c0b1c1167c5d@oss.qualcomm.com>
 <20260722-pristine-lemon-dugong-ec2c0e@quoll>
In-Reply-To: <20260722-pristine-lemon-dugong-ec2c0e@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA2NiBTYWx0ZWRfXzMJG92Knyx5+
 if/cZGd/Nq9GRTyN3F+lLU7MHUx+GxsHx9LvZHlxSyeguxPrvFG1nNojD+GkCSK3p+k3o8ekaCb
 I+KRgFgew6C5rx2qvIqutolNX4dOBZuHOI+JG1dbtqvu3dHJ57BMsvj+zQN93M2RTNrijIuFmPb
 xRYe5ZPeH8JzqX5fNkPPbBWTqs7IQW0MeBlsJrZbPqVrrSv2+mfMyfSP/eyOXR2sGXsvx2tGVjg
 JyVd+Wc/sPoifTBV8Mu3SKCNEGwAgIS44ZD7JVNWgSmT1UfqBPVKNzMi/O4yLE6rUtO1GUASXVH
 7wBWvvB1sXJFPOGJl3NUQfxHgbhEsIyWUdiGeqeDevnZxEdTIoQDb4IWDwMHZMevsZ2YpcLJ+3A
 pX29NCqjhofJ/r5MSMZVnB82ZOrSZ5B926ukGEmO8FmqVnZDWTrMzEzm8S+tqG1vnppyxK5HNog
 pw6V/uK2HZGKmvJHrlQ==
X-Proofpoint-GUID: waXvPTgYWySYB7-0PkTTePVf1gsC-kCJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA2NiBTYWx0ZWRfX4Ijob6yL4UD4
 0ilCfMF08QA19ChHXnhpFiBV+ERpBeY3jMfbOIm0dQECDihFK77d/XPUmJOquoADiulksyFlFxW
 R3RsxLvFEwL5NkppEYtQtB5VroqY8j0=
X-Authority-Analysis: v=2.4 cv=b7iCJNGx c=1 sm=1 tr=0 ts=6a606d90 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=e1oV9azWTbvrO268RREA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: waXvPTgYWySYB7-0PkTTePVf1gsC-kCJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220066

On 7/22/26 2:51 PM, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Mon, Jul 20, 2026 at 09:50:34PM -0700, Hangxiang Ma wrote:
> > The Kaanapali CSI2 PHY is compatible with the existing x1e80100 CSI2
> > C-PHY/DPHY binding. Add the "qcom,kaanapali-csi2-phy" compatible.
> >
> > Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> > ---
> >   Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 4 +++-
> 
> There is no such file on recent next and cover letter says nothing about
> dependencies.
> 
> Best regards,
> Krzysztof
> 
> 

Sorry, I also noticed that mistake after posting this series, so it won't occur in the subsequent SM8750 series. I'll add a description of the dependencies to the cover letter in the next revision if those dependencies haven't been merged yet. Thanks a lot.

Best regards,
Hangxiang
