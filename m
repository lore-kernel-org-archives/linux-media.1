Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793724462;
	b=J0pzzCcK8OjWKESP8Hqj/0EUFcwtFHPlAw6ngMmeMGho6lbN4TIDdKqwhe30/sDCNOyW
	 q9uwH8Ko+BymB5oUovT44dX3UBqmig1Ntz3gL+s9I02uZkpcFBMkhCrzp5s3qLbaIbuRA
	 DHQ5/QbOxX2VuPqaVQcSWHiguIy9dGmZ90hYGSNd+HH9XmyRT0UCokEB9Qoy6o+oWy+oK
	 DiN/Nv+oZp/yRCYpB62CvVfsWJ82i5gDFBx2010UjKiwWL7cm+IlQjq36+CSaK4Swv/Yj
	 grlWSp0Xfj1NF79d8v8MjkB8KPtHQ3+UQ/Oc+NfVGNsG5jCP0I473e2gZslxNtYpxSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793724462;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Paahz2cu5Q9vlGBYGrknkFs8wYwBWIJPZ66Zms3vNmU=;
	b=vVqxbQFcVJvb9qeJzEJqfAVeyP3mzxFAS2BOZodQrepTqCIqpWp9wNoAyfkMs72UcRG/
	 2imEbJxvUy8TOjREzQKdYpkgvmwb3wRtid8Plq2nHKa8ZFirt0r0K7W1Q6SuPaF+nuySK
	 YHG1Pz6N9XQFSgoCKId7fzFezpTWrJACHiOYp4OZp1jqoHXezlVfGpi7CS/uVBnckUDIJ
	 WtVj8sOGPl6jpqENjEwEwoXycKzNNvHNXE7NPMDFZLbretNxkHp9anh8UPLAhAVvX4kzU
	 i7E3e32G/aCh5wQLFu7YIijbtEWm3seCC29odHI0VH04MbuTFmYxGkfkQMqJF65uAbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bhn+6NiQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GustMljW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC78606A32E
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 16:47:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFC78606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bhn+6NiQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GustMljW
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3EA3Js3657791
	for <linux-media@vger.kernel.org>; Tue, 3 Nov 2026 16:47:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Paahz2cu5Q9vlGBYGrknkFs8wYwBWIJPZ66Zms3vNmU=; b=bhn+6NiQkuOQKXG6
	XR2m53GsSTThmw+w27tl/BJmR4EFjS0irkF/k1h+e1fkw3OdIxc71YE3cT04Wnq5
	VLq5MfNX2Zogbp1rCP23LJcEhL0EYKx+1dg75LRngxkznojXxPkX9Ig6KJ4cvH5y
	CtETC/QVuj6CgNZt779t3+4DCN11aPXiv5ofMqy4ZZb/PPvQTC/ym35f16EOivP1
	d32nmGAA7DwvnGJmjnDZKSyU6jcP8Mr3liGyA04Hpw5fJaJXGObmClAcSKhSDdfd
	at+XJYYh9vg48qwb/U9YL8+VIUsDNHoX+q7yFDTZTFZWzUnlzhIdPuDcwHfNLbFe
	OiKh0Q==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq94ctsdb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 16:47:40 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a086f5d91aso5649931b3a.1
        for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 08:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793724460; x=1794329260; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Paahz2cu5Q9vlGBYGrknkFs8wYwBWIJPZ66Zms3vNmU=;
        b=GustMljW74EyHYAGxYnZJlmz7VB6Z7HF6zWtTvun2Jan967g7FZKW+2SDHqbJnm7iY
         V2wG7rQpR75Et+VAP9DAfCP0cBX3XEH49+ro+fYD9u2SSewjW4hffIUe47m+ujzsq5Gz
         ROEjh6qyBbbEOLAcobLucguM4gaDJjITG/fReHcbEWYnFSo17nuW8VqgPy82rq+KCuvW
         uAj76L10GqPKH9lK5uV9rfm6Kx7NIux3rkW7bG1pu70mQiNEnXcA9VBFjyLnQ2xGZeIw
         jlfTSCe3d/h8M88U4Yozk7tqhJjasfsK0k+XPljafncPrK6FA0T5RZPAEKWN1qCDqGsv
         CTQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793724460; x=1794329260;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Paahz2cu5Q9vlGBYGrknkFs8wYwBWIJPZ66Zms3vNmU=;
        b=AbrtUHNNCCc9BeBe79Y3NyMKcnWfWBUILNJvLPS/gen9J2s0J5JI/2vNdvczk04QLv
         KkbUnPskemdh+Yf/UGGDcR1LNtSDodHEzk+YwH7i8s7jKcpxD67RphGpE2Ri5t4+bdKc
         Gavl3W4jwrWnx2JRvR2EBuXPN/4HNtxacjGt0tWiX+Hs5j1ykoemYBsOK/tqICHxgvyc
         +qFKeS6rjQcqffSYM2WOcNgQjLGxSyOlYeTnggX3sGEnIt7uyNBhRE6dNalwZ05yxqWd
         c2CRMOuui1II1jG/LmLugfk/9Z0CTZ0pkuZuyY365lz97SMiVXa9j4cz6ILQXUVSz4Je
         /4Fw==
X-Forwarded-Encrypted: i=1; AKwUvBw8FNf6rt7FmhpdSVY8r5HNIE8YWOB4qrUcaGRrZY6lgGqbEurNK94e2qhXbycG1gnX0sDfHQWK4e9b2g==@vger.kernel.org
X-Gm-Message-State: APuU4Z9R2pYOzUbrpo/e+mSUWIl+tBG13xSa+OdJw4sKnj5SEK8mVDc/
	aSOFAw4cSXzvvtLQ/GiXHiHauwK6Q/AZL05Xg2Amb4uaUq27iznaedfXy3OKC1jCy/VdxVMlN+q
	/uNOQ9OWMSZJedFAE9dnOdabY+sTM7aslNtb9pAq97yRMv468vPh4FHcyjXBdP3wGeA==
X-Gm-Gg: AYBFou2EHhGVkjKm8e3XB+XDOI1/hw3sot1rrv1qs0CfVHNV52fNGfpnFvQzyG1ZJ+/
	eDmR8fJH7/YbywDvYSv1XiFLQbHk5ShCW81ro7K6R8dbnCr4gGBcGz7z5cBPAVzJZa+yETpCIyg
	ob6Ox//vGZK3CFe0tvSu1fXQBkhVXuOnFTTWf4OTarCGVmu7rI9TUeVt37GHYk6YewJwRH7qf5S
	Q+bYnMoa246HFJL3wUTBiOzdH5m/3O+v8mGj5eEXtugqBK/LbW3WcSIr7dFOF+MgHMwF86JzjbY
	/oB3AHQP5Q9s/fMEfmDBpbnJuZfhLtnKJampPNP00jXL+ehP9sY8smk/ncL8e9BQvoKtBnfOYxd
	U3r1hv7+N6mIlJMvd9sFYX624q0ZGjzgnjdv0gqxpa907VUpY45VQZ6flkSyQUUp2AUNmf3VKup
	lG
X-Received: by 2002:a05:6a20:9145:b0:3e2:1160:6d20 with SMTP id adf61e73a8af0-3e928a80f31mr13008342637.3.1793724459801;
        Tue, 03 Nov 2026 08:47:39 -0800 (PST)
X-Received: by 2002:a05:6a20:9145:b0:3e2:1160:6d20 with SMTP id adf61e73a8af0-3e928a80f31mr13008297637.3.1793724459204;
        Tue, 03 Nov 2026 08:47:39 -0800 (PST)
Received: from [192.168.1.10] ([115.98.177.53])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aada3d3603sm3400303b3a.37.2026.11.03.08.47.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 08:47:38 -0800 (PST)
Message-ID: <ef38c950-5fa4-4b57-b97c-8f306b2295e9@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 22:17:29 +0530
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 8/9] arm64: dts: qcom: shikra: Add OPE node
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261102-camss-isp-ope-v12-0-702254689feb@oss.qualcomm.com>
 <20261102-camss-isp-ope-v12-8-702254689feb@oss.qualcomm.com>
 <bac09735-4136-442c-9208-556568d39967@oss.qualcomm.com>
 <zymjeclhd2ezemd6jeujtsu4y3gb26gi2v4vd3gmi7diuaa23m@aqr4blf32t5b>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <zymjeclhd2ezemd6jeujtsu4y3gb26gi2v4vd3gmi7diuaa23m@aqr4blf32t5b>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=O+KsLx9W c=1 sm=1 tr=0 ts=6aea102c cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=iaXPdgsK/hfklW56b25dCw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=DwxOReZszbjtibhM6OkA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: olWXagjFgbDphWwBGQ_x_h61Y7iasCcd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA2NiBTYWx0ZWRfX9ZyddKPLXnvQ
 9NQWX/OPENOhAEaHngwPjjJvXwEnO0Bk9wHDcW8kTe9Ho7ExYP6I51Lusg9BL3MkE0zVWYZxI7b
 iK5JAN3nqjjXJiaoN+ug6sKLGDrKQMwLwiW+44UMREVfcoFCWLGc1hz9f7d8BCugb+QJC/fbFr/
 ZGEWYvRIBsm449sz64mmyBNn72oK1CP8GOkFoO1BZJ/seN1UUKL6vlncFZrd9rQ2SDEac0pi8q9
 f9f27arbvLUMgnWmaucFCJR7sQjzQoztQsciEN5DSOgWzvmcUlI0xRhsmvuE7qZc2VWgLGLOQmh
 9kyDirn+8UNhsWGs5MtvheC8ikmUTC1vXCB/AthHN9+xf7CLrz4OfIPydCflu+YY1t/dEzw7DsE
 5zoPZajVJ8v8Dol0wEWOJy9Ch6pQwoXfB29Qwhm7gdMTWGsR2vKWjMlZAm9D/goIQQ/Ts346kGN
 Zjs37R3Ws1jEdYq2A8Q==
X-Proofpoint-GUID: olWXagjFgbDphWwBGQ_x_h61Y7iasCcd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA2NiBTYWx0ZWRfX+NzlWaWXlp8z
 nV3V0+bmdyLh6YJz7AV0E7oMn/nSCOXr8/xa6S8FxafAVMRTPbi0FuYUfO0Pf1lYv9/8nAY6S0E
 abxQWPJFqRYCuw/NljKYZjdFtpYt7tY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_03,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030066



On 03-11-2026 19:03, Abel Vesa wrote:
>>> OPE is a memory-to-memory block with no board-level dependencies, so
>>> the node is left enabled for all Shikra boards.
>>>
>>> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
>>> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>> Tested-By: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com> #Shikra CQM
> This tag will probably not be picked up by b4 and it will probably confuse
> some of the scripts maintainers use. It needs to be "Tested-by:".

Thanks for pointing this out, sorry for the typo.

Please use:
Tested-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com> # Shikra CQM

-- 
Regards,
Nihal Kumar Gupta

