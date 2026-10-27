Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793099521;
	b=I2AR04OY8TifS3RRZ73rwECQehx9XWOq8vn/3UFankKNEPbjI36HidxkCcwR5pMaeBS0
	 ptvm9c4fx6IL9aXxKtlSY91ZBB7DHUgEGWO5GOptNZT7kOaBQlhAJffvzA7HZUVBtyrsK
	 jUy6pBYdflxMRWueSdDgtO8pONhZQJZse9+deYsPd3Pv9UoOuT/Dde7wObPHhsW/g9YQC
	 Hdai5VjGC5cvlZOK54EqneBoDvYED6sBeHL53r5OUCQXc5yyTE4VJScGcB1ielV7JwSPV
	 ibyVeFMzrn3i7L3npxdMDXRTKqkeHfp1lgWHq+nVcCBYViRy73umWJ8tPfTBhslmIKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793099521;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FtCLJyhlU+SpPWQsK4RHlbtjukmxd1FVsKSyDoa/+wc=;
	b=VgczhlWVBgKQrqypG9ckv6hWpVKszeMLbd9YQkuwG8ENDY2jbFuwQWoNsbxBnstxy4xl
	 3/axA5/GggB45PEHviW3Xntpb40zep0xV9aNg2IADIsLzvI21Cse+O6JGMUxHaDyZy0YU
	 JZH0C6UIJ6Em95RVPppdwdV1ijTFQDinFwRIKgqM+pzLgDFElklVWEqlAf3Eoakn3/u+t
	 Na2/fhVypNCzKPBoi55e4XqVm8dX/Znud9ciJ1VhCmw3ZqHEMobT4oLH1S4khuDn4u92X
	 tA6MvKP/tgpB7HfItz7JD1lTs4ZJgQjSpNoh8ST7sKzxzoRRb+iwFu6hjBCboCfw6yA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W3BoJ6xW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ccMwch2j;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1178E606A321
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 11:12:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1178E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W3BoJ6xW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ccMwch2j
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe9Y3894498
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 11:12:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FtCLJyhlU+SpPWQsK4RHlbtj
	ukmxd1FVsKSyDoa/+wc=; b=W3BoJ6xWd7t57pU2qjNrJ32YoieGr2XWsKmWDWTr
	wpfyEOPEpmjaU6fBJIRXpbhgqvLO+/oyq1KlZZvVxVMcXdMF35pWSv7t/sHJ39pu
	HP79jp7mp5dOERsaBIwzaWKDSQVqUdIXMf0mPjBoUVVl7Ilw0jzSVi9hf+bq667v
	oFhDecKIdSAteeIuPnmnzs4s90Cf78Uoun0LZll8j8K9uU/hafwPkUZl4tTid+2C
	XBZrHeyp/UCkcA6HdhSt2fLQvvoq3ey2rvChOw4n6JcNU6PFrODWgd5ZwBpib3sO
	CV8W7yM3MzwTwnCTzX63iHMBYS+jz/sZ8hzJjDxLHCjXRA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj8smv5qy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 11:12:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb71b1443so893583185a.2
        for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 04:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793099519; x=1793704319; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FtCLJyhlU+SpPWQsK4RHlbtjukmxd1FVsKSyDoa/+wc=;
        b=ccMwch2jldDtGSInmXmTq+QyKkyIoNLnQnoO+k0gufIPNRgGdnl9R/4hFhNNnBlxhF
         5FKRZvAQdlUPDQJL+nW+auFWW/UGiBjbAQmozBE5S8BziyLoDvRr3SRdb6OjIhKIjqaH
         AWxKeKXsnWKEBXdnL9Jf+Pa528khXOVoFSagc1YBCC3JnQ3PaBILVqdtZsFwR37P2Goj
         mi4lwaKUW0OyPb17l/TZDK8EsRfJKHtxMlMJAP0fiYFiv4sHwc9dwyU9jAmmxgjIFzxb
         Y7IV9HobzKExqpMcAdxyiqx+bHGeN4Y/d48znMD5giSzrctG3/adjKG+ggYE6vxM4/m4
         YSfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793099519; x=1793704319;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FtCLJyhlU+SpPWQsK4RHlbtjukmxd1FVsKSyDoa/+wc=;
        b=Krd3jz/GJpXnBPoIc7YnSKfdvMQ7znkPWkMZdOyP4ODDiOi+IW0+zadQJcqecaeiYb
         Fj0mnOwDIn1+meNkKGye2SbvLx9x+Ylf+uxf9e9ciG2r9yyqGtx4ClikdAXs+VA5vxOd
         E3SEifOITFmePB9hR58smMXfvsWLXdKLQJKKsZgiGFScwHj5P2+b4bjW0wN5Yymr53ij
         AVWS5v6sP7XIPHszsdswIJTCOt8JrqIquZfblCn1AqhE6K+2uUik78ModN3T4muSFWMX
         2Tp6y9q93nMN8s2E/sqtcOpiGtFB1gYqaT3B9TJU+poFvEys+9TZ+fZxa8sXlIdsyg3O
         +qEw==
X-Forwarded-Encrypted: i=1; AKwUvBzuFNkqbsxj8COyYRvGnk5y79dFhq0rYIclVjuRR0Xn6TfeiIrzeSVPPMXk9nkh1G7H4dWOpkQHLwVMDg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKn6gDvc9Zk2C9hHq4NNJY6w8JyD+RhLTuEwZPYxrxDDC5YWuuD
	oi6ECif+MA1erlpJm3qJ7M3GAjndrtuC8AuqrVVvb92GDE8Ofnf6w/jczOr2dbpyg7a0eMxDWEd
	hEX6dt4WOSj8IwrCt7aUEB9hMK7i487DpgH/kjAYccWTXHBCnOI/WSBcLorN/K7MrWg==
X-Gm-Gg: AYBFou04bASn03if8uWy1RhiQ0xi2inNLCdMxa+9d4UJ055KnyMKO0lSPFVjsbZbWO8
	NXOlPgv+tDf+bieh6oA7G1FUgBv7M3fglMYe1hocaan4U4WBDxfua1l/mD0EceUi17727Wvka7x
	JsCrPWJXaguTQElTYw8bimYrUmoI3TWMEJh5ApgYqOgUzglukY2Coy7JRd5ZE0brpxg+tntsiPA
	bEvoqGJEctXGqE/8BeqcnX85JNJXJTyfKPmDQEwl5AsYuCozFto7y5Tt2kKa6N6QY1wpnjUSd2z
	wkS8W/BodEgtaMDr6j1U2E71P+0qqHMAcDtZlthsStjmu5vZR839TZQqi4fi6WDb26ppC4y52BX
	0/QpBORd45npNohgm
X-Received: by 2002:a05:620a:468a:b0:93e:5821:2c5c with SMTP id af79cd13be357-940ef92bf84mr1471865385a.60.1793099519150;
        Tue, 27 Oct 2026 04:11:59 -0700 (PDT)
X-Received: by 2002:a05:620a:468a:b0:93e:5821:2c5c with SMTP id af79cd13be357-940ef92bf84mr1471860085a.60.1793099518606;
        Tue, 27 Oct 2026 04:11:58 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359f523c0sm128773315e9.0.2026.10.27.04.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:11:57 -0700 (PDT)
Date: Tue, 27 Oct 2026 13:11:56 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Vladimir Zapolskiy <vz@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom: sm8450: Add CAMSS device tree
 node
Message-ID: <gntt2dsfdsv6iptnl3wo7ys42adio7vogd7eomwuj75yli7e4b@vfn4n3shptrx>
References: <20261026224957.1115370-1-vz@kernel.org>
 <20261026224957.1115370-7-vz@kernel.org>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261026224957.1115370-7-vz@kernel.org>
X-Proofpoint-ORIG-GUID: gVpIVaHLa68-rQoj9yM4seaFu1D39XR4
X-Authority-Analysis: v=2.4 cv=Sfti5fRu c=1 sm=1 tr=0 ts=6ae08700 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=machDEjTdI7jPHO31ysA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: gVpIVaHLa68-rQoj9yM4seaFu1D39XR4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NCBTYWx0ZWRfX4j+2XNXmeeA/
 gUsXa1AH9KZjSSMbHxOLDrnhBd2yOnvBDrGScS0LmhfVVlfcAinQKv7I1A4DqHuIJP7uHfJ49vK
 3PR7eBNVr9RX8pfUpY571QvRo93+Q88=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NCBTYWx0ZWRfX0Yy+jiIZRbaz
 oM2TzcYRM2jPuAXClUvDhoTUvCTVAMnuez5q8CX8jlJOQXaJH2CKPtj/AVqlf7w15HoVOPiWHj9
 GecKVErc8xhzzBVPd/xNqtMA1iSS1s4Y+O79j1t0U8+SnzE8dXwR7F05rV9hsxBdfMqSRzAqjHo
 kldCbKdAsZFmdGAsRM8PefWrrZMymXbrylnFcTcjUiaW/FMIggDvWqaB3fBvLwqJYYTyYWuNAzJ
 O/o3DLUYy4fZx+DoP2lHC3TDEpoyu46dFaJhd/HMrxGOb2VCjh6KxykZ/rGaYiqPTxRHZtCoAhJ
 RcZVX00XYoBOIJ46Tf36FzQQbXh6kEz+z1Kad1QWVd4A98OUj0iOtKgQ7Ty1KrSn/17WHqKo1bI
 EPwOJMapLrADQdyWZHuoE9ajfcO+ZPCtcRS8PSay+L6me4LtbPi8KN0sRA5mAhjwlMnPiBmMd1C
 UB3g2Lt64wfQbKbc+2A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270044

On 26-10-27 00:49:56, Vladimir Zapolskiy wrote:
> Add Qualcomm SM8450 CAMSS device tree node to the platform dtsi file,
> the CAMSS input ports are connected to output ports of CSIPHY devices.
> 
> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
