Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C79C47DD65
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 13:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790171272; cv=none; b=qmxVM+//I3RzPlyC5gdPfKpruzGiHdZ2/Lpf+RJZP5/+wMQCouG0oXOhVn/lHvNtA4PF0/3ByrGqXMXZQpgNBCJYZzUy8m8LOF9uQwZ/CLQNgwEsJOD+B7mAwElIWqRFLTwGCAf9fMeTNGykZ/MXOHTvE2jISGk794jpoZQPz/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790171272; c=relaxed/simple;
	bh=6TDPy8HiYvIK8BLqW2Do+y5gjPAR8+4NGldT85qKbrU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z7iqNHMA+DGT1htq20MaLyvLDBNbaefP66Vcw8PN4a7Te4rh9zaiXJmZazRoFfMKTpi/3lB5lCmMTCnX7tz9lBmpLBKJ2WkI9giW29j/VISe8lZJraUkZwZctnEsC9OUXq4pAjgR6z8dp7AjOjX/nIUqtsCFklK5fGQryYQPs04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ouz0sEQ5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ahqJL2sH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ouz0sEQ5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ahqJL2sH"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBc7Nw2639478
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 13:47:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=f6RI1UfnbG6hFkuz5mrr0mPm
	fiG6vQKcsGj0ghcQRnw=; b=Ouz0sEQ5Z1EzgpA+sBFnsAqN+AmCuuWpBraGa0ZX
	Zq3FTOOluaUz2Vgun9HijmHwHaFW4q9TIAwiRhOCAoxv7ymtmOTC1D2O+J4uqT36
	WzkpTDUWY0JY4npF/lv2+lz/B8W6NJRCVf04y4OLypidoYWTijt5+iDJ3rAujRLh
	MfixR9i0FMFNf2qHCo4XEhORisXX/oWv34j+OmDLk9Nfdaxvn2s6mwltomwpRo0q
	cp3uFv2ue8vwYWPyVdcQKUElkDT+N4EyvtXv7RQLB7d8p5RetSLnhLpFqMrMvwp3
	1bTGZZTKJXfpF1NMfH5NQ8Ymc4kEsChlUGGwDR+kkASZsQ==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv9bqhuuw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 13:47:50 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-45e6091d8a1so916864fac.1
        for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 06:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790171269; x=1790776069; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f6RI1UfnbG6hFkuz5mrr0mPmfiG6vQKcsGj0ghcQRnw=;
        b=ahqJL2sHPxJLX1HZuvlbuhM0ud5MGPsxkqoLKXvLeOqC/z7q9x8LmSF+h4uK12oVx1
         z7Xxp9LZt0sOU1kN9XjUUw1KxuZrUohaTN3MST/GmpvLlgVK7OHq5XzZb08dcKvdWD2X
         UqGxo/yipCACCCO8fdCuPkAzFvCMCWrKNc7ydp2t0mA2PIX3frSw4AuJff4XRBXSiU2G
         cnYSTyoqF02J1U8NBb0gPj9+wmAQSU2o32srshqMoIfFRLiONvzPWs2Mn8y+gcWckjqU
         GPr0R4+DIiuSm03n5QjDpHAT4dfK4RkEGw9836sY/iP2kjqr3VMpp1BPFhsyeG3pZkU3
         3eXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790171269; x=1790776069;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f6RI1UfnbG6hFkuz5mrr0mPmfiG6vQKcsGj0ghcQRnw=;
        b=qiK3NWETtjqP08HJ/bLQY4QaN5QM7Gi78DeeZGFFdc4BM3UKeYZ0pDiu6arBGkH85V
         lrcP6FTPmNsj+3eFpFgq0CUOnn40ASTR9E78MYQIjmOElISe2K1b/pgIf8hXzi2YTg6V
         DhV+xHKlMQ5nw+C2emxSLG01NxTXrcY5toxmJrdP0KTBOgW5XtpgFTy6mkkxzUJQUU/3
         yPL74FQD4znTVGg/ExfdQ+y2FdzJZdU5ZljR5wHhzyUtFu+OD/s61g/yT/PXHxDO5buk
         NmDcrjUItvicmaNIHuToQuGMavc13iXH2p4kCCdLrfneIlQr6hHAOgHpRf/JMtsoE4BB
         24DA==
X-Forwarded-Encrypted: i=1; AKwUvBwxRz7YETOO+qb7WROpzQZtf8kWy9//7jyet/yiTFx/nOfQA8Es5B5h/6UXsQGRNbViJWTEOxG7TJmd3Q==@vger.kernel.org
X-Gm-Message-State: AFuF++lUZObj0ofA67agVzBeTeKHAGqGV4k9M/3cCDNOHm8UnWvlDxBb
	ig6D/IvJ9LIhX893PVa2npbs2mXFlIDLkIVB2zzjytIraL7rXskHOmX1RtvU9vDyCdFOIr3Y8Ba
	sAXx5EteTogDFmLsoDKTQ8vZMFtav1p1/mepFC7Qq+E/APdAXV5bC5hYZdjPHU/Y6Mw==
X-Gm-Gg: AYBFou1z9WMMblIC2FMayU0+i2no6X+EePAc17WRFtN4WwkPTv5xV6Pm0YSqzvIuU1q
	GqEsHtyVzAmOhUbirWRi8lN/ndGTcFAwncBhxsZ14lAmtT2x/UPfQJFqx/QKE7F9ptr5NWODu+k
	0VuAVqSW2UEokjY9JtlfinbfTDVGahSD+BMH4/lwlR7dJRK/TYieyPGhWYwQWA1iXnQUSMrOhlA
	Tp627vYdZQJzkIcMXB7hDWkYP1l7n0C0emK3UccQ6SQGifywTFHmBr/SRSwGluqylNl96k/5qmR
	BooDn6kR+5faVBzJHD0k5DEe4XaPRCGD0S+HGmQxd8ZG8wQU/DCIRz3/8C/Yj3vdcyvvta+c84E
	tcF0m8X11K6K26o1XzbcA9LADzEB8bqBy2BsbBjkmTA==
X-Received: by 2002:a05:6870:3806:b0:483:67d7:e03a with SMTP id 586e51a60fabf-49089d5da63mr2560966fac.11.1790171269633;
        Wed, 23 Sep 2026 06:47:49 -0700 (PDT)
X-Received: by 2002:a05:6870:3806:b0:483:67d7:e03a with SMTP id 586e51a60fabf-49089d5da63mr2560957fac.11.1790171269214;
        Wed, 23 Sep 2026 06:47:49 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4908eba2f0csm1710925fac.14.2026.09.23.06.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 06:47:48 -0700 (PDT)
Date: Wed, 23 Sep 2026 21:47:41 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] media: iris: Add support for nord platform
Message-ID: <arPYfVPIWblIayxl@QCOM-aGQu4IUr3Y>
References: <20260919-nord-iris-v1-0-94428761ec06@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260919-nord-iris-v1-0-94428761ec06@oss.qualcomm.com>
X-Proofpoint-GUID: CkosypiwlwTdSqSVLX25TwgvCJujuUKF
X-Proofpoint-ORIG-GUID: CkosypiwlwTdSqSVLX25TwgvCJujuUKF
X-Authority-Analysis: v=2.4 cv=WZuZ+EhX c=1 sm=1 tr=0 ts=6ab3d886 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=2wm1sE6lh8PoynkbDlcA:9 a=CjuIK1q_8ugA:10 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1NCBTYWx0ZWRfXzukFWtqwwNo2
 xsRqbzdgbWD/hFZy2HXntWZaI1cEM/WkWOIWZPhBRH1/G9oxWMjC1Ug3X2kYEEhPfkGLG2vNHsy
 KGAuaReAjfSfYMeo/eTNN537Uh+dJgg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1NCBTYWx0ZWRfX0HJ52BbWfsCF
 3uo5vcQEh18tu+tuGTDrlAfmXSjdedRQ2aI7ZHFEBFwkBT5shpS2Wfok4l0752LilhH6HhPog+e
 pJq8S4FAAUQfOg+m2sd9dUAMnabpvC4BsAWiKFiabZkN1BD3Y9QFGmmH+SbXpfxZctfsq85zs4F
 NE69xOfjOE/kMzMB0Nb94g9yhH6yJ5YzTxVEiMcYzTdfNe0IN/W1o1UocCcGwdCTX3u763e5FkF
 Y33kQf5aYIazwk/hlm9tS9eW88Hp+b9UP+HZdtnkWYiBuYUTYCNwJQ33T6YUGpTv8JShY+30opp
 Nhkvj0GCtVUc5VZZ9FW4EsANi1B39UdIX6D5gr+I6R1/6Wuz/X0jbgHWgnWhy8shUV9QZ0tJ3Kg
 N4GaW7JOutDhjaWmI87N+zozqwLQL/uWsojFb6FUCsjS2+cAouoOs12Ug/hHQqv9VIRY13Gn8JH
 ljslK/UC5iH/8QwMrCw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230054

On Sat, Sep 19, 2026 at 10:14:54AM +0530, Vishnu Reddy wrote:
> The nord platform integrates the Qualcomm iris video codec hardware,
> which is compatible with the glymur based iris implementation.
> 
> This series reuses the glymur DT schema to accommodate nord iris
> support and adds the required iris device tree node to the relevant
> nord device tree.

[...]

> Vishnu Reddy (4):
>       dt-bindings: media: qcom,nord-iris: Add nord video codec

The binding should go through media subsystem. That said, this series
should be named with "arm64: dts: qcom: ..." and only contain the 3 DTS
patches.

Shawn

>       arm64: dts: qcom: nord: Add iris video node
>       arm64: dts: qcom: nord-ride-embedded: Enable iris video codec node
>       arm64: dts: qcom: nord-rrd: Enable iris video codec node
> 
>  .../bindings/media/qcom,glymur-iris.yaml           |   6 +-
>  arch/arm64/boot/dts/qcom/nord-embedded.dtsi        | 114 +++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/nord-ride-embedded.dts    |   6 ++
>  arch/arm64/boot/dts/qcom/nord-rrd.dts              |   6 ++
>  4 files changed, 131 insertions(+), 1 deletion(-)
