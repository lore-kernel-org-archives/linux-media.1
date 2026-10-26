Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793008244;
	b=ictqVzsHrERwbzy4OoKGAiYs65bkvqVzSDEcxeDCJqBmXcjEh2wtpMRTVyIsUDhexi6O
	 /9sEOpBExu4nYZE1YZCz9m6OTAueQISDwFGGZQo2oEJClo1D3p9i2pasv3nvXC88wki7T
	 LynPyA7LIaf4oyVkAE3wQhUAq+ZnHmirU3OGbhJ5j4ivFsf7WmIfiloUznAXwNAHMx+ZR
	 AblB3t0eSnIScYdh1kqhTPZohJkdkkTugLIV4AxXMcHlu8truBvYfv6+Qn0+Y0eKtes9b
	 6NCCjada+ixJdDYf8Dox/wCF42rzwF4oWKHxi8v027KPuuJqhU+mqQ/Bu+No2UIfq+g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008244;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OM9NA6+9DRMy/5K7XlTQer+gWEHVhhYXBGhL8vr8CDI=;
	b=zTCT0AN5+Je/mji4UMPhrNC8poObw4mS5LX99Jrr0i2EPHwc3p7MIkaFyYzq0Wamw2U6
	 at4FgEprejJ7VmHiGPIz0srAero1VCjGUldaa33TXjyWH6tQ9Xb7FnhsE6LElgyADN+cT
	 z4aPL2g7isl+cxdZrhkm8C4cbcwKe0RWPIS2qeqFtLqySnMoRgPuaW+/zyrYcNw6EAtBE
	 /HfmnF1ILsUacNuB4xX0Ohcq6BE3H2Eux8d+cZlix6SqO/7SZ5rf+0TbSqt3WeqNii92s
	 VG2JR7kXJIxyx7UjEIYsi2qcwjGAjkuJDivcnNkDGaPS+vMpmh4/BrVne2i6fR8EWyA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VZzhkrMU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GYHdcNSr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BFDC60A260E
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 09:50:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BFDC60A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VZzhkrMU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GYHdcNSr
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4b7cW2806463
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 09:50:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OM9NA6+9DRMy/5K7XlTQer+g
	WEHVhhYXBGhL8vr8CDI=; b=VZzhkrMUsOLBiooW/QzsjtbJY/FF/BNqFiImpKD0
	fwr2m7fM28MoQIFGdoW7sL2Su8o950QtBmXq1vWRdkcX4sHhDtTRmHy54mMjWleq
	Ga5ShmvhNjivtWu39ZtJUqs+35VJNw5eoluHLVk7LpbHl+4aXeCMNRpzCEThq326
	otYkUxiE0FDo0zFRpGgmpkpZ/OTNrqHDUf801l8feaREka4P1vzSu5Q5Beh6J1xO
	xCph4yUZNhR4byoIUho1Zlj0jcD2PL7KSISsnB5WvS9TPIYQ5bryWSm8RxwuxAGO
	xwgfF7e4X0C8vtOH29M75scnnO5b6n6TLRWGzEw2rqqPsw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgm8xnuu7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 09:50:43 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7bf45388253so2637623137.3
        for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 02:50:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793008242; cv=none;
        d=google.com; s=arc-20260327;
        b=GIySeKhAsPjpC06x8vLSFUO0u6cswiPXWE6RFtpxBdQ51qevGH/6I0ozcizK5aQR7I
         jI2/GcRQBNOxQF0Cq86iCCYc1ZoHlaAf9MLcjuUAyswnNacstliHh9hLgMLkgyEU7fC7
         oRwparPpx7HYFEDvk2Za+DLHWVVvDY5qoMX+Oo3kCygkspD/eIwGsXMahyEq2nwHv/u6
         CoZy6IuuK0ajUTQn6jVjh8U8FSeThRJfZIQMQk+vG5p+t5/bjJEh6xf2yPiLE0GzhtwK
         o5RUyb+g/iE7sRq6e2Q13UgXTj1RT7znI9j0/hhPOGEZ0muqIgYleSfg2JvC0qIQJb+J
         eZNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OM9NA6+9DRMy/5K7XlTQer+gWEHVhhYXBGhL8vr8CDI=;
        fh=5YqItuFD6vaJh5o7c7F6BJHfV01D4DMCMm/lMwcFaFk=;
        b=X26Tuow3FYC8+rIcHeHOGi9NXxNjsBncVSdhKE2T2YgrR1W9CvilA1URRrIS/rWgqQ
         MMrgHxKr+n45ZGWJsnLc9AYMmbTdVspqYshHqbk9ZNTmBEa6JlcEr5NIhbBi+H7bUGTA
         yknQNPH5myZt5BYlXtyNEP4xzQ13gwptaiJxRFPqW6XTmK89C+xkArVVojmzwoM1tumN
         NzhQLSnTc7My9QvIqZq4psZ4dTefjVyxybpxRE46xYSc8yMqKTDrSIgdQB8Sqqva3+w8
         abpu/GhIpxpSGs4AHFnaQBtI5W4LPAEYGUqiR6fyDTw252f8188VQMI1yQgUSaVeHReW
         p25A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793008242; x=1793613042; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OM9NA6+9DRMy/5K7XlTQer+gWEHVhhYXBGhL8vr8CDI=;
        b=GYHdcNSr34P5rNbw4vS+cM9nkUtxtGfSIjaRf1D3cG2WvGgCDE5FrNLau3B40MPNc8
         WVNZoSgibs8GMgNdYD/8nlZvfhzGLjD/Dyxy9CVakNbxiD+UtHJLhOe8Xnb5k96E6adS
         SGknZJXr5a8F1KnrmdQ3FjqNzB3GmuohUBIgVe7VIC2Dfx05udguKArKg944XX1UQcgb
         UJfnIvQ9wjCjZGY9jH5i3VddB6n9rWbKhMRFrTHGR/NYTadc7pNT0G8+vN5Ma6nLTHgW
         shBR5a7YTXyEBr2GSqW1o3yFqAXwqbVRguG2IcbTiwFJpueD7N+co5JcxVd2EseJ5kMR
         2IGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008242; x=1793613042;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OM9NA6+9DRMy/5K7XlTQer+gWEHVhhYXBGhL8vr8CDI=;
        b=j2EIipnDK6486QFI9mYBsqNrHjSLTbT8qzNaoMOXBeuiDVD5w0IY0IRY3G20MfofeD
         81QIPAjH48sih78NUbCfLlw4bPocwfmKFzdPsGHyvHSaCBOM4YPP/Vjq59gvqYgZ6+iA
         Fj5t3SYlHNeAlFbPSk2w+JL1drIbBPgP9gu0DXQqMw3RuyzKv3SX5+6G9cG73QbxVj7b
         5J+Lv82bstbxPJVY9g6qsJ95vrG2TiQ9zIPMW5Wjj5+NnDXBt4V2ghob/c+9KL9ZDOdG
         gyS4P7V5i4PyDm2Wu4bS6K0GhlV2lrnLmRol8tlTajBe50rDd0AXQZiku9H/EEQKh6ZQ
         DDwQ==
X-Forwarded-Encrypted: i=1; AKwUvBwGfqMPNdukKxpEFNalNPCm6EKc53Cb2bc4Mxumbhrv1KHf3PcuU8q6ypUwlW/uNHHpMTNLWVsthGKl/g==@vger.kernel.org
X-Gm-Message-State: AFq9FYLpR971+hZqm8OMs5LEXrzKrtUHq2lbnZ5sw7Pc/pRmwB6yTQVz
	Dmz66iZkFD9W8m3J2FajlIfvDk8d0+ENOQktcJiRPgTmDKqAYPW1Okij715cg/hlHNPIRCwhcpr
	14bAKVXgRtad3wPmyULQcB5w/ZXx1ZlMuLWWDYWLIfFBPS0AeNRo3cSZh7I1X93YpbAhSeFIsJ9
	Sdly6IMmrITSkjSM1ApMfIv6/smV0UAnKyNcfGQ/BgCBcXcHSl
X-Gm-Gg: AYBFou0ICzG7tsbyX0DpG9sC8aQo6Jsa+GjNK7DPbCQLxfZNk9uQVJ+7rbLe7jYkdJi
	S9CQgtj20wJo31XfSBQy2sZlPLoBqexhH2Au/SAKEI41Vd9ZQJKoxcFZlJnUEXOrwYoJilk2J/+
	W7pcZfZ3N56uHLkggN6Qq9BgdFj0nt5Zu49ztoAFOePA4wNyH+6m/ZCN2Xnwrjh7wEwONpyXH/y
	56gfAoGtGfUgIwHFA==
X-Received: by 2002:a05:6102:2925:b0:7af:fef2:8ecf with SMTP id ada2fe7eead31-7ce5cc37a74mr1922795137.8.1793008242591;
        Mon, 26 Oct 2026 02:50:42 -0700 (PDT)
X-Received: by 2002:a05:6102:2925:b0:7af:fef2:8ecf with SMTP id
 ada2fe7eead31-7ce5cc37a74mr1922772137.8.1793008242146; Mon, 26 Oct 2026
 02:50:42 -0700 (PDT)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
 <DiH264mdSk9atz9YjnNUImra2MISyqRZQN8lEO6HpzVBiYU4i_cNONZzyW0DfvCXJ5aGIrBbDYFXRbTBYLyjBg==@protonmail.internalid>
 <20261024-kaanapali-camss-v22-8-7da3ea49c8a1@oss.qualcomm.com> <5e1cc716-22d2-4d1e-b68c-0c1608890043@kernel.org>
In-Reply-To: <5e1cc716-22d2-4d1e-b68c-0c1608890043@kernel.org>
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 17:50:30 +0800
X-Gm-Features: AclHuK9VMGCfWrLZ5or5WCH1QYYnG4gicCOANcYBpkmCFj6xw3eUiA1tUH_i_Q4
Message-ID: <CACbMrhqvfhyejKqsbCXRs8p9Kizeh8pS6qBygKDwpghPqrGzeQ@mail.gmail.com>
Subject: Re: [PATCH v22 08/14] media: qcom: camss: csid: Add support for CSID 1080
To: "Bryan O'Donoghue" <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: aamOMSBaWkDXVOVhvqdU17blamHAfY-t
X-Authority-Analysis: v=2.4 cv=Ra0FmFtv c=1 sm=1 tr=0 ts=6adf2273 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=XVB2PD5oAi8qZ-TPs3wA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzOSBTYWx0ZWRfX/dY1M30P5maC
 8ZYC9P9tpf/CMsmh7YjEY1ZI00Ruy5ppsa+FJlVbkpxJ7Rys9T0Kk3P0tgoRup3EKt5QIRONDXI
 xtFZgVgQu5fUC/K6FdgIHJ+QM0jrQ44=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzOSBTYWx0ZWRfX/3tx4bLxElWH
 m1FxlX2mFuqvG8Ka34auCGAeS0Q5wjQa9rOzVeGn6TvIX4tq23ZttNjXWS/nHqLp0wN4rRbVpCp
 ko1O/Te9Qll+6vsGzJQgJu84djpvni3SrFCdg+rWfM3/JaYYPyNfQyEB9xOlFMDlINy/r/Mb/8A
 qkGZzPyCTVfNPMwtcMmkcTgKCMI6iiQiEGzY5ZmSOWz8XigW+blrj+p/D1xMKYgM31SppoihNl+
 8RtZu1Chnf0lW7cWNkTfeC4LNa5c19MOxREncl6khG4mk/3wz06+NRr7oykoFBK3ULfP0l3DOz0
 SX1f7xOIK3oaSjg6HMeAWX76cE4rgPqRIrdBNWoAL9r1IiE4xOfx4VMilMQpG7drX2eyh5PquON
 VYHIf2QeBgBBQAOAmtu2euGq5sXRe49LeKpriPIIrXpthj/u9Lb7/VhBrI2Y75NH6v7LJG6P/v0
 2dNBvpl36qa5jJuhxXA==
X-Proofpoint-ORIG-GUID: aamOMSBaWkDXVOVhvqdU17blamHAfY-t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260039

On 10/25/2026 7:15 PM, Bryan O'Donoghue wrote:
> On 25/10/2026 03:17, Hangxiang Ma wrote:
>> +#define        INFO_INPUT_SOF                BIT(12)
>> +#define        INFO_INPUT_EOF                BIT(9)
>
> Excellent thank you I forgot to ask for INPUT_EOF too, which we
> obviously need too.
>
> ---
> bod

Thanks!

BTW, I'm not sure whether the current addr_update design fully meets
your and Loic's requirements. Since we're still in the merge window, an
early review would be greatly appreciated, especially if you have any
concerns about the design.


---
Best Regards,
Hangxiang
