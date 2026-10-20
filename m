Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792485343;
	b=ov0kSK7/HbF/3EFU1Pgz5jfiAw9ZPXdFuq7XB6ZLEHLAQPHcfh9U6isgfcWd53CFynnB
	 m6Js64McqDoXNJykl9pNrkiSY1kHUdpFg8o6nojf/qcLvs/IG/KCIcVR/JvVixkrZN+q5
	 bCvxiM6l9oekZomDn9N0waMz2xA0Lek6FehdoOmXsgADNQpHJH0H7hjBOT7TegmKp/QSF
	 96/ZmbTzvGb+Dk7ztBZ2mZrORQHG0pR2ThuRiOXnhNlMHwwjAD3gl4gmnz9qRs51pFQl+
	 J3t4qjkDAa+DPG1U9cc1rapJgkEYM7Ml1o1wNQNixByHNy/Z293ZP0814YDn5eogyRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792485343;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=66+gStrT+StV7zXT9UJMTjajLq3qUZbhGhADbacL9UA=;
	b=rNsVEybtNXOrEVRQlFQP7Wmy3ypBglFTFtW+S/igNXsLGTNPSUTLSPxqCKXFGeaPQ5Cf
	 i6xi01YTWY2aNulve8K0ySDz/p4tZkIqlfsNZjk3QOXtNeuNjn1DH0z/4Rha7RFp+VD8A
	 APMORw1JZNy2v7mc2TFcMEOB7378sqYFjEHzisKtDqJBOXLrt+E79WqMDx9oT/Nq/xBSg
	 MbSA3EPTxv/ipHSvUQi6Kgy639Zg2lsiOVkRDMjETa1x22THWr/uH+kdxxbtJ0NiXV3MA
	 SyCR5MrxU2o6mt8r3yfR79cQ3ksiIb/Th3k1lY5j+RsatWyEPBx3Me9wXYyk76ZbPTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="g7h/aEHm";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V3HmpHLl;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F1F606A320
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 08:35:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33F1F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g7h/aEHm;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V3HmpHLl
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K8E5j11211293
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 08:35:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	66+gStrT+StV7zXT9UJMTjajLq3qUZbhGhADbacL9UA=; b=g7h/aEHman4Gol6E
	CvpiHjeAH/SLbNfmctNUpdPbVFcEqKeaYquVqQ7tvJ81dTk9UuUWq3OwUZCfzwum
	Yr56PXCEuHp8SXPchbM7VjBTAtXEi8M8hNPRWkiIe/xjKdEZ7edA9nXHcuYO2leP
	26Ij0z4Iv4fFvJeoQ1WGP6iKglkKcBHQmVYCedulvTjgWQXw7gKFzYAx7HLGT5Cc
	B9EFiqbZ1jZnxpVloiLaBFX5geIjp/AKdS9d+IhbLr3H7kyTUibSpdXtvx/hQrMe
	WK+jv7Y4+nhN7d1Wdhtf+kEoH7zDz0CGAF0GYWDpzwg/b9KZZgUEbZUK164/+Wu1
	PyAdug==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5p1n8y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 08:35:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f2bdebfc5so98625385a.1
        for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 01:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792485341; x=1793090141; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=66+gStrT+StV7zXT9UJMTjajLq3qUZbhGhADbacL9UA=;
        b=V3HmpHLlMCSE85ynyodSY8ojHW8pgPYitAF/AjbfLAlasNx5wWzQ8K8UQl3bVkWr9o
         wjymIZL/VAtPmnIHTORcdMcfDPRTV8EQodYGwsRMWtx0MrAqeaR1UnOGI5fwkIEaDcrO
         QHkxMjbDvnror7yRU0X/iAArXnZMytcWfrp0uXChFKzDt7eM+9YAtJlditoZGiCvPLoc
         Ow8paiNXlVgf71zRQTc9oWKUgIEtDzOB88kS1gJNjSGeMlHtqMHubJEPu5yP9a88512q
         6YcCsKeztv1iiKIj6oMTPxRdfZxgi5T4eI1P0eYPu+xFVUWXqwzrBdoWSz20uDqRxFsF
         qRlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792485341; x=1793090141;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=66+gStrT+StV7zXT9UJMTjajLq3qUZbhGhADbacL9UA=;
        b=rV6FVlDWuiEA0vfgC9FhpVLYfSKLEsyHn/M1IJi7XY6if7iv+bVNHcOfk/ule2oTh8
         ilUN6YZhNDzJs/cAg5dJjHDUlPXei3E4l1BZMuYlxpDhJn79NQdhVgnFZ5zJkBHMSD6k
         rsJfCWMW3JM3mMlNfKcVM9ybzSNEYilY/g3t1xYIaFwF/CHwOM37abyCL6atGY2CUhvo
         8Azul40qq/pY/AV8sMEW/XTA1YiNxs0I1m7vxIUt6wxDjVUTYPq2MVPGLUiyk3KFZHkO
         GWDoik73ZojxqRBqpfWgSCXLV+TqEayvkXgYFTCgPSXmSpS5N4g83bp66FlxnTNNWboN
         bfDg==
X-Forwarded-Encrypted: i=1; AKwUvBxPBpjAAwtH8U7Dgg3rBg9U0853vJ+WJGjNMgmI18AiBWrGv7K/aO2p9u2mEoDKnJagdXo/XmynQsZnwg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLjxyg1BXz+JzxmKPw2xLYLPcFZJ9rh1xkH7CnnCtsqO6sssM6c
	+CzzNCFPBPPJ/evTZKwfbHXMPPpBVRb70SojB81fwSmatFrWp1ChGvmYb4+GOKekEBs4Av7ZsKg
	cnNqHhNVTtZRoarbL0X7RbrNr+gsgZIOsaK4Bf4+9ln5eObm+CePLgako+vCK8KkZ4Q==
X-Gm-Gg: AYBFou2XhfIekzBgNF4lHSjrWMa2DMoSZB6jTloa+vXrsIWI8QTuUN+Vedotm/8U/dB
	o+nwknIvmyuNTgVrI7evRbIsX/ZwITrRBQxn3DymUUqAXdqc3LzwSRg2cFGv9ueuhFHmAVsFmTL
	zNdpBeTk4uz3w3/XbCpNKlHhWeGfH+QnE10goNVd0GuvFUzNoXHSkPzWIQgYnQOa3DXH9V+MGw3
	VtKKdK9p5BwwMPuSNGZC7vo9gjRKKjAl6wIZ3Ib/NqBCWcNx6TgKrsfdguUBI8QC8gQifmzTw3K
	Y7YxrPJ2RskC8bYgtC42RhuuAAWyK4fopePbZ5zudg478hh9yoknozKQlRfz5QMWGQtOsBfu4eD
	uuouxx5C97tn+klM3DMHd3Q==
X-Received: by 2002:a05:620a:2948:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93f29dcb869mr1945705685a.6.1792485341371;
        Tue, 20 Oct 2026 01:35:41 -0700 (PDT)
X-Received: by 2002:a05:620a:2948:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93f29dcb869mr1945701585a.6.1792485340917;
        Tue, 20 Oct 2026 01:35:40 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1d5262sm5053676a12.22.2026.10.20.01.35.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 01:35:39 -0700 (PDT)
Message-ID: <3de40458-7d7e-4cd8-a200-746e4c2adb13@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 10:35:36 +0200
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
Subject: Re: [PATCH 06/10] clk: qcom: mmcc-msm8996: keep mmss_mmagic_maxi_clk
 always enabled
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
 <20261019-msm8998-fix-clocks-v1-6-370949e4d8a0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-msm8998-fix-clocks-v1-6-370949e4d8a0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: vX7TBGAd6jfQax5ZmK9PU9orj8jJ6nCZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzNCBTYWx0ZWRfX+5nUz7nqZjBP
 Rp1gr6+C8PjCyMzf4BRS08dB8496Wiu5DKdn4RIzG3keW8duqAmcT6qY5SqXYJS8wfNzJDt++5p
 44MgNRJk4yRGziGN38VzoWDk8Nl1ArE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzNCBTYWx0ZWRfXyYjJ0RX4cH+Y
 Zq7BFIk5fL67RO9Bm0bSfQtvwBm0ndEnOQhObAEofINVK4uxVKQU/oYSvK1DVFh+LwlPEMtO2Sv
 9gaQQNOxxOTPD0EPAEYvwIiMI0W2tNPMtoh/Z+/FZfp/LMKNCGhrgEU7YKYZFNJtdlNaOs9md5j
 sWSyUPX0JY150Y9mdVV9EQbBOCAmHWQ54x8/KmjEzSQVHxOyMdRWMr0T+1dNHXAPzbYruNQs5CZ
 2kStM8WcL/GBczW0NA2n1mM7xkfvByLb7tEtMw0xKva8kbfKUZOCYC8VhGK0lokdqPhTsAVsHTV
 JSijgJTTDWQreCNxcyNnfkNKNu0bltcXqK259JGKlO4bt2AGPAB8jXLQSypCiWlL7O/i0Y0O5X9
 hRvdTVLT1UjMH3ADPWOVoQ8naXETC7mS6SOwpPiPVWjBAfgr/c55P2BtZeM5K5luVVu0Fz9XhZQ
 x0TuQDIG8pT/fYILwDQ==
X-Proofpoint-GUID: vX7TBGAd6jfQax5ZmK9PU9orj8jJ6nCZ
X-Authority-Analysis: v=2.4 cv=crUOAF4i c=1 sm=1 tr=0 ts=6ad727de cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=KiQJPOv1UjsmjKsQXtkA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200034

On 10/19/26 3:41 PM, Dmitry Baryshkov wrote:
> Enabling vmem_maxi_clk fails with -EBUSY, the branch never leaving halt
> ("vmem_maxi_clk status stuck at 'off'"), which makes the VMEM block
> unusable. The MAXI branches sit behind the MMAGIC aggregator, so they
> cannot leave halt unless mmss_mmagic_maxi_clk is running.
> 
> Commit 7705bb7176b9 ("clk: qcom: mmcc-msm8996: leave all mmagic gdscs
> and clocks always enabled") marked the MMAGIC clocks CLK_IS_CRITICAL
> because there is no bus driver to manage them, but missed this one: its
> siblings mmss_mmagic_ahb_clk, mmagic_video_axi_clk and
> mmagic_video_noc_cfg_ahb_clk all carry the flag while
> mmss_mmagic_maxi_clk does not.
> 
> Mark it CLK_IS_CRITICAL as well.
> 
> Note that the halt bit is truthful here and must not be papered over
> with BRANCH_HALT_SKIP: touching the block while its AXI clock is off
> silently resets the SoC.

Will the right fix forward be to grab a handle to all of mmagic
for MNoC and activate them as needed? CLK_IS_CRITICAL is obviously
a workaround

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
