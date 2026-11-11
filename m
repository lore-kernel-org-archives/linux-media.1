Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794411623;
	b=th8/n2eXFRmrdju+w4HLl7Edfqx5Ba+9Tm6NPEDQ3OPYgWPx3UY1THd4dcqzoTbFKyi7
	 pXWCiGsI84c+Ur9bb96lCnIw6eqVgfnYRDVdpniROSYrMSUmtXbyeQEUv6xyw79QDjZvY
	 bT1IuLHuY3wkBE91icTBujSL9R9Vbuuzio44MPolGr7q8KPtm8bEjCDaPHNeOWUWuSRoQ
	 /csVqnH9ORFYnHYTfrcv1phju6tgpTOW7RPzq5Fg9xj2bNkFYnpEhN7L5qypJMC9Iifmk
	 hdPZCDSBXUqKjQcgQBq+SKJ1FHPKHKK2cGZbIyOUyNUs2q7M8zqzBmiRvPHsig6Bzsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794411623;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FA1mHnF+XhN6ttPQgBr5HKBiaAsWpxa3gFD/i1WYPj0=;
	b=UEVhF3hI28dDX+Vm582cTyEBmbNAuP0t2uy3iqYBnEtezmK5dD0yR7FaoQAXCsTdt5/3
	 l+Y/kOtG5f6xGw9X7d/CgUlJRKBC6tpQXpS1fjgl8Ewxj1yRsXWntGP/5z+jPnxMqTp52
	 nHgUgIaulhwwuOcd0/ZgwsYyEQagSZJhMvcL50K8oLIXcxuYSHgx9gpfOkVQtbZXuRm8S
	 uJ3h9kKIhcx2Dv9hiQX8L5pv2qxNsKm+/Qye2cJs0es53c5L32x8x6TLF+ay2q5ojhMIC
	 9pIvYzovgacLTlox5/YRnz12HEowi5v8vl65L93A+lUThKhaITugSr5au7biI4+QyLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cmpR6iEg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MFenZKQg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22C160A2604
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 15:40:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F22C160A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cmpR6iEg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MFenZKQg
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF0Bi0618020
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 15:40:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FA1mHnF+XhN
	6ttPQgBr5HKBiaAsWpxa3gFD/i1WYPj0=; b=cmpR6iEgItva8d+V7jBmgK1yi8y
	WvWKre2w6PsPgtBTgaWEfwSO0WB22pAYq2s2wXs3kZvVCkX5vyZPsceblbDezrtC
	Uo1bjE4le6s+Cs6UG2u91KzJlCIpbgksbaaxbI5aXWXljnEuGZK6dEQsNZalwD7x
	rZqqCj6g/0yiNTjNUYGDGBeEnYf9NV6FkQrFjqvgKxQgMbhCK+UoDcbknPyGL6MS
	ZELlk2uFR9s+0h3eXlEdSPpR0yjqQMFKrxyE4n782+dz4jPoPOCCGiLPzCiDWtF8
	S0ztZ9CHejo3GRM7n66kaQoMlStB5k0fSGcUOFal++DF0xbQzuqV4Bs5j3Q==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvpjjsbar-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 15:40:21 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7cc48fbca26so208101137.3
        for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 07:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794411621; x=1795016421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FA1mHnF+XhN6ttPQgBr5HKBiaAsWpxa3gFD/i1WYPj0=;
        b=MFenZKQgsGUlx4zDEDXADzZBOjSh+qOulwQvtjrmv4ViEkiAO1p+20RCrlv8ybZywb
         3LpiZNkzvZhXmNPtKQ7b7lhlgbeQ/LAXawMF3keNqKYSVqoCNkhpUsxGUrZoZ7hfPnH3
         /I6smMb4IQkDh92FFNt1Ukvm53ocl9RyWDrCeIB77eB2g6wvt/W+BTrYjZPbMCiZXLWa
         xLvV66huARM+yv2Xa+pt+QXR6v8lZCxhvTh4JySqFDz1lc+qyuct9JMcIP4EwyFyGC7R
         MxyEgbdqzqoLyTxr/bfY9KEQMBb1NPXYN47bf0zIvzp5Qq1gtJPDgqTdAwLjgJo6hRbo
         xWaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794411621; x=1795016421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FA1mHnF+XhN6ttPQgBr5HKBiaAsWpxa3gFD/i1WYPj0=;
        b=FnLISI4YeWy1K3RFwhszNQp4/HVRMQOAEUfrL4GDazbGB1tWcGIGUlLwA2KGtEZvYQ
         qvHmmVZxkX54omTwQSMX0O8Tlxd49IUvX57VkxFQY/h4NriUBAaB9ebbSCRI/BfExgUy
         yWCsjCh/5I1YijzkkfGwwYNvAjx6cS42N8tnvwYg8trHYJt74LQYa+lMwSX57X4bSHtk
         v9OFxBRk+06OXHKiRiUzKNkznVnwfIqbozp94Fiws1a++QCr6XmywTW/ynGJMKpZ3gIA
         A80tWHokE4JbpxhlwY+VeyaasB9cHLWkXsD71c/kJrwXo8m52b3e6won/oTSoJNJEBAJ
         fBQQ==
X-Gm-Message-State: APuU4Z8jt7Ds3o15rGcfmPau8yulRTG7Nl26CQ+Uw+eyyXNbj7MbFwrj
	yWCOZ3ToEDBlE2GnY/zr74PRYKLEhot5QjAWci4+izhWQnPBssnfUDhkYESl4kzB28zFLRKdgzE
	xfWWlPRxu8yHMpRit7FqPsIMXprdFEoxBR21uoRVhB/WeNtK+OT8V/WWFn7e7QEMHIw==
X-Gm-Gg: AYBFou0RoEWKfvsY1DpSsG7oQGpSpIbmh4HM35J3cQHISm+WZFdSjLyJ8DOiw+9mvld
	KocEaECogWWTbNCzXrgxHMnCqeAM3af/c0Biknm5rRZsc/Kf5DH8p7gvnodBlseZmF/fc9DpSiK
	rAQfWDW7t25sV8KXKakb3kfQwSF75WDKUgshxIOtpv0yuKtzblQo5S5vl36Aq8FcWg/q8WmPHST
	Wq0iSpIbmPNiVo1NSIyoDSPYkU1uf/3IA6rwIt983F63KOKUFyxdf1fRGRCl1eh8pcNAKDTCqqy
	3scOf2D2iqvBCg/PK9ioWUpciSKQXkmqjnQ6MXLKNPASIZkXBeHZKO0lQjxZ8fVrbzn2LM9Fy0i
	39tgvzvcbgefIvcwqWxwWpNmXLZzrGRBQzMDgZsmBBBfJgPszvLIjvmZadJBpsfcKkpIMMg0aTw
	==
X-Received: by 2002:a67:e106:0:b0:7a1:f980:e934 with SMTP id ada2fe7eead31-7d4fb287de8mr763514137.16.1794411621106;
        Wed, 11 Nov 2026 07:40:21 -0800 (PST)
X-Received: by 2002:a67:e106:0:b0:7a1:f980:e934 with SMTP id ada2fe7eead31-7d4fb287de8mr763500137.16.1794411620618;
        Wed, 11 Nov 2026 07:40:20 -0800 (PST)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4c52fe41sm5288525e9.5.2026.11.11.07.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:40:19 -0800 (PST)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, bod@kernel.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, loic.poulain@linaro.org,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        atanas.filipov@oss.qualcomm.com
Subject: Re: [PATCH v8 5/8] arm64: dts: qcom: sm8250: Add JPEG encoder node
Date: Wed, 11 Nov 2026 17:40:18 +0200
Message-Id: <20261111154018.654669-1-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <3ti6ntq6ztczilnwv66ak7ohl63mgw4tv4mdbsiy2hrkqqqjow@rmkwrasthd5e>
References: <20261110163909.78085-1-atanas.filipov@oss.qualcomm.com> <20261110163909.78085-6-atanas.filipov@oss.qualcomm.com> <3ti6ntq6ztczilnwv66ak7ohl63mgw4tv4mdbsiy2hrkqqqjow@rmkwrasthd5e>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2MiBTYWx0ZWRfXxhLHx9eg3A4o
 sqFnS3xUf2x8inyVMG7Udge5m2V70Ov6oaIXfDW9ylWxQMqwY3JMXbs+DPPoEYWMYsOpZ8Vr+86
 A6FtD86bQWw8je0Qgi7qhlOUT9tJOZv4M3WPicB+O7pyTpklHrvvTjTmIbjCXJCAIX/Wxfn28nl
 fMhAscOVnwH36b6OQDCvMGKOBF7ZOXD64GAhSblknd85sjYdGAHTQjLdBkmtXT3ulWve5tXqhs2
 QWB2ODTxmeEOlI2zGpJjMhCDTH0o+yS2EpajV55ge126eSy9jFKEd/zoefGIFqMYKBEQZgBbY7N
 DCcGSO0Vzfi6j2poV+RarhKRgFLf4tshweyoEaBCOqh2K7n8+OBp6bv/Vcz1Ec91O2Z2KlwAxaO
 B75zFyMV+ITL04/DosTXYKBz79IAw0RcJ8mmFjHbxICgyq1fiJrBgN3a6P+yqES7X45XVn5OiP7
 31rNbGiKfoWeBgwN/Bg==
X-Proofpoint-ORIG-GUID: c8R_y-QVXDbm5C6yzAPS8GRfgWAS8ffr
X-Authority-Analysis: v=2.4 cv=FeuiV5+6 c=1 sm=1 tr=0 ts=6af48c65 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=AU935lpaGaaCzQUhO60A:9
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: c8R_y-QVXDbm5C6yzAPS8GRfgWAS8ffr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2MiBTYWx0ZWRfX/ptGWnQFS+Ws
 myrj2isFdYMyukRQFBblWigtXNawFz/hu8oaYz3R0IJc84q9XOIq1zEWi/EcQubC2VTTyDEV2uR
 3BfZWNEQG1tjz3GlYzYzxzotvuOYAHU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110062

On Wed, Nov 11, 2026 at 03:14:54PM +0200, Dmitry Baryshkov wrote:
> > +		jpeg_enc: jpeg-encoder@ac53000 {
> > +			compatible = "qcom,sm8250-jpeg-enc";
> > +			status = "disabled";
>
> Drop, there is no point in keeping it disabled. (And the status is
> expected to be the last property anyway).

Ok, I will enable it by default in the next version.

> > +			power-domains = <&camcc TITAN_TOP_GDSC>,
>
> TITAN_TOP_GDSC is a child of MMCX. You shouldn't need to declare mmcx
> separately. Instead cast the votes on TITAN and they will propagate to
> the MMCX rail.

Ok, I will drop mmcx and vote through TITAN_TOP_GDSC.

> > +			interconnects = <&mmss_noc MASTER_CAMNOC_SF 0 &mc_virt SLAVE_EBI_CH0 0>;
>
> Use tags instead of 0.  I guess it's QCOM_ICC_TAG_ALWAYS.

Ok, I will use QCOM_ICC_TAG_ALWAYS.

--
Best regards,
Atanas
