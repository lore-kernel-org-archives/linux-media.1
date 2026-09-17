Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C196F2F83B5
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 15:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789659013; cv=none; b=nYCGhXiFyh7/1UqrmjJd/K2x5EbVZHdoO9zqRz+0RD5z3fLcGV2jDIZzhnmL3lRxMd/kDiXDufAt7I6YVE/qE+ZYAQVvgKotjpR/G+RRrtJMkaXMe4OB7fYHwIxY6RbkTbbYL9cnJT+sshbx77Q/LY1v+5w+6iV+0LjfECQDamA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789659013; c=relaxed/simple;
	bh=EWDDxvLh/ajUORqgSDl2rZ8ViAb2Wg2kGEU9j2QUOOU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mGiLS23Ql0obETN5+YyeNnMeB9CTE+OXzIcjtrO2iXkmhzCiR2eEPDPA1UA3hw1L4A6Ht0gORT9a11cxu5+f3j4vFCg7mCOyNXCbT9cgwLf9cY/EGddDw91NL+7vgpWAMkckpyDa8dhOMcMzMdwB6k0/ncCRiewcZQGru0W3IwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PDsyaP0e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GQMYTvPL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PDsyaP0e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GQMYTvPL"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HDiR1q2265055
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 15:30:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ri1E8u+BKFp8OWjyXvh+uMJ4
	co8edga6jii1ZtQDCCU=; b=PDsyaP0eFQq0gY9bRGD1dBPRKI+Mti6Fa6Mjx9P4
	/khZUBYJ0eBzHeRoEwoD2BIAv1R1UYKV0L0YH6aTLI9OE8jA57mYaHLv3jelQ66Q
	2vN1baVoBfaUxZfXQRxJ/MWfg9+zKIqYi32F18ewUXW3XhPsDW8hgyuXpm/npdUE
	eh0kwUF0zhAS1AO10UaJngpkjcqIA6sQmOMEqu1EZHf5tTw+UyGNX1M69T6FYH3D
	uwGIaJSJ0XTUBI2Zmu0T4rdQOuc6mYtXsJoD+KwwihlcaBfW0YWoUGIcpm7N5LLS
	pvypELLWoJjYJxxdP5Alw0GmTnYKP+QNFEMG4ZsO5NFlPg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grfpph1d4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 15:30:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93918756165so178369285a.0
        for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 08:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789659007; x=1790263807; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ri1E8u+BKFp8OWjyXvh+uMJ4co8edga6jii1ZtQDCCU=;
        b=GQMYTvPLu1a4ZBbD7WwWpX/WSxaTjHibIB/F3M+xX412BoDUspXI60DoS0vfAFphk2
         tqdQG5gQyQOk/XmDBeyiJ0xNP2bUgtA53iYb9Mckodn8ly184M02OLcLsIz+TMYP8p/2
         DoZpDeSgllJhlACJ1dcQdul79F/Tmxrma63ld8omWj8wyImMw5eYKi7hoAQEPFtC5ijG
         3oD2TDV6AQjh9QcOgzMxIK92DMR/ZqmJQSTb8l4u+c4eR8kE8t0VzqkLGswXVnpY5Z98
         RNKaHO8bO34W7EIxll3NnqCAeXWOBkK6vc5Jx87pWltlQZiiJqVzXkgDnswrpYURrxaj
         H2iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789659007; x=1790263807;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ri1E8u+BKFp8OWjyXvh+uMJ4co8edga6jii1ZtQDCCU=;
        b=VJI8AQkmg+3pgnjd8CUzMA0MZEs+7IMdplJPdD4cgCGTE0tKHFTNFQGcz3oxzFup05
         tu7RwI4qBEhd0WIF/kYH03ivDq1wlFPCou7GrySg+hxUVYpFmgzUhs/TEmZQ34+rrxyL
         tr0HTruZq9SEesrlEHxNPHQZty1FT+BvaXw+0cHS7Ps5Rj129jj8K+4WgCJmUGvxoSMK
         Fzz79rzjyE/ersp4Qrm0PkJySpVw+kfQeP3oU4d3agxNI93JvLOWPHmu0OUydAoXBFTS
         vnDVY9ZZp5TxGlBPII819Hslma4S4gC50Y3Q3Xz+GySC+vwkYHAjqzxTjBGOJUeoG308
         3/xA==
X-Forwarded-Encrypted: i=1; AKwUvByIR+hKO6DwfF36PoMBNO/OSDmFkwfV6sfWqkmanwBdF7+wwUz4FXHnir2zfOX5Occev66SJGWCAQ/0tg==@vger.kernel.org
X-Gm-Message-State: AFuF++lzhROg5K+SxR3kkENFjjamJWNS8Gv3Hlw918//52UarP4jSQKL
	hWbEaHuHhPIjcLiYYPNXdP2gk9IIgkQ0OTVa5aOEU+2yYYKzhGXnhTpRhqHgeNgEv4wv3AU6PJm
	dURQncFDUKrTuIeLHpDcN2bwWN/QMYscahSnxwdOOBnb+AJFLMlw+SOQtkAAzvbTQ9g==
X-Gm-Gg: AYBFou3ZqHeaIXT2/f0sGsNsgRGJ39L9T624BLkRrKofF3geo72xi1BM/ENRzMJF/d0
	mlQCT+9JrjOe8+qhbfu1+3M01kzbUmdbE0HVcy8sR5WfW/rBT6lZsnqBjAXiBtABkcDHHR7lgYy
	HcDfQyiITFEcMCJa4jxcctEz3n2IFakP9nUi5r6BAnDvAJvvSCKvUYn1OqvyDLYQqZm3Ms0+G8l
	kWaLxW5jyVeU/kBN+6kmF1eXl1l4ebmSSVfZ+38KsnjmcReNTMpuURUPo+iZvkBQSvjXxWcDqNm
	UBT8l0nnTxVPRLkcWFIlbxUuhMzv60BmKf75XMsTey1A1yTNe+VoyfaIPKneQyDqgW7IXubFIN5
	peVOQRAUG/QWnXg==
X-Received: by 2002:a05:620a:172c:b0:939:6de6:9517 with SMTP id af79cd13be357-93bb794e07dmr1288320685a.46.1789659006341;
        Thu, 17 Sep 2026 08:30:06 -0700 (PDT)
X-Received: by 2002:a05:620a:172c:b0:939:6de6:9517 with SMTP id af79cd13be357-93bb794e07dmr1288311585a.46.1789659005708;
        Thu, 17 Sep 2026 08:30:05 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd247809sm141129705e9.11.2026.09.17.08.30.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:30:04 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:30:02 +0300
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
Subject: Re: [PATCH v8 5/5] arm64: dts: qcom: shikra-iqs-evk-imx577-camera:
 Add DT overlay for Shikra
Message-ID: <ok2efl2jwkpm4etywz2w256gozewohaznorhhb6b3zed5ktr6f@vvqtflnebftn>
References: <20260917-shikra-camss-review-v8-0-9b9596221cfa@oss.qualcomm.com>
 <20260917-shikra-camss-review-v8-5-9b9596221cfa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-shikra-camss-review-v8-5-9b9596221cfa@oss.qualcomm.com>
X-Proofpoint-GUID: -Xwuk0aB4hcICxW5nE_sJpwiuEuHXoX6
X-Authority-Analysis: v=2.4 cv=YcYodARf c=1 sm=1 tr=0 ts=6aac077f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=XE-wypd_VeY0GsksmEIA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: -Xwuk0aB4hcICxW5nE_sJpwiuEuHXoX6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIyMCBTYWx0ZWRfX1MEXJlnUwsbg
 DTl6YDyfnzFN3PD2SP8tWpHMzcd9Eq42IqE9/fT/k8t3+yDkg8O8soKQe/LR+iARS9Olg0rZ2+9
 625KD5zUi3npVkQjmmityiGkzxvgN5xzKpaXPpUDkNLeJ8Diuf8h6jYJDFMPM4ub8/vawBcAkoB
 r1VeVEp9jXh77AScov76MK6/XYHXXRLuzucr6rxiMLdyA7deTiJEwQmYfhwSajyGGM/e4Bv+Hc5
 hNnoETdjDowRjZToKYugw6NAOoHtd5pWlTFYVEIlcc9JfT4avcnfAAYfqwJTjtih44df8EXJ8uL
 k7DwMp4y2UP/QwLwWWqJt18O1QoCjFFUqxnTs+SfmmtVIVQUnRhex3lW+FBjCEmE30YALSOrApl
 +dguhGpevgvei9lCqlo6+fNfp96KDnkBjg7K4E8zEJ6CmVVqzGfvlXTONB0hs5NvKTiByknqrPR
 dMkSeXWf8M87I3UEBAg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIyMCBTYWx0ZWRfXw9bWakduc5Z2
 7zeXrBXK8rmznVxnTwyKxIQ7DT/Bf92GYMVxD6Z9HLRweSB64lB1kq6t8X6d4KINZGZ3wFULGq0
 vXRm2LPVzUET5nIWnnYAr8pwrNLRDP4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170220

On 26-09-17 17:11:04, Nihal Kumar Gupta wrote:
> Shikra IQS is an industrial-grade variant using PM8150 PMIC, requiring
> different CSIPHY and sensor supply rails compared to the retail boards
> (CQM and CQS) which use PM4125.
> 
> Add a dedicated overlay for optional IMX577 integration via CSIPHY1.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
