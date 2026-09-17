Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A654C10C8
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 15:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789658844; cv=none; b=Qve9UrG8TzW08ECWm8QJmAa+xNH6KlCvtAUAG7OMNTNodThMuH67bsRee6EgdDCr7yAXYBz1qP+nPIieWUvr5qOPV2G3NFEbNcEExbphoAT0yEghO4YwEIiCD5QJS2+bSd3l5X1qYyeCK9Kz/IvEnsXelTrI0psaxNvWzGxzz+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789658844; c=relaxed/simple;
	bh=ORrkQdx7WaXLuX6nCR7n/UoR4xgg8OSPPnuyxEfLNUk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OdybTAAm9ZkTXGecSfkCgXQjZr/MReVYDsWRo49Z67VbEc+h0x66kppScCCuhZcyf45+ylFpYf+5RPq816mWdbCuYrSXn+iS8yw3dBvU7t1oGfeK5ypgOpMaxcQe3DW/7OIz7CTiF5RBl8jjn4ek2zP5X8YHRnXS0u362SsL6eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MQ0AS78Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fF6FPlpy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MQ0AS78Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fF6FPlpy"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HDiVdn2974883
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 15:27:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lOcf1R7o5InmAsKwg2E0EjTS
	IYI7yDGuX6N2Ud8ufV8=; b=MQ0AS78YiydvB/L9ivANs0HuhU7RutkgB/3kwdsG
	kMln+VSjUbSBBkbM5olq7ZRZzRo++BRaqiiaJEvyz0Akj/Hp1UHnUUiNPhcVNDSq
	pBDSU2oW7E2Qzwfg6V/uLmt5m7FsWiMArz36lg4/pTUOcg04wcln4stYkJvzbgiF
	baJAbhBtKQd1MqqD0O2f2nwVFWzvlvbm3z5RoUurE/IWD78pLrjtaHdulPd1NWwg
	m/+K+R9RONfZyvdSC6pJKvZZ+M2QdJsKFhO/3iyPqUVyd7Cyh3DcuKaYkSkTj//Z
	X6KTcpwF+lDdjZ3eULZUuIS/dgjHB6Dq53/u/7u1UaTO1g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grdd6hpem-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 15:27:15 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91051512080so16161646d6.3
        for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 08:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789658834; x=1790263634; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lOcf1R7o5InmAsKwg2E0EjTSIYI7yDGuX6N2Ud8ufV8=;
        b=fF6FPlpyCSwQaHGjcVNd5MjyCjbetN7WV1blgzFr9082tOU0WbDziUbZG7XZT+cZMi
         SNck0Hkd9KtjOR3rC1cg5O6dt/3H/0hBYn7QcWDFnZ5ZGhIi4nj1RSx/r+dNPrwfjKEx
         +kMnDfUu34tkct9uFkgbhF01K8pLn8SaOrWRvXsj+EjZQqp2L0BLIgTycOiYjnDaJskW
         9i4kJF8+5BJdlbO5Sv8gj6MRiY+oNcxD2Z9m4nc16qf2SW/ovq+iqOtZxnRnzozFQ8Ro
         vSne9G/6mxeVVv2bd8DX7gZjiXAymgcNrkywXqvBtFp0BldruuzNkh4KERopfqtUOiRV
         ce4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789658834; x=1790263634;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lOcf1R7o5InmAsKwg2E0EjTSIYI7yDGuX6N2Ud8ufV8=;
        b=ufUxks5wUl7wEKcrHZdSFVQ8rE7kvDFwFC9k9NF6gWmt65XvxdOry9mWz1A8eqX6m0
         1EA0rPmqAK0eMOYho7tQVfoDsZdRtG8Odq4IjQoPROyKY3qfcIpr0Nm1z3aP5ZShcfB0
         iH77LKPehWewdevJoOOI+3dOhBC4wcYi60J6y01trNUMVbnHVC7LGIri8zRBV22FoAz2
         ppOeu/nGld9FeLmcvk0NBSy4wRaGg2yuJUHWKoVYJVe9bUAOsrH79lc3JOWF/Fj+zI8W
         Yt7ivVdxWOZBkH0DZZyFkbSYklotqz4q8zWA6AX8u4DI4CK49xtuah6DHJA+DBQsLUKG
         qBSA==
X-Forwarded-Encrypted: i=1; AKwUvBylxjq3ujSVeZy+3Lt/Kok9uEFT1+ChZPR9f/OLbgETYH51FqKUtxgOlvryIbu8vXvo5+6hRmIhXxKbqA==@vger.kernel.org
X-Gm-Message-State: AFuF++nICONPUoX2I6kp4nSsTJVNFbdnsBUtV5ikOfl8yCyzLbFF2wBc
	TwlDKqkVwjFxBAitLDPbVgKAAw1FElAMmEB5jClmmI9FgXFf4OkgtsZSDExq0wiDVTn+CQTkAhc
	V8hH6af96cMl24lUm1ggLO8fUGZc0dxlMi/08xJg8EMFVXaFtgxokWUShkQkyxhxroA==
X-Gm-Gg: AYBFou0uGUcgNtt4LYkHeyQfyCKf8UtY5DfzZoRgsaS5V2cxN1WLgXcGoUMlRHayGGe
	yEvxEtKRloFiwLr32crbCKSfQip0xQdvkPKRiqxRjUePNSFS/sPFHHdfAn9ZhBrLZA2qdTfdQYt
	SggJ3QgK/JDq9G8z3PcbLA7vntxr/YpqwOiEZebYpqwJpgVbOcgQhwl9o/6YP3yyg91S3P5hwio
	Li1DEKeqr145179kEOsmPkAsxg7I+Dh/ic6FrjwCMBZxeyDL58MTasUy7jGHjfiJTeUdFCbNvzf
	7nzh75rZ2tbOXMcMTcxeFM9kpLJvG1a2L0SMxafP0N+s1fIQZcILibP2nc7QYNHqFX87JFumBIK
	ss3gPsYrmFtUsncc=
X-Received: by 2002:a05:6214:62c8:b0:912:4527:7ba with SMTP id 6a1803df08f44-91252411994mr6212076d6.23.1789658833858;
        Thu, 17 Sep 2026 08:27:13 -0700 (PDT)
X-Received: by 2002:a05:6214:62c8:b0:912:4527:7ba with SMTP id 6a1803df08f44-91252411994mr6211096d6.23.1789658833203;
        Thu, 17 Sep 2026 08:27:13 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf26c8dsm16288601f8f.14.2026.09.17.08.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:27:12 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:27:09 +0300
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
Subject: Re: [PATCH v8 2/5] arm64: dts: qcom: shikra: Add CCI definitions for
 Shikra
Message-ID: <ns6fwcvy53zd3yx237nrnbyzs2dvnp2imucgdxmj2wqi7pupsf@dkif3wniurye>
References: <20260917-shikra-camss-review-v8-0-9b9596221cfa@oss.qualcomm.com>
 <20260917-shikra-camss-review-v8-2-9b9596221cfa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-shikra-camss-review-v8-2-9b9596221cfa@oss.qualcomm.com>
X-Proofpoint-GUID: GRevcAtWTy-VGMtp9lYQC7WrAoEDSiXd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIxOCBTYWx0ZWRfX+cSePZjRjWGT
 EUn3uWkXep2DasBTQhhKBMQbBIsPjZxaMYEUQrB/1wyVoWwA58l6O+62UNn2WvrvQrWCtwDYwLm
 yJZxBk6QZJsg6nX9Zl/rn18AJ0BVLoHikDoLsyk2mKoXxMYOmTifcz2V4pCzLJpNJuxS4zuD4Y6
 MxM3h4p7CA+zl9RWgnpXGSIB4hFpHwqw1SWkOPCRs7JKQMOl5G7lDrpFr+yFqUAhNj6fr2xP8Pd
 hNA9ETgJ0Q8/+2HQq79r9I7Hhhp6AweZwHLm5BYryWkuu3V5PETv0wbk7I3KTepqSEDPP43LdvG
 sMVWDhwRDWLeQZyUnCGPoINHtqem2aQLkb2tyjx0SZ+L/6W48hZe916tf4SyU9di31Q+1s+onzZ
 gaG57N/28vtrJ62b9dw93NHyDPojrEZQgC/eDOOTHs4BvVl2qxUj/DV13zuzGyurKNND0uSRfQg
 tTuz0GnwE1U34tzg4zA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIxOCBTYWx0ZWRfXysE0/XzWkjqJ
 vvzXN1H5+Jw1M+FIVAGh1kvzfvQ+Gezmx6qYWVqkWbU//sIlwHdd7aEOd2OFBEV/kB3LvjA6abt
 6RSV18PMlhhZ6HVqTgIVrk6Wmoa6so8=
X-Authority-Analysis: v=2.4 cv=GeOCDgXL c=1 sm=1 tr=0 ts=6aac06d3 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=kTwRDD6jQfcqJCPQX_EA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: GRevcAtWTy-VGMtp9lYQC7WrAoEDSiXd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170218

On 26-09-17 17:11:01, Nihal Kumar Gupta wrote:
> Qualcomm Shikra SoC has one Camera Control Interface (CCI)
> containing two I2C hosts.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
