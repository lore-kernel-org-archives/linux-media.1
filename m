Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB1241B36C
	for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 09:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785232795; cv=none; b=PAic2oGmNnWjQeOILsMwWwYIaaMfVi6tGqPVppZS+hEE+L9IuFk1UUeBfaum5WHRwnbwgsMWq22xYivedvvkJdaXIABFJ9NVPR6tpq6rJixEYdnhYhq/3H5ryIublJyRW4vA2HbH2ARyCGjgangMZRJztX/eY9el/nQ1zm0GeTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785232795; c=relaxed/simple;
	bh=+0Wbn7WCEuDzhQgR47IsKajWKvA2zjxBMfDYi8y6aYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ssjJNxnOuz0dfI/7leDbkjDyOAAp29+XsMuzAMzdnbuWKMW8UiXigmqVcDwl8r9G4DojTR2sBAIWjZV7pEXN05wBVSyLbWgZLnWr7Uug3Fsjiii7ODhWKPXwnQzLO2eRgWEUrJrnuKfiZ6jnpBkzmo2X81wH2KtKPCmzZVX4eJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J1ev1n2U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P1HA23+3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J1ev1n2U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P1HA23+3"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S81xcA1663585
	for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 09:59:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=U5PN1TT1lMw7TFu/s+fchO87
	W7nUXA/Ck6/FI9wxkQQ=; b=J1ev1n2UjmCEGnDr2A3w20S3xTEdMbyk2o0n2O3b
	uydHI8Fdeh6KmvEcUuikaqnKHsiZRMxfXorFisVwty213IRNbxOFTqYqI3AhFB04
	2CglaJ7ckrkNZ0aaVIds/BzE2qKPgBo4kTvMGXmIeTvgDk/7CSrYHgNYcCUKyoXn
	DU/kSTJ7rAHH/q5jiwTr1yV6Pva1HsPkvCIF11KSqlLbd4hrwQv6zFfK8jXEmxXF
	RFJthzdSlIov3kNjOQTSIFSrcJaG/I0LMHODKM3hFbk3eAJpVfGRdY15vBqD9RIr
	YJmaYfwyqdp7xuZOpa/SyTsoQTdvKpddt177lKG98FlhfQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fppttryg4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 09:59:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92ac0a54110so477559885a.2
        for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 02:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785232792; x=1785837592; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U5PN1TT1lMw7TFu/s+fchO87W7nUXA/Ck6/FI9wxkQQ=;
        b=P1HA23+3BW27APyHGGpq4/JM1Ag1Nv5rsV4bpzRotGNvQQNhgiCQLtMES3EapcuJLB
         WtsFnaFlAmhWtHXBjoCTmbk4BIzbtXOa3pE29zJ+s0WiGhYa8LzYO+8HVD2LI/rkIItU
         hST9/FkNGzu2TDgjvGpcPWtxwxDJszx/JIepVqKSKq7hA9QJsbcio6chAbUh3GiFrgd0
         hajSYexESN9nb1SuC+LgvD1HjHD07UgS/XfqOZtLijQdR0GdCFgadqeZN0rEt/klkRuy
         KXhH6RAPGR6wL/Z7M4N1w8lcrQw9eeuha3ZgYd2nnwVr8yqBNl2lC+DFa/7a4vAn3mDP
         ezDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785232792; x=1785837592;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U5PN1TT1lMw7TFu/s+fchO87W7nUXA/Ck6/FI9wxkQQ=;
        b=sx/Pd68y0UODrk1Xt1AjqrIsnB661wlXSxfcbYDBGTqa9r7TIAHSDfLTA1zQ8SKEa1
         mcfCgoWphCBF1XD/EyBoMM905pr4oPbOjRmBwQwYP+eWv9uK3V84yIYX85hxqkTtIoTZ
         Pav/Q0R+8T57XpD+bSrGYbs2gEk47TQ7czq9dfK8EtlhN70HG0RPiof0Z4nmEOtzdr67
         YowdrreWENGvWLrOOijcr09/SNXxmDPoTbhtMgbT9o9AJfSZLLEL6ob8W4ZfnKX2C01G
         iDSNAlD2FggfdK9Wn0fYwqRET1HuXs+dV3g4X4+63yIqvEhJP12p8RmynOT8lDnL8K4U
         i1Qw==
X-Forwarded-Encrypted: i=1; AHgh+RrVHF3j31Al/xDwtE7RAeSPH8q12Zcdqekqtvhqc/5YiqeoDx6oOBiL9C+aTYdbwiXK+jKzVw5twCxr+A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRSiz7y6roF7gNZKE80uWN2SCQGfh0uTr4HYb6vDNNPg/qGAnO
	HKV0qgUDr5vh1a2/1VZVMW3H7WVd2dpwBg+lDy+o/0OeeJxD8WUnhhHRrvLmuK8ez4GVDESH3vV
	52/5qAxdDjltiNdXClGIczBkKc3Z0YFQQ2ncBwlK4V2ocMpnsKy93c9yx2f9XoRxO5w==
X-Gm-Gg: AR+sD11wH1YrHhlFshyJ3jrzDTFrh2fwnqmv45xkwVocWZlv5dfdrK6bFCkwnjcgG/u
	F0opGHVGQ1J3iKjArdJNF39EIYAU9Q+Ox0mvoN4GUrMiVZRJ7pfgHL5I2aVgdrn2oX67Tyo1rup
	pzxKrGSWrutkTQ18/R00CWWFjRxz1JOjBjHghy5wXWzkc19+pWrflSX34uJtq15COVkzq4NBTfz
	khaq/zrCoc49W4n769F6/BRW7IUWOBxuv3rO1rHjv+Ib/BKpa4UjD/lRnbmat+I+dkegWIblbLC
	YYs01OSU725up3fm9jy8hvZ7c8/VRMgbU+rYGGldYmRL385G/aqcz4oslC7Vx7IS5voUdQ/j6W+
	Lwyc/32upXjZNxIE=
X-Received: by 2002:ac8:59c7:0:b0:51b:f25c:2896 with SMTP id d75a77b69052e-529d6fa0310mr13120441cf.11.1785232791995;
        Tue, 28 Jul 2026 02:59:51 -0700 (PDT)
X-Received: by 2002:ac8:59c7:0:b0:51b:f25c:2896 with SMTP id d75a77b69052e-529d6fa0310mr13120161cf.11.1785232791475;
        Tue, 28 Jul 2026 02:59:51 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b388d5b4sm212090015e9.3.2026.07.28.02.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 02:59:50 -0700 (PDT)
Date: Tue, 28 Jul 2026 12:59:47 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: guoniu.zhou@oss.nxp.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Frank Li <frank.li@nxp.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, imx@lists.linux.dev,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v16 2/3] dt-bindings: clock: imx95-blk-ctl: Define
 formatter child node schema
Message-ID: <2hmw6cq6e5ba4hps46k2drdutaofcqcrczjreq7hoikmobb7rm@wbconxilsxg3>
References: <20260728-csi_formatter-v16-0-1065ba47530a@oss.nxp.com>
 <20260728-csi_formatter-v16-2-1065ba47530a@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728-csi_formatter-v16-2-1065ba47530a@oss.nxp.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA4NiBTYWx0ZWRfXyuhxc3BoUGhf
 AURvfbiqHkZaUO1bPxQtTLXVp78MLVEx7ZDNrWashpck1kWJ2JTx/vctgv4zkfghRD84Hc2+wwF
 jd7PlZTLAEgXCSzwfZW9LScLCc94mZg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA4NiBTYWx0ZWRfXxHi9YDbjGw8d
 HJRcJOEDLRvaaC6V7pZUk7jc+z1QdRkI4ca6CYJ9Qfl0zsrXkWegkBaxvEo1Xhy7XTEsNOhVvXK
 ch8UmCX8F2ERx4CfcWOs9VCXHRaKXotQi8dzJ82pIWtVq47t/4NFT7IWu46KVPskyPR256kmp+K
 hgCGIYHGlh/VwXIRDd9x+Mb/ODIqsROZ+zP09Q+j/yC0oZdXlhyJeRLE5KxIIM8IeP6eL5/dHAj
 O3Mb+AjcE6h8CmhRTDCV8RV422+W5q9GoN3l9px/dYi4Za7xl6I07d++k+AR5jsvhkOCewYiTCx
 eSbdbFMrfSu2q8AKUWeDHMXLF8m4+gZiicHL7kVw/fd6eRr0H9ZPJKnmsoBHzadMSLTrX8ePZSS
 PtYUKESpQMqDI4PMtxJq5edrXLx2cOvsaff/38OHDLYMBbU9bu4RBoQijFR7Z3ss+C9aOE0HDs5
 7CMLR2y4XbqVlMMrISQ==
X-Authority-Analysis: v=2.4 cv=aa1RWxot c=1 sm=1 tr=0 ts=6a687d99 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=P1BnusSwAAAA:8 a=mdcQqFF6s0ROXEWFMbUA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=ST-jHhOKWsTCqRlWije3:22
 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-GUID: YBGhl8gLoPCn1ZX37UFkHq46y76cfOPG
X-Proofpoint-ORIG-GUID: YBGhl8gLoPCn1ZX37UFkHq46y76cfOPG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1011 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280086

On 26-07-28 14:14:15, guoniu.zhou@oss.nxp.com wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
> 
> The Camera CSR contains control registers for multiple CSI formatter IPs
> at different register offsets. Each formatter is an independent hardware
> block with its own clock input and media pipeline connection.
> 
> Define schema to allow formatter child nodes under nxp,imx95-camera-csr,
> with 'reg' property specifying the formatter's register offset within the
> CSR address space.
> 
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Acked-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

Mauro, please let me know if you want to take this through your tree.
