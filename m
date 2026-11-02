Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793625725;
	b=aYY8EyZKTo/A7HaI8Ygu9vCwqahFLDbaLweCq3nNI5YlYXl5nR93URBLUIsjoVa0X19E
	 +1CqK8ARvuw06EM+ejJqQBz6Uslg/VceZtKO9snwiqSVcCSgRg2/3rCQ7NvS5hDNZG/3z
	 jbY+vR2MYCYiF/AvETsg9YAiISMe/Zsc+Z3Mla1PaO1p+j+G2NQKnBbtO97mBUoevXw0s
	 P2AL2IQ+pcVPHRucjyyvM0nGGqMDtugcr5PCjCjpY6BYyD9KfGACUtd+16EkeB9t/3jAx
	 nMPjLPNBTuAuZPCgOUqEuQ+k9yHsFE3CYiZtk6xxGIuPv+HJtVonOfnS4wVzFfTLXtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793625725;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=90Ay6la8TU+IvwZUCYiWLuxyD2NB080gAWQ5QDfHdus=;
	b=pod6NQEMSrec/b4KeqP/x6+eLCIqnmjt27ZfcZWdWOB820yhESauSH+EMtx+SIar5Tf4
	 tfmUIcAOx6bpBFVmp1CFCCv7+YKcT0ITgc7DNc4ybj52U2sbyNQmonVOyP6kFm2Sbe8K2
	 Nli6M9fjB/aK1/893tA3vleM4wBV1mnRyQnveIMK5N0Q4Ldb9eekd8UneJCeGIWoCr75d
	 /f8/nXXxo/h4sxZLs5MGSQtELgvYBrTcqLy+MsTGzh5GMpUebgXogW3SSjxM3IGN2BpvL
	 fhxaKsDRJ7Rn0cHw2B8ghmUQImAmQAVQ9n9I9oGpbHCax+R/zLWKeonAzIIaMvE8TOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="B/dC0XIq";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f9kD1gQe;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4982606A329
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 13:22:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4982606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B/dC0XIq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f9kD1gQe
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DALfu388214
	for <linux-media@vger.kernel.org>; Mon, 2 Nov 2026 13:22:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=90Ay6la8TU+IvwZUCYiWLuxy
	D2NB080gAWQ5QDfHdus=; b=B/dC0XIqpOw30TIvCbrrFaeOref0hss7IVinJ4ch
	bFvgPMKXhVgCOWOvgGBdA++EJ6oVWV6epByqD3fWp4FqUOresDL3rpcEWJVClUKa
	nzrYlQj2wtix9isgxcty2IAY1/rSLN7y3g1Bs599XpYzdXJ2PUfE9PxYcOWn5BhN
	NWq8SSEtvJby3zpTxkiSfjgYQXvjUKhloOdhpIDZpIcVzYaTxFDUENQ3FvoN3LPG
	z6OliLWDYFkiI+zFTzj0ImgVVc/OVJTiuOg7C+dLoITPmM5kpE1TT3GC770oLGSn
	pYNYwA5VLxqrSHrQS+AWbUoPpVOibvmwql/5bg/VBDZexQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpph19988-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 13:22:03 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91c01778cefso59780166d6.2
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 05:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793625723; x=1794230523; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=90Ay6la8TU+IvwZUCYiWLuxyD2NB080gAWQ5QDfHdus=;
        b=f9kD1gQe95fzg7MGuelyQxBZwYbuMy6lsxRiXlq5YIShefsaGo8/o+QfhZZFO6UJZB
         rBzic0EzUI0Hn1n62zV6p9EzNmnEZJDrB+pLPHF4Fr7egzSOua1bxrEdGEhxUMqHF0ax
         l2SaJunbpajcD0L3rH/SwUdPeMa2btwNai3v+3rVlCtIaty8TE146yarV+pym/394OpY
         K5R4OnznBXYlCxHVnx1wkajYCgkkMb4SFFxcrHXYvFUuTJm9HqlzoNkIFiruTkX2dZR7
         rg3MMdF/uIGXS0HifEcNgI6XmhbjwXGIHDd0KBuPniRcJkGeilnHiYUn+CbFVUeSsi16
         N+Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793625723; x=1794230523;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=90Ay6la8TU+IvwZUCYiWLuxyD2NB080gAWQ5QDfHdus=;
        b=ZPemKEg5YvnwdHzCt3SswCnJPx9qWJv86unXEt5KjnGWpOlDDNbg+6IQs0MoOcVtRN
         2susG7lXxUa1r0CAALLwSNBxL3790UCLz0Ne1yXhBvM7lGXiC/zHjl5wFZhN6Q+/0Kva
         Qextsw4hPLCu58x5sft44y6RjC+BVx8jA7x8mgWguwuiMKvHqItVnBnXiwcfdFcEQlxw
         c25KjMBXjyDFP+50UNKfh54j1Db3YB+o1dbgTuGrkQAAHMBxBRX3mglF+s5z1reBSuYf
         40rj1IngvRHyLKRC5t62/52gZp9TDmDQQdk2cuRqkbe/9ayXSDgXq2U8i7jffGOsHeh4
         1Vgw==
X-Forwarded-Encrypted: i=1; AKwUvBxhni3eNnwHYh4GoZIIax6Z7mLSp0PKdwEtq41egl8UX7BL6OdFjIkGFojg5FzEBIaw2hReig2Ru3Qp8g==@vger.kernel.org
X-Gm-Message-State: AFq9FYJe4kBGK1+UwVgYFSNupotQiLlUgHqtAt/DMMyApWJjnDIkiUY5
	ItFpO2N73StAe3bHjtXRng8mW0n/oGlGn2WfQGEjUNQNkV8zzgl7sZ3f78HA82HxBXaR+aAjQux
	Zadu0nRIMf0eGJCwux3mkroS7uhL1Ur01N+6VRuN2o3yTbpjx4UMdlt2xJAhhmZ6qQw==
X-Gm-Gg: AYBFou1z5UmoxFr+3Gs25DSJAfkLYy0lJL6jnnTmhy6+lJU2Ccz9yMju3gfD9uVAz5H
	H6Pz9/A9wbZEMp8B1zzD3UPsAhyJ8pcrZLuXa481qSx6AnBZW5Rk/BGQkwtFGOkVaFGT3PF6ySU
	wQaH1WMen53kum4qRQb+Fd0MJt6LNlVlgLt81o0EfGa/D/KMKvQ21hIbqNNMpmOWgv693IKa7O/
	aib/QSxkJDsEBDHTo7fk2n6zQc3sE2SYvNqFlhhZKFrrkvuhYaFCMH0rSsMxEPZ42h2ctkbWZZA
	URi/hXMYtaE7DA6i0XAcYYpSfTZZvuQUgB3LUOhSqcR70rR5uyFUxdrBECq6cBSL6q//xWxvcbP
	gd9XsFAnL5TFR43MpHioA5UBaRsyrdhuI9/Azji35/kU08GNrJJSu5DU8mlKylpg=
X-Received: by 2002:a05:620a:25cf:b0:93f:3120:6c7c with SMTP id af79cd13be357-94421799b6bmr1603116085a.50.1793625722509;
        Mon, 02 Nov 2026 05:22:02 -0800 (PST)
X-Received: by 2002:a05:620a:25cf:b0:93f:3120:6c7c with SMTP id af79cd13be357-94421799b6bmr1603109185a.50.1793625721709;
        Mon, 02 Nov 2026 05:22:01 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf396dfdbsm273630695e9.1.2026.11.02.05.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:22:00 -0800 (PST)
Date: Mon, 2 Nov 2026 15:21:59 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 6/6] arm64: dts: qcom: sm8650: Add CAMSS test pattern
 generators
Message-ID: <kmijrohgr5lbkg665hnini6qhz2a7z4ee4croaxlrut4dtpdj5@xugb3sxfgmri>
References: <20261031112203.545319-1-vladimir.zapolskiy@linaro.org>
 <20261031112203.545319-7-vladimir.zapolskiy@linaro.org>
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
In-Reply-To: <20261031112203.545319-7-vladimir.zapolskiy@linaro.org>
X-Proofpoint-GUID: Z1z6y1RheKk8mWoDKQrvn8BaE2bgdKMq
X-Authority-Analysis: v=2.4 cv=IruL47/g c=1 sm=1 tr=0 ts=6ae88e7b cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ABvto48SYsrZWTe_A2YA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Z1z6y1RheKk8mWoDKQrvn8BaE2bgdKMq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1MyBTYWx0ZWRfXzo21N7pBbRQh
 GBLyIzIsfXALozKQWI2zHAplEJgcNW39IQjqQ6a/GlG+j7mDWsucDNC/NHtfEEaOoi7yVtfCkNF
 K72O0b19KPirGxBI1XsDxntqOE5SlQTE2zHN28eX7Mg1TX5o+xFIVTY1BNCkf1XORB6t0H9Zj9t
 TOHfAMaVE6YK5EeWHmouh/z6Jhl3Izwh4V83nhtvVsy9777t5T0ZIdy+e7DmEQP11gy8vHZrIky
 PZMdAk+9kZDRTtQM8tppNW5IhFAR6BAlhxBy5HVMixnrR1I3xty6kj5d1GGaFT0d+pGWmLAbSXQ
 9ofxl8ZmQotmYH0HVKacOYg27rHml3IQLOqffOzO61E8oHEZWQlZFBR/KgBiyNH1sYHEs22Bxd/
 AxyU6S/N66m4dsTHpIxC8q2E3/CQxG0hNAGGrQS+9fXV1yeTJPfBo+8+NHgw43Bt3ncvWY3C4k0
 6Lx6EqkGazdIVcX4gIA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1MyBTYWx0ZWRfX6ssF49ogtG4d
 Me6HrWIuWFsgS8ZLQVYB7uG60ufJQxONLcNC78pTsHQKEBcn30L/QE06Yl3rwjg2mumrQwhbHm/
 6+Mj0+2o58/cVxze6qibMpZqtf0Ljzg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020053

On 26-10-31 13:22:03, Vladimir Zapolskiy wrote:
> Describe register spaces of three test pattern generator (TPG) blocks
> found in Qualcomm SM8650 CAMSS and the non-real time CAMNOC AXI clock,
> which is needed to get TPG output written to VFE.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
