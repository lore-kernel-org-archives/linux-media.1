Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793099545;
	b=mA8i9nHdR7BtXUEueBZ4YSNGiiSzdZzTQmhDJqgA/n3Htn9d0kb8zjWAsB8t4Hta1W6W
	 3mkpAIKDCYTmdGh2TXiWMakl+LkSEnOoFQBS6u9Gp07WD+p8bYKCQ9DphNsiSEq2ne6u/
	 e2oXBtAmEK5NTSLHlslTEpWIqFWJZbNAmj0VlN6IU70qZomqHzsu1jBQP+EdW8JcnCKf4
	 RXB37Q7rG+1lgf2zdbEBra7Qcfnn9k8J/jP7O2Tq0VbNtLgWeczJi7QDPSgjzGqmtHYqc
	 r7nVoFlc707kULIhqkew0COhWm+BCuD+PJplywLGoOxLcZSXiJLK/QRBB5rSRhH+MmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793099545;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=5LcItJXuNXFQ1eh8RpKnheo0zJPTojpSv8nt0cOFZYU=;
	b=kpxkaGbFBK5AtzcVhuCe+APFNm9I7ZuoyK/ayzLiyzkc181Lo7/gCPjJ+tupz3AfSlmC
	 deet51lcG6oltWuC0H+vWYUY8lxcvouuMlq5YP9bCOT8i9e12/uXjj+30Gxvjqi6Ast1N
	 q+LpSIx+JAMZm/sRzedyexpygPXfhrZuXRZge9JE7C6mAmiUwSL5Sq4xLjDS3q1F59rfb
	 Iit4HA3Q0cAdV6xSY5E3V13egpbL7KmlB0miVv57fxqc2yVfOQ8nvHihTYi0K036M1s9N
	 ys9Z46Nb0/cxg6CC0unNCWfC0bUG3LykNUsyt3SWFKID7XULas8UUxxIoO5fqT2hhIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WVwAbHdu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OLUBIBMe;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F63606A31E
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 11:12:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63F63606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WVwAbHdu;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OLUBIBMe
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAdwlr1921733
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 11:12:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5LcItJXuNXFQ1eh8RpKnheo0
	zJPTojpSv8nt0cOFZYU=; b=WVwAbHdubapu1ysJDNo6+QNjAk9/RtUim9IQOBEY
	2WgttqTaUtEV0gY3NVeZdHNWhRP62xUWprrxsKfJRq0+bZ/jRLnjqx1syqaIch8d
	S8QhCaAAb/yMmCKNQeqYR8oqEi1hGOw7cvbZNUMZSBuooyKPKnaYb7Xvu3eVw+Bl
	hCVwNdwAi9XAhTcyTmytAHsMc1pDg6DTc6Y6KGxbLIqy09ADacDMSs1W9FJD6MMo
	RCT+DsOCTUY+Bm/3rKPdTBF3rLG8XZR6TdU1ucNG/uvcVqtnxju5Wohz64YXBTZp
	FZsY6uef2QHqGp9KtR06WWSdeaK0s9399p3z9WXXoR4ZgQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjrq68jjg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 11:12:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f20addba1so788717685a.1
        for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 04:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793099544; x=1793704344; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5LcItJXuNXFQ1eh8RpKnheo0zJPTojpSv8nt0cOFZYU=;
        b=OLUBIBMe8d+uuIMgk/DLnmaj+3M/vrzbGMwraXN2ynLZw/JtKMp7KAhOaD0k4QIIDj
         yoPml9JSw1/Y9LyvdThIf3m/qMuvhPB7Jm+P78SWNQH3WjzBCBNRXX74BKnoFQnzhL8V
         GtF0ty5EGYUQzwTBRAWStZVhyPdPvb2g+CZSseEccRiO4hGahMQa8OsVyx33IQD/Rw81
         58Zn0F9RIfT2RAiNlLczx+NFT7ohwEwvgxrYzCgk9nhE1TJ7iUDflHD4Yv+n+9/j05p0
         H2iy5Y/X203byrN/GX4f7PjViiT7+7annNm27Jd5ELSf4ZyNqSTrCMpwoqit+CTZ8C3f
         U3eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793099544; x=1793704344;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5LcItJXuNXFQ1eh8RpKnheo0zJPTojpSv8nt0cOFZYU=;
        b=PZuf0AMu1nbM3kYWGHp3rotUxeLrOB6AQwlOgFq0Z2dMP80CCCDwgdBZW9prs2e7yM
         7YZ5dJHn9gvdV8Q2DTGx21HTb0EH50mPPr3TiAQuWsRxy6o6vy5eMcvzpc8BxtNoroiw
         lKvIx8EWmoTvtm8FzAzLWu7RGEm5jdp6mQt4vKBLvKOAYA7nGvFDxaR5zjDuMuslG7hn
         FYZ5C/dEFO2zIfZTMTvHH7eSuzuA1WAmzjdlpOgMsL5/tSr4v6ipVXcEghMwUSahQsZe
         Gp7c22QVg8LXbS+PvznsoEws/UAKBlrGVshyoQtr276VqzNLFqh8Ya3qeOAcmww3rQMy
         iiVQ==
X-Forwarded-Encrypted: i=1; AKwUvByQOKrZ9G91e6bKXIe4VE+zED3eGuxu6LqtDWdp+HqsZJbx6aFXPUcNABgor+cFs8UzllLN1EyF9QoV3A==@vger.kernel.org
X-Gm-Message-State: AFq9FYLB8pdFBr1i3cqLBu2qRsV0IwIumCIiXwyot4GkllOseMVavm4a
	Vk30EPv6HRyWI2zPZ5V0rfKthkba+TeAUZ6GARXBdXSdumd4+TQmr9kDpCpAg8VbQ7ZuHPKa6EY
	ctFc6F8x4xb0e4M07QvEafIeN+VCKsvOpkaSQntHYoh06DEawFle89ZP7Im+hPz7nGQ==
X-Gm-Gg: AYBFou1VkgculWdPOqXBrkxEFHA9vT7LEdwyyMFuMqkhzvQ8jdz873lk5H0BxH9k0Hh
	8NVu3Th07IJyYTyuiimKcV6uinLFcp8DDP5jbf9oJQOcI1N8swI5aIp2BPCojpSb4lCpjINbA0O
	0tBg8yujr68ZC+8d8AWYMu3xHtNNULDwDFuGR8M0HPTmcn0YIAUoBqBHyEvyrnvkBqKBSnQ8/ZW
	/bi0DnnElsjRiHqkJ1zGvdOmfbV75yx80JhiLp8WDPS+xcLOqjK1ANaKC5SuARxYbvhzYxbPB+3
	HAaB0TQbrBiaVqn6ebB+4+JJbtBllI6yKvxMj6nZLXoFrnkthHuUCSKNfEVVzbmffHUQBDxyxmr
	zkA+Wz9TNO58814wcHZvbVnY8AupKjsyjwXxKrA3idjBxi0rF1H0wLDZCpmEl/3hZ5Q==
X-Received: by 2002:a05:620a:410a:b0:93b:fb3c:2d09 with SMTP id af79cd13be357-940ef995afamr1483247885a.66.1793099543696;
        Tue, 27 Oct 2026 04:12:23 -0700 (PDT)
X-Received: by 2002:a05:620a:410a:b0:93b:fb3c:2d09 with SMTP id af79cd13be357-940ef995afamr1483242285a.66.1793099543110;
        Tue, 27 Oct 2026 04:12:23 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359fbb725sm259014395e9.0.2026.10.27.04.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:12:22 -0700 (PDT)
Date: Tue, 27 Oct 2026 13:12:20 +0200
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
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 7/7] arm64: dts: qcom: sm8450: Add description of pins
 with MCLK function
Message-ID: <rtjp32br42qz7xtfj4jwamvbzfpqroxuk3le5kseac3rnz4n6h@gwcmaiarpo7i>
References: <20261026224957.1115370-1-vz@kernel.org>
 <20261026224957.1115370-8-vz@kernel.org>
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
In-Reply-To: <20261026224957.1115370-8-vz@kernel.org>
X-Authority-Analysis: v=2.4 cv=RYwFmFtv c=1 sm=1 tr=0 ts=6ae08718 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=qZm0d5fHY1XYkhLSR6wA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: Z4mmrun7e2jzZj1ru2Y47Smf2MAl03-i
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NCBTYWx0ZWRfX7to2BVDFggLz
 TBBM8kLuMWkVFSfvRQJ6EusEhF/UeIV4lMTztxufEMEEW2grSB8MnDbAZFmkczLBTdPmHcTSEtQ
 KPvKUp0KWuakErCBesliZOB4txlzpXU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NCBTYWx0ZWRfX9BUshFedzu0P
 ngvM6c0tDWulvAq0kTSEdcuES4APdHMZTx4SQd9gXMkE9wVkm4alfbOMWaDIYXJZjzi+VpPaDdU
 8gMCxXDWtcvpSj81FJZFuAHmXdPRRt2tu++982FL3y5Amsa1MDWzG34hkfWXJl1YxD6aJM6OtX1
 2a3cCZl8Fd6dMI0ktUkSRAdVRB8LC7jCJln+4gDs7+J5zQdRZ+Gp3XQTun4v6vU57kuiqb+31yF
 7KSIWXMq0Mvsf8mlrrMUn8HQhPUb58yXnzKmNitUB2XZH9CzDkAevEnlxHvnKOzjf8lJJepeZ5f
 UQ6Sg6m+RF+ZUDcMCsvZQxn5AzpHZGOKc8mHTCVGWctF7Y5SLABuwWNYrDteJXEgmt4pLhRq/rg
 vX3mRnWwItOXjJJuGbJhM9tt2THQSM70WwDdF69eG3CIq+hUiPl/6QZ/pJnQYp+AscXJSCu00/Z
 B0LkbaSd30rsQPiFVGg==
X-Proofpoint-ORIG-GUID: Z4mmrun7e2jzZj1ru2Y47Smf2MAl03-i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270044

On 26-10-27 00:49:57, Vladimir Zapolskiy wrote:
> Qualcomm SM8450 SoC provides up to 8 MCLK signals on GPIOs 100 to 107,
> add the correspondent default and sleep pin configurations.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
