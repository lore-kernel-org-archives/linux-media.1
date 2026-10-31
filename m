Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793456061;
	b=o5pdQDKvW86xu62cpu/5YKmZIOHeAdNynG5w6sfniCOxpgruu2OhcZYQbkYdOvsP0OI9
	 nt3icnmcLnHV8kJfpeIHBByvJyy1vR9RtoeacjxRnDMcmz72MO68haa4lQVz+Y8aX2Jm4
	 VBfhVU+UshVkyxwTxSsrKyEepKw8a3j3fsB1VR+WqcxHB5iCelbVl7hpsK+ALHeeF0M5E
	 orCgtB+dF6WR9k7Ft50mTIcZzffs8i3Pi0KGomBQ17DnHvmhJ6iMDaLFiGNszLt784njG
	 D5ECX7vxTimRPu9KuPzYNlmT4voKd5OBy8PA7mEGZLZaRrqcc5kxuyzTZUmlp8r/6TA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793456061;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=2P97b9+pLX1rELgHYJetOViVYuqQ18+rtDceUL9B0Yk=;
	b=uvoYwXTrTlKJjpNWTBjKg39jKlQ83/ARrUz8xc6qiVxjRk80GulaJkiyFv7ITnsA9ZYx
	 N+iHI6leX/zblMIgfdBechTqmhM8NqlSUy9XjzqD1ciR72+06a0F6/1ghZ1kJUjjyBmjR
	 4obr64p1bN1J9N3iER1SpRJADHNLqWAvmQYfGBcPyRwXUeGP9Kq46c3veHJjG+fjM1YoI
	 HruyoTb36nA21aKWn8KzrnkQA33afpIozEUqJxaJuBaYwTQBzpS3/NmIDBmnudoMMQ5u/
	 jW23QQHle7rnX1kWZTnErlfCmOoOuuglvX9qQ9gulYsRoVlIHbXd5TRbHrsF882BJ5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RkfXQhcV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BP08eHjk;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D11606A31E
	for <linux-media@vger.kernel.org>; Sat, 31 Oct 2026 14:14:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50D11606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RkfXQhcV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BP08eHjk
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VD00VH2787804
	for <linux-media@vger.kernel.org>; Sat, 31 Oct 2026 14:14:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2P97b9+pLX1rELgHYJetOViVYuqQ18+rtDceUL9B0Yk=; b=RkfXQhcV2Gc2FsIM
	BR+1NwXe/fEZC5914jTFgS9eht8hn9w1Do92CpuoWuxQuEzMsdsceHxcLIud85V7
	pSkUuhhhiHAzas02eJtr8LPgZTQnN5KZj7m3yUU0SRqyaeSLZ29WhnSZsS/eChOD
	7PyfnlYRQueaVJP+pm7HYbvMSavX9I7CcWM/U25oIpBZV+KeZ4/9uNh7Y38Vi5RQ
	IuhAUIECW/wsU5q3joWOigacgJvW0rqmvf4tGK7pZtfax1Hyo9lreBVk0VL3yvw+
	xyc0c3x/3QPaidHVxTd5cBS+GAQmsetE+pQWgaMy8/q6cgdmRDR4Bw/ahyCsw3qz
	152koA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7wxhac3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 31 Oct 2026 14:14:20 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1acbaf81bebso1922333c88.1
        for <linux-media@vger.kernel.org>; Sat, 31 Oct 2026 07:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793456059; x=1794060859; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2P97b9+pLX1rELgHYJetOViVYuqQ18+rtDceUL9B0Yk=;
        b=BP08eHjkuMYKzj/TyDsc0gSw2BtkOr5LAVeEWdKvAhD+6snFbOHEjqI9INA8JQuuEu
         twk2ZN7+vxRWMz1hkc3ht5T+831/owAjDXO70LbInOtdZAbpKOdd8Ep9Shwu4qyDmjOS
         GKfe1JBImAuNDc3FnzYikxApqYnvS21oPUlp3qLqUayLzXCBE4Ch+wE1FUzramzFcEQk
         qSTYKLwqbEGb85YSnPJalmEMUPkje4fLYsk/5oFh47ip6i2UKH6v3wr//BowS3CARAWa
         fU3wKRFCn7L8J7qCoAyTb4SntahVsZ2M/Sk+/JA+tE6I8CGeURkbWbrXnMAq7NcFAwa8
         huzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793456059; x=1794060859;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2P97b9+pLX1rELgHYJetOViVYuqQ18+rtDceUL9B0Yk=;
        b=MMsd22jm8G95qfvVCxGK2bLAXQR5E4ISrd5pGiV1S4dqhKP2G4sBijYPDPi7w3IMAa
         3c28iNIyBAgS2/I+pjO5mq2tC2S2Jk2cdeK/ynu4zRAv5ukLU2F5n/l/OLcoDurpV++z
         VM4uvTTMgIx1knXYKhurdCSOuiagAP6mfWmXEP8ivVLOEMmBtyUYXzQDueNBYBo/5u8+
         kISKXn2gy/Dj6qla0TY8/W5R4GUjFcmoUnNdFXLOxFYfbeHKBQ0KTd4U3zZ3mJgqS1mG
         W6JoI+BHHBC+UTLA/+S3rQ0nvJ+Wy561/c85qQ/ob40UfUY/VAhAGqZg3sa9DlukShDW
         aJHw==
X-Forwarded-Encrypted: i=1; AKwUvBwdjsweiqPEKJyqa9F94ETkNbEIVaEzbKxRPSXQ4gbu3uVYCcoNKOlas3/H7z8zxWJXT0dzOw/QdS3uLA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLGp2c28ME9SRRD3swviip2KIzAJRHwLkyW2ZAp3nSU7E2NnV/9
	bOLJhNeJ6pn9bLZ1lCsVAuHeGXmb1qeyzV1gHoykhlsozqcGN+2f7a2ZyKFKH8utR214HJEUQvS
	K1d9wr9RldXBzDU+1YXiLKSOXH6Sk9/s8Hwb2hHwuFopsBT759nWMu7TjWiicWGpqjw==
X-Gm-Gg: AYBFou1yBOYb83+xeFLBmsgP7D0oVL4I1Fa3YhW9NN50RAg/eKzZROjDEHo8gzXhEHv
	jaaYU7NzcocBbsGDx17YIOidw9v7UuoXk65LiQxQH441MgvNtppK76if418KqJaJfauL2U4HQVK
	vBdp7l9Cc1m7FR6u+hZBcfNzuaKF70DaIDyHXf16e8eYI99Z7PtrqM9q6QeLYZftV1/yScW/XgU
	rSm+DPfeGpoexG9WBTD/8AnY1yYXk3Jj5ZFT73xYDnhiW+CO3TQplWCWdnHatWvYTbZiX8+x0M0
	px6rDGFd9sD/j8Tg8v07GqvuuH8mLo91gOskBLa+/RLxSP0JO960GoaKE3pBgoLmygRPlpV7jTu
	AUta3qf1wIg8l7GTaVYjlUdXsaAbhmS/kOJ2614G86g4E5nJjSfiXNwyGaJiCoxA+91X0pBq49i
	I=
X-Received: by 2002:a05:7022:7f13:b0:144:eab0:9cbc with SMTP id a92af1059eb24-1ac5e8dea62mr7118310c88.37.1793456058872;
        Sat, 31 Oct 2026 07:14:18 -0700 (PDT)
X-Received: by 2002:a05:7022:7f13:b0:144:eab0:9cbc with SMTP id a92af1059eb24-1ac5e8dea62mr7118252c88.37.1793456058014;
        Sat, 31 Oct 2026 07:14:18 -0700 (PDT)
Received: from [192.168.1.6] ([115.98.177.53])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac192c2e9dsm21015339c88.9.2026.10.31.07.14.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Oct 2026 07:14:17 -0700 (PDT)
Message-ID: <d35b7934-54e7-425b-a223-570512be0374@oss.qualcomm.com>
Date: Sat, 31 Oct 2026 19:44:08 +0530
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
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/7] media: qcom: camss: Allow CSI2 PHY devices without
 CSIPHY resources
To: Vladimir Zapolskiy <vz@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261026224957.1115370-1-vz@kernel.org>
 <20261026224957.1115370-4-vz@kernel.org>
 <CAFEp6-16WAoyS+aY2BzPknsMtHa1cSfVYNmYvTKHm_MWqqW_ag@mail.gmail.com>
 <271ccc9b-ccf1-4254-9664-2f00b504a5a9@kernel.org>
Content-Language: en-US
In-Reply-To: <271ccc9b-ccf1-4254-9664-2f00b504a5a9@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: dNc-QeuX0HnmQgihmyUYtGsuGFAN33IY
X-Proofpoint-ORIG-GUID: dNc-QeuX0HnmQgihmyUYtGsuGFAN33IY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA1NiBTYWx0ZWRfX7chIH1GLpKOD
 EIi5OsMz0krLfnPty/OWgMsw9uSI2xRoNgpv7rmgzcOTDtACdEWTd95ypZW0ce2Ih3Z6hWm/TsH
 6E6EIwiP8qNsxVGOaJ9Vo9pD/dZnDv4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA1NiBTYWx0ZWRfX/OnyzkXhBT9K
 WuFzQ8NndbOmfCPpeSFe5hXQqVgkzsOhX3svki/9fDO7s7dlVKem2h4EPkqtF+r4R+k6FX7f4tr
 OfPLbPunZRuLMsjlPl91zirwZkunb1MPZcBT5R9W/kOTttV+izhSNqWkY6F+nzRFNmzmqIggOPq
 kROiXgSD0vbvhbNKq+eNQfMsBAdgmBHLG6v1ZmYaktVy76ie4JjZjLdIOiqclWeM2gM+RfQAvPI
 qt+/0A5gXnSZo0fZn/hMKxz5dFkgcD5QMnQ9p5nLWrccMUv7UTQTZD3ezafHNCDSMWgp4k4qWNr
 UtErXpxyefDy075BH3OH6N042w6tD6DQSeCOK/q4p5JeMluKhmEmM4lUWWGKcSl/gqS+FJViC83
 +1yC2jVwv2NvAxwXKRAeIs4Tr5UGbZcvbux7fVJ9OR7Qkaaa0ZUPzIkRG5omJkVWu8nRKZXDqzv
 yuO1h2K9rcFd/k6/g9A==
X-Authority-Analysis: v=2.4 cv=JLquIMKb c=1 sm=1 tr=0 ts=6ae5f7bc cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=iaXPdgsK/hfklW56b25dCw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=tzcnicmHaCEtZrSMFQwA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310056



On 27-10-2026 22:30, Vladimir Zapolskiy wrote:
> Please note that 'csiphy_res_phy' was introduced a few lines above
> by this change, it's only purpose is to provide the needed supported
> media formats, and this is unavoidable.
> 

Right, agreed. Glymur uses the non-legacy path, but that path still uses
camss->res->csiphy_res in msm_csiphy_subdev_init(), at least to get the
CSIPHY id and supported media formats. That is why Glymur currently has
a non-NULL csiphy_res even though the actual PHY programming is handled
by the standalone CSI2 PHY driver.

> This change follows the assumption that pixel formats from all
> non-legacy PHYs are SDM845 compatible, that's true for this platform,
> it is expected to be true for the most of approaching non-legacy
> platforms, and on demand it may be changed later on.
> 
> The current form likely is the most compact and the least invasive
> change, which gets to the point of supporting CAMSS on platforms
> with no CSIPHY resources given in the CAMSS driver.
> 
> For instance, note, the recently proposed Glymur CAMSS [1] references
> X1E CSIPHY resources, which is actually incorrect, since there is
> no "csiphyX" I/O resources anymore for Glymur. This change can be
> reused for Glymur as well, and its reference to X1E CSIPHYs can be
> dropped, but any better proposal or improvement are welcome.

The intention was not to describe CAMSS-owned CSIPHY I/O resources for
Glymur. This also follows the earlier suggestion to reuse/fall back
to the Hamoa/X1E CAMSS description where possible:

https://lore.kernel.org/all/lepv7cgykrylficddcnnbii3kzxsiei3itcwc4ibq53s33rogi@ndnf7zrtu5ex/

Moving Glymur to .csiphy_res = NULL is possible, but with this fallback
the CSIPHY id comes from the CAMSS port number. Since Glymur uses
CSIPHY ids 0, 1 and 4, that would also require Glymur-specific driver
data and DT/binding updates to describe CSIPHY4 as CAMSS port 4.

Bryan, Loic, do you think we need that change now, or should Glymur keep
the current approach for this DTS series?

-- 
Regards,
Nihal Kumar Gupta

