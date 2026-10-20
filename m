Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792479349;
	b=kL/2zLcK/yWN3dmrkT1U+9/30qW7mgRbkqdL/OcBGPYFbYXe9UCTRCj5F8ffZg3/X05+
	 F/iO3WwGUJNXPMZuuWv+IZKQvL2X5Sa6Ca+6MwTbXEAxrhHRzMPPISGYjvAFgg2Qfs14b
	 BoqLD/MbAjVNU90gdN1bS4Ws8YrRIJUvKyKEAtXxeIOpbSUUJmJjO6jUr+vjvkloIWcOA
	 ifZ81FfArHlqnDoz+agkwqpH7uBwm4gA8mZuWqGxPYi2VMpStM7qSSaWbR9j+KxyriiLB
	 YwT3rESzIqtJw8qS+xWBnANJSGoRhcw0r50K/X/AIpTjFV0KygX3VlspJRfMrBDiAbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792479349;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OTo02d9lu2hUCUXtfOqHtxSGEa5kW4yvDS/CVW9TPHs=;
	b=Rm8Yti0TInNoSaDIcqvFNyZiOyQ5MJYxVVjW+0qoEfoSiV4HWQqLE2vMmrNc1BSMia9C
	 HAd0H83WciNaYnyMDaOXXmTRNp/scblBvMPG3JLWrIU+JjgQykTBPyDNP9JGRgmXvXpC8
	 BYRW3RpBR8SQWsVLaUh474wNcuqUgudm6CX/yNSvduOnhGeccXTJf4JIAYU2sBM/6CHt5
	 yCTywpVjtFDGTEqmO3PZ+U52xVbz+Tqq8tWug8sX+8Iwdpq9f99soNM9C4CHq5+B/AqIe
	 J/zhKyQDiZdwIO7LqKUqbJRw1Ijy5cjVRzVIrVD3HX96zdTNMMIi/THqf/8q1z2cqEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eOXZ77JO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GN94tP+b;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E969D606A31F
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 06:55:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E969D606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eOXZ77JO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GN94tP+b
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0t7fZ1211003
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 06:55:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OTo02d9lu2hUCUXtfOqHtxSGEa5kW4yvDS/CVW9TPHs=; b=eOXZ77JOS+5qBwf8
	yoW8ccNz6u9NkcR7Ur48gQYnAw6ikuD/RzudVJG5cw9DQmva1MIcE1ziZzmp3XWq
	uBW+/fy8zDWIE9W7y1oPJMv9RwcUCD6UEmd0bz4cbWAv5gBw6XvgemJNgy17z+y/
	y8hwmsT/nHyt3EydGpXFXzgrjbg58hV9ICuRqW3ifduW/gGaaljN/dOXidJiXNKv
	pyIg68slO3S+tYxc01vAbjRpRmkPZxY5D4oCvU2o3dtTxz6td1bAOH/LF/f/WuAH
	Tp5A/fj3W2Ae5/YLvJK7Gfu6nIx2zbRf59hKDkiW26bKWiXEY94Ce+mRVOen0GzY
	6eV1BA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5p18y4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 06:55:48 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-53630cded29so10466781cf.2
        for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 23:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792479347; x=1793084147; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OTo02d9lu2hUCUXtfOqHtxSGEa5kW4yvDS/CVW9TPHs=;
        b=GN94tP+bZHBnT3KXoZRkN7W0lt/V33IcJxiDEUjRt4LpIpb+VqBm1bjcyomlAh8wpf
         PtRNEaOuCHWW1r0gdsfOtWAvU9H6oCNetbV3pgHmKOKg1nnB9SGAfb5jA4u4ZsN/TZko
         Rx/l62hmkGXZuF9FDQZOhHnRch5mOxEFHE6sKlAKapXSUf2YuqOneDukIELehFmudWWt
         cGjClQu3bF+CM5+PAiE69q8wcilEGv/Qv9fkuNqJEMz+u8Q8b455sVD/mb2OKLG8YFBF
         VFnwKRp7hTTI0wqzqFKLm++0I76XpvEKwPHYnpgLDNP2/lAN5rFvJvFwXhIsDby6nLoN
         ovZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792479347; x=1793084147;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OTo02d9lu2hUCUXtfOqHtxSGEa5kW4yvDS/CVW9TPHs=;
        b=XORUyUQsOu6WkS0ighVprNu+Zjhs4ELBYgEkvz7JuVWLj9cV5220swtGhUDzVUK+Cp
         aL92z8ZBD5h23IP0CCZDc6zxKtU3uoZdJtcWdjVQs9nmRD85BuKbOk2z5wO6kqAdFYhb
         eGfIyLHRx/dA8QOhLQbB3q4h+SifuVEJKAZnDPgvdmb9108vPpYEfAlo0Q86xv67t1Gb
         0q+tHxWrOgmasXm546qHYX3Ol9iaQMKFVrWMoTiLKs4dFyq/jK13rep336eBlZAP6oNl
         NOLIF4KphWFB3r/4eQR0C/2/sTXIdk3aP/dQ7fUhPzoLfAuURgjPm+peSV8J7I09kjwT
         SwUQ==
X-Forwarded-Encrypted: i=1; AKwUvByfyk48JaOpWhzVHOh/tMxk4UDIM1MUvzjksafat8A5anE5kLk5jvTr6JEN8NeoSBJ7oBbC8TI4b3bUiA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJDxMS0KCtDW+w8mEdULWX0/GU4bV2mdyFSfT8129eXM78d1S0V
	o0pMWvslIDaeHZQFYwWKc5CRPPQb4Q2FqIfvl7y1QQiabIGfyrudA/80e9bvGD02xtwioVFZmmg
	CDa3qh00MuVYJ7Bp8ImA1fkGLNQv0e7l2KHn9imHhnM5qaiHL1ZapKZW9m7lEfxOKEWaDoBLgLg
	==
X-Gm-Gg: AYBFou15/3lrWivkpOk9rnM63cdfDTkRdwyULDq8RI/f6GjuUyqYYPC2PbzeiM/p8kL
	vD52H20h5CQ1i7HyeKXclNq8z6bJT9bjCwbttfdQKLvvWZ4vhRLFkIsVsFsIUYTlgXQMqXIXrDw
	0CSB/aGJMJ5eiw33HzpkzEoMZGRy6zUUbP3c5ijRlWeWPQrgnZ0c8UG68SaOCbqjDWml2UWPPQ3
	+Q+Ymdrh4dNCdjNlwhD8+JE1LcmQiPQMmFDmEJBOYdGphV4QyrDz09yzZjrIFK6L5pqf026G3EC
	4aRQQYmLUKvmTmT0n8ysf+cO0udrNB9Ic2qfSFmnaIxr/xnbk7PK32RYwWc+VzGg6P/DtXrn20Y
	EtTSThuLGk7rWJEEm9RcpXg==
X-Received: by 2002:a05:622a:14cb:b0:51c:2324:666 with SMTP id d75a77b69052e-536460e29afmr169672841cf.3.1792479347240;
        Mon, 19 Oct 2026 23:55:47 -0700 (PDT)
X-Received: by 2002:a05:622a:14cb:b0:51c:2324:666 with SMTP id d75a77b69052e-536460e29afmr169672411cf.3.1792479346744;
        Mon, 19 Oct 2026 23:55:46 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eae235sm462296566b.67.2026.10.19.23.55.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 23:55:45 -0700 (PDT)
Message-ID: <4df039eb-f89d-4a82-9f2a-dc90e31548d8@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 08:55:42 +0200
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
Subject: Re: [PATCH 10/10] arm64: dts: qcom: msm8996pro: use the MSM8996 Pro
 CPU clock compatible
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Joonwoo Park <joonwoop@codeaurora.org>,
        Imran Khan <kimran@codeaurora.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Ilia Lin <ilialin@codeaurora.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261019-msm8998-fix-clocks-v1-0-370949e4d8a0@oss.qualcomm.com>
 <20261019-msm8998-fix-clocks-v1-10-370949e4d8a0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-msm8998-fix-clocks-v1-10-370949e4d8a0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: PKNhaWp3JmL2pl0JeiaXMc-AcHfFMQfp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAyNyBTYWx0ZWRfX2vm6IpTxBn9V
 hsy99eoEVB3cSS4TkZ92Db3P8IRfaY+NXBCTqDACON3Rhb8wGoOXVYyqFTBAlLiZwGmAaUsszNf
 V2RWAUV2tsGu7DZf+7y86Dx9ltRs1Hk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAyNyBTYWx0ZWRfX3tcmmeILbk0q
 Mey2+05Wrhq96dfYZlxqCwWgoImEW+HrIqzutHR2i5Z7GNAAALL4Ss93ZEL6mWAl0yu0q2Zqh+2
 XXnQRgk2o238jv/gakWyQWjTqnl+b5Blzq4T2hsBmP0MoJv0HQByB8fCK2Rdt1vrB8Ky1JvW6Al
 LYS0MKPV3QScNTWQZZo+qgSIvR2rOQEWHNQXzp3yOsh+hCMT01XhKd6qDZwvMZK7glBbbAlVtSR
 0fll1h1FYALwLM1d1TdAUpgXwK7Br3JGto0sPDL7ztYYFVbkimHo6V0IxJpxDYX8J8o3h1TZTvd
 9od24lwf2GPocIRAQ0785LlVOK/GOMKBX+yewBIJjHJY6r7FWhHqGZHcbH0ESnXTUw3SnYTiqfw
 FxOWXuZDOoLwKpp86oqH5Hme20aIO4BGPLHJzz0V478byiFpI6Wrhf7skPj6bp7IkV9E2eDSA4s
 wiwqJhBFVhGIyBaPBLg==
X-Proofpoint-GUID: PKNhaWp3JmL2pl0JeiaXMc-AcHfFMQfp
X-Authority-Analysis: v=2.4 cv=crUOAF4i c=1 sm=1 tr=0 ts=6ad71074 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=2OWSJv1YRWKtX4VDGZoA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200027

On 10/19/26 3:41 PM, Dmitry Baryshkov wrote:
> The CPU clock controller of MSM8996 Pro needs its own setup, which the
> driver can only apply when the DT tells it the SoC is the Pro one.
> 
> Use the MSM8996 Pro compatible.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
