Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961DD37D10A
	for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 14:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785162530; cv=none; b=itOKajuEuHqqoPf9p8F2CNcSjsTHzNFp3qyg6j3bKarof8x1jqofVNxdoy+cN3VISgiInlxU4THamKFBiiE7+Ujs8yarfjJEW74AhtU4cFk4ILjMsXxGWPzQzkvO85tRmaMQwJtSEHbDaB3TKZdkPLoA/r2HYl1AxlJkDX8hwiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785162530; c=relaxed/simple;
	bh=dtaCPwCxPBZsQU9e3ksDAJu5ustHqHFuIA9inl4S3Ng=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YQR2eMdIgSAJrWzAFlnJ+kxSQHcJKwJsJ/GzXoH6Bd8VO1leOzwCQ7JfBXpNT/7p+bJMOQoDsoAPMBvFJ90aLcgoajogKEq4QgEbTAG40WCSkVK6AzBXB1+i7qLDGvIOF+lUUdSmbHOSgP4GmWyi6FwwshapcGtZz5IYW8O2Go8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M+o0hSNH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d3GwjbCN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M+o0hSNH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d3GwjbCN"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlhvd3895728
	for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 14:28:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XwYeDvLJf9xoDaVgSmjefyJPwZ0kaUEFJBnHboR0txw=; b=M+o0hSNHcjNeILVg
	B/EOF/hkawhWP5TCNt00nOp98TyC0DZqa9hDaev4t3y6xAok2AjW2mVCndmNWEN2
	AA5T+cAXEwEAgZJag4yFxZaZsN60WSCKcIkOeU7RqiugTcqGoTck5isPSyCUwInw
	vKwenjqiv6Nqjvmz1/nZFrT/VYTPLc5mUIFVJF0R4fh0GzUaakGO6MWWnAOe+hmX
	eDl2zEMLD6b6Q76NBFivsWvuB6X2wgwTFPb4ui+DbZF42f2guEmF3hC0kJhj8Wnv
	nwgswkcMI+YUD7KWqsWtdcCEHHOAXmcDj0Yr/W51wULTiKqZRIYnusUPab0YIzNT
	T9Pydg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fnsxs30yf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 14:28:45 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51cab6f7517so4623151cf.0
        for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 07:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785162525; x=1785767325; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XwYeDvLJf9xoDaVgSmjefyJPwZ0kaUEFJBnHboR0txw=;
        b=d3GwjbCN1TxWcAA7GWlafjLDqGGbioxLqKS2d7t4aU+JFC4dIj48+ApPsJFg1lETtH
         PGLbzg0jBuA2abNS6dvFnNwmd1Zd1Cdy3MOMeWaHXuCdUv1id7AnpvcsZJ32s8eXymi2
         XUQKch6nR14yqivJue3zCuS65b6ywRa7YaJp1aUX9pmTV0iusUrQRGn/hFzW39EFKPZL
         tgSiQBCFtzsqXixhUrvt2c6R/jAYNs/o3d2e8Q0XvDozKHwtAh1OT1/qUFruQtbqg86a
         R4jl/ArHqcnTzOPQ2N8x0O7n3Y+D8+gkvx/IutXYJElVcXg0ZO83Tp8duO6fF3ejmC1o
         W+oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785162525; x=1785767325;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XwYeDvLJf9xoDaVgSmjefyJPwZ0kaUEFJBnHboR0txw=;
        b=kzkRdHghHWcrk9A+eYoebnx4zHdl1OIOECQafEgdiNOh30KXORMPoSNUoSAbiCQa1G
         +PmkwCFSA4c11SzmAhxEf06lLg7N1tsUgWftig7zfmZQvgBjmyVA9AM5diWDqi9TF1nJ
         gUbtRABLzIYX3a7VouQf+8Ht8Z+FGMgiQWZvFUKKiinVSK+2/E4abbquXzZlBizX8iBO
         oFPQX55C87XCj3A82ZFVtZ7dTYBl9ytU8uGdDj0qxkDnnp3XfXB4JjJFEeYa3anD5Nkw
         nbhey9KrdhmFrk8StCheT0vupQK7GNjRmnTl9UB0wc2eW9J2TgyyTl/m7LnUxlqdtOQq
         pz+A==
X-Forwarded-Encrypted: i=1; AHgh+RoxE1MRxkkXLaFz3U53OMXt8xRcuAACZQzQa2NPNAZTEHCBqUEeP2ckepPsi8LeB1zbPOTdk1LrmiZngQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCxXREo7xHo6r1JKQ7rglQOleHfGjUNol4TyYCnOMC9FtXJTt4
	Ew7xzF8r3vAeSphR6JsdFp3WBrJierjzq6cWw+0jdwPSJwC7qRYW/zvzsZu63//zIp286/Ks6my
	tPsWKPOjEoJW57MTnkyyHwXBvbIVPpXK58NB+OuLlOVBKopL8TSo+Grz3dzKkTmFQ9Q==
X-Gm-Gg: AR+sD11pvBGvfnVf7wWveVK/MHcyy/GAgmfuGivZlsP6WoqFegReqNt/uxJzmb7j8VH
	FOD14/7djbBH0ANb9AHo5yeqk0BY4+IP5XFw9A2atxMdMO/rthZRwyVhIMKazdduQZAOzy0pGiC
	ZLlP9AfzglE7AtX31sflXMHJC6JWHbQp3Yh0S6uWTyUDrN2mw+Q0HNx3CIUTKc1rx/icLa/rmTc
	jwNdawk67ecsETwrwCDtTw5gimpMXBbL6vwFju2b1lAPM0cmmKEsKHUdyFY/UXf7NunOULdQZ+f
	cHS816xtO0Rf1YTSkXutnTW7HnWsiA7WOikXU8qtnPbs1dS0/Ufp3G+7pmVJhuPooo1jcMxhimZ
	mwbBFy8GH4FkOjMsaiB2g5G2c
X-Received: by 2002:a05:622a:1191:b0:51b:f9e0:87b0 with SMTP id d75a77b69052e-529cfcfb62bmr3497561cf.2.1785162524686;
        Mon, 27 Jul 2026 07:28:44 -0700 (PDT)
X-Received: by 2002:a05:622a:1191:b0:51b:f9e0:87b0 with SMTP id d75a77b69052e-529cfcfb62bmr3497151cf.2.1785162523970;
        Mon, 27 Jul 2026 07:28:43 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32ebcc4dsm670043366b.49.2026.07.27.07.28.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 07:28:43 -0700 (PDT)
Message-ID: <be2fb404-061d-4e69-b430-9cecea21f60f@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 16:28:41 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/2] media: iris: add support for purwa platform
To: David Sheffield <producer456@gmail.com>, wangao.wang@oss.qualcomm.com
Cc: bryan.odonoghue@linaro.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com
References: <CAOAE-oNM-AS35-k=ntkLX8H35UF6_6AhMTP_10C=RroA2_AvsQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAOAE-oNM-AS35-k=ntkLX8H35UF6_6AhMTP_10C=RroA2_AvsQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEzNyBTYWx0ZWRfX05hcPfkxyzeO
 1EZH51/VDxOy9GLwyU6Hi5xOYo34ZeQWduAw7NqvkxfwoHfSi7xdR+G1qh9zc5fVErBAYEFrP2n
 GUpcfkMZpocEeYbx70HRyi4zkbOupTuChYtcoXTSxqGIUqDN1c5zo05Cs2y4PWHQhdO3gkJ+xfr
 hKYhxzyv32UQ2G416A89oVIoMpeSRb1ZYrsnMyn8+tBXUaIO6oI5CmfFMrKnXQPdX2b0z13zdl4
 Zde8oipyrWYEtIMUY0TEe7wrIMLs/ftbX/22ERFEnkvjV/9xU+RXijZvNxdPP1cP4p9iSBvHyN9
 Xgo6fOS3ZK0tfTGT99JsUfxMAv6dqCoXR3ui+C1n0n5YFB8RCM0858p2+dM1h897Q1huS8+Rv2g
 INWXjIT2E59Vedx0YzDVrhHi260oBESlMMlRicB/onS/Qkzsn3Lt3KFFXS3a6DPpZQ1JMLJp82l
 hcQR5qBw7RGZQhd+Ung==
X-Authority-Analysis: v=2.4 cv=EYr4hvmC c=1 sm=1 tr=0 ts=6a676b1d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=_YIi2MdEoqMPYrfQuocA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 2iYSGei4-SaijqJgQ5kjaBFmS3T2X9VJ
X-Proofpoint-GUID: 2iYSGei4-SaijqJgQ5kjaBFmS3T2X9VJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEzNyBTYWx0ZWRfX3xdT8PCdNOFI
 9zjqH/wnf1Df/uTOFpwZKXP/PVhlH1G4QAz/ZHdXB2PjxVIaaAAuLeyCQZWvmyGYHZVQwrKP2Hq
 8Bwq3MqDfDdaGzH+fxjFNIQd/iJBs7A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270137

On 7/25/26 9:43 PM, David Sheffield wrote:
> (Data point from a production purwa device, in case it is useful for this
> series — and one question at the end.)
> 
> I tried to bring up iris on a Microsoft Surface Pro 12-inch 1st Edition
> (X1P-42-100, production-fused) on 7.2.0-rc3, using a device tree node with
> compatible "qcom,x1p42100-iris" and firmware-name pointing at the video
> firmware extracted from this device's own Windows driver package.
> 
> Every firmware candidate fails identically at PAS image init:
> 
> qcom-iris aa00000.video-codec: error -22 initializing firmware
> qcom/x1p42100/Microsoft/Surface12/qcvss8380_pa.mbn
> qcom-iris aa00000.video-codec: firmware download failed
> qcom-iris aa00000.video-codec: core init failed
> 
> i.e. qcom_scm_pas_init_image() itself returns EINVAL (the dev_err comes from
> mdt_loader), before auth-and-reset.
> 
> What I tested and ruled out:
> 
> - Four genuine blobs: qcvss8380_pa.mbn and qcvss8380.mbn from both the
> device's official recovery image (April 2026 build) and the current
> Surface drivers MSI (July 2026 build). All four -22.
> - Signing: the video blobs Microsoft ships are Qualcomm-production-signed
> (cert chain strings show "Qualcomm Cryptographic Operations"), unlike the
> adsp/cdsp blobs for this device which are Microsoft-OEM-signed — and those
> adsp/cdsp images PAS-authenticate and boot fine on every boot, so the SCM
> PAS path itself is healthy on this machine.

So it's clear the issue is that for some reason the loader rejects the
firmware. The fw has to be:

* accessible (do you have some odd file permissions on it?)
* valid (does it have a similar header compared to other MBNs?)
* correctly signed for the device (may it be that the recovery image you
  mentioned may not be exercising the video accelerator and it unknowingly
  ships a not-quite-right blob?)
* loaded to the expected memory region - some older FWs (as in, on ancient
  SoCs mostly) used to be grumpy about relocations. This shouldn't be a
  problem nowadays, but it's worth keeping in mind

> - Metadata format: the failing qcvss images and the working qcadsp image are
> both MBN v7 with identical hash-segment header layout.
> - Version/anti-rollback: April and July builds fail the same way.
> 
> Since Windows runs video decode on this same TZ with these same
> Qualcomm-signed images, plain signature rejection doesn't seem to explain
> it. Which prompts the question: has this series been tested on
> production-fused retail hardware (e.g. the x1p42100 laptops), or on
> CRD/development devices? And is PAS ID 9 with the OEM-shipped qcvss8380
> image expected to work on retail purwa devices, or is there a known
> TZ/XBL-side requirement (different image, different pas_id, secure-boot
> chain state) that would explain init_image EINVAL on an OEM machine?

PAS_IDs are common across all Qualcomm SoCs and have been for some 15
years now

Konrad


